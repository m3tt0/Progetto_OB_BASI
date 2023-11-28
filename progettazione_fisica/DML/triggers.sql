CREATE OR REPLACE TRIGGER Store_Password
BEFORE INSERT ON Utente
FOR EACH ROW
EXECUTE FUNCTION storePassword();

CREATE OR REPLACE FUNCTION storePassword()
RETURNS TRIGGER AS
$$
BEGIN
    new.password = sha512(new.password);
    RETURN new;
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER Check_Data_Presentazione
BEFORE INSERT OR UPDATE OF data_presentazione ON Presentazione_Articolo
FOR EACH ROW
EXECUTE FUNCTION checkDataPresentazione();

CREATE OR REPLACE FUNCTION checkDataPresentazione()
RETURNS TRIGGER AS
$$
DECLARE
    data_inizio_conferenza Conferenza.data_inizio%TYPE;
    data_fine_conferenza Conferenza.data_fine%TYPE;
BEGIN
    SELECT c.data_inizio INTO data_inizio_conferenza FROM Conferenza AS c WHERE new.codice_conferenza = c.codice_conferenza;
    SELECT c.data_fine INTO data_fine_conferenza FROM Conferenza AS c WHERE new.codice_conferenza = c.codice_conferenza;
    IF new.data_presentazione < data_inizio_conferenza THEN
        RAISE EXCEPTION 'Non è possibile inserire una data presentazione prima della data di inizio di una conferenza';
    ELSIF new.data_presentazione > data_inizio_conferenza THEN
        RAISE EXCEPTION 'Non è possibile inserire una data presentazione dopo la data di fine di una conferenza';
    END IF;
    RETURN new;
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER Formato_Serie
BEFORE INSERT ON Serie
FOR EACH ROW
EXECUTE FUNCTION formatoSerie();

CREATE OR REPLACE FUNCTION formatoSerie()
RETURNS TRIGGER AS
$$
DECLARE
    formato_prequel Libro.modalita_fruizione%TYPE;
    formato_sequel Libro.modalita_fruizione%TYPE;
BEGIN
    SELECT l.modalita_fruizione INTO formato_prequel
    FROM Libro AS l
    WHERE l.isbn = new.prequel;

    SELECT l.modalita_fruizione INTO formato_sequel
    FROM Libro AS l
    WHERE l.isbn = new.sequel;

    IF formato_prequel != formato_sequel THEN
        RAISE EXCEPTION $e$Non puoi inserire due libri con formato diverso all'interno di una serie$e$;
    END IF;

    RETURN new;
END
$$
LANGUAGE plpgsql;

-- verificare l'integrità di una serie: una serie deve avere tutti i libri disposti in maniera sequenziale

CREATE OR REPLACE TRIGGER Integrita_Serie
AFTER INSERT ON Serie
FOR EACH ROW
EXECUTE FUNCTION integritaSerie();

--FUNZIONE INTREGRITA' SERIE
CREATE OR REPLACE FUNCTION integritaSerie()
RETURNS TRIGGER AS
$$
DECLARE
    primo_serie Serie.prequel%TYPE;
    ultimo_serie Serie.sequel%TYPE;
BEGIN

    IF EXISTS(SELECT * FROM Serie WHERE nome = new.nome) THEN
        SELECT s.prequel INTO primo_serie
        FROM Serie AS s
        WHERE s.nome = new.nome
        AND s.prequel NOT IN (
            SELECT s1.sequel
            FROM Serie AS s1
            WHERE s1.nome = new.nome
        );

        SELECT s.sequel INTO ultimo_serie
        FROM Serie AS s
        WHERE s.nome = new.nome
        AND s.sequel NOT IN (
            SELECT s1.libro
            FROM Serie AS s1
            WHERE s1.nome = new.nome
        );

        IF NOT EXISTS(
                SELECT *
                FROM Serie AS s
                WHERE s.prequel = new.sequel)
        THEN
            RAISE EXCEPTION $e$Non puoi inserire un libro all'interno di una serie che sia scollegato dagli altri libri della serie$e$;
        END IF;
        IF new.sequel = primo_serie THEN
            RAISE EXCEPTION 'Il primo libro di una serie non può essere un sequel';
        END IF;
        IF new.prequel = ultimo_serie THEN
            RAISE EXCEPTION $e$L'ultimo libro di una serie non può essere un prequel$e$;
        END IF;
    END IF;
    RETURN new;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER Insert_Into_Serie
BEFORE INSERT ON Serie
FOR EACH ROW
EXECUTE FUNCTION insertIntoSerie();

--TRIGGER CHE TI PERMETTE DI INSERIRE I LIBRI ANCHE NEL MEZZO DI UNA SERIE
CREATE OR REPLACE FUNCTION insertIntoSerie()
RETURNS TRIGGER AS
$$
BEGIN
    IF EXISTS(
        SELECT *
        FROM Serie AS s
        WHERE new.prequel != s.prequel AND new.sequel = s.sequel AND new.nome = s.nome
    )
    THEN
        UPDATE Serie SET sequel = new.prequel WHERE sequel = new.sequel;
    END IF;
    RETURN new;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER Only_Romanzi_In_Serie
BEFORE INSERT ON Serie
FOR EACH ROW
EXECUTE FUNCTION onlyRomanziInSerie();

CREATE OR REPLACE FUNCTION onlyRomanziInSerie()
RETURNS TRIGGER AS
$$
BEGIN
    IF ((SELECT l.tipo
        FROM Libro AS l
        WHERE l.isbn = new.prequel != 'romanzo') AND
        (SELECT l.tipo
        FROM Libro AS l
        WHERE l.isbn = new.sequel != 'romanzo'))
    THEN
        ROLLBACK;
    END IF;
    RETURN new;
END;
$$ LANGUAGE plpgsql;




--ELIMINARE UNA RACCOLTA DI LIBRI SE è VUOTA
CREATE OR REPLACE FUNCTION remove_raccolta_libro()
RETURNS TRIGGER AS
$$
    DECLARE
        libri_raccolta record;
    BEGIN
        SELECT r.raccolta INTO libri_raccolta FROM libreria.libro_contenuto_raccolta AS r WHERE r.raccolta = OLD.raccolta;
        if libri_raccolta == NULL THEN
            DELETE FROM libreria.raccolta AS r WHERE r.cod_raccolta = OLD.raccolta;
        end if;
    END;
$$ language plpgsql;



CREATE OR REPLACE TRIGGER remove_raccolta_libro
AFTER DELETE ON libreria.libro_contenuto_raccolta
FOR EACH ROW
EXECUTE FUNCTION remove_raccolta_libro();




--ELIMINARE UNA RACCOLTA DI ARTICOLI SE è VUOTA
CREATE OR REPLACE FUNCTION remove_raccolta_articolo()
RETURNS TRIGGER AS
$$
    DECLARE
        articoli_raccolta record;
    BEGIN
        SELECT r.raccolta INTO articoli_raccolta FROM libreria.articolo_contenuto_raccolta AS r WHERE r.raccolta = OLD.raccolta;

        IF articoli_raccolta == NULL THEN
            DELETE FROM libreria.raccolta AS r WHERE r.cod_raccolta = OLD.raccolta;
        END IF;
        RETURN OLD;
    END;
$$ language plpgsql;

CREATE OR REPLACE TRIGGER remove_raccolta_articolo
AFTER DELETE ON libreria.articolo_contenuto_raccolta
FOR EACH ROW
EXECUTE FUNCTION remove_raccolta_articolo();





--ELIMINARE UNA COLLANA DI LIBRI SE I LIBRI SONO MENO DI DUE
CREATE OR REPLACE FUNCTION remove_collana()
RETURNS TRIGGER AS
$$
    DECLARE
        libri_collana INTEGER;
    BEGIN
        SELECT COUNT(*) INTO libri_collana FROM libreria.libro_contenuto_collana AS c WHERE c.issn = OLD.issn;

        IF libri_collana < 2 THEN
            DELETE FROM libreria.collana AS c WHERE c.issn = OLD.issn;
        END IF;

        RETURN OLD;
    END;
$$ language plpgsql;

CREATE OR REPLACE TRIGGER remove_collana
AFTER DELETE ON libreria.libro_contenuto_collana
FOR EACH ROW
EXECUTE FUNCTION remove_collana();




--ELIMINARE UNA RIVISTA DI ARTICOLI SE è VUOTA
CREATE OR REPLACE FUNCTION remove_rivista()
RETURNS TRIGGER AS
$$
    DECLARE
        articoli_rivista record;
    BEGIN
        SELECT r.rivista INTO articoli_rivista FROM libreria.articolo_scientifico_pubblicazione_rivista AS r WHERE r.rivista = OLD.rivista;

        IF articoli_rivista == NULL THEN
            DELETE FROM libreria.rivista AS r WHERE r.cod_rivista = OLD.rivista;
        END IF;
        return OLD;
    END;

$$ language plpgsql;

CREATE OR REPLACE TRIGGER remove_rivista
AFTER DELETE ON libreria.articolo_scientifico_pubblicazione_rivista
FOR EACH ROW
EXECUTE FUNCTION remove_rivista();


CREATE OR REPLACE FUNCTION check_editore_in_collana()
RETURNS TRIGGER AS
$$
    DECLARE
        editore_libro libreria.Libro.editore%TYPE;
        editore_collana libreria.collana.editore%TYPE;
    BEGIN
        SELECT l.editore INTO editore_libro FROM libreria.Libro as l WHERE l.isbn = NEW.isbn;
        SELECT c.editore INTO editore_collana FROM libreria.collana as c WHERE c.issn = NEW.issn;

        IF editore_collana != editore_libro THEN
            ROLLBACK;
        END IF;

        RETURN NEW;
    END;
$$ language plpgsql;

CREATE OR REPLACE TRIGGER check_editore_collana
BEFORE INSERT OR UPDATE ON libreria.Libro_Contenuto_Collana
FOR EACH ROW
EXECUTE FUNCTION check_editore_in_collana();



































-- COSE DA FARE:
-- 1) INSERIRE LA POSSIBILITA DI AGGIUNGERE UNA SERIE IN TESTA O NEL MEZZO E AGGIUNGERE RELATIVE MODIFICHE
-- 2) AGGIUNGERE NUOVI TRIGGER, TRA CUI:
                                        -- -ELIMINARE UNA RACCOLTA SE VUOTA ----> FATTO
                                        -- -ELIMINARE UNA COLLONA SE VUOTA  ----> FATTO
                                        -- -ELIMINARE UNA RIVISTA SE VUOTA  ----> FATTO
                                        -- -ELIMINARE UN NEGOZIO SE NON VENDE NIENTE ---->
                                        -- -ELIMINARE UN AUTORE SE NON HA SCRITTO LIBRI ---





--QUERY PER PRENDERE I NOMI DEI LIBRI IN SERIE--
SELECT l.titolo AS libro, s.libro AS codice_libro, l2.titolo AS sequel, s.sequel AS codice_sequel, s.nome
FROM (libreria.serie AS s JOIN libreria.libro l on s.libro = l.isbn) JOIN libreria.libro AS l2 ON s.sequel = l2.isbn
WHERE s.nome = 'HARRY POTTER';


















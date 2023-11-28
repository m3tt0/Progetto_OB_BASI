CREATE OR REPLACE TRIGGER store_password
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
$$LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER check_data_presentazione
BEFORE INSERT OR UPDATE OF data_presentazione ON presentazione_articolo
FOR EACH ROW
EXECUTE FUNCTION checkDataPresentazione();

CREATE OR REPLACE FUNCTION checkDataPresentazione()
RETURNS TRIGGER AS
$$
    DECLARE
        dataI_conf conferenza.data_inizio%TYPE;
        dataF_conf conferenza.data_fine%TYPE;
    BEGIN
        SELECT c.data_inizio INTO dataI_conf FROM libreria.conferenza AS c WHERE new.codice_conferenza = c.codice_conferenza;
        SELECT c.data_fine INTO dataF_conf FROM libreria.conferenza AS c WHERE new.codice_conferenza = c.codice_conferenza;

        IF new.data_presentazione NOT BETWEEN dataI_conf AND dataF_conf THEN
            ROLLBACK;
        END IF;

        RETURN new;

    END;
$$LANGUAGE plpgsql;


CREATE OR REPLACE VIEW top_ten_saves AS
SELECT isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, SUM(num_salvataggi) AS numero_salvataggi
FROM libro_contenuto_raccolta AS lr JOIN raccolta AS r ON lr.raccolta = r.cod_raccolta
                                    JOIN libro AS l ON l.isbn = lr.libro
GROUP BY isbn
ORDER BY numero_salvataggi DESC
FETCH FIRST 10 ROWS ONLY;




-- verificare integrità serie, all'interno di una serie ci devono essere libri dello stesso formato (o tutti cartacei, o tutti digitali, o tutti audiolibri) --

CREATE OR REPLACE TRIGGER formato_serie
BEFORE INSERT ON serie
FOR EACH ROW
EXECUTE FUNCTION formato_serie();

CREATE OR REPLACE FUNCTION formato_serie()
RETURNS TRIGGER AS
$$
    DECLARE
        formato_libro libreria.libro.modalita_fruizione%TYPE;
        formato_sequel libreria.libro.modalita_fruizione%TYPE;
    BEGIN
        SELECT l.modalita_fruizione INTO formato_libro
        FROM libreria.libro AS l
        WHERE l.isbn = new.libro;

        SELECT l.modalita_fruizione INTO formato_sequel
        FROM libreria.libro AS l
        WHERE l.isbn = new.sequel;

        if formato_libro != formato_sequel then
            rollback;
        end if;

        return new;
    end
    $$language plpgsql;


CREATE OR REPLACE VIEW negozi_serie_complete AS
SELECT DISTINCT v.negozio, v.indirizzo, v.url, s.nome_serie
FROM serie AS s NATURAL JOIN vendita AS v
WHERE NOT EXISTS (
    SELECT s1.sequel, s1.libro
    FROM serie AS s1
    WHERE s1.nome_serie = s.nome_serie
    AND (sequel NOT IN (SELECT libro FROM Vendita AS v1 WHERE v1.negozio = v.negozio)
    OR libro NOT IN (SELECT libro FROM Vendita AS v1 WHERE v1.negozio = v.negozio))
);



-- verificare l'integrità di una serie: una serie deve avere tutti i libri disposti in maniera sequenziale

CREATE OR REPLACE TRIGGER b_integrita_serie
AFTER INSERT ON serie
FOR EACH ROW
EXECUTE FUNCTION integrita_serie();

CREATE OR REPLACE TRIGGER a_insert_into_serie
BEFORE INSERT ON serie
FOR EACH ROW
EXECUTE FUNCTION insert_into_serie();

CREATE OR REPLACE TRIGGER romanzi_in_serie
BEFORE INSERT ON serie
FOR EACH ROW
EXECUTE FUNCTION only_romanzi_serie();


--FUNZIONE INTREGRITA' SERIE
CREATE OR REPLACE FUNCTION integrita_serie()
RETURNS TRIGGER AS $$
    DECLARE
        first libreria.serie.libro%TYPE;
        last libreria.serie.sequel%TYPE;

    BEGIN
        IF EXISTS(SELECT * FROM libreria.serie WHERE nome_serie = new.nome_serie) THEN

            SELECT s.libro INTO first FROM libreria.serie AS s WHERE s.nome_serie = NEW.nome_serie AND s.libro NOT IN (SELECT s1.sequel FROM libreria.serie AS s1 WHERE s1.nome_serie = NEW.nome_serie);
            SELECT s.sequel INTO last FROM libreria.serie AS s WHERE s.nome_serie = NEW.nome_serie AND s.sequel NOT IN (SELECT s1.libro FROM libreria.serie AS s1 WHERE s1.nome_serie = NEW.nome_serie);
            --raise notice '%' ,first;
            --raise notice '%',last;
            IF (NOT EXISTS(SELECT * FROM libreria.serie AS s WHERE s.libro = NEW.sequel)) OR (NEW.sequel = first) OR (NEW.libro = last) THEN
                rollback;
            END IF;
        END IF;
        return new;
    END;
$$
language plpgsql;

--TRIGGER CHE TI PERMETTE DI INSERIRE I LIBRI ANCHE NEL MEZZO DI UNA SERIE
CREATE OR REPLACE FUNCTION insert_into_serie()
RETURNS TRIGGER AS
$$
    BEGIN
            IF EXISTS(SELECT * FROM libreria.serie AS s WHERE new.libro != s.libro AND new.sequel = s.sequel AND new.nome_serie = s.nome_serie) THEN
                UPDATE libreria.serie SET sequel = new.libro WHERE sequel = new.sequel;
            END IF;
        return new;

    end;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION only_romanzi_serie()
RETURNS TRIGGER AS
$$
    BEGIN
        IF ((SELECT l.tipo
            FROM libro AS l
            WHERE l.isbn = new.prequel != 'romanzo') AND
            (SELECT l.tipo
            FROM libro AS l
            WHERE l.isbn = new.sequel != 'romanzo'))
        THEN
            rollback;
        END IF;
        return new;
    END;
$$ language plpgsql;




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
SELECT l.titolo AS libro, s.libro AS codice_libro, l2.titolo AS sequel, s.sequel AS codice_sequel, s.nome_serie
FROM (libreria.serie AS s JOIN libreria.libro l on s.libro = l.isbn) JOIN libreria.libro AS l2 ON s.sequel = l2.isbn
WHERE s.nome_serie = 'HARRY POTTER';


















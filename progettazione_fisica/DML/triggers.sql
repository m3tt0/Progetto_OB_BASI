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
    SELECT c.data_inizio INTO data_inizio_conferenza FROM Conferenza AS c WHERE new.conferenza = c.cod_conferenza;
    SELECT c.data_fine INTO data_fine_conferenza FROM Conferenza AS c WHERE new.conferenza = c.cod_conferenza;
    IF new.data_presentazione < data_inizio_conferenza THEN
        RAISE EXCEPTION 'Non è possibile inserire una data presentazione prima della data di inizio di una conferenza';
    ELSIF new.data_presentazione > data_fine_conferenza THEN
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
            SELECT s1.prequel
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
        WHERE l.isbn = new.prequel) != 'romanzo' AND
        (SELECT l.tipo
        FROM Libro AS l
        WHERE l.isbn = new.sequel) != 'romanzo')
    THEN
        RAISE EXCEPTION 'Una serie deve essere composta solo da romanzi';
    END IF;
    RETURN new;
END; --NON CAPISCO CHE ERRORE CI SIA--
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER Remove_Raccolta_Libro
AFTER DELETE ON Libro_Contenuto_Raccolta
FOR EACH ROW
EXECUTE FUNCTION removeRaccoltaLibro();

--ELIMINARE UNA RACCOLTA DI LIBRI SE è VUOTA
CREATE OR REPLACE FUNCTION removeRaccoltaLibro()
RETURNS TRIGGER AS
$$
DECLARE
    libri_raccolta RECORD;
BEGIN
    SELECT r.raccolta INTO libri_raccolta FROM Libro_Contenuto_Raccolta AS r WHERE r.raccolta = old.raccolta;
    IF libri_raccolta == NULL THEN
        DELETE FROM Raccolta AS r WHERE r.cod_raccolta = old.raccolta;
    END IF;
    RETURN old;
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER Remove_Raccolta_Articolo
AFTER DELETE ON Articolo_Contenuto_Raccolta
FOR EACH ROW
EXECUTE FUNCTION removeRaccoltaArticolo();

--ELIMINARE UNA RACCOLTA DI ARTICOLI SE è VUOTA
CREATE OR REPLACE FUNCTION removeRaccoltaArticolo()
RETURNS TRIGGER AS
$$
DECLARE
    articoli_raccolta record;
BEGIN
    SELECT r.raccolta INTO articoli_raccolta FROM Articolo_Contenuto_Raccolta AS r WHERE r.raccolta = old.raccolta;

    IF articoli_raccolta == NULL THEN
        DELETE FROM Raccolta AS r WHERE r.cod_raccolta = old.raccolta;
    END IF;
    RETURN old;
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER Remove_Collana
AFTER DELETE ON Libro_Contenuto_Collana
FOR EACH ROW
EXECUTE FUNCTION removeCollana();

--ELIMINARE UNA COLLANA DI LIBRI SE I LIBRI SONO MENO DI DUE
CREATE OR REPLACE FUNCTION removeCollana()
RETURNS TRIGGER AS
$$
DECLARE
    libri_collana INTEGER;
BEGIN
    SELECT COUNT(*) INTO libri_collana FROM Libro_Contenuto_Collana AS c WHERE c.collana = old.collana;

    IF libri_collana < 2 THEN
        DELETE FROM Collana AS c WHERE c.issn = old.collana;
    END IF;
    RETURN old;
END;
$$
LANGUAGE plpgsql;



CREATE OR REPLACE TRIGGER Remove_Rivista
AFTER DELETE ON Articolo_Scientifico_Pubblicazione_Rivista
FOR EACH ROW
EXECUTE FUNCTION removeRivista();

--ELIMINARE UNA RIVISTA DI ARTICOLI SE è VUOTA
CREATE OR REPLACE FUNCTION removeRivista()
RETURNS TRIGGER AS
$$
DECLARE
    articoli_rivista RECORD;
BEGIN
    SELECT r.rivista INTO articoli_rivista FROM Articolo_Scientifico_Pubblicazione_Rivista AS r WHERE r.rivista = old.rivista;

    IF articoli_rivista == NULL THEN
        DELETE FROM Rivista AS r WHERE r.issn = old.rivista;
    END IF;
    return old;
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER Check_Editore_Collana
BEFORE INSERT OR UPDATE ON Libro_Contenuto_Collana
FOR EACH ROW
EXECUTE FUNCTION checkEditoreInCollana();

CREATE OR REPLACE FUNCTION checkEditoreInCollana()
RETURNS TRIGGER AS
$$
DECLARE
    editore_libro Libro.editore%TYPE;
    editore_collana Collana.editore%TYPE;
BEGIN
    SELECT l.editore INTO editore_libro FROM Libro as l WHERE l.isbn = new.libro;
    SELECT c.editore INTO editore_collana FROM Collana as c WHERE c.issn = new.libro;

    IF editore_collana != editore_libro THEN
        RAISE EXCEPTION 'Una collana non può avere editori diversi';
    END IF;
    RETURN new;
END;
$$
LANGUAGE plpgsql;



CREATE OR REPLACE TRIGGER Coerenza_Vendite
BEFORE INSERT OR UPDATE ON Vendita
FOR EACH ROW
EXECUTE FUNCTION coerenzaVendite();

CREATE OR REPLACE FUNCTION coerenzaVendite()
RETURNS TRIGGER AS
$$
DECLARE
    current_negozio RECORD;
    tipo_libro Libro.modalita_fruizione%TYPE;
BEGIN
    SELECT * INTO current_negozio FROM Negozio AS n WHERE n.partita_iva = new.negozio;
    SELECT l.modalita_fruizione INTO tipo_libro FROM Libro AS l WHERE l.isbn = new.libro;

    IF current_negozio.indirizzo IS NOT NULL AND current_negozio.url IS NULL AND tipo_libro != 'cartaceo' THEN
        RAISE EXCEPTION 'Un negozio fisico non può vendere libri digitali o audiolibri';
    END IF;
    RETURN new;
END
$$
LANGUAGE plpgsql;

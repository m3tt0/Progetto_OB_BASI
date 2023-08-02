CREATE OR REPLACE TRIGGER store_password
BEFORE INSERT ON Utente
FOR EACH ROW
EXECUTE FUNCTION store_password();

CREATE OR REPLACE FUNCTION store_password()
RETURNS TRIGGER AS
$f$
    BEGIN
        new.password = sha512(new.password);
        RETURN new;
    END;
$f$
LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER check_data_presentazione
BEFORE INSERT OR UPDATE OF data_presentazione ON presentazione_articolo
FOR EACH ROW
EXECUTE FUNCTION check_data_presentazione();

CREATE OR REPLACE FUNCTION check_data_presentazione()
RETURNS TRIGGER AS
$$
    DECLARE
        dataI_conf conferenza.data_inizio%TYPE;
        dataF_conf conferenza.data_fine%TYPE;
    BEGIN
        select c.data_inizio into dataI_conf from libreria.conferenza as c where new.codice_conferenza = c.codice_conferenza;
        select c.data_fine into dataF_conf from libreria.conferenza as c where new.codice_conferenza = c.codice_conferenza;

        if new.data_presentazione not between dataI_conf and dataF_conf then
            rollback;
        end if;

        return new;

    end;
$$LANGUAGE plpgsql;


------- TRIGGER CHE CI PERMETTONO DI UPDATARE IL NUMERO DI SALVATAGGI DI UNA RACCOLTA ----------

CREATE OR REPLACE TRIGGER increment_num_salvataggi
AFTER INSERT ON utente_salvataggio_raccolta
FOR EACH ROW
EXECUTE FUNCTION increment_num_salvataggi();

CREATE OR REPLACE FUNCTION increment_num_salvataggi()
RETURNS TRIGGER AS
$$
    BEGIN
        UPDATE raccolta SET num_salvataggi = num_salvataggi + 1 WHERE new.raccolta = raccolta.cod_raccolta;

        RETURN new;
    end;

$$LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER decrement_num_salvataggi
AFTER DELETE ON utente_salvataggio_raccolta
FOR EACH ROW
EXECUTE FUNCTION decrement_num_salvataggi();

CREATE OR REPLACE FUNCTION decrement_num_salvataggi()
RETURNS TRIGGER AS
$$
    BEGIN
        UPDATE raccolta SET num_salvataggi = num_salvataggi - 1 WHERE new.raccolta = raccolta.cod_raccolta;

        RETURN new;
    end;

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

-- verificare l'integrità di una serie: una serie deve avere tutti i libri disposti in maniera sequenziale

CREATE OR REPLACE TRIGGER integrita_serie
BEFORE INSERT ON serie
FOR EACH ROW
EXECUTE FUNCTION integrita_serie();

CREATE OR REPLACE FUNCTION integrita_serie()
RETURNS TRIGGER AS $$
    BEGIN
        IF EXISTS(SELECT FROM libreria.serie WHERE nome_serie = new.nome_serie) AND NOT EXISTS(SELECT FROM libreria.serie AS s WHERE s.sequel = new.libro) THEN
            rollback;
        END IF;


        return new;
    END;
$$
language plpgsql;


























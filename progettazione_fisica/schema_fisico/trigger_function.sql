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
        select c.data_inizio into dataI_conf from progetto_libreria.libreria.conferenza as c where new.codice_conferenza = c.codice_conferenza;
        select c.data_fine into dataF_conf from progetto_libreria.libreria.conferenza as c where new.codice_conferenza = c.codice_conferenza;

        if new.data_presentazione not between dataI_conf and dataF_conf then
            rollback;
        end if;

        return new;

    end;
$$LANGUAGE plpgsql;













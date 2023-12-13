CREATE OR REPLACE FUNCTION storePassword()
RETURNS TRIGGER AS
$$
BEGIN
    new.password = sha512(new.password);
    RETURN new;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER Store_Password
BEFORE INSERT ON Utente
FOR EACH ROW
EXECUTE FUNCTION storePassword();


CREATE OR REPLACE FUNCTION notificaUtenteSerieComplete()
RETURNS TRIGGER AS
$$
DECLARE
    serie_to_check Serie.nome%TYPE;
    nome_negozio_con_serie_completa Negozio.nome%TYPE;
    messaggio Notifica.messaggio%TYPE;
    destinatari CURSOR FOR SELECT username FROM Utente;
BEGIN
    SELECT nome INTO serie_to_check FROM Serie WHERE prequel = new.libro OR sequel = new.libro;
    IF found THEN
        SELECT nome_negozio INTO nome_negozio_con_serie_completa
        FROM NegoziConSerieComplete
        WHERE partita_iva = new.negozio AND nome_serie = serie_to_check;
        IF found THEN
            messaggio := format('Il negozio %s (P.IVA: %s) ha disponibile l''intera serie %s', nome_negozio_con_serie_completa, new.negozio, serie_to_check);
            FOR destinatario IN destinatari LOOP
                INSERT INTO Notifica VALUES (messaggio, destinatario.username);
            END LOOP;
        END IF;
    END IF;
    RETURN new;
END
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER Notifica_Utente_Serie_Complete_On_Insert
AFTER INSERT ON Vendita
FOR EACH ROW
EXECUTE FUNCTION notificaUtenteSerieComplete();

CREATE OR REPLACE TRIGGER Notifica_Utente_Serie_Complete_On_Update
AFTER UPDATE OF quantita ON Vendita
FOR EACH ROW
WHEN (old.quantita = 0)
EXECUTE FUNCTION notificaUtenteSerieComplete();


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

CREATE OR REPLACE TRIGGER Check_Data_Presentazione
BEFORE INSERT OR UPDATE OF data_presentazione ON Presentazione_Articolo
FOR EACH ROW
EXECUTE FUNCTION checkDataPresentazione();


--ELIMINARE UNA COLLANA DI LIBRI SE I LIBRI SONO MENO DI DUE
CREATE OR REPLACE FUNCTION removeCollana()
RETURNS TRIGGER AS
$$
DECLARE
    numero_libri_in_collana INTEGER;
BEGIN
    SELECT COUNT(*) INTO numero_libri_in_collana FROM Libro_Contenuto_Collana AS c WHERE c.collana = old.collana;

    IF numero_libri_in_collana < 2 THEN
        DELETE FROM Collana AS c WHERE c.issn = old.collana;
    END IF;
    RETURN old;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER Remove_Collana
AFTER DELETE OR UPDATE ON Libro_Contenuto_Collana
FOR EACH ROW
EXECUTE FUNCTION removeCollana();


--ELIMINARE UNA RIVISTA DI ARTICOLI SE è VUOTA
CREATE OR REPLACE FUNCTION removeRivista()
RETURNS TRIGGER AS
$$
BEGIN
    IF NOT EXISTS(SELECT * FROM Articolo_Scientifico_Pubblicazione_Rivista AS r WHERE r.rivista = old.rivista) THEN
        DELETE FROM Rivista AS r WHERE r.issn = old.rivista;
    END IF;
    return old;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER Remove_Rivista
AFTER DELETE OR UPDATE ON Articolo_Scientifico_Pubblicazione_Rivista
FOR EACH ROW
EXECUTE FUNCTION removeRivista();


CREATE OR REPLACE FUNCTION checkEditoreInCollana()
RETURNS TRIGGER AS
$$
DECLARE
    editore_libro Libro.editore%TYPE;
    editore_collana Collana.editore%TYPE;
BEGIN
    SELECT l.editore INTO editore_libro FROM Libro as l WHERE l.isbn = new.libro;
    SELECT c.editore INTO editore_collana FROM Collana as c WHERE c.issn = new.collana;

    IF editore_collana != editore_libro THEN
        RAISE EXCEPTION 'I libri facenti parte della stessa collana devono avere lo stesso editore';
    END IF;
    RETURN new;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER Check_Editore_Collana
BEFORE INSERT OR UPDATE ON Libro_Contenuto_Collana
FOR EACH ROW
EXECUTE FUNCTION checkEditoreInCollana();


CREATE OR REPLACE FUNCTION checkEditoreInCollanaUpdateLibro()
RETURNS TRIGGER AS
$$
BEGIN
    DELETE FROM Libro_Contenuto_Collana AS lc WHERE lc.libro = old.isbn;
    RETURN old;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER Check_Editore_Collana_Update_Libro
BEFORE UPDATE OF Editore ON Libro
FOR EACH ROW
WHEN (old.editore != new.editore)
EXECUTE FUNCTION checkEditoreInCollanaUpdateLibro();


CREATE OR REPLACE FUNCTION checkEditoreInCollanaUpdateCollana()
RETURNS TRIGGER AS
$$
BEGIN
    IF EXISTS (SELECT lc.libro
               FROM Libro_Contenuto_Collana AS lc
               WHERE lc.collana = old.issn)
    THEN
        RAISE EXCEPTION 'Non si può modificare l''editore di una collana non vuota';
    END IF;
    RETURN old;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER Check_Editore_Collana_Update_Collana
BEFORE UPDATE OF Editore ON Collana
FOR EACH ROW
EXECUTE FUNCTION checkEditoreInCollanaUpdateCollana();


CREATE OR REPLACE FUNCTION coerenzaVendite()
RETURNS TRIGGER AS
$$
DECLARE
    current_negozio Negozio%ROWTYPE;
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

CREATE OR REPLACE TRIGGER Coerenza_Vendite
BEFORE INSERT OR UPDATE ON Vendita
FOR EACH ROW
EXECUTE FUNCTION coerenzaVendite();


CREATE OR REPLACE FUNCTION coerenzaSalvataggiRaccolte()
RETURNS TRIGGER AS
$$
DECLARE
    raccolta_to_check Raccolta%ROWTYPE;
BEGIN
    SELECT * INTO raccolta_to_check FROM Raccolta WHERE cod_raccolta = new.raccolta;
    IF raccolta_to_check.visibilita = 'privata' AND raccolta_to_check.proprietario = new.utente THEN
        RAISE EXCEPTION 'Non puoi salvare una raccolta creata da te stesso e non puoi salvare una raccolta privata';
    ELSIF raccolta_to_check.visibilita = 'privata' AND raccolta_to_check.proprietario <> new.utente THEN
        RAISE EXCEPTION 'Non puoi salvare una raccolta privata.';
    ELSIF raccolta_to_check.visibilita = 'pubblica' AND raccolta_to_check.proprietario = new.utente THEN
        RAISE EXCEPTION 'Non puoi salvare una raccolta creata da te stesso.';
    END IF;
    RETURN new;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER Coerenza_Salvtaggi_Raccolte
BEFORE INSERT OR UPDATE ON Utente_Salvataggio_Raccolta
FOR EACH ROW
EXECUTE FUNCTION coerenzaSalvataggiRaccolte();
-- Implementazione del vincolo di formato serie

-- verificare l'integrità di una serie: una serie deve avere tutti i libri disposti in maniera sequenziale

--FUNZIONE INTREGRITA' SERIE
CREATE OR REPLACE PROCEDURE checkOnlyRomanziInSerie(prequel Serie.prequel%TYPE, sequel Serie.sequel%TYPE) AS
$$
DECLARE
    tipo_prequel Libro.tipo%TYPE;
    tipo_sequel Libro.tipo%TYPE;
BEGIN
    SELECT tipo INTO tipo_prequel FROM Libro WHERE isbn = prequel;
    SELECT tipo INTO tipo_sequel FROM Libro WHERE isbn = sequel;

    IF tipo_prequel != 'romanzo' OR tipo_sequel != 'romanzo' THEN
        RAISE EXCEPTION 'Una serie deve essere composta solo da romanzi';
    END IF;
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE checkFormatoSerie(prequel Serie.prequel%TYPE, sequel Serie.sequel%TYPE) AS
$$
DECLARE
    formato_prequel Libro.modalita_fruizione%TYPE;
    formato_sequel Libro.modalita_fruizione%TYPE;
BEGIN
    SELECT modalita_fruizione INTO formato_prequel FROM Libro WHERE isbn = prequel;
    SELECT modalita_fruizione INTO formato_sequel FROM Libro WHERE isbn = sequel;

    IF formato_prequel != formato_sequel THEN
        RAISE EXCEPTION $e$Non puoi inserire due libri con formato diverso all'interno di una serie$e$;
    END IF;
END
$$
LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE checkCicloSerie(nome_serie Serie.nome%TYPE, prequel Serie.prequel%TYPE, sequel Serie.sequel%TYPE) AS
$$
DECLARE
    primo_serie Serie.prequel%TYPE;
    ultimo_serie Serie.sequel%TYPE;
BEGIN
    -- Perché va gestito il caso del primo/ultimo libro? Perché il vincolo di UNIQUE non è sufficiente
    -- per gestire quest'ultimo caso, il vincolo di UNIQUE su prequel/sequel impedisce soltanto
    -- l'inserimento di due tuple con attributo "prequel/sequel" uguali

    -- Prendo il primo libro di una serie
    SELECT s.prequel INTO primo_serie
    FROM Serie AS s WHERE s.nome = nome_serie AND s.prequel NOT IN (
        SELECT s1.sequel
        FROM Serie AS s1
        WHERE s1.nome = s.nome
    );
    -- Prendo l'ultimo libro di una serie
    SELECT s.sequel INTO ultimo_serie
    FROM Serie AS s
    WHERE s.nome = nome_serie
    AND s.sequel NOT IN (
        SELECT s1.prequel
        FROM Serie AS s1
        WHERE s1.nome = s.nome
    );
    -- Controllo che l'ultimo libro della serie non sia prequel del primo libro di una serie
    IF prequel = ultimo_serie AND sequel = primo_serie THEN
        RAISE EXCEPTION $e$L'ultimo libro di una serie non può essere prequel del primo libro della serie.\n
                            Il primo libro di una serie non può essere sequel dell'ultimo libro della serie$e$;
    END IF;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE checkSequenzialitaSerie(nome_serie Serie.nome%TYPE, prequel_to_check Serie.prequel%TYPE, sequel_to_check Serie.sequel%TYPE) AS
$$
BEGIN
    IF NOT EXISTS(
        SELECT * FROM Serie
        WHERE (prequel = prequel_to_check OR sequel = sequel_to_check
        OR prequel = sequel_to_check OR sequel = prequel_to_check)
        AND nome = nome_serie
    ) THEN
        RAISE EXCEPTION 'Non si possono inserire libri scollegati all''interno di una serie';
    END IF;
END
$$
LANGUAGE plpgsql;


--TRIGGER CHE TI PERMETTE DI INSERIRE I LIBRI correttamente in una serie
CREATE OR REPLACE FUNCTION insertIntoSerie()
RETURNS TRIGGER AS
$$
BEGIN
    CALL checkOnlyRomanziInSerie(new.prequel, new.sequel);
    CALL checkFormatoSerie(new.prequel, new.sequel);
    IF EXISTS(SELECT * FROM Serie WHERE nome = new.nome) THEN
        CALL checkCicloSerie(new.nome, new.prequel, new.sequel);
        CALL checkSequenzialitaSerie(new.nome, new.prequel, new.sequel);
        UPDATE Serie SET sequel = new.prequel WHERE sequel = new.sequel;
        UPDATE Serie SET prequel = new.sequel WHERE prequel = new.prequel;
    END IF;
    RETURN new;
END
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER Insert_Into_Serie
BEFORE INSERT ON Serie
FOR EACH ROW
EXECUTE FUNCTION insertIntoSerie();


CREATE OR REPLACE FUNCTION deleteFromSerie()
RETURNS TRIGGER AS
$$
BEGIN
    UPDATE Serie SET sequel = old.sequel  WHERE sequel = old.prequel;
    RETURN new;
END
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER Delete_From_Serie
AFTER DELETE ON Serie
FOR EACH ROW
EXECUTE FUNCTION deleteFromSerie();


CREATE OR REPLACE FUNCTION updatePrequelSerie()
RETURNS TRIGGER AS
$$
BEGIN
    CALL checkFormatoSerie(new.prequel, new.sequel);
    CALL checkOnlyRomanziInSerie(new.prequel, new.sequel);
    CALL checkCicloSerie(new.nome, new.prequel, new.sequel);
    UPDATE Serie SET sequel = new.prequel WHERE sequel = old.prequel;
    RETURN new;
END
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER Update_Prequel_From_Serie
AFTER UPDATE OF prequel ON Serie
FOR EACH ROW
EXECUTE FUNCTION updatePrequelSerie();


CREATE OR REPLACE FUNCTION updateSequelSerie()
RETURNS TRIGGER AS
$$
BEGIN
    CALL checkFormatoSerie( new.prequel, new.sequel);
    CALL checkOnlyRomanziInSerie(new.prequel, new.sequel);
    CALL checkCicloSerie(new.nome, new.prequel, new.sequel);
    UPDATE Serie SET prequel = new.sequel WHERE prequel = old.sequel;
    RETURN new;
END
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER Update_Sequel_From_Serie
AFTER UPDATE OF sequel ON Serie
FOR EACH ROW
EXECUTE FUNCTION updatePrequelSerie();

CREATE OR REPLACE FUNCTION updateNomeSerie()
RETURNS TRIGGER AS
$$
BEGIN
    UPDATE Serie SET nome = new.nome WHERE nome = old.nome;
    RETURN new;
END
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER Update_Nome_From_Serie
AFTER UPDATE OF nome ON Serie
FOR EACH ROW
EXECUTE FUNCTION updateNomeSerie();

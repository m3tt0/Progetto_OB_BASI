CREATE OR REPLACE FUNCTION LibriInNegozio(negozio Negozio.partita_iva%type)
RETURNS SETOF Libro AS 
$$
BEGIN
    RETURN QUERY(
        SELECT isbn, titolo, costo, quantita
        FROM Vendita AS v JOIN Libro AS l ON v.libro = l.isbn
        WHERE v.negozio = negozio
    );
END;
$$

CREATE OR REPLACE FUNCTION RaccolteDiUtente(richiedente Utente.username%type, proprietario Utente.username%type)
RETURNS SETOF Raccolta AS 
$$
BEGIN
    RETURN QUERY(
        SELECT nome
        FROM Raccolta AS r
        WHERE r.proprietario = proprietario AND (richiedente = proprietario OR r.visibilita = 'pubblica');
    );
END;
$$

--DA RIFARE NEL LOGICO
CREATE OR REPLACE VIEW LibriInRaccolta AS
SELECT isbn, titolo
FROM Raccolta AS r JOIN Libro_Contenuto_Raccolta AS lr ON r.cod_raccolta = lr.raccolta
WHERE r.cod_raccolta = '' AND r.proprietario = '';

CREATE OR REPLACE FUNCTION ArticoliInRivista(rivista Rivista.issn%type)
RETURNS SETOF Articolo AS 
$$
BEGIN
    RETURN QUERY(
        SELECT doi, titolo,
        FROM Articolo_Scientifico_Pubblicazione_Rivista AS asr JOIN Articolo_Scientifico AS a ON asr.articolo_scientifico = a.doi
        WHERE asr.rivista = rivista;
    );
END;
$$
    
CREATE OR REPLACE FUNCTION ArticoliInConferenza(conferenza Conferenza.cod_conferenza%type)
RETURNS SETOF Articolo AS 
$$
BEGIN
    RETURN QUERY(
        SELECT doi, titolo
        FROM Presentazione_Articolo AS pa JOIN Articolo_Scientifico AS a ON pa.articolo_scientifico = a.doi
        WHERE pa.conferenza = conferenza;
    );
END;
$$

CREATE OR REPLACE FUNCTION LibriDaAutore(autore Autore.cod_autore%type)
RETURNS SETOF Libro AS
$$
BEGIN
    RETURN QUERY(
        SELECT isbn, titolo
        FROM Scrittura_Libro AS sl JOIN Libro AS l ON sl.libro = l.isbn
        WHERE sl.autore = autore;
    );
END;
$$

CREATE OR REPLACE FUNCTION ArticoloDaAutore(autore Autore.cod_autore%type)
RETURNS SETOF Articolo AS 
$$
BEGIN
    RETURN QUERY(
        SELECT doi, titolo
        FROM Scrittura_Articolo AS sa JOIN Articolo_Scientifico AS a ON sa.articolo_scientifico = a.doi
        WHERE sa.autore = autore;
    );
END;
$$

CREATE OR REPLACE FUNCTION NegoziDaLibro(libro Libro.ISBN%type)
RETURNS SETOF Negozio AS
$$
BEGIN
    RETURN QUERY(
        SELECT partita_iva, nome
        FROM Vendita AS v JOIN Negozio AS n ON v.negozio = n.partita_iva
        WHERE v.libro = libro;
    );
END;
$$

CREATE OR REPLACE FUNCTION LibriInSala(sala Sala.cod_sala%type)
RETURNS SETOF Negozio AS
$$
BEGIN
    RETURN QUERY(
        SELECT isbn, titolo
        FROM Libro AS l JOIN Presentazione_Libro AS p ON l.isbn = p.libro
        WHERE p.sala = sala;
    );
END;
$$

CREATE OR REPLACE FUNCTION LibriInCollana(collana Collana.issn%type)
RETURNS SETOF Negozio AS
$$
BEGIN
    RETURN QUERY(
        SELECT isbn, titolo
        FROM Libro AS l JOIN Libro_Contenuto_Collana AS col ON col.libro = l.isbn
        WHERE col.collana = collana;
    );
END;
$$

CREATE OR REPLACE FUNCTION LibriInSerie(serie Serie.nome%type)
RETURNS SETOF Libro AS
$$
BEGIN
        RETURN QUERY(
            SELECT isbn, titolo
            FROM Libro AS l JOIN Serie AS s ON (s.sequel=l.isbn OR s.prequel=l.isbn)
            WHERE s.nome = serie
        );
END;
$$
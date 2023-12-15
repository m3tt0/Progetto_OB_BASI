CREATE OR REPLACE FUNCTION LibriInNegozio(negozio_richiesto Negozio.partita_iva%TYPE)
RETURNS TABLE (isbn Libro.isbn%TYPE, titolo Libro.titolo%TYPE, costo Vendita.costo%TYPE, quantita Vendita.quantita%TYPE) AS
$$
BEGIN
    RETURN QUERY(
        SELECT l.isbn, l.titolo, v.costo, v.quantita
        FROM Vendita AS v JOIN Libro AS l ON v.libro = l.isbn
        WHERE v.negozio = negozio_richiesto
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION RaccolteDiUtente(utente_richiedente Utente.username%TYPE, utente_richiesto Utente.username%TYPE)
RETURNS TABLE (nome Raccolta.nome%TYPE) AS
$$
BEGIN
    RETURN QUERY(
        SELECT r.nome
        FROM Raccolta AS r
        WHERE r.proprietario = utente_richiesto AND (utente_richiedente = utente_richiesto OR r.visibilita = 'pubblica')
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION LibriInRaccolta(raccolta_richiesta Raccolta.cod_raccolta%TYPE, utente_richiedente Utente.username%TYPE)
RETURNS TABLE (isbn Libro.isbn%TYPE, titolo Libro.titolo%TYPE) AS
$$
BEGIN
    RETURN QUERY(
        SELECT l.isbn, l.titolo
        FROM Libro AS l JOIN Libro_Contenuto_Raccolta AS lcr ON l.isbn = lcr.libro JOIN Raccolta AS r ON lcr.raccolta = r.cod_raccolta
        WHERE lcr.raccolta = raccolta_richiesta AND (r.visibilita='pubblica' OR r.proprietario = utente_richiedente)
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ArticoliInRivista(rivista_richiesta Rivista.issn%TYPE)
RETURNS TABLE (doi Articolo_Scientifico.doi%TYPE, titolo Articolo_Scientifico.titolo%TYPE) AS
$$
BEGIN
    RETURN QUERY(
        SELECT a.doi, a.titolo
        FROM Articolo_Scientifico_Pubblicazione_Rivista AS asr JOIN Articolo_Scientifico AS a ON asr.articolo_scientifico = a.doi
        WHERE asr.rivista = rivista_richiesta
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ArticoliInConferenza(conferenza_richiesta Conferenza.cod_conferenza%TYPE)
RETURNS TABLE (doi Articolo_Scientifico.doi%TYPE, titolo Articolo_Scientifico.titolo%TYPE) AS
$$
BEGIN
    RETURN QUERY(
        SELECT a.doi, a.titolo
        FROM Presentazione_Articolo AS pa JOIN Articolo_Scientifico AS a ON pa.articolo_scientifico = a.doi
        WHERE pa.conferenza = conferenza_richiesta
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION LibriDaAutore(autore_richiesto Autore.cod_autore%TYPE)
RETURNS TABLE (isbn Libro.isbn%TYPE, titolo Libro.titolo%TYPE) AS
$$
BEGIN
    RETURN QUERY(
        SELECT l.isbn, l.titolo
        FROM Scrittura_Libro AS sl JOIN Libro AS l ON sl.libro = l.isbn
        WHERE sl.autore = autore_richiesto
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ArticoloDaAutore(autore_richiesto Autore.cod_autore%TYPE)
RETURNS TABLE (doi Articolo_Scientifico.doi%TYPE, titolo Articolo_Scientifico.titolo%TYPE) AS
$$
BEGIN
    RETURN QUERY(
        SELECT a.doi, a.titolo
        FROM Scrittura_Articolo AS sa JOIN Articolo_Scientifico AS a ON sa.articolo_scientifico = a.doi
        WHERE sa.autore = autore_richiesto
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION NegoziDaLibro(libro_richiesto Libro.ISBN%TYPE)
RETURNS TABLE (partita_iva Negozio.partita_iva%TYPE, nome Negozio.nome%TYPE) AS
$$
BEGIN
    RETURN QUERY(
        SELECT n.partita_iva, n.nome
        FROM Vendita AS v JOIN Negozio AS n ON v.negozio = n.partita_iva
        WHERE v.libro = libro_richiesto
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION LibriInSala(sala_richiesta Sala.cod_sala%TYPE)
RETURNS TABLE (isbn Libro.isbn%TYPE, titolo Libro.titolo%TYPE) AS
$$
BEGIN
    RETURN QUERY(
        SELECT l.isbn, l.titolo
        FROM Libro AS l JOIN Presentazione_Libro AS p ON l.isbn = p.libro
        WHERE p.sala = sala_richiesta
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION LibriInCollana(collana_richiesta Collana.issn%TYPE)
RETURNS TABLE (isbn Libro.isbn%TYPE, titolo Libro.titolo%TYPE) AS
$$
BEGIN
    RETURN QUERY(
        SELECT l.isbn, l.titolo
        FROM Libro AS l JOIN Libro_Contenuto_Collana AS col ON col.libro = l.isbn
        WHERE col.collana = collana_richiesta
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION LibriInSerie(serie_richiesta Serie.nome%TYPE)
RETURNS TABLE (isbn Libro.isbn%TYPE, titolo Libro.titolo%TYPE) AS
$$
BEGIN
        RETURN QUERY(
            SELECT l.isbn, l.titolo
            FROM Libro AS l JOIN Serie AS s ON (s.sequel=l.isbn OR s.prequel=l.isbn)
            WHERE s.nome = serie_richiesta
        );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE VIEW TopTenRaccolteSalvate AS
SELECT r.cod_raccolta, r.nome, calcolonumerosalvataggiraccolta(r.cod_raccolta) AS numero_salvataggi
FROM Raccolta AS r
ORDER BY calcoloNumeroSalvataggiRaccolta(r.cod_raccolta) DESC
FETCH FIRST 10 ROWS ONLY;

CREATE OR REPLACE VIEW NegoziConSerieComplete AS
SELECT DISTINCT s.nome AS nome_serie, n.partita_iva, n.nome AS nome_negozio, n.indirizzo, n.url
FROM (Serie AS s JOIN Vendita AS v ON (s.prequel = v.libro OR s.sequel = v.libro)) JOIN Negozio AS n ON v.negozio = n.partita_iva
AND NOT EXISTS (
    SELECT *
    FROM serie AS s1
    WHERE s1.nome = s.nome
    AND (s1.sequel NOT IN (SELECT libro FROM Vendita AS v1 WHERE v1.negozio = v.negozio)
    OR s1.prequel NOT IN (SELECT libro FROM Vendita AS v1 WHERE v1.negozio = v.negozio))
)
AND NOT EXISTS (
    SELECT *
    FROM Serie AS s1 JOIN Vendita AS v1 ON (s1.prequel = v1.libro OR s1.sequel = v1.libro)
    WHERE v1.negozio = v.negozio
    AND v1.quantita = 0
);
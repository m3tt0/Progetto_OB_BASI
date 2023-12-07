CREATE OR REPLACE FUNCTION LibriInNegozio(cur_negozio Negozio.partita_iva%type)
RETURNS TABLE (isbn Libro.isbn%TYPE, titolo Libro.titolo%TYPE, costo Vendita.costo%TYPE, quantita Vendita.quantita%TYPE) AS
$$
BEGIN
    RETURN QUERY(
        SELECT l.isbn, l.titolo, v.costo, v.quantita
        FROM Vendita AS v JOIN Libro AS l ON v.libro = l.isbn
        WHERE v.negozio = cur_negozio
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION RaccolteDiUtente(cur_richiedente Utente.username%type, cur_proprietario Utente.username%type)
RETURNS TABLE (nome Raccolta.nome%TYPE) AS
$$
BEGIN
    RETURN QUERY(
        SELECT r.nome
        FROM Raccolta AS r
        WHERE r.proprietario = cur_proprietario AND (cur_richiedente = cur_proprietario OR r.visibilita = 'pubblica')
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION LibriInRaccolta(cur_raccolta Raccolta.cod_raccolta%type, cur_utente Utente.username%type)
RETURNS TABLE (isbn Libro.isbn%TYPE, titolo Libro.titolo%TYPE) AS
$$
BEGIN
    RETURN QUERY(
        SELECT l.isbn, l.titolo
        FROM Libro AS l JOIN Libro_Contenuto_Raccolta AS lcr ON l.isbn = lcr.libro JOIN Raccolta AS r ON lcr.raccolta = r.cod_raccolta
        WHERE lcr.raccolta = cur_raccolta AND (r.visibilita='pubblica' OR r.proprietario = cur_utente)
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ArticoliInRivista(cur_rivista Rivista.issn%type)
RETURNS TABLE (doi Articolo_Scientifico.doi%TYPE, titolo Articolo_Scientifico.titolo%TYPE) AS
$$
BEGIN
    RETURN QUERY(
        SELECT a.doi, a.titolo
        FROM Articolo_Scientifico_Pubblicazione_Rivista AS asr JOIN Articolo_Scientifico AS a ON asr.articolo_scientifico = a.doi
        WHERE asr.rivista = cur_rivista
    );
END;
$$ LANGUAGE plpgsql;
    
CREATE OR REPLACE FUNCTION ArticoliInConferenza(cur_conferenza Conferenza.cod_conferenza%type)
RETURNS TABLE (doi Articolo_Scientifico.doi%TYPE, titolo Articolo_Scientifico.titolo%TYPE) AS
$$
BEGIN
    RETURN QUERY(
        SELECT a.doi, a.titolo
        FROM Presentazione_Articolo AS pa JOIN Articolo_Scientifico AS a ON pa.articolo_scientifico = a.doi
        WHERE pa.conferenza = cur_conferenza
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION LibriDaAutore(cur_autore Autore.cod_autore%type)
RETURNS TABLE (isbn Libro.isbn%TYPE, titolo Libro.titolo%TYPE) AS
$$
BEGIN
    RETURN QUERY(
        SELECT l.isbn, l.titolo
        FROM Scrittura_Libro AS sl JOIN Libro AS l ON sl.libro = l.isbn
        WHERE sl.autore = cur_autore
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ArticoloDaAutore(cur_autore Autore.cod_autore%type)
RETURNS TABLE (doi Articolo_Scientifico.doi%TYPE, titolo Articolo_Scientifico.titolo%TYPE) AS
$$
BEGIN
    RETURN QUERY(
        SELECT a.doi, a.titolo
        FROM Scrittura_Articolo AS sa JOIN Articolo_Scientifico AS a ON sa.articolo_scientifico = a.doi
        WHERE sa.autore = cur_autore
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION NegoziDaLibro(cur_libro Libro.ISBN%type)
RETURNS TABLE (partita_iva Negozio.partita_iva%TYPE, nome Negozio.nome%TYPE) AS
$$
BEGIN
    RETURN QUERY(
        SELECT n.partita_iva, n.nome
        FROM Vendita AS v JOIN Negozio AS n ON v.negozio = n.partita_iva
        WHERE v.libro = cur_libro
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION LibriInSala(cur_sala Sala.cod_sala%type)
RETURNS TABLE (isbn Libro.isbn%TYPE, titolo Libro.titolo%TYPE) AS
$$
BEGIN
    RETURN QUERY(
        SELECT l.isbn, l.titolo
        FROM Libro AS l JOIN Presentazione_Libro AS p ON l.isbn = p.libro
        WHERE p.sala = cur_sala
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION LibriInCollana(cur_collana Collana.issn%type)
RETURNS TABLE (isbn Libro.isbn%TYPE, titolo Libro.titolo%TYPE) AS
$$
BEGIN
    RETURN QUERY(
        SELECT l.isbn, l.titolo
        FROM Libro AS l JOIN Libro_Contenuto_Collana AS col ON col.libro = l.isbn
        WHERE col.collana = cur_collana
    );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION LibriInSerie(cur_serie Serie.nome%type)
RETURNS TABLE (isbn Libro.isbn%TYPE, titolo Libro.titolo%TYPE) AS
$$
BEGIN
        RETURN QUERY(
            SELECT l.isbn, l.titolo
            FROM Libro AS l JOIN Serie AS s ON (s.sequel=l.isbn OR s.prequel=l.isbn)
            WHERE s.nome = cur_serie
        );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE VIEW TopTenRaccolteSalvate AS
SELECT r.cod_raccolta, r.nome, calcolonumerosalvataggiraccolta(r.cod_raccolta) AS numero_salvataggi
FROM Raccolta AS r
ORDER BY calcoloNumeroSalvataggiRaccolta(r.cod_raccolta) DESC
FETCH FIRST 10 ROWS ONLY;

CREATE OR REPLACE VIEW NegoziConSerieComplete AS
SELECT DISTINCT v.negozio, n.indirizzo, n.url, s.nome
FROM (Serie AS s JOIN Vendita AS v ON s.prequel = v.libro) JOIN Negozio AS n ON v.negozio = n.partita_iva
WHERE NOT EXISTS (
    SELECT s1.sequel, s1.prequel
    FROM serie AS s1
    WHERE s1.nome = s.nome
    AND (sequel NOT IN (SELECT libro FROM Vendita AS v1 WHERE v1.negozio = v.negozio)
    OR libro NOT IN (SELECT libro FROM Vendita AS v1 WHERE v1.negozio = v.negozio))
);

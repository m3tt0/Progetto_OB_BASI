CREATE OR REPLACE VIEW LibriInNegozio AS
SELECT isbn, titolo, costo, quantita
FROM Vendita AS v JOIN Libro AS l ON v.libro = l.isbn
WHERE v.negozio = --NEGOZIO DA ANALIZZARE-- ;

CREATE OR REPLACE VIEW RaccolteDiUtente AS
SELECT nome
FROM Raccolta AS r
WHERE r.proprietario = '' AND ('' = '' OR r.visibilita = 'pubblica');

CREATE OR REPLACE VIEW LibriInRaccolta AS
SELECT isbn, titolo
FROM Raccolta AS r JOIN Libro_Contenuto_Raccolta AS lr ON r.cod_raccolta = lr.raccolta
WHERE r.cod_raccolta = '' AND r.proprietario = '';

CREATE OR REPLACE VIEW ArticoliInRivista AS
SELECT doi, titolo,
FROM Articolo_Scientifico_Pubblicazione_Rivista AS asr JOIN Articolo_Scientifico AS a ON asr.articolo_scientifico = a.doi
WHERE asr.rivista = '';

CREATE OR REPLACE VIEW ArticoliInConferenza AS
SELECT doi, titolo
FROM Presentazione_Articolo AS pa JOIN Articolo_Scientifico AS a ON pa.articolo_scientifico = a.doi
WHERE pa.conferenza = '';

CREATE OR REPLACE VIEW LibriDaAutore AS
SELECT isbn, titolo
FROM Scrittura_Libro AS sl JOIN Libro AS l ON sl.libro = l.isbn
WHERE sl.autore = '';

CREATE OR REPLACE VIEW ArticoloDaAutore AS
SELECT doi, titolo
FROM Scrittura_Articolo AS sa JOIN Articolo_Scientifico AS a ON sa.articolo_scientifico = a.doi
WHERE sa.autore = '';

CREATE OR REPLACE VIEW NegozioDiLibri AS
SELECT partita_iva, nome
FROM Vendita AS v JOIN Negozio AS n ON v.negozio = n.partita_iva
WHERE v.libro = '';
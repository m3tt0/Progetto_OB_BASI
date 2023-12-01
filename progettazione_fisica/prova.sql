CREATE TABLE IF NOT EXISTS Utente
(
    username USERNAME NOT NULL,

    CONSTRAINT Utente_PK PRIMARY KEY (username)
);

CREATE TABLE IF NOT EXISTS Raccolta
(
    cod_raccolta SERIAL NOT NULL,
    nome VARCHAR DEFAULT 'nuova_raccolta',

    CONSTRAINT Raccolta_PK PRIMARY KEY (cod_raccolta)
);

CREATE TABLE IF NOT EXISTS Utente_Salvataggio_Raccolta
(
    utente USERNAME NOT NULL,
    raccolta SERIAL NOT NULL,

    CONSTRAINT Salvataggio_PK PRIMARY KEY (utente, raccolta),
    CONSTRAINT Username_FK FOREIGN KEY (utente) REFERENCES Utente (username) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Raccolta_FK FOREIGN KEY (raccolta) REFERENCES Raccolta (cod_raccolta) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO libro_contenuto_collana(libro, collana)
VALUES
('9780061120084', '1234-567X');



SELECT *
FROM LibriInNegozio('55667788990');

SELECT *
FROM RaccolteDiUtente('alice_smith','alice_smith');

SELECT *
FROM LibriInRaccolta(7, 'david_thompson');

SELECT *
FROM ArticoliInRivista('1234-5678');

SELECT *
FROM ArticoliInConferenza(1);

SELECT *
FROM LibriDaAutore(3);

SELECT *
FROM ArticoloDaAutore(1);

SELECT *
FROM NegoziDaLibro('9788804509955');

SELECT *
FROM LibriInSala(3);

SELECT *
FROM LibriInCollana('5678-9012');

SELECT *
FROM LibriInSerie('Saga Harry Potter Cartacea');




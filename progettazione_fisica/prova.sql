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
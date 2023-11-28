CREATE TABLE IF NOT EXISTS Libro
(
    isbn ISBN NOT NULL,
    titolo VARCHAR NOT NULL,
    editore VARCHAR NOT NULL,
    modalita_fruizione TIPO_FRUIZIONE NOT NULL,
    anno_pubblicazione NUMERIC(4) NOT NULL,
    copertina BYTEA NOT NULL,
    descrizione VARCHAR,
    genere VARCHAR,
    target VARCHAR,
    materia VARCHAR,
    tipo TIPO_LIBRO NOT NULL,

    CONSTRAINT Libro_PK PRIMARY KEY (isbn),
    CONSTRAINT Didattico_Or_Romanzo CHECK ((tipo = 'romanzo' AND genere IS NOT NULL AND materia IS NULL AND target IS NULL) OR
                                           (tipo = 'didattico' AND materia IS NOT NULL AND target IS NOT NULL AND genere IS NULL))
);

CREATE TABLE IF NOT EXISTS Articolo_Scientifico
(
    doi DOI NOT NULL,
    titolo VARCHAR NOT NULL,
    editore VARCHAR NOT NULL,
    modalita_fruizione TIPO_FRUIZIONE NOT NULL,
    anno_pubblicazione NUMERIC(4) NOT NULL,
    copertina BYTEA NOT NULL,
    descrizione VARCHAR,

    CONSTRAINT Articolo_Scientifico_PK PRIMARY KEY (doi)
);

CREATE TABLE IF NOT EXISTS Autore
(
    cod_autore SERIAL NOT NULL,
    nome VARCHAR NOT NULL,
    data_nascita DATE NOT NULL,
    data_morte DATE,
    nazionalita  VARCHAR NOT NULL,
    biografia TEXT,

    CONSTRAINT Autore_PK PRIMARY KEY (cod_autore)
);

CREATE TABLE IF NOT EXISTS Scrittura_Libro
(
    autore SERIAL NOT NULL,
    libro ISBN NOT NULL,

    CONSTRAINT Scrittura_Libro_PK PRIMARY KEY (autore, libro),
    CONSTRAINT Autore_FK FOREIGN KEY (autore) REFERENCES Autore(cod_autore) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Libro_FK FOREIGN KEY (libro) REFERENCES Libro(isbn) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Scrittura_Articolo
(
    autore SERIAL NOT NULL,
    articolo_scientifico DOI NOT NULL,

    CONSTRAINT Scrittura_Articolo_PK PRIMARY KEY (autore, articolo_scientifico),
    CONSTRAINT Autore_FK FOREIGN KEY (autore) REFERENCES Autore(cod_autore) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Articolo_Scientifico_FK FOREIGN KEY (articolo_scientifico) REFERENCES Articolo_Scientifico(doi) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Sala
(
    cod_sala SERIAL NOT NULL,
    nome VARCHAR NOT NULL,
    indirizzo VARCHAR NOT NULL,

    CONSTRAINT Sala_PK PRIMARY KEY (cod_sala)
);

CREATE TABLE IF NOT EXISTS Presentazione_Libro
(
    sala SERIAL NOT NULL,
    libro ISBN NOT NULL,
    data_presentazione DATE NOT NULL,

    CONSTRAINT Presentazione_Libro_PK PRIMARY KEY (sala, libro),
    CONSTRAINT Sala_FK FOREIGN KEY (sala) REFERENCES Sala(cod_sala) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Libro_FK FOREIGN KEY (libro) REFERENCES Libro(isbn) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Collana
(
    issn ISSN NOT NULL,
    nome VARCHAR NOT NULL,
    editore VARCHAR NOT NULL,

    CONSTRAINT Collana_PK PRIMARY KEY (issn)
);

CREATE TABLE IF NOT EXISTS Libro_Contenuto_Collana
(
    libro ISBN NOT NULL,
    collana ISSN NOT NULL,

    CONSTRAINT Libro_Contenuto_Collana_PK PRIMARY KEY (libro, collana),
    CONSTRAINT Libro_FK FOREIGN KEY (libro) REFERENCES Libro(isbn) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Collana_FK FOREIGN KEY (collana) REFERENCES Collana(issn) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Rivista
(
    issn ISSN NOT NULL,
    nome VARCHAR NOT NULL,
    argomento VARCHAR NOT NULL,
    anno_pubblicazione NUMERIC(4) NOT NULL,
    responsabile VARCHAR NOT NULL,

    CONSTRAINT Rivista_PK PRIMARY KEY (issn)
);

CREATE TABLE IF NOT EXISTS Articolo_Scientifico_Pubblicazione_Rivista
(
    articolo_scientifico DOI NOT NULL,
    rivista ISSN NOT NULL,

    CONSTRAINT Pubblicazione_PK PRIMARY KEY (rivista, articolo_scientifico),
    CONSTRAINT Articolo_Scientifico_FK FOREIGN KEY (articolo_scientifico) REFERENCES Articolo_Scientifico(doi) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Rivista_FK FOREIGN KEY (rivista) REFERENCES Rivista(cod_rivista) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Conferenza
(
    cod_conferenza SERIAL NOT NULL,
    luogo VARCHAR NOT NULL,
    data_inizio DATE NOT NULL,
    data_fine DATE NOT NULL,
    organizzatore VARCHAR NOT NULL,
    responsabile VARCHAR NOT NULL,

    CONSTRAINT Conferenza_PK PRIMARY KEY (cod_conferenza)
);

CREATE TABLE IF NOT EXISTS Presentazione_Articolo
(
    conferenza SERIAL NOT NULL,
    articolo_scientifico DOI NOT NULL,
    data_presentazione DATE NOT NULL,

    CONSTRAINT Presentazione_Articolo_PK PRIMARY KEY (conferenza, articolo_scientifico),
    CONSTRAINT Conferenza_FK FOREIGN KEY (conferenza) REFERENCES Conferenza(cod_conferenza) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Articolo_Scientifico_FK FOREIGN KEY (articolo_scientifico) REFERENCES Articolo_Scientifico(doi) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Negozio
(
    partita_iva PARTITA_IVA NOT NULL,
    nome VARCHAR NOT NULL,
    indirizzo VARCHAR,
    url VARCHAR,

    CONSTRAINT Negozio_PK PRIMARY KEY (partita_iva),
    CONSTRAINT Validita_Negozio CHECK (indirizzo != NULL OR url != NULL)
);

CREATE TABLE IF NOT EXISTS Vendita
(
    negozio PARTITA_IVA NOT NULL,
    libro ISBN NOT NULL,
    costo NUMERIC(14, 2) NOT NULL,
    quantita INTEGER DEFAULT 0,

    CONSTRAINT Vendita_PK PRIMARY KEY (negozio, libro),
    CONSTRAINT Negozio_FK FOREIGN KEY (negozio) REFERENCES Negozio (partita_iva) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Libro_FK FOREIGN KEY (libro) REFERENCES Libro (isbn) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Serie
(
    nome VARCHAR NOT NULL,
    prequel ISBN NOT NULL UNIQUE,
    sequel ISBN NOT NULL UNIQUE,

    CONSTRAINT Serie_PK PRIMARY KEY (nome, prequel, sequel),
    CONSTRAINT Prequel_FK FOREIGN KEY (prequel) REFERENCES Libro (isbn) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Sequel_FK FOREIGN KEY (sequel) REFERENCES Libro (isbn) ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT Prequel_NotEqual_Sequel CHECK(prequel != sequel)
);

CREATE TABLE IF NOT EXISTS Utente
(
    username USERNAME NOT NULL,
    email EMAIL_TYPE UNIQUE NOT NULL,
    password BYTEA NOT NULL,
    nome VARCHAR NOT NULL,
    cognome VARCHAR NOT NULL,
    data_nascita DATE NOT NULL,
    amministratore BOOL NOT NULL DEFAULT FALSE,

    CONSTRAINT Utente_PK PRIMARY KEY (username),
);

CREATE TABLE IF NOT EXISTS Notifica
(
    messaggio TEXT NOT NULL,
    data_ora TIMESTAMP NOT NULL,
    destinatario USERNAME NOT NULL,

    CONSTRAINT Notifica_PK PRIMARY KEY (data_ora, destinatario),
    CONSTRAINT Destinatario_FK FOREIGN KEY (destinatario) REFERENCES Utente(username) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Raccolta
(
    cod_raccolta SERIAL NOT NULL,
    nome VARCHAR NOT NULL DEFAULT 'nuova_raccolta',
    visibilita VISIBILITA NOT NULL DEFAULT FALSE,
    proprietario USERNAME NOT NULL,

    CONSTRAINT Raccolta_PK PRIMARY KEY (cod_raccolta),
    CONSTRAINT Proprietario_FK FOREIGN KEY (proprietario) REFERENCES Utente (username) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Articolo_Contenuto_Raccolta
(
    articolo_scientifico DOI NOT NULL,
    raccolta SERIAL NOT NULL,

    CONSTRAINT Articolo_Contenuto_Raccolta_PK PRIMARY KEY (articolo_scientifico, raccolta),
    CONSTRAINT Raccolta_FK FOREIGN KEY (raccolta) REFERENCES Raccolta (cod_raccolta) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Articolo_Scientifico_FK FOREIGN KEY (articolo_scientifico) REFERENCES Articolo_Scientifico (doi) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Libro_Contenuto_Raccolta
(
    libro ISBN NOT NULL,
    raccolta SERIAL NOT NULL,

    CONSTRAINT Libro_Contenuto_Raccolta_PK PRIMARY KEY (raccolta, libro),
    CONSTRAINT Libro_FK FOREIGN KEY (libro) REFERENCES Libro (isbn) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Raccolta_FK FOREIGN KEY (raccolta) REFERENCES Raccolta (cod_raccolta) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Utente_Salvataggio_Raccolta
(
    utente USERNAME NOT NULL,
    raccolta SERIAL NOT NULL,

    CONSTRAINT Salvataggio_PK PRIMARY KEY (utente, raccolta),
    CONSTRAINT Username_FK FOREIGN KEY (utente) REFERENCES Utente (username) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Raccolta_FK FOREIGN KEY (raccolta) REFERENCES Raccolta (cod_raccolta) ON UPDATE CASCADE ON DELETE CASCADE
);

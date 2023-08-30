CREATE TABLE IF NOT EXISTS Libro
(
    isbn ISBN NOT NULL,
    titolo VARCHAR NOT NULL,
    editore VARCHAR NOT NULL,
    modalita_fruizione TIPO_FRUIZIONE NOT NULL,
    anno_pubblicazione NUMERIC(4) NOT NULL,
    copertina BYTEA NOT NULL,
    descrzione VARCHAR,
    genere VARCHAR,
    target VARCHAR,
    materia VARCHAR,
    tipo TIPO_LIBRO NOT NULL,

    CONSTRAINT Libro_PK PRIMARY KEY (ISBN),
    CONSTRAINT didattico_or_romanzo CHECK (tipo = 'romanzo' AND genere IS NOT NULL AND materia IS NULL AND target IS NULL OR
                                           tipo = 'didattico' AND materia IS NOT NULL AND target IS NOT NULL AND genere IS NULL)
);

CREATE TABLE IF NOT EXISTS Articolo_Scientifico
(
    isbn ISBN NOT NULL,
    titolo VARCHAR NOT NULL,
    editore VARCHAR NOT NULL,
    modalita_fruizione TIPO_FRUIZIONE NOT NULL,
    anno_pubblicazione SMALLINT NOT NULL,
    copertina BYTEA,
    descrzione VARCHAR,

    CONSTRAINT Articolo_Scientifico_PK PRIMARY KEY (ISBN)
);

CREATE TABLE IF NOT EXISTS Serie
(
    libro ISBN NOT NULL UNIQUE,
    sequel ISBN NOT NULL UNIQUE,
    nome_serie VARCHAR NOT NULL,

    CONSTRAINT Serie_PK PRIMARY KEY (nome_serie, libro, sequel),
    CONSTRAINT Prequel_FK FOREIGN KEY (libro) REFERENCES Libro (ISBN) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Sequel_FK FOREIGN KEY (sequel) REFERENCES Libro (ISBN) ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT notequal CHECK(libro != sequel)
);


CREATE TABLE IF NOT EXISTS Utente
(
    cod_utente SERIAL NOT NULL,
    nickname VARCHAR UNIQUE NOT NULL,
    email EMAIL_TYPE UNIQUE NOT NULL,
    password BYTEA NOT NULL,
    nome VARCHAR NOT NULL,
    cognome VARCHAR NOT NULL,
    data_nascita DATE NOT NULL,
    admin BOOL NOT NULL DEFAULT FALSE,

    CONSTRAINT Utente_PK PRIMARY KEY (cod_utente),

    CHECK (nickname !~ '^.*[^A-Za-z0-9].*$')
);


CREATE TABLE IF NOT EXISTS Notifica
(
    messaggio TEXT NOT NULL,
    ora_data TIMESTAMP NOT NULL,
    utente SERIAL NOT NULL,

    CONSTRAINT Utente_FK FOREIGN KEY (utente) REFERENCES Utente(cod_utente)
);

CREATE TABLE IF NOT EXISTS Raccolta
(
    cod_raccolta SERIAL NOT NULL,
    num_salvataggi INTEGER NOT NULL DEFAULT 0,
    visibilità BOOLEAN NOT NULL DEFAULT FALSE,
    proprietario SERIAL NOT NULL,

    CONSTRAINT Raccolta_PK PRIMARY KEY (cod_raccolta),
    CONSTRAINT Raccolta_FK FOREIGN KEY (proprietario) REFERENCES Utente (cod_utente) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Libro_Contenuto_Raccolta
(
  raccolta serial not null,
  libro isbn not null,

  CONSTRAINT Libro_Contenuto_Raccolta_PK PRIMARY KEY (raccolta, libro),
  CONSTRAINT Libro_Contenuto_Raccolta_FK1 FOREIGN KEY (raccolta) REFERENCES Raccolta (cod_raccolta) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Libro_Contenuto_Raccolta_FK2 FOREIGN KEY (libro) REFERENCES Libro (ISBN) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Articolo_Contenuto_Raccolta
(
  raccolta SERIAL NOT NULL,
  articolo_scientifico ISBN NOT NULL,

  CONSTRAINT Articolo_Contenuto_Raccolta_PK PRIMARY KEY (raccolta, articolo_scientifico),
  CONSTRAINT Articolo_Contenuto_Raccolta_FK1 FOREIGN KEY (raccolta) REFERENCES Raccolta (cod_raccolta) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Articolo_Contenuto_Raccolta_FK2 FOREIGN KEY (articolo_scientifico) REFERENCES Articolo_Scientifico (ISBN) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Utente_Salvataggio_Raccolta
(
    utente SERIAL NOT NULL,
    raccolta SERIAL NOT NULL,

    CONSTRAINT Salvataggio_PK PRIMARY KEY (utente, raccolta),
    CONSTRAINT Utente_FK FOREIGN KEY (utente) REFERENCES Utente (cod_utente) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Raccolta_FK FOREIGN KEY (raccolta) REFERENCES Raccolta (cod_raccolta) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Rivista
(
    cod_rivista INTEGER NOT NULL,
    nome VARCHAR NOT NULL,
    argomento VARCHAR NOT NULL,
    anno_pubblicazione SMALLINT NOT NULL,
    responsabile VARCHAR NOT NULL,

    CONSTRAINT Rivista_PK PRIMARY KEY (cod_rivista)
);

CREATE TABLE IF NOT EXISTS Articolo_Scientifico_Pubblicazione_Rivista
(
    rivista INTEGER NOT NULL,
    articolo_scientifico isbn NOT NULL,

    CONSTRAINT Pubblicazione_PK PRIMARY KEY (rivista, articolo_scientifico),
    CONSTRAINT Rivista_FK FOREIGN KEY (rivista) REFERENCES Rivista(cod_rivista) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Articolo_Scientifico_FK FOREIGN KEY (articolo_scientifico) REFERENCES Articolo_Scientifico(ISBN) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Conferenza
(
    codice_conferenza INTEGER NOT NULL,
    luogo VARCHAR NOT NULL,
    data_inizio DATE NOT NULL,
    data_fine DATE NOT NULL,
    organizzatore VARCHAR NOT NULL,
    responsabile VARCHAR NOT NULL,

    CONSTRAINT Conferenza_PK PRIMARY KEY (codice_conferenza)
);

CREATE TABLE IF NOT EXISTS Presentazione_Articolo
(
    codice_conferenza INTEGER NOT NULL,
    articolo_scientifico ISBN NOT NULL,
    data_presentazione DATE NOT NULL,

    CONSTRAINT Presentazione_Articolo_PK PRIMARY KEY (codice_conferenza, articolo_scientifico),
    CONSTRAINT Presentazione_Articolo_FK_Conferenza FOREIGN KEY (codice_conferenza) REFERENCES Conferenza(codice_conferenza) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Presentazione_Articolo_FK_Articolo_Scientifico FOREIGN KEY (articolo_scientifico) REFERENCES Articolo_Scientifico(ISBN) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Collana
(
    issn ISSN NOT NULL,
    nome VARCHAR NOT NULL,
    editore VARCHAR NOT NULL,

    CONSTRAINT Collana_PK PRIMARY KEY (ISSN)
);

CREATE TABLE IF NOT EXISTS Libro_Contenuto_Collana
(
    isbn ISBN NOT NULL,
    issn ISSN NOT NULL,

    CONSTRAINT Libro_Contenuto_Collana_PK PRIMARY KEY (ISBN, ISSN) ,
    CONSTRAINT Libro_Contenuto_Collana_FK_Libro FOREIGN KEY (ISBN) REFERENCES Libro(ISBN) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Libro_Contenuto_Collana_FK_Collana FOREIGN KEY (ISSN) REFERENCES Collana(ISSN) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Autore
(
    cod_autore INTEGER NOT NULL,
    nome VARCHAR NOT NULL,
    data_nascita DATE NOT NULL,
    data_morte DATE,
    nazionalitÃ  VARCHAR NOT NULL,
    biografia VARCHAR NOT NULL,

    CONSTRAINT Autore_PK PRIMARY KEY (cod_autore)
);

CREATE TABLE IF NOT EXISTS Scrittura_Articolo
(
    cod_autore INTEGER NOT NULL,
    isbn ISBN NOT NULL,

    CONSTRAINT Scrittura_Articolo_PK PRIMARY KEY (cod_autore, ISBN),
    CONSTRAINT Scrittura_Articolo_FK_Autore FOREIGN KEY (cod_autore) REFERENCES Autore(cod_autore) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Scrittura_Articolo_FK_Articolo_Scientifico FOREIGN KEY (ISBN) REFERENCES Articolo_Scientifico(ISBN) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Scrittura_Libro
(
    cod_autore INTEGER NOT NULL,
    isbn ISBN NOT NULL,

    CONSTRAINT Scrittura_Libro_PK PRIMARY KEY (cod_autore, ISBN),
    CONSTRAINT Scrittura_Libro_FK_Autore FOREIGN KEY (cod_autore) REFERENCES Autore(cod_autore) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Scrittura_Libro_FK_Libro FOREIGN KEY (ISBN) REFERENCES Libro(ISBN) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Sala
(
    codice_sala INTEGER NOT NULL,
    nome VARCHAR NOT NULL,
    indirizzo VARCHAR NOT NULL,

    CONSTRAINT Sala_CodiceSala PRIMARY KEY (codice_sala)
);

CREATE TABLE IF NOT EXISTS Presentazione_Libro
(
    codice_sala INTEGER NOT NULL,
    isbn ISBN NOT NULL,
    data_presentazione DATE NOT NULL,

    CONSTRAINT Presentazione_Libro_PK PRIMARY KEY (codice_sala, ISBN),
    CONSTRAINT Presentazione_Libro_FK_Sala FOREIGN KEY (codice_sala) REFERENCES Sala(codice_sala) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Presentazione_Libro_FK_Libro FOREIGN KEY (ISBN) REFERENCES Libro(ISBN) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Negozio
(
    partita_iva CHAR(11) NOT NULL,
    nome VARCHAR NOT NULL,
    indirizzo VARCHAR,
    url VARCHAR,

    CONSTRAINT Negozio_PK PRIMARY KEY (partita_iva),

    CHECK (partita_iva ~ '^\d+$'),

    CHECK (indirizzo != NULL OR url != NULL)

);

CREATE TABLE IF NOT EXISTS Vendita
(
    negozio CHAR(11) NOT NULL,
    libro ISBN NOT NULL,
    costo DOUBLE PRECISION,
    quantità INTEGER DEFAULT 0,

    CONSTRAINT Vendita_PK PRIMARY KEY (negozio, libro),
    CONSTRAINT Negozio_FK FOREIGN KEY (negozio) REFERENCES Negozio (partita_iva) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Libro_FK FOREIGN KEY (libro) REFERENCES Libro (ISBN) ON UPDATE CASCADE ON DELETE CASCADE
);
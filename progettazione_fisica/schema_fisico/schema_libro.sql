create domain isbn as char(17) check(value like '978-__-___-____-_');

create domain issn as char(9) check(value like '____-____');

create domain email_type as varchar check (value like '%@%.%');

create type tipo_fruizione as enum ('digitale', 'cartaceo', 'audiolibro');

create type tipo_libro as enum ('didattico', 'romanzo');

create table if not exists Libro
(
    ISBN isbn NOT NULL,
    titolo varchar NOT NULL,
    editore varchar NOT NULL,
    modalita_fruizione tipo_fruizione NOT NULL,
    anno_pubblicazione numeric(4) NOT NULL,
    copertina bytea NOT NULL,
    descrzione varchar,
    genere varchar,
    target varchar,
    materia varchar,
    tipo tipo_libro NOT NULL,

    CONSTRAINT Libro_PK PRIMARY KEY (ISBN),
    CONSTRAINT didattico_or_romanzo check (tipo = 'romanzo' and genere is not null or tipo = 'didattico' and materia is not null and target is not null)

);

create table if not exists Articolo_Scientifico
(
    ISBN isbn NOT NULL,
    titolo varchar NOT NULL,
    editore varchar NOT NULL,
    modalita_fruizione tipo_fruizione NOT NULL,
    anno_pubblicazione smallint NOT NULL,
    copertina bytea,
    descrzione varchar,

    CONSTRAINT Articolo_Scientifico_PK PRIMARY KEY (ISBN)

);

create table if not exists Serie
(
    codice_serie integer not null,
    prequel isbn not null,
    sequel isbn not null,
    nome varchar not null,

    CONSTRAINT Serie_PK PRIMARY KEY (codice_serie, prequel, sequel),
    CONSTRAINT Prequel_FK FOREIGN KEY (prequel) REFERENCES Libro (ISBN) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Sequel_FK FOREIGN KEY (sequel) REFERENCES Libro (ISBN) ON UPDATE CASCADE ON DELETE CASCADE
);


create table if not exists Utente
(
    cod_utente serial not null,
    nickname varchar unique not null,
    email email_type unique not null,
    password bytea not null,
    nome varchar not null,
    cognome varchar not null,
    data_nascita date not null,
    admin bool not null default false,

    CONSTRAINT Utente_PK PRIMARY KEY (cod_utente),

    check (nickname !~ '^.*[^A-Za-z0-9].*$')
);


create table if not exists Notifica
(
    messaggio text not null,
    ora_data timestamptz not null,
    utente serial not null,

    CONSTRAINT Utente_FK FOREIGN KEY (utente) REFERENCES Utente(cod_utente)
);

create table if not exists Raccolta
(
    cod_raccolta serial not null,
    num_salvataggi integer not null default 0,
    visibilità boolean not null default false,
    proprietario serial not null,

    CONSTRAINT Raccolta_PK PRIMARY KEY (cod_raccolta),
    CONSTRAINT Raccolta_FK FOREIGN KEY (proprietario) REFERENCES Utente (cod_utente) ON UPDATE CASCADE ON DELETE CASCADE
);



create table if not exists Libro_Contenuto_Raccolta
(
  raccolta serial not null,
  libro isbn not null,

  CONSTRAINT Libro_Contenuto_Raccolta_PK PRIMARY KEY (raccolta, libro),
  CONSTRAINT Libro_Contenuto_Raccolta_FK1 FOREIGN KEY (raccolta) REFERENCES Raccolta (cod_raccolta) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Libro_Contenuto_Raccolta_FK2 FOREIGN KEY (libro) REFERENCES Libro (ISBN) ON UPDATE CASCADE ON DELETE CASCADE
);

create table if not exists Articolo_Contenuto_Raccolta
(
  raccolta serial not null,
  articolo_scientifico isbn not null,

  CONSTRAINT Articolo_Contenuto_Raccolta_PK PRIMARY KEY (raccolta, articolo_scientifico),
  CONSTRAINT Articolo_Contenuto_Raccolta_FK1 FOREIGN KEY (raccolta) REFERENCES Raccolta (cod_raccolta) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT Articolo_Contenuto_Raccolta_FK2 FOREIGN KEY (articolo_scientifico) REFERENCES Articolo_Scientifico (ISBN) ON UPDATE CASCADE ON DELETE CASCADE
);

create table if not exists Utente_Salvataggio_Raccolta
(
    utente serial not null,
    raccolta serial not null,

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
    articolo_scientifico isbn NOT NULL,
    data_presentazione DATE NOT NULL,

    CONSTRAINT Presentazione_Articolo_PK PRIMARY KEY (codice_conferenza, articolo_scientifico),
    CONSTRAINT Presentazione_Articolo_FK_Conferenza FOREIGN KEY (codice_conferenza) REFERENCES Conferenza(codice_conferenza) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Presentazione_Articolo_FK_Articolo_Scientifico FOREIGN KEY (articolo_scientifico) REFERENCES Articolo_Scientifico(ISBN) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Collana
(
    ISSN issn NOT NULL,
    nome VARCHAR NOT NULL,
    editore VARCHAR NOT NULL,

    CONSTRAINT Collana_PK PRIMARY KEY (ISSN)
);

CREATE TABLE IF NOT EXISTS Libro_Contenuto_Collana
(
    ISBN isbn NOT NULL,
    ISNN issn NOT NULL,

    CONSTRAINT Libro_Contenuto_Collana_PK PRIMARY KEY (ISBN, ISNN) ,
    CONSTRAINT Libro_Contenuto_Collana_FK_Libro FOREIGN KEY (ISBN) REFERENCES Libro(ISBN) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Libro_Contenuto_Collana_FK_Collana FOREIGN KEY (ISNN) REFERENCES Collana(ISSN) ON UPDATE CASCADE ON DELETE CASCADE
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
    ISBN isbn NOT NULL,

    CONSTRAINT Scrittura_Articolo_PK PRIMARY KEY (cod_autore, ISBN),
    CONSTRAINT Scrittura_Articolo_FK_Autore FOREIGN KEY (cod_autore) REFERENCES Autore(cod_autore) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Scrittura_Articolo_FK_Articolo_Scientifico FOREIGN KEY (ISBN) REFERENCES Articolo_Scientifico(ISBN) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Scrittura_Libro
(
    cod_autore INTEGER NOT NULL,
    ISBN isbn NOT NULL,

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
    ISBN isbn NOT NULL,
    data_presentazione DATE NOT NULL,

    CONSTRAINT Presentazione_Libro_PK PRIMARY KEY (codice_sala, ISBN),
    CONSTRAINT Presentazione_Libro_FK_Sala FOREIGN KEY (codice_sala) REFERENCES Sala(codice_sala) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Presentazione_Libro_FK_Libro FOREIGN KEY (ISBN) REFERENCES Libro(ISBN) ON UPDATE CASCADE ON DELETE CASCADE
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

CREATE TABLE IF NOT EXISTS Negozio
(
    partita_iva CHAR(11) NOT NULL,
    nome VARCHAR NOT NULL,
    indirizzo VARCHAR,
    url VARCHAR,

    CONSTRAINT Negozio_PK PRIMARY KEY (partita_iva),

    check (partita_iva ~ '^\d+$'),

    check (indirizzo != NULL OR url != NULL)

);







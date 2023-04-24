create domain isbn as char(17) check(value like '978-__-___-____-_');

create type tipo_fruizione as enum ('digitale', 'cartaceo', 'audiolibro');

create table if not exists Libro
(
    ISBN isbn NOT NULL,
    titolo varchar NOT NULL,
    editore varchar NOT NULL,
    modalita_fruizione tipo_fruizione NOT NULL,
    anno_pubblicazione smallint NOT NULL,
    copertina bytea NOT NULL,
    descrzione varchar,

    constraint Libro_PK PRIMARY KEY (ISBN)

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

    constraint Articolo_Scientifico_PK PRIMARY KEY (ISBN)

);
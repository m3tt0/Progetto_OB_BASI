CREATE TABLE IF NOT EXISTS Libro
(
    isbn ISBN NOT NULL,
    titolo VARCHAR NOT NULL,
    editore VARCHAR NOT NULL,
    modalita_fruizione TIPO_FRUIZIONE NOT NULL,
    anno_pubblicazione NUMERIC(4) NOT NULL,
    copertina BYTEA,
    descrizione VARCHAR,
    genere VARCHAR,
    target VARCHAR,
    materia VARCHAR,
    tipo TIPO_LIBRO NOT NULL,

    CONSTRAINT Libro_PK PRIMARY KEY (isbn),
    CONSTRAINT Didattico_Or_Romanzo CHECK ((tipo = 'romanzo' AND genere IS NOT NULL AND materia IS NULL AND target IS NULL) OR
                                           (tipo = 'didattico' AND materia IS NOT NULL AND target IS NOT NULL AND genere IS NULL))
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

CREATE TABLE IF NOT EXISTS Negozio
(
    partita_iva PARTITA_IVA NOT NULL,
    nome VARCHAR NOT NULL,
    indirizzo VARCHAR,
    url VARCHAR,

    CONSTRAINT Negozio_PK PRIMARY KEY (partita_iva),
    CONSTRAINT Validita_Negozio CHECK (indirizzo IS NOT NULL OR url IS NOT NULL)
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

INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780060935467', 'Piccole donne', 'Mondadori', 'cartaceo', 1868, null, 'Un romanzo classico per ragazze', 'Fiction', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780061120084', 'Il vecchio e il mare', 'Einaudi', 'cartaceo', 1952, null, 'Un classico della letteratura', 'Narrativa', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780142401208', 'Il Signore degli Anelli: Lo Hobbit', 'Ballantine Books', 'digitale', 1954, null, 'Un classico fantasy epico', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780142401209', 'Il Signore degli Anelli: Lo Hobbit', 'Ballantine Books', 'cartaceo', 1954, null, 'Un classico fantasy epico', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780321122264', 'Programmazione in C', 'Addison-Wesley', 'cartaceo', 1999, null, 'Guida alla programmazione in C', null, 'Studenti', 'Informatica', 'didattico');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780345339705', 'Il Signore degli Anelli: La Compagnia dell''Anello', 'Ballantine Books', 'cartaceo', 1954, null, 'Primo volume della serie', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780345339706', 'Il Signore degli Anelli: La Compagnia dell''Anello', 'Ballantine Books', 'digitale', 1954, null, 'Primo volume della serie', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780345339711', 'Il Signore degli Anelli: Le Due Torri', 'Ballantine Books', 'cartaceo', 1954, null, 'Secondo volume della serie', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780345339713', 'Il Signore degli Anelli: Le Due Torri', 'Ballantine Books', 'digitale', 1954, null, 'Secondo volume della serie', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780345339720', 'Il Signore degli Anelli: Il Ritorno del Re', 'Ballantine Books', 'cartaceo', 1955, null, 'Terzo volume della serie', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780345339721', 'Il Signore degli Anelli: Il Ritorno del Re', 'Ballantine Books', 'digitale', 1955, null, 'Terzo volume della serie', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780345340428', 'Il Signore degli Anelli: Il Silmarillion', 'Ballantine Books', 'cartaceo', 1977, null, 'Opera postuma di J.R.R. Tolkien', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780345340429', 'Il Signore degli Anelli: Il Silmarillion', 'Ballantine Books', 'digitale', 1977, null, 'Opera postuma di J.R.R. Tolkien', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780525676154', 'Introduzione alla statistica', 'McGraw-Hill', 'digitale', 2000, null, 'Manuale introduttivo sulla statistica', null, 'Studenti', 'Statistica', 'didattico');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780553386790', 'Fondazione', 'Mondadori', 'digitale', 1951, null, 'Un capolavoro di fantascienza', 'Fantascienza', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780747532742', 'Harry Potter e la Pietra Filosofale', 'Salani', 'digitale', 1997, null, 'Il primo libro della serie di Harry Potter', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780747532743', 'Harry Potter e la Pietra Filosofale', 'Salani', 'cartaceo', 1997, null, 'Il primo libro della serie di Harry Potter', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780747538492', 'Harry Potter e la Camera dei Segreti', 'Salani', 'cartaceo', 1998, null, 'Il secondo libro della serie di Harry Potter', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780747538493', 'Harry Potter e la Camera dei Segreti', 'Salani', 'digitale', 1998, null, 'Il secondo libro della serie di Harry Potter', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780747543350', 'Harry Potter e il Prigioniero di Azkaban', 'Salani', 'cartaceo', 1999, null, 'Il terzo libro della serie di Harry Potter', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780747543351', 'Harry Potter e il Prigioniero di Azkaban', 'Salani', 'digitale', 1999, null, 'Il terzo libro della serie di Harry Potter', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780747545117', 'Harry Potter e il Calice di Fuoco', 'Salani', 'cartaceo', 2000, null, 'Il quarto libro della serie di Harry Potter', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780747545118', 'Harry Potter e il Calice di Fuoco', 'Salani', 'digitale', 2000, null, 'Il quarto libro della serie di Harry Potter', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780747570737', 'Harry Potter e l''Ordine della Fenice', 'Salani', 'digitale', 2003, null, 'Il quinto libro della serie di Harry Potter', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780747570738', 'Harry Potter e l''Ordine della Fenice', 'Salani', 'cartaceo', 2003, null, 'Il quinto libro della serie di Harry Potter', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780747584680', 'Harry Potter e il Principe Mezzosangue', 'Salani', 'cartaceo', 2005, null, 'Il sesto libro della serie di Harry Potter', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780747584681', 'Harry Potter e il Principe Mezzosangue', 'Salani', 'digitale', 2005, null, 'Il sesto libro della serie di Harry Potter', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780747591060', 'Harry Potter e i Doni della Morte', 'Salani', 'digitale', 2007, null, 'Il settimo libro della serie di Harry Potter', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9780747591061', 'Harry Potter e i Doni della Morte', 'Salani', 'cartaceo', 2007, null, 'Il settimo libro della serie di Harry Potter', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9788804509955', 'Il Grande Gatsby', 'Einaudi', 'digitale', 1925, null, 'Un classico della letteratura americana', 'Romanzo', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9788804583598', 'Norwegian Wood', 'Mondadori', 'cartaceo', 1987, null, 'Un romanzo di Haruki Murakami', 'Romanzo', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9788804648885', 'Cronache di Narnia', 'Mondadori', 'digitale', 1950, null, 'Una serie fantasy di C.S. Lewis', 'Fantasy', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9788804668234', 'Il codice da Vinci', 'Mondadori', 'digitale', 2003, null, 'Un thriller di Dan Brown', 'Thriller', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9788804676161', '1984', 'Mondadori', 'cartaceo', 1949, null, 'Un classico distopico', 'Distopia', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9788804685385', 'Il nome della rosa', 'Mondadori', 'cartaceo', 1980, null, 'Un giallo storico di Umberto Eco', 'Giallo storico', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9788804685386', 'Siddhartha', 'Mondadori', 'digitale', 1922, null, 'Un romanzo di Hermann Hesse', 'Filosofico', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9788804708961', 'Il Cacciatore di Androidi', 'Mondadori', 'digitale', 1968, null, 'Romanzo di Philip K. Dick', 'Fantascienza', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9788806186615', 'Cent''anni di solitudine', 'Mondadori', 'digitale', 1967, null, 'Un capolavoro del realismo magico', 'Realismo magico', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9788820355254', 'Il Piccolo Principe', 'Bompiani', 'digitale', 1943, null, 'Un classico della letteratura per bambini', 'Letteratura per bambini', null, null, 'romanzo');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9788848136319', 'Fisica generale', 'Zanichelli', 'cartaceo', 1985, null, 'Manuale di fisica generale', null, 'Studenti', 'Fisica', 'didattico');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9788850327115', 'Programmazione in Java', 'Hoepli', 'cartaceo', 2001, null, 'Guida alla programmazione in Java', null, 'Studenti', 'Informatica', 'didattico');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9788850333741', 'Algoritmi e Strutture Dati', 'Hoepli', 'cartaceo', 1996, null, 'Testo sui fondamenti dell''informatica', null, 'Studenti', 'Informatica', 'didattico');
INSERT INTO public.libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo) VALUES ('9788879831680', 'Lezioni di Analisi Matematica', 'Zanichelli', 'cartaceo', 1991, null, 'Manuale di matematica avanzata', null, 'Studenti', 'Matematica', 'didattico');

INSERT INTO public.serie (nome, prequel, sequel) VALUES ('Saga Harry Potter Cartacea', '9780747532743', '9780747538492');
INSERT INTO public.serie (nome, prequel, sequel) VALUES ('Saga Harry Potter Cartacea', '9780747538492', '9780747543350');
INSERT INTO public.serie (nome, prequel, sequel) VALUES ('Saga Harry Potter Cartacea', '9780747543350', '9780747545117');
INSERT INTO public.serie (nome, prequel, sequel) VALUES ('Saga Harry Potter Cartacea', '9780747545117', '9780747570738');
INSERT INTO public.serie (nome, prequel, sequel) VALUES ('Saga Harry Potter Cartacea', '9780747570738', '9780747584680');
INSERT INTO public.serie (nome, prequel, sequel) VALUES ('Saga Harry Potter Cartacea', '9780747584680', '9780747591061');
INSERT INTO public.serie (nome, prequel, sequel) VALUES ('Saga Il Signore degli Anelli Digitale', '9780142401208', '9780345339706');
INSERT INTO public.serie (nome, prequel, sequel) VALUES ('Saga Il Signore degli Anelli Digitale', '9780345339706', '9780345339713');
INSERT INTO public.serie (nome, prequel, sequel) VALUES ('Saga Il Signore degli Anelli Digitale', '9780345339713', '9780345339721');
INSERT INTO public.serie (nome, prequel, sequel) VALUES ('Saga Il Signore degli Anelli Digitale', '9780345339721', '9780345340429');

INSERT INTO public.negozio (partita_iva, nome, indirizzo, url) VALUES ('01234567890', 'Libreria Feltrinelli', 'Via del Corso, 123, Roma', null);
INSERT INTO public.negozio (partita_iva, nome, indirizzo, url) VALUES ('98765432101', 'Libreria Mondadori', 'Piazza Colonna, 45, Milano', null);
INSERT INTO public.negozio (partita_iva, nome, indirizzo, url) VALUES ('11223344556', 'Libreria Hoepli', null, 'https://www.hoepli.it/');
INSERT INTO public.negozio (partita_iva, nome, indirizzo, url) VALUES ('99887766554', 'Libreria Coop', 'Via della Moscova, 18, Milano', null);
INSERT INTO public.negozio (partita_iva, nome, indirizzo, url) VALUES ('33445566778', 'Libreria Giunti', 'Via de'' Tornabuoni, 17, Firenze', null);
INSERT INTO public.negozio (partita_iva, nome, indirizzo, url) VALUES ('55667788990', 'Libreria Newton Compton', 'Via del Corso, 123, Roma', 'https://www.newtoncompton.com/');

INSERT INTO public.vendita (negozio, libro, costo, quantita) VALUES ('11223344556', '9788804509955', 14.50, 45);
INSERT INTO public.vendita (negozio, libro, costo, quantita) VALUES ('11223344556', '9788804583598', 22.25, 35);
INSERT INTO public.vendita (negozio, libro, costo, quantita) VALUES ('11223344556', '9788804668234', 19.99, 20);
INSERT INTO public.vendita (negozio, libro, costo, quantita) VALUES ('11223344556', '9788804685386', 17.75, 30);
INSERT INTO public.vendita (negozio, libro, costo, quantita) VALUES ('11223344556', '9788850327115', 25.00, 15);
INSERT INTO public.vendita (negozio, libro, costo, quantita) VALUES ('55667788990', '9780747532743', 21.75, 25);
INSERT INTO public.vendita (negozio, libro, costo, quantita) VALUES ('55667788990', '9780747538492', 18.99, 30);
INSERT INTO public.vendita (negozio, libro, costo, quantita) VALUES ('55667788990', '9780747543350', 14.95, 50);
INSERT INTO public.vendita (negozio, libro, costo, quantita) VALUES ('55667788990', '9780747545117', 27.50, 20);
INSERT INTO public.vendita (negozio, libro, costo, quantita) VALUES ('55667788990', '9780747570738', 16.50, 40);
INSERT INTO public.vendita (negozio, libro, costo, quantita) VALUES ('55667788990', '9780747584680', 11.00, 20);
INSERT INTO public.vendita (negozio, libro, costo, quantita) VALUES ('55667788990', '9780747591061', 25.99, 20);
INSERT INTO public.vendita (negozio, libro, costo, quantita) VALUES ('55667788990', '9788804509955', 13.00, 91);
INSERT INTO public.vendita (negozio, libro, costo, quantita) VALUES ('98765432101', '9780061120084', 18.99, 25);
INSERT INTO public.vendita (negozio, libro, costo, quantita) VALUES ('98765432101', '9788804583598', 9.95, 60);
INSERT INTO public.vendita (negozio, libro, costo, quantita) VALUES ('98765432101', '9788804676161', 20.50, 30);
INSERT INTO public.vendita (negozio, libro, costo, quantita) VALUES ('98765432101', '9788804685385', 12.75, 40);
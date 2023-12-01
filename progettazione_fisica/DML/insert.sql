
-- Inserimento di 10 tuple nella tabella Libro

-- Libro 1
INSERT INTO Libro (ISBN, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo)
VALUES ('978-12-345-7890-1', 'Il Signore degli Anelli', 'Bompiani', 'cartaceo', 1954, 'copertina1.jpg', 'Questo libro è un capolavoro della letteratura fantastica...', 'Fantasy', 'Lettori di tutte le età', NULL, 'romanzo');

-- Libro 2
INSERT INTO Libro (ISBN, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo)
VALUES ('978-23-456-8901-2', 'Pride and Prejudice', 'Mondadori', 'digitale', 1813, 'copertina2.jpg', 'This is a classic of English literature...', 'Romance', 'English literature enthusiasts', NULL, 'romanzo');

-- Libro 3
INSERT INTO Libro (ISBN, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo)
VALUES ('978-34-568-9012-3', 'Introduction to Physics', 'Pearson', 'digitale', 2020, 'copertina3.jpg', 'This book provides an introduction to the principles of physics...', NULL, 'Physics students', 'Physics', 'didattico');

-- Libro 4
INSERT INTO Libro (ISBN, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo)
VALUES ('978-45-678-0123-4', 'The History of Art', 'Thames & Hudson', 'cartaceo', 2018, 'copertina4.jpg', 'Explore the fascinating history of art...', NULL, 'Art enthusiasts', 'Art History', 'didattico');

-- Libro 5
INSERT INTO Libro (ISBN, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo)
VALUES ('978-56-780-1234-5', 'Python Programming for Beginners', 'O Reilly', 'digitale', 2022, 'copertina5.jpg', 'Learn Python programming from scratch...', NULL, 'Beginners', 'Computer Science', 'didattico');

-- Libro 6
INSERT INTO Libro (ISBN, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo)
VALUES ('978-67-890-2345-6', 'War and Peace', 'Vintage Classics', 'cartaceo', 1869, 'copertina6.jpg', 'A historical novel by Leo Tolstoy...', 'Historical Fiction', 'Literature enthusiasts', NULL, 'romanzo');

-- Libro 7
INSERT INTO Libro (ISBN, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo)
VALUES ('978-78-901-3456-7', 'Chemistry Essentials', 'McGraw Hill', 'digitale', 2019, 'copertina7.jpg', 'This book covers the essential concepts of chemistry...', NULL, 'Chemistry students', 'Chemistry', 'didattico');

-- Libro 8
INSERT INTO Libro (ISBN, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo)
VALUES ('978-89-023-4567-8', 'Inferno', 'Rizzoli', 'cartaceo', 2013, 'copertina8.jpg', 'The first part of Dante Alighieri Divine Comedy...', 'Epic Poetry', 'Italian literature enthusiasts', NULL, 'romanzo');

-- Libro 9
INSERT INTO Libro (ISBN, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo)
VALUES ('978-90-124-5678-9', 'Environmental Science', 'Wiley', 'digitale', 2021, 'copertina9.jpg', 'Learn about environmental issues and solutions...', NULL, 'Environmental Science students', 'Environmental Science', 'didattico');

-- Libro 10
INSERT INTO Libro (ISBN, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo)
VALUES ('978-01-245-6789-0', '1984', 'Penguin Books', 'cartaceo', 1949, 'copertina10.jpg', 'A dystopian novel by George Orwell...', 'Dystopian Fiction', 'Science fiction enthusiasts', NULL, 'romanzo');

-- Inserimento di 5 tuple nella tabella utente
INSERT INTO Utente (nickname, email, password, nome, cognome, data_nascita)
VALUES ('coolkid123', 'cool@gmail.com', '12345', 'John', 'Pork', '02-02-1922');

INSERT INTO Utente (nickname, email, password, nome, cognome, data_nascita)
VALUES ('goodcarl', 'carlobravo@libero.it', '12345', 'Carlo', 'Bravo', '31-03-1945');

INSERT INTO Utente (nickname, email, password, nome, cognome, data_nascita)
VALUES ('mariogiordanolol', 'giordanom@rai.org', '12345', 'Mario', 'Giordano', '19-06-1966');

INSERT INTO Utente (nickname, email, password, nome, cognome, data_nascita)
VALUES ('aradami', 'adamiaureliano@gmail.com', '12345', 'Aureliano', 'Adami', '05-09-1990');

INSERT INTO Utente (nickname, email, password, nome, cognome, data_nascita)
VALUES ('bohbohboh', 'bohboh@gmail.com', '12345', 'Boh', 'Boh', '01-01-1900');


INSERT INTO RACCOLTA(visibilità, proprietario)
VALUES (TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1),
(TRUE, RANDOM()*(5-1)+1);




INSERT INTO libro_contenuto_raccolta(libro, raccolta)
VALUES ('978-12-345-7890-1',11),
('978-12-345-7890-1',12),
('978-12-345-7890-1',13),
('978-12-345-7890-1',14),
('978-12-345-7890-1',15),
('978-12-345-7890-1',16),
('978-12-345-7890-1',17),
('978-12-345-7890-1',18),
('978-12-345-7890-1',19),
('978-12-345-7890-1',20),
('978-12-345-7890-1',21),
('978-12-345-7890-1',22),
('978-12-345-7890-1',23),
('978-12-345-7890-1',24),
('978-23-456-8901-2',8),
('978-23-456-8901-2',9),
('978-23-456-8901-2',10),
('978-23-456-8901-2',11),
('978-23-456-8901-2',12),
('978-23-456-8901-2',13),
('978-23-456-8901-2',14),
('978-23-456-8901-2',15),
('978-23-456-8901-2',16),
('978-23-456-8901-2',17),
('978-23-456-8901-2',18),
('978-23-456-8901-2',19),
('978-23-456-8901-2',20),
('978-34-568-9012-3',7),
('978-34-568-9012-3',8),
('978-34-568-9012-3',9),
('978-34-568-9012-3',10),
('978-34-568-9012-3',11),
('978-34-568-9012-3',12),
('978-34-568-9012-3',13),
('978-34-568-9012-3',14),
('978-34-568-9012-3',15),
('978-34-568-9012-3',16),
('978-34-568-9012-3',17),
('978-34-568-9012-3',18),
('978-34-568-9012-3',19),
('978-34-568-9012-3',20),
('978-34-568-9012-3',21),
('978-45-678-0123-4',16),
('978-45-678-0123-4',17),
('978-45-678-0123-4',18),
('978-45-678-0123-4',19),
('978-45-678-0123-4',20),
('978-45-678-0123-4',21),
('978-45-678-0123-4',22),
('978-45-678-0123-4',23),
('978-45-678-0123-4',24),
('978-45-678-0123-4',25),
('978-45-678-0123-4',26),
('978-45-678-0123-4',27),
('978-45-678-0123-4',28),
('978-45-678-0123-4',29),
('978-56-780-1234-5',21),
('978-56-780-1234-5',22),
('978-56-780-1234-5',23),
('978-56-780-1234-5',24),
('978-56-780-1234-5',25),
('978-56-780-1234-5',26),
('978-56-780-1234-5',27),
('978-56-780-1234-5',28),
('978-56-780-1234-5',29),
('978-56-780-1234-5',30),
('978-56-780-1234-5',31),
('978-67-890-2345-6',27),
('978-67-890-2345-6',28),
('978-67-890-2345-6',29),
('978-67-890-2345-6',30),
('978-78-901-3456-7',20),
('978-78-901-3456-7',21),
('978-78-901-3456-7',22),
('978-78-901-3456-7',23),
('978-78-901-3456-7',24),
('978-78-901-3456-7',25),
('978-89-023-4567-8',19),
('978-89-023-4567-8',20),
('978-89-023-4567-8',21),
('978-89-023-4567-8',22),
('978-89-023-4567-8',23),
('978-89-023-4567-8',24),
('978-90-124-5678-9',19),
('978-90-124-5678-9',20),
('978-90-124-5678-9',21),
('978-90-124-5678-9',22),
('978-90-124-5678-9',23),
('978-90-124-5678-9',24),
('978-90-124-5678-9',25),
('978-01-245-6789-0',22),
('978-01-245-6789-0',23),
('978-01-245-6789-0',24),
('978-01-245-6789-0',25),
('978-01-245-6789-0',26),
('978-01-245-6789-0',27);





INSERT INTO utente_salvataggio_raccolta
VALUES (1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),
(1,10),
(1,11),
(1,12),
(1,13),
(1,14),
(1,15),
(2,13),
(2,14),
(2,15),
(2,16),
(2,17),
(2,18),
(2,19),
(2,20),
(2,21),
(2,22),
(2,23),
(2,24),
(2,25),
(3,3),
(3,4),
(3,5),
(3,6),
(3,7),
(3,8),
(3,9),
(3,10),
(3,11),
(3,12),
(3,13),
(3,14),
(3,15),
(3,16),
(3,17),
(3,18),
(3,19),
(3,20),
(3,21),
(3,22),
(3,23),
(4,3),
(4,4),
(4,5),
(4,6),
(4,7),
(4,8),
(4,9),
(4,10),
(4,11),
(4,12),
(4,13),
(4,14),
(4,15),
(4,16),
(4,17),
(4,18),
(4,19),
(4,20),
(4,21),
(4,22),
(4,23),
(4,24),
(4,25),
(4,26),
(4,27),
(4,28),
(4,29),
(4,30),
(4,31),
(4,32),
(5,15),
(5,16),
(5,17),
(5,18),
(5,19),
(5,20),
(5,21),
(5,22),
(5,23),
(5,24),
(5,25),
(5,26),
(5,27),
(5,28),
(5,29),
(5,30);

INSERT INTO libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo) VALUES ('978-34-568-9012-3', 'Introduction to Physics', 'Pearson', 'digitale', 2020, 'copertina3.jpg', 'This book provides an introduction to the principles of physics...', null, 'Physics students', 'Physics', 'didattico');
INSERT INTO libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo) VALUES ('978-45-678-0123-4', 'The History of Art', 'Thames & Hudson', 'cartaceo', 2018, 'copertina4.jpg', 'Explore the fascinating history of art...', null, 'Art enthusiasts', 'Art History', 'didattico');
INSERT INTO libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo) VALUES ('978-56-780-1234-5', 'Python Programming for Beginners', 'O Reilly', 'digitale', 2022, 'copertina5.jpg', 'Learn Python programming from scratch...', null, 'Beginners', 'Computer Science', 'didattico');
INSERT INTO libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo) VALUES ('978-78-901-3456-7', 'Chemistry Essentials', 'McGraw Hill', 'digitale', 2019, 'copertina7.jpg', 'This book covers the essential concepts of chemistry...', null, 'Chemistry students', 'Chemistry', 'didattico');
INSERT INTO libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo) VALUES ('978-90-124-5678-9', 'Environmental Science', 'Wiley', 'digitale', 2021, 'copertina9.jpg', 'Learn about environmental issues and solutions...', null, 'Environmental Science students', 'Environmental Science', 'didattico');
INSERT INTO libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo) VALUES ('978-23-456-8901-2', 'Pride and Prejudice', 'Mondadori', 'digitale', 1813, 'copertina2.jpg', 'This is a classic of English literature...', 'Romance', null, null, 'romanzo');
INSERT INTO libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo) VALUES ('978-67-890-2345-6', 'War and Peace', 'Vintage Classics', 'cartaceo', 1869, 'copertina6.jpg', 'A historical novel by Leo Tolstoy...', 'Historical Fiction', null, null, 'romanzo');
INSERT INTO libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo) VALUES ('978-01-245-6789-0', '1984', 'Penguin Books', 'cartaceo', 1949, 'copertina10.jpg', 'A dystopian novel by George Orwell...', 'Dystopian Fiction', null, null, 'romanzo');
INSERT INTO libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo) VALUES ('978-89-023-4567-8', 'Inferno', 'Rizzoli', 'cartaceo', 2013, 'copertina8.jpg', 'The first part of Dante Alighieri Divine Comedy...', 'Epic Poetry', null, null, 'romanzo');
INSERT INTO libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo) VALUES ('978-56-780-1237-1', 'La compagnia dell''anello', 'Bompiani', 'cartaceo', 1968, 'copertina11.jpg', null, 'Fantasy', null, null, 'romanzo');
INSERT INTO libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo) VALUES ('978-67-890-2342-4', 'Le due torri', 'Bompiani', 'cartaceo', 1998, 'copertina12.jpg', null, 'Fantasy', null, null, 'romanzo');
INSERT INTO libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo) VALUES ('978-12-345-7890-1', 'Il ritorno del Re', 'Bompiani', 'cartaceo', 1954, 'copertina1.jpg', 'Questo libro Ã¨ un capolavoro della letteratura fantastica...', 'Fantasy', null, null, 'romanzo');
INSERT INTO libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo) VALUES ('978-88-691-8315-7', 'Harry Potter: La pietra liposofale', 'J.K. Rowling', 'cartaceo', 1997, 'copertina13.jpg', null, 'Fantasy', null, null, 'romanzo');
INSERT INTO libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo) VALUES ('978-88-310-0339-1', 'Harry Potter: La camera dei segreti', 'J.K. Rowling', 'cartaceo', 1998, 'copertina14.jpg', null, 'Fantasy', null, null, 'romanzo');
INSERT INTO libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo) VALUES ('978-88-310-0340-7', 'Harry Potter: Il prigioniero di Azkaban', 'J.K. Rowling', 'cartaceo', 1999, 'copertina15.jpg', null, 'Fantasy', null, null, 'romanzo');
INSERT INTO libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo) VALUES ('978-88-310-0341-4', 'Harry Potter: Il calice di fuoco', 'J.K. Rowling', 'cartaceo', 2000, 'copertina16.jpg', null, 'Fantasy', null, null, 'romanzo');
INSERT INTO libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo) VALUES ('978-88-310-0341-3', 'Harry Potter: Il calice di fuoco', 'J.K. Rowling', 'digitale', 2000, 'copertina16.jpg', null, 'Fantasy', null, null, 'romanzo');
INSERT INTO libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo) VALUES ('978-88-691-8315-5', 'Harry Potter: La pietra liposofale', 'J.K. Rowling', 'digitale', 1997, 'copertina13.jpg', null, 'Fantasy', null, null, 'romanzo');
INSERT INTO libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo) VALUES ('978-88-310-0341-9', 'Harry Potter: L''ordine della fenice', 'J.K. Rowling', 'cartaceo', 2003, 'copertina16.jpg', null, 'Fantasy', null, null, 'romanzo');
INSERT INTO libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrzione, genere, target, materia, tipo) VALUES ('978-88-310-0294-5', 'Harry Potter: Il principe mezzo sangue', 'J.K. Rowling', 'cartaceo', 2005, 'copertina16.jpg', null, 'Fantasy', null, null, 'romanzo');

INSERT INTO serie (libro, sequel, nome_serie) VALUES ('978-01-245-6789-0', '978-88-310-0341-4', 'HARRY POTTER');
INSERT INTO serie (libro, sequel, nome_serie) VALUES ('978-45-678-0123-4', '978-88-310-0339-1', 'HARRY POTTER');
INSERT INTO serie (libro, sequel, nome_serie) VALUES ('978-67-890-2345-6', '978-88-691-8315-7', 'HARRY POTTER');
INSERT INTO serie (libro, sequel, nome_serie) VALUES ('978-88-310-0294-5', '978-67-890-2345-6', 'HARRY POTTER');
INSERT INTO serie (libro, sequel, nome_serie) VALUES ('978-88-310-0339-1', '978-89-023-4567-8', 'HARRY POTTER');
INSERT INTO serie (libro, sequel, nome_serie) VALUES ('978-88-310-0340-7', '978-01-245-6789-0', 'HARRY POTTER');
INSERT INTO serie (libro, sequel, nome_serie) VALUES ('978-88-310-0341-4', '978-88-310-0341-9', 'HARRY POTTER');
INSERT INTO serie (libro, sequel, nome_serie) VALUES ('978-88-310-0341-9', '978-88-310-0294-5', 'HARRY POTTER');
INSERT INTO serie (libro, sequel, nome_serie) VALUES ('978-88-691-8315-7', '978-45-678-0123-4', 'HARRY POTTER');
INSERT INTO serie (libro, sequel, nome_serie) VALUES ('978-89-023-4567-8', '978-88-310-0340-7', 'HARRY POTTER');
INSERT INTO serie (libro, sequel, nome_serie) VALUES ('978-56-780-1237-1', '978-67-890-2342-4', 'IL SIGNORE DEGLI ANELLI');
INSERT INTO serie (libro, sequel, nome_serie) VALUES ('978-67-890-2342-4', '978-12-345-7890-1', 'IL SIGNORE DEGLI ANELLI');



INSERT INTO Libro (isbn, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione, genere, target, materia, tipo)
VALUES
('9780142401209', 'Il Signore degli Anelli: Lo Hobbit', 'Ballantine Books', 'cartaceo', 1954, NULL, 'Un classico fantasy epico', 'Fantasy', NULL, NULL, 'romanzo'),

('9780345339706', $a$Il Signore degli Anelli: La Compagnia dell'Anello$a$, 'Ballantine Books', 'digitale', 1954, NULL, 'Primo volume della serie', 'Fantasy', NULL, NULL, 'romanzo'),

('9780345339713', 'Il Signore degli Anelli: Le Due Torri', 'Ballantine Books', 'digitale', 1954, NULL, 'Secondo volume della serie', 'Fantasy', NULL, NULL, 'romanzo'),

('9780345339720', 'Il Signore degli Anelli: Il Ritorno del Re', 'Ballantine Books', 'cartaceo', 1955, NULL, 'Terzo volume della serie', 'Fantasy', NULL, NULL, 'romanzo'),

('9780345340429', 'Il Signore degli Anelli: Il Silmarillion', 'Ballantine Books', 'digitale', 1977, NULL, 'Opera postuma di J.R.R. Tolkien', 'Fantasy', NULL, NULL, 'romanzo'),

('9780142401208', 'Il Signore degli Anelli: Lo Hobbit', 'Ballantine Books', 'digitale', 1954, NULL, 'Un classico fantasy epico', 'Fantasy', NULL, NULL, 'romanzo'),

('9780345339705', $a$Il Signore degli Anelli: La Compagnia dell'Anello$a$, 'Ballantine Books', 'cartaceo', 1954, NULL, 'Primo volume della serie', 'Fantasy', NULL, NULL, 'romanzo'),

('9780345339712', 'Il Signore degli Anelli: Le Due Torri', 'Ballantine Books', 'cartaceo', 1954, NULL, 'Secondo volume della serie', 'Fantasy', NULL, NULL, 'romanzo'),

('9780345339721', 'Il Signore degli Anelli: Il Ritorno del Re', 'Ballantine Books', 'digitale', 1955, NULL, 'Terzo volume della serie', 'Fantasy', NULL, NULL, 'romanzo'),

('9780345340428', 'Il Signore degli Anelli: Il Silmarillion', 'Ballantine Books', 'cartaceo', 1977, NULL, 'Opera postuma di J.R.R. Tolkien', 'Fantasy', NULL, NULL, 'romanzo'),

('9780553386790', 'Fondazione', 'Mondadori', 'digitale', 1951, NULL, 'Un capolavoro di fantascienza', 'Fantascienza', NULL, NULL, 'romanzo'),

('9788804676161', '1984', 'Mondadori', 'cartaceo', 1949, NULL, 'Un classico distopico', 'Distopia', NULL, NULL, 'romanzo'),

('9780525676154', 'Introduzione alla statistica', 'McGraw-Hill', 'digitale', 2000, NULL, 'Manuale introduttivo sulla statistica', NULL, 'Studenti', 'Statistica', 'didattico'),

('9780321122264', 'Programmazione in C', 'Addison-Wesley', 'cartaceo', 1999, NULL, 'Guida alla programmazione in C', NULL, 'Studenti', 'Informatica', 'didattico'),

('9780061120084', 'Il vecchio e il mare', 'Einaudi', 'cartaceo', 1952, NULL, 'Un classico della letteratura', 'Narrativa', NULL, NULL, 'romanzo'),

('9788806186615', $a$Cent'anni di solitudine$a$, 'Mondadori', 'digitale', 1967, NULL, 'Un capolavoro del realismo magico', 'Realismo magico', NULL, NULL, 'romanzo'),

('9780060935467', 'Piccole donne', 'Mondadori', 'cartaceo', 1868, NULL, 'Un romanzo classico per ragazze', 'Fiction', NULL, NULL, 'romanzo'),

('9788804668234', 'Il codice da Vinci', 'Mondadori', 'digitale', 2003, NULL, 'Un thriller di Dan Brown', 'Thriller', NULL, NULL, 'romanzo'),

('9788879831680', 'Lezioni di Analisi Matematica', 'Zanichelli', 'cartaceo', 1991, NULL, 'Manuale di matematica avanzata', NULL, 'Studenti', 'Matematica', 'didattico'),

('9788804583598', 'Norwegian Wood', 'Mondadori', 'cartaceo', 1987, NULL, 'Un romanzo di Haruki Murakami', 'Romanzo', NULL, NULL, 'romanzo'),

('9788804509955', 'Il Grande Gatsby', 'Mondadori', 'digitale', 1925, NULL, 'Un classico della letteratura americana', 'Romanzo', NULL, NULL, 'romanzo'),

('9788804685385', 'Il nome della rosa', 'Mondadori', 'cartaceo', 1980, NULL, 'Un giallo storico di Umberto Eco', 'Giallo storico', NULL, NULL, 'romanzo'),

('9788804685386', 'Siddhartha', 'Mondadori', 'digitale', 1922, NULL, 'Un romanzo di Hermann Hesse', 'Filosofico', NULL, NULL, 'romanzo'),

('9788850327115', 'Programmazione in Java', 'Hoepli', 'cartaceo', 2001, NULL, 'Guida alla programmazione in Java', NULL, 'Studenti', 'Informatica', 'didattico'),

('9788820355254', 'Il Piccolo Principe', 'Bompiani', 'digitale', 1943, NULL, 'Un classico della letteratura per bambini', 'Letteratura per bambini', NULL, NULL, 'romanzo'),

('9788848136319', 'Fisica generale', 'Zanichelli', 'cartaceo', 1985, NULL, 'Manuale di fisica generale', NULL, 'Studenti', 'Fisica', 'didattico'),

('9788804648885', 'Cronache di Narnia', 'Mondadori', 'digitale', 1950, NULL, 'Una serie fantasy di C.S. Lewis', 'Fantasy', NULL, NULL, 'romanzo'),

('9788850333741', 'Algoritmi e Strutture Dati', 'Hoepli', 'cartaceo', 1996, NULL, $a$Testo sui fondamenti dell'informatica$a$, NULL, 'Studenti', 'Informatica', 'didattico'),

('9788804708961', 'Il Cacciatore di Androidi', 'Mondadori', 'digitale', 1968, NULL, 'Romanzo di Philip K. Dick', 'Fantascienza', NULL, NULL, 'romanzo'),

('9780747532743', 'Harry Potter e la Pietra Filosofale', 'Salani', 'cartaceo', 1997, NULL, 'Il primo libro della serie di Harry Potter', 'Fantasy', NULL, NULL, 'romanzo'),

('9780747538493', 'Harry Potter e la Camera dei Segreti', 'Salani', 'digitale', 1998, NULL, 'Il secondo libro della serie di Harry Potter', 'Fantasy', NULL, NULL, 'romanzo'),

('9780747543350', 'Harry Potter e il Prigioniero di Azkaban', 'Salani', 'cartaceo', 1999, NULL, 'Il terzo libro della serie di Harry Potter', 'Fantasy', NULL, NULL, 'romanzo'),

('9780747545118', 'Harry Potter e il Calice di Fuoco', 'Salani', 'digitale', 2000, NULL, 'Il quarto libro della serie di Harry Potter', 'Fantasy', NULL, NULL, 'romanzo'),

('9780747570738', $a$Harry Potter e l'Ordine della Fenice$a$, 'Salani', 'cartaceo', 2003, NULL, 'Il quinto libro della serie di Harry Potter', 'Fantasy', NULL, NULL, 'romanzo'),

('9780747584681', 'Harry Potter e il Principe Mezzosangue', 'Salani', 'digitale', 2005, NULL, 'Il sesto libro della serie di Harry Potter', 'Fantasy', NULL, NULL, 'romanzo'),

('9780747591061', 'Harry Potter e i Doni della Morte', 'Salani', 'cartaceo', 2007, NULL, 'Il settimo libro della serie di Harry Potter', 'Fantasy', NULL, NULL, 'romanzo'),

('9780747532742', 'Harry Potter e la Pietra Filosofale', 'Salani', 'digitale', 1997, NULL, 'Il primo libro della serie di Harry Potter', 'Fantasy', NULL, NULL, 'romanzo'),

('9780747538492', 'Harry Potter e la Camera dei Segreti', 'Salani', 'cartaceo', 1998, NULL, 'Il secondo libro della serie di Harry Potter', 'Fantasy', NULL, NULL, 'romanzo'),

('9780747543351', 'Harry Potter e il Prigioniero di Azkaban', 'Salani', 'digitale', 1999, NULL, 'Il terzo libro della serie di Harry Potter', 'Fantasy', NULL, NULL, 'romanzo'),

('9780747545117', 'Harry Potter e il Calice di Fuoco', 'Salani', 'cartaceo', 2000, NULL, 'Il quarto libro della serie di Harry Potter', 'Fantasy', NULL, NULL, 'romanzo'),

('9780747570737', $a$Harry Potter e l'Ordine della Fenice$a$, 'Salani', 'digitale', 2003, NULL, 'Il quinto libro della serie di Harry Potter', 'Fantasy', NULL, NULL, 'romanzo'),

('9780747584680', 'Harry Potter e il Principe Mezzosangue', 'Salani', 'cartaceo', 2005, NULL, 'Il sesto libro della serie di Harry Potter', 'Fantasy', NULL, NULL, 'romanzo'),

('9780747591060', 'Harry Potter e i Doni della Morte', 'Salani', 'digitale', 2007, NULL, 'Il settimo libro della serie di Harry Potter', 'Fantasy', NULL, NULL, 'romanzo');




INSERT INTO Articolo_Scientifico (doi, titolo, editore, modalita_fruizione, anno_pubblicazione, copertina, descrizione)
VALUES
('10.1002/9781118786352', 'Machine Learning for Dummies', 'Wiley', 'digitale', 2020, NULL, 'Introduction to machine learning algorithms'),

('10.1038/s41586-021-03736-x', 'AI-driven Multifunctional Polymers', 'Nature', 'digitale', 2021, NULL, 'A study on the development of AI-driven polymers with multiple functions'),

('10.1126/science.abh3467', 'Quantum Computing: Progress and Challenges', 'Science', 'cartaceo', 2022, NULL, 'Review article on the current state and challenges of quantum computing'),

('10.5555/12345678', 'Advances in Bioinformatics', 'Springer', 'digitale', 2019, NULL, 'Latest developments in bioinformatics research'),

('10.1088/1361-6560ab63d4', 'Applications of Medical Physics in Cancer Therapy', 'IOP Publishing', 'cartaceo', 2020, NULL, 'Utilizing medical physics for cancer treatment'),

('10.1021/acsnano.0c08359', 'Nanomedicine: Current Status and Future Prospects', 'ACS Nano', 'digitale', 2021, NULL, 'Comprehensive overview of the current state and future directions of nanomedicine'),

('10.1126/sciadv.abh4787', 'Advancements in Materials Science', 'Science Advances', 'cartaceo', 2022, NULL, 'Exploring recent advancements in the field of materials science'),

('10.1103/PhysRevLett.126.057201', 'Discovery of New Particle in High-Energy Physics', 'Physical Review Letters', 'digitale', 2021, NULL, 'Reporting the discovery of a new particle in high-energy physics experiments'),

('10.5555/87654321', 'Climate Change Impacts on Biodiversity', 'Springer', 'cartaceo', 2020, NULL, 'Assessment of climate change impacts on global biodiversity'),

('10.1088/1741-2552ab8d42', 'Neuroprosthetics: Current Trends and Future Directions', 'Journal of Neural Engineering', 'digitale', 2019, NULL, 'Reviewing the latest trends and future prospects in neuroprosthetics'),

('10.1038/nature21074', 'CRISPR-Cas9: Gene Editing Revolution', 'Nature', 'cartaceo', 2017, NULL, 'Highlighting the revolutionary impact of CRISPR-Cas9 in gene editing'),

('10.1007/s11227-020-03322-9', 'Cloud Computing: Security Challenges and Solutions', 'Springer', 'digitale', 2020, NULL, 'Exploring security challenges and solutions in cloud computing'),

('10.1126/science.aba5253', 'Advances in Quantum Teleportation', 'Science', 'cartaceo', 2021, NULL, 'Presenting recent advances in the field of quantum teleportation'),

('10.5555/98765432', 'Artificial Intelligence in Drug Discovery', 'Wiley', 'digitale', 2018, NULL, 'Application of artificial intelligence in accelerating drug discovery'),

('10.1038/s41467-020-18723-y', 'Deep Learning for Image Recognition', 'Nature Communications', 'cartaceo', 2020, NULL, 'Utilizing deep learning techniques for advanced image recognition');






INSERT INTO Autore (cod_autore, nome, data_nascita, data_morte, nazionalita, biografia)
VALUES
(1, 'J.R.R. Tolkien', '1892-01-03', '1973-09-02', 'Inglese', 'John Ronald Reuel Tolkien è stato uno scrittore, filologo e professore universitario inglese. È principalmente noto per i suoi romanzi Il Signore degli Anelli'),

(2, 'Isaac Asimov', '1920-01-02', '1992-04-06', 'Russo', 'Isaak Yudovich Ozimov è stato uno scrittore e biochimico russo naturalizzato statunitense, noto per i suoi lavori di divulgazione scientifica e per le sue opere di fantascienza'),

(3, 'George Orwell', '1903-06-25', '1950-01-21', 'Inglese', 'Eric Arthur Blair, meglio conosciuto con lo pseudonimo di George Orwell, è stato uno scrittore, giornalista e saggista britannico'),

(4, 'Dan Brown', '1964-06-22', NULL, 'Americana', 'Daniel Gerhard Brown è uno scrittore statunitense, autore di thriller. È noto per il suo romanzo Il codice da Vinci'),

(5, 'Haruki Murakami', '1949-01-12', NULL, 'Giapponese', 'Haruki Murakami è uno scrittore, traduttore e saggista giapponese. Le sue opere sono spesso surreali e metafisiche'),

(6, 'Umberto Eco', '1932-01-05', '2016-02-19', 'Italiana', 'Umberto Eco è stato uno scrittore, filosofo, semiologo, bibliofilo e accademico italiano. È noto per il suo romanzo Il nome della rosa'),

(7, 'Louisa May Alcott', '1832-11-29', '1888-03-06', 'Americana', 'Louisa May Alcott è stata una scrittrice statunitense, famosa per il suo romanzo Piccole donne'),

(8, 'Philip K. Dick', '1928-12-16', '1982-03-02', 'Americana', 'Philip Kindred Dick è stato uno scrittore statunitense, noto per le sue opere di fantascienza'),

(9, 'C.S. Lewis', '1898-11-29', '1963-11-22', 'Irlandese', 'Clive Staples Lewis è stato uno scrittore, filosofo, teologo e critico letterario irlandese'),

(10, 'Hermann Hesse', '1877-07-02', '1962-08-09', 'Svizzera', 'Hermann Hesse è stato uno scrittore, poeta, filosofo e pittore tedesco, naturalizzato svizzero, premio Nobel per la letteratura nel 1946'),

(11, 'Alice Smith', '1978-03-15', NULL, 'Americana', $a$Alice Smith è una ricercatrice specializzata in nanomedicina presso il Dipartimento di Scienze Biomediche presso l'Università di XYZ. Le sue ricerche sono incentrate sullo sviluppo di nanomateriali per la diagnosi e il trattamento delle malattie.$a$),

(12, 'Bob Johnson', '1985-08-10', NULL, 'Inglese', $a$Bob Johnson è uno scienziato specializzato in materiali avanzati presso il Dipartimento di Scienze dei Materiali dell'Università di ABC. Ha contribuito significativamente alla scoperta di nuovi materiali con proprietà uniche.$a$),

(13, 'Carol White', '1972-06-20', NULL, 'Canadese', $a$Carol White è una fisica teorica di fama mondiale e professore emerito presso l'Università di DEF. Le sue ricerche si concentrano sull'esplorazione dei concetti teorici avanzati in fisica delle particelle.$a$),

(14, 'David Brown', '1988-01-03', NULL, 'Americana', $a$David Brown è uno scienziato ambientale presso il Dipartimento di Scienze Ambientali dell'Università di GHI. Il suo lavoro è centrato sull'analisi degli impatti del cambiamento climatico sulla biodiversità.$a$),

(15, 'Eva Green', '1980-05-22', NULL, 'Francese', $a$Eva Green è una neuroscienziata di fama internazionale presso il Dipartimento di Neuroscienze dell'Università di JKL. Le sue ricerche si concentrano sullo sviluppo di neuroprotesi avanzate.$a$),

(16, 'Frank Miller', '1965-12-01', NULL, 'Americano', $a$Frank Miller è uno scienziato esperto in biologia molecolare presso l'Istituto di Biologia Molecolare MNO. Il suo lavoro è incentrato sull'applicazione di CRISPR-Cas9 nella modifica genetica.$a$),

(17, 'Grace Taylor', '1970-04-18', NULL, 'Canadese', $a$Grace Taylor è una ricercatrice in informatica presso il Dipartimento di Informatica dell'Università di PQR. Il suo lavoro si concentra sulla sicurezza informatica in ambienti di cloud computing.$a$),

(18, 'Henry Adams', '1982-09-25', NULL, 'Inglese', 'Henry Adams è uno scienziato delle particelle presso il CERN. Ha contribuito in modo significativo agli esperimenti di alta energia, inclusa la scoperta di nuove particelle.'),

(19, 'Ivy Martinez', '1974-11-08', NULL, 'Americana', $a$Ivy Martinez è una bioinformatica presso il Dipartimento di Scienze Biologiche dell'Università di STU. Le sue ricerche si concentrano sulla bioinformatica e sull'analisi avanzata dei dati biologici.$a$),

(20, 'Jack Turner', '1987-07-14', NULL, 'Britannico', $a$Jack Turner è uno scienziato informatico specializzato in intelligenza artificiale presso il Dipartimento di Informatica dell'Università di VWX. Il suo lavoro si concentra sull'applicazione dell'intelligenza artificiale nella scoperta di nuovi farmaci.$a$);



INSERT INTO Scrittura_Libro (autore, libro)
VALUES
(1, '9780142401209'), -- J.R.R. Tolkien ha scritto "Il Signore degli Anelli"

(2, '9780553386790'), -- Isaac Asimov ha scritto "Fondazione"

(3, '9788804676161'), -- George Orwell ha scritto "1984"

(4, '9780525676154'), -- Autori vari hanno contribuito a "Introduzione alla statistica"

(5, '9780321122264'), -- Autori vari hanno contribuito a "Programmazione in C"

(6, '9780061120084'), -- Haruki Murakami ha scritto "Norwegian Wood"

(7, '9788806186615'), -- Autori vari hanno contribuito a "Cent'anni di solitudine"

(8, '9788804668234'), -- Philip K. Dick ha scritto "Il codice da Vinci"

(9, '9788879831680'), -- C.S. Lewis ha scritto "Lezioni di Analisi Matematica"

(10, '9788804708961'), -- Hermann Hesse ha scritto "Il Cacciatore di Androidi"

(11, '9780061120084'), -- Nuovo autore ha scritto "Norwegian Wood"

(12, '9788804509955'), -- Nuovo autore ha scritto "Il Grande Gatsby"

(13, '9788804648885'), -- Nuovo autore ha scritto "Cronache di Narnia"

(14, '9788850327115'), -- Nuovo autore ha contribuito a "Programmazione in Java"

(15, '9788806186615'), -- Nuovo autore ha scritto "Cent'anni di solitudine"

(16, '9780060935467'), -- Nuovo autore ha scritto "Piccole donne"

(17, '9788804583598'), -- Nuovo autore ha scritto "Il nome della rosa"

(18, '9788820355254'), -- Nuovo autore ha scritto "Il Piccolo Principe"

(19, '9788804685385'), -- Nuovo autore ha scritto "Siddhartha"

(20, '9788804668234'); -- Nuovo autore ha scritto "Il codice da Vinci"




INSERT INTO Scrittura_Articolo (autore, articolo_scientifico)
VALUES
(1, '10.1002/9781118786352'), -- J.R.R. Tolkien ha contribuito a "Machine Learning for Dummies"

(2, '10.1038/s41586-021-03736-x'), -- Isaac Asimov ha contribuito a "AI-driven Multifunctional Polymers"

(3, '10.1126/science.abh3467'), -- George Orwell ha contribuito a "Quantum Computing: Progress and Challenges"

(4, '10.5555/12345678'), -- Autori vari hanno contribuito a "Advances in Bioinformatics"

(5, '10.1088/1361-6560ab63d4'), -- Autori vari hanno contribuito a "Applications of Medical Physics in Cancer Therapy"

(6, '10.1038/nature21074'), -- Haruki Murakami ha contribuito a "CRISPR-Cas9: Gene Editing Revolution"

(7, '10.1007/s11227-020-03322-9'), -- Autori vari hanno contribuito a "Cloud Computing: Security Challenges and Solutions"

(8, '10.1126/science.aba5253'), -- Philip K. Dick ha contribuito a "Advances in Quantum Teleportation"

(9, '10.5555/98765432'), -- C.S. Lewis ha contribuito a "Artificial Intelligence in Drug Discovery"

(10, '10.1038/s41467-020-18723-y'); -- Hermann Hesse ha contribuito a "Deep Learning for Image Recognition"




INSERT INTO Sala (nome, indirizzo)
VALUES
('Sala delle Querce', 'Via delle Rose, 12'),

($a$Sala d'Arte$a$, 'Via dei Cipressi, 34'),

('Sala Aurora', 'Corso del Sole, 56'),

('Sala del Castello', 'Via della Luna, 78'),

('Sala degli Ulivi', 'Viale degli Oleandri, 90'),

('Sala Verde', 'Via delle Margherite, 112'),

('Sala Azzurra', 'Corso dei Gigli, 134'),

('Sala del Palazzo', 'Via dei Fiori, 156'),

('Sala del Mare', 'Viale delle Conchiglie, 178'),

('Sala del Bosco', 'Via dei Pini, 200');



INSERT INTO Presentazione_Libro (sala, libro, data_presentazione)
VALUES
(1, '9780142401209', '2023-12-01'), -- Presentazione de "Il Signore degli Anelli" nella Sala delle Querce

(2, '9780553386790', '2023-12-02'), -- Presentazione de "Fondazione" nella Sala d'Arte

(3, '9788804676161', '2023-12-03'), -- Presentazione de "1984" nella Sala Aurora

(4, '9780525676154', '2023-12-04'), -- Presentazione de "Introduzione alla statistica" nella Sala del Castello

(5, '9780321122264', '2023-12-05'), -- Presentazione de "Programmazione in C" nella Sala degli Ulivi

(6, '9780061120084', '2023-12-06'), -- Presentazione de "Norwegian Wood" nella Sala Verde

(7, '9788806186615', '2023-12-07'), -- Presentazione de "Cent'anni di solitudine" nella Sala Azzurra

(8, '9788804668234', '2023-12-08'), -- Presentazione de "Il codice da Vinci" nella Sala del Palazzo

(9, '9788879831680', '2023-12-09'), -- Presentazione de "Lezioni di Analisi Matematica" nella Sala del Mare

(10, '9788804708961', '2023-12-10'); -- Presentazione de "Il Cacciatore di Androidi" nella Sala del Bosco



INSERT INTO Collana (issn, nome, editore)
VALUES
('1234-567X', 'Salani Classici', 'Salani'),

('5678-9012', 'Mondadori SuperPocket', 'Mondadori'),

('9012-3456', 'Hoepli Guide', 'Hoepli'),

('3456-7890', 'Zanichelli Saggi', 'Zanichelli'),

('7890-1234', 'Bompiani Romanzi', 'Bompiani'),

('2345-6789', 'Einaudi Letteratura', 'Einaudi');



INSERT INTO Libro_Contenuto_Collana (libro, collana)
VALUES
('9788806186615', '5678-9012'), -- "Cent'anni di solitudine" nella collana "Mondadori SuperPocket"

('9780553386790', '5678-9012'), -- "Fondazione" nella collana "Mondadori SuperPocket"

('9788804676161', '5678-9012'), -- "1984" nella collana "Mondadori SuperPocket"

('9788804583598', '5678-9012'), -- "Norwegian Wood" nella collana "Mondadori SuperPocket"

('9788804668234', '5678-9012'), -- "Il codice da Vinci" nella collana "Mondadori SuperPocket"

('9788879831680', '3456-7890'), -- "Lezioni di Analisi Matematica" nella collana "Zanichelli Saggi"

('9788848136319', '3456-7890'), -- "Fisica generale" nella collana "Zanichelli Saggi"

('9788850327115', '9012-3456'), -- "Programmazione in Java" nella collana "Hoepli Guide"

('9788850333741', '9012-3456'), -- "Algoritmi e Strutture Dati" nella collana "Hoepli Guide"

('9780747532743', '1234-567X'), -- "Harry Potter e la Pietra Filosofale" nella collana "Salani Classici"

('9780747538493', '1234-567X'), -- "Harry Potter e la Camera dei Segreti" nella collana "Salani Classici"

('9780747543350', '1234-567X'), -- "Harry Potter e il Prigioniero di Azkaban" nella collana "Salani Classici"

('9780747545118', '1234-567X'), -- "Harry Potter e il Calice di Fuoco" nella collana "Salani Classici"

('9780747570738', '1234-567X'), -- "Harry Potter e l'Ordine della Fenice" nella collana "Salani Classici"

('9780747584681', '1234-567X'), -- "Harry Potter e il Principe Mezzosangue" nella collana "Salani Classici"

('9780747591061', '1234-567X'); -- "Harry Potter e i Doni della Morte" nella collana "Salani Classici"



INSERT INTO Rivista (issn, nome, argomento, anno_pubblicazione, responsabile)
VALUES
('1234-5678', 'Science Today', 'Scienze', 2023, 'Mario Rossi'),

('5678-9012', 'Tech Innovations', 'Tecnologia', 2023, 'Laura Bianchi'),

('9012-3456', 'Medical Breakthroughs', 'Medicina', 2023, 'Giuseppe Verdi'),

('3456-7890', 'Mathematics Journal', 'Matematica', 2023, 'Anna Neri'),

('7890-1234', 'Computer Science Review', 'Informatica', 2023, 'Luca Ferrari'),

('2345-6789', 'Environmental Insights', 'Ambiente', 2023, 'Maria Rossi'),

('8765-4321', 'Psychology Today', 'Psicologia', 2023, 'Roberto Conti'),

('5432-1098', 'Literary Critique', 'Critica Letteraria', 2023, 'Elena Bianchi'),

('2109-8765', 'Physics World', 'Fisica', 2023, 'Paolo Verdi'),

('9812-3456', 'History Chronicles', 'Storia', 2023, 'Sara Ferrari');




INSERT INTO Articolo_Scientifico_Pubblicazione_Rivista (articolo_scientifico, rivista)
VALUES
('10.1002/9781118786352', '5678-9012'), -- Articolo scientifico pubblicato su "Tech Innovations"

('10.1038/s41586-021-03736-x', '1234-5678'), -- Articolo scientifico pubblicato su "Science Today"

('10.1126/science.abh3467', '1234-5678'), -- Articolo scientifico pubblicato su "Science Today"

('10.5555/12345678', '5678-9012'), -- Articolo scientifico pubblicato su "Tech Innovations"

('10.1088/1361-6560ab63d4', '2109-8765'), -- Articolo scientifico pubblicato su "Physics World"

('10.1021/acsnano.0c08359', '5678-9012'), -- Articolo scientifico pubblicato su "Tech Innovations"

('10.1126/sciadv.abh4787', '3456-7890'), -- Articolo scientifico pubblicato su "Mathematics Journal"

('10.1103/PhysRevLett.126.057201', '2109-8765'), -- Articolo scientifico pubblicato su "Physics World"

('10.5555/87654321', '3456-7890'), -- Articolo scientifico pubblicato su "Mathematics Journal"

('10.1088/1741-2552ab8d42', '2109-8765'); -- Articolo scientifico pubblicato su "Physics World"




INSERT INTO Conferenza (luogo, data_inizio, data_fine, organizzatore, responsabile)
VALUES
('Roma', '2023-05-15', '2023-05-18', 'Università di Roma', 'Prof. Mario Rossi'),

('New York', '2023-07-10', '2023-07-13', 'New York University', 'Dr. Laura Bianchi'),

('Tokyo', '2023-09-20', '2023-09-23', 'Tokyo Tech Institute', 'Prof. Giuseppe Verdi'),

('Paris', '2023-11-05', '2023-11-08', 'Sorbonne University', 'Dr. Anna Neri'),

('San Francisco', '2024-02-15', '2024-02-18', 'Stanford University', 'Prof. Luca Ferrari'),

('Sydney', '2024-04-10', '2024-04-13', 'University of Sydney', 'Dr. Maria Rossi'),

('Rio de Janeiro', '2024-06-20', '2024-06-23', 'Federal University of Rio de Janeiro', 'Prof. Roberto Conti'),

('London', '2024-09-05', '2024-09-08', 'Imperial College London', 'Dr. Elena Bianchi'),

('Berlin', '2024-11-15', '2024-11-18', 'Technical University of Berlin', 'Prof. Paolo Verdi'),

('Beijing', '2025-02-25', '2025-02-28', 'Peking University', 'Dr. Sara Ferrari');





INSERT INTO Presentazione_Articolo (conferenza, articolo_scientifico, data_presentazione)
VALUES
(1, '10.1002/9781118786352', '2023-05-16'),

(2, '10.1038/s41586-021-03736-x', '2023-07-11'),

(3, '10.1126/science.abh3467', '2023-09-21'),

(4, '10.5555/12345678', '2023-11-06'),

(5, '10.1088/1361-6560ab63d4', '2024-02-16'),

(6, '10.1021/acsnano.0c08359', '2024-04-11'),

(7, '10.1126/sciadv.abh4787', '2024-06-21'),

(8, '10.1103/PhysRevLett.126.057201', '2024-09-06'),

(9, '10.5555/87654321', '2024-11-16'),

(10, '10.1088/1741-2552ab8d42', '2025-02-26');




INSERT INTO Negozio (partita_iva, nome, indirizzo, url)
VALUES
('01234567890', 'Libreria Feltrinelli', 'Via del Corso, 123, Roma', NULL),

('98765432101', 'Libreria Mondadori', 'Piazza Colonna, 45, Milano', NULL),

('11223344556', 'Libreria Hoepli', NULL, 'https://www.hoepli.it/'),

('99887766554', 'Libreria Coop', 'Via della Moscova, 18, Milano', NULL),

('33445566778', 'Libreria Giunti', 'Via de'' Tornabuoni, 17, Firenze', NULL),

('55667788990', 'Libreria Newton Compton', 'Via del Corso, 123, Roma', 'https://www.newtoncompton.com/');



INSERT INTO Vendita (negozio, libro, costo, quantita) VALUES
-- vendite per la libreria Mondadori, può vendere solo libri cartacei
('98765432101', '9780142401209', 15.99, 50),  -- Il signore degli anelli
('98765432101', '9788804676161', 20.50, 30),  -- 1984
('98765432101', '9788804685385', 12.75, 40),  -- Il nome della rosa
('98765432101', '9780061120084', 18.99, 25),  -- Il vecchio e il mare
('98765432101', '9788804583598', 9.95, 60),  -- Norwegian Wood

-- Vendite per la Libreria Hoepli, può vendere sia libri digitali che audiolibri che libri cartacei
('11223344556', '9788804509955', 14.50, 45),  -- Il Grande Gatsby
('11223344556', '9788804583598', 22.25, 35),  -- Norwegian Wood
('11223344556', '9788804668234', 19.99, 20),  -- Il codice da Vinci
('11223344556', '9788804685386', 17.75, 30),  -- Siddhartha
('11223344556', '9788850327115', 25.00, 15),  -- Programmazione in Java

-- Vendite per la Libreria Newton Compton, può vendere sia libri digitali che audiolibri che libri cartacei
('55667788990', '9780747570738', 16.50, 40),  -- Harry Potter e l'Ordine della Fenice
('55667788990', '9780747532743', 21.75, 25),  -- Harry Potter e la Pietra Filosofale
('55667788990', '9780747538493', 18.99, 30),  -- Harry Potter e la Camera dei Segreti
('55667788990', '9780747543350', 14.95, 50),  -- Harry Potter e il Prigioniero di Azkaban
('55667788990', '9780747545118', 27.50, 20),  -- Harry Potter e il Calice di Fuoco
('55667788990', '9780747584681', 11, 20),     -- Harry Potter e il Principe Mezzosangue
('55667788990', '9780747591061', 25.99, 20),  -- Harry Potter e i Doni della Morte
('55667788990', '9788804509955', 13, 91);     -- Il Grande Gatsby



INSERT INTO Serie (nome, prequel, sequel) VALUES
('Saga Harry Potter Cartacea', '9780747532743', '9780747538492'),
('Saga Harry Potter Cartacea', '9780747538492', '9780747543350'),
('Saga Harry Potter Cartacea', '9780747543350', '9780747545117'),
('Saga Harry Potter Cartacea', '9780747545117', '9780747570738'),
('Saga Harry Potter Cartacea', '9780747570738', '9780747584680'),
('Saga Harry Potter Cartacea ', '9780747584680', '9780747591061'),
('Saga Il Signore degli Anelli Digitale', '9780142401208', '9780345339706'),
('Saga Il Signore degli Anelli Digitale', '9780345339706', '9780345339713'),
('Saga Il Signore degli Anelli Digitale', '9780345339713', '9780345339721'),
('Saga Il Signore degli Anelli Digitale', '9780345339721', '9780345340429');


INSERT INTO Utente (username, email, password, nome, cognome, data_nascita, amministratore)
VALUES
('john_doe', 'john.doe@example.com', 'P@ssw0rd', 'John', 'Doe', '1990-05-15', TRUE),

('alice_smith', 'alice.smith@example.com', 'Secret!23', 'Alice', 'Smith', '1985-09-22', FALSE),

('bob_jones', 'bob.jones@example.com', 'P@ssword', 'Bob', 'Jones', '1992-11-10', FALSE),

('emma_davis', 'emma.davis@example.com', 'SecurePwd123!', 'Emma', 'Davis', '1988-03-30', FALSE),

('michael_white', 'michael.white@example.com', 'Admin@456', 'Michael', 'White', '1995-07-18', TRUE),

('olivia_martin', 'olivia.martin@example.com', 'OliviaPwd#1', 'Olivia', 'Martin', '1993-01-25', FALSE),

('david_thompson', 'david.thompson@example.com', 'DavidPass!23', 'David', 'Thompson', '1987-06-12', FALSE),

('lily_wilson', 'lily.wilson@example.com', 'LilySecure456$', 'Lily', 'Wilson', '1998-04-05', FALSE),

('ryan_jackson', 'ryan.jackson@example.com', 'RyanPwd789*', 'Ryan', 'Jackson', '1991-09-15', FALSE),

('sophia_adams', 'sophia.adams@example.com', 'SophiaPass@1', 'Sophia', 'Adams', '1994-12-28', TRUE);




INSERT INTO Notifica (messaggio, data_ora, destinatario)
VALUES
-- Messaggio di benvenuto per john_doe
('Benvenuto su Bookstore, John Doe! Inizia a esplorare il nostro vasto catalogo di libri.', '2023-11-30 12:00:00'::timestamp, 'john_doe'),
-- Notifica di sconto per michael_white
('Sconto speciale del 10% su tutti i libri per te, Michael White. Approfitta dell''offerta limitata!', '2023-11-30 14:30:00'::timestamp, 'michael_white'),
-- Promemoria per alice_smith
('Ricorda di completare l''acquisto nel tuo carrello, Alice Smith. I tuoi libri ti aspettano!', '2023-11-30 15:45:00'::timestamp, 'alice_smith'),
-- Notifica di aggiornamento per olivia_martin
('Nuove funzionalità sono state aggiunte al sistema. Olivia Martin, dai un''occhiata alle ultime novità!', '2023-11-30 16:30:00'::timestamp, 'olivia_martin'),
-- Avviso di spedizione per bob_jones
('Il tuo ordine è stato spedito, Bob Jones. Segui lo stato di consegna per restare aggiornato.', '2023-11-30 17:15:00'::timestamp, 'bob_jones');




INSERT INTO Raccolta (nome, visibilita, proprietario) VALUES
('Libri di John', 'privata', 'john_doe'),
($a$Alice's Favorites$a$, 'pubblica', 'alice_smith'),
($a$Bob's Private Collection$a$, 'privata', 'bob_jones'),
($a$Emma's Reading List$a$, 'pubblica', 'emma_davis'),
($a$Michael's Hidden Gems$a$, 'privata', 'michael_white'),
($a$Olivia's Public Picks$a$, 'pubblica', 'olivia_martin'),
($a$David's Personal Library$a$, 'privata', 'david_thompson'),
($a$Lily's Must-Reads$a$, 'pubblica', 'lily_wilson'),
($a$Ryan's Top Selection$a$, 'privata', 'ryan_jackson'),
($a$Sophia's Bookshelf$a$, 'pubblica', 'sophia_adams');





-- Raccolta di John
INSERT INTO Articolo_Contenuto_Raccolta (articolo_scientifico, raccolta) VALUES
    ('10.1002/9781118786352', 1),
    ('10.1038/s41586-021-03736-x', 1),
    ('10.1126/science.abh3467', 1),
    ('10.5555/12345678', 1);

-- Alice's Favorites
INSERT INTO Articolo_Contenuto_Raccolta (articolo_scientifico, raccolta) VALUES
    ('10.1088/1361-6560ab63d4', 2),
    ('10.1021/acsnano.0c08359', 2),
    ('10.1126/sciadv.abh4787', 2);

-- Bob's Private Collection
INSERT INTO Articolo_Contenuto_Raccolta (articolo_scientifico, raccolta) VALUES
    ('10.1103/PhysRevLett.126.057201', 3),
    ('10.5555/87654321', 3),
    ('10.1088/1741-2552ab8d42', 3),
    ('10.1038/nature21074', 3);

-- Emma's Reading List
INSERT INTO Articolo_Contenuto_Raccolta (articolo_scientifico, raccolta) VALUES
    ('10.1007/s11227-020-03322-9', 4),
    ('10.1126/science.aba5253', 4),
    ('10.5555/98765432', 4);

-- Michael's Hidden Gems
INSERT INTO Articolo_Contenuto_Raccolta (articolo_scientifico, raccolta) VALUES
    ('10.1038/s41467-020-18723-y', 5),
    ('10.5555/98765432', 5);

-- Olivia's Public Picks
INSERT INTO Articolo_Contenuto_Raccolta (articolo_scientifico, raccolta) VALUES
    ('10.1038/nature21074', 6),
    ('10.1103/PhysRevLett.126.057201', 6),
    ('10.1038/s41586-021-03736-x', 6),
    ('10.1126/sciadv.abh4787', 6);

-- David's Personal Library
INSERT INTO Articolo_Contenuto_Raccolta (articolo_scientifico, raccolta) VALUES
    ('10.1007/s11227-020-03322-9', 7),
    ('10.5555/98765432', 7);

-- Lily's Must-Reads
INSERT INTO Articolo_Contenuto_Raccolta (articolo_scientifico, raccolta) VALUES
    ('10.1038/s41467-020-18723-y', 8),
    ('10.1103/PhysRevLett.126.057201', 8),
    ('10.1038/nature21074', 8);

-- Ryan's Top Selection
INSERT INTO Articolo_Contenuto_Raccolta (articolo_scientifico, raccolta) VALUES
    ('10.1088/1361-6560ab63d4', 9),
    ('10.1021/acsnano.0c08359', 9),
    ('10.5555/87654321', 9);








-- Alice's Favorites
INSERT INTO Libro_Contenuto_Raccolta (libro, raccolta) VALUES
    ('9788806186615', 2),
    ('9780061120084', 2),
    ('9780553386790', 2);

-- Bob's Private Collection
INSERT INTO Libro_Contenuto_Raccolta (libro, raccolta) VALUES
    ('9788804648885', 3),
    ('9788804685385', 3),
    ('9780525676154', 3);

-- Emma's Reading List
INSERT INTO Libro_Contenuto_Raccolta (libro, raccolta) VALUES
    ('9780747532743', 4),
    ('9780747538493', 4),
    ('9780747543350', 4);

-- Michael's Hidden Gems
INSERT INTO Libro_Contenuto_Raccolta (libro, raccolta) VALUES
    ('9780747584681', 5),
    ('9780747591061', 5);

-- Olivia's Public Picks
INSERT INTO Libro_Contenuto_Raccolta (libro, raccolta) VALUES
    ('9780747570738', 6),
    ('9780747584681', 6),
    ('9780345339713', 6),
    ('9788850333741', 6);

-- David's Personal Library
INSERT INTO Libro_Contenuto_Raccolta (libro, raccolta) VALUES
    ('9788806186615', 7),
    ('9780553386790', 7);

-- Lily's Must-Reads
INSERT INTO Libro_Contenuto_Raccolta (libro, raccolta) VALUES
    ('9780747584681', 8),
    ('9780747591061', 8),
    ('9780747570738', 8);

-- Ryan's Top Selection
INSERT INTO Libro_Contenuto_Raccolta (libro, raccolta) VALUES
    ('9788806186615', 9),
    ('9780061120084', 9),
    ('9788804648885', 9);

-- Sophia's Bookshelf
INSERT INTO Libro_Contenuto_Raccolta (libro, raccolta) VALUES
    ('9780747570738', 10),
    ('9780747584681', 10),
    ('9780345339706', 10);



INSERT INTO Utente_Salvataggio_Raccolta (utente, raccolta) VALUES
('john_doe', 1),
('john_doe', 3),
('alice_smith', 1),
('alice_smith', 9),
('bob_jones', 1),
('bob_jones', 10),
('emma_davis', 3),
('emma_davis', 8),
('olivia_martin', 7),
('sophia_adams', 6);
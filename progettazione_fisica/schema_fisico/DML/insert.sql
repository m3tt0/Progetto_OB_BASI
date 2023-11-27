
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
create domain isbn as char(17) check(value !~ '^97[89][0-9]{10}$');

create domain issn as char(9) check(value !~ '[0-9]{4}-[0-9]{3}([0-9]|X)$');

create domain doi as varchar check(value !~ '^10.[0-9]*$');

create domain email_type as varchar check (value like '%@%.%');

create type tipo_fruizione as enum ('digitale', 'cartaceo', 'audiolibro');

create type tipo_libro as enum ('didattico', 'romanzo');

create type visibilita as enum ('pubblica', 'privata');



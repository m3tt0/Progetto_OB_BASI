CREATE DOMAIN isbn AS VARCHAR
    CHECK(VALUE ~ '^(978|979)[0-9]{6,6}([0-9X]|[0-9]{4,4})$');

CREATE DOMAIN issn AS CHAR(9)
    CHECK(VALUE ~ '[0-9]{4}-[0-9]{3}([0-9]|X)$');

CREATE DOMAIN doi AS VARCHAR
    CHECK(VALUE ~ '^10\.[a-zA-Z0-9]+([._-][a-zA-Z0-9]+)*\/([a-zA-Z0-9]+([._-][a-zA-Z0-9]+)*)$');

CREATE DOMAIN email_type AS VARCHAR
    CHECK (VALUE ~ '^[a-z0-9]+([._-][a-z0-9]+)*@[a-z0-9]+\.([a-z]{2,})');

CREATE DOMAIN partita_iva AS CHAR(11)
    CHECK (VALUE ~ '^\d+$');

CREATE DOMAIN username AS VARCHAR
    CHECK (VALUE ~ '^[a-z0-9_]+([.][a-z0-9_]+)*$' AND VALUE !~ '_+$');
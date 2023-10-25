CREATE DOMAIN isbn AS CHAR(17) CHECK(VALUE LIKE '978-__-___-____-_');
CREATE DOMAIN issn AS CHAR(9) CHECK(VALUE LIKE '____-____');
CREATE DOMAIN doi AS TEXT CHECK(VALUE LIKE '^https:\/\/doi\.org\/10\.\d{4,}/[a-zA-Z0-9.-]+\/\d{4}\.\d{4}$')
CREATE DOMAIN email_type AS VARCHAR CHECK(VALUE LIKE '%@%.%');

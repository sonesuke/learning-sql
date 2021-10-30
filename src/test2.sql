DROP TABLE IF EXISTS A;
CREATE TABLE A (
    first_name_a text,
    last_name_a text,
    id_a int
);

INSERT INTO A
VALUES
    ('William', 'Hartnell', 1),
    ('Matt', 'Smithe', 2),
    ('Paul', 'McGann', 3),
    ('David', 'Tennant', 4),
    ('Colin', 'Baker', 5)
;

DROP TABLE IF EXISTS B;
CREATE TABLE B(
    first_name_b text,
    last_name_b text,
    id_b text
);

INSERT INTO B
VALUES
    ('Matt', 'Smith', 'a'),
    ('Peter', 'Davison', 'b'),
    ('Dave', 'Tennant', 'c'),
    ('Colin', 'Baker', 'd'),
    ('Will', 'Hartnel', 'e')
;

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;
SELECT
       *
FROM
     A a, B b
WHERE
      LEVENSHTEIN(a.first_name_a, b.first_name_b) <= 2
  AND LEVENSHTEIN(a.last_name_a, b.last_name_b) <= 2
;

CREATE EXTENSION IF NOT EXISTS pg_trgm;
SELECT
    *
FROM
    A a, B b
WHERE
    SIMILARITY(a.first_name_a, b.first_name_b) > 0.4
    AND SIMILARITY(a.last_name_a, b.last_name_b) > 0.4
;

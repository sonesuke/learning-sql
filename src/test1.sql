DROP TABLE IF EXISTS test;
CREATE TABLE test (
    id integer,
    string text
);
INSERT INTO test VALUES
    (1, '123,456,xxxx'),
    (2, '123、3333¥n2222');
SELECT * FROM test;

SELECT *, REGEXP_SPLIT_TO_TABLE(string, '[^0-9]+') FROM test;
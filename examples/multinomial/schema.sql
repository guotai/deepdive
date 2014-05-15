
DROP TABLE IF EXISTS m1 CASCADE;
DROP TABLE IF EXISTS m2 CASCADE;
CREATE TABLE m1(
    mid bigint,
    value bigint,
    id bigint);

CREATE TABLE m2(
    mid bigint,
    value bigint,
    id bigint);

INSERT INTO m1(mid, value) VALUES
    (0, 0),
    (1, 1),
    (2, 2),
    (3, NULL);

INSERT INTO m2(mid, value) VALUES
    (0, 1),
    (1, 0),
    (2, NULL),
    (3, NULL);

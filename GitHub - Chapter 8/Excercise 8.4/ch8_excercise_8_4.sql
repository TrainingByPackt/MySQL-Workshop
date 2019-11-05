CREATE TABLE months (
  month_number tinyint unsigned primary key,
  month_name varchar(15),
  CHECK (month_number <= 12)
);
DESCRIBE months;
INSERT INTO months VALUES (1, 'January');
INSERT INTO months VALUES ('February');
INSERT INTO months VALUES ('February', 2);
INSERT INTO months VALUES (15, 'February');
INSERT INTO months VALUES (2, 'The month February');

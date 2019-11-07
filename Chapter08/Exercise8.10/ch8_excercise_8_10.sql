USE world;
SELECT * FROM city INTO OUTFILE '/var/lib/mysql-files/city.csv'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n';
\! head /var/lib/mysql-files/city.csv
CREATE TABLE copy_of_city LIKE city;
LOAD DATA INFILE '/var/lib/mysql-files/city.csv' INTO TABLE copy_of_city
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n';

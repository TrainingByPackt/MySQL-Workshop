DROP DATABASE world_simple;
CREATE DATABASE world_simple;
USE world_simple;

CREATE TABLE country
AS SELECT Code, Name FROM world.country WHERE Code IN ('BGR','ROM');

CREATE TABLE city
AS SELECT ID, Name, CountryCode FROM world.city
WHERE Name IN ('Sofija', 'Plovdiv', 'Bucuresti', 'Iasi');

SELECT city.Name, country.Code, country.Name FROM city
JOIN country ON city.CountryCode=country.Code;

SELECT ci.Name, co.Code AS CountryCode, co.Name  AS CountryName 
FROM city ci JOIN country co ON ci.CountryCode=co.Code;

INSERT INTO city VALUES(2460, 'Skopje', 'MKD');

SELECT ci.Name, co.Code AS CountryCode, co.Name  AS CountryName 
FROM city ci JOIN country co ON ci.CountryCode=co.Code;

SELECT ci.Name, co.Code AS CountryCode, co.Name  AS CountryName 
FROM city ci LEFT JOIN country co ON ci.CountryCode=co.Code;

SELECT co.Name, COUNT(*) FROM country co
LEFT JOIN city ci ON ci.CountryCode=co.Code
GROUP BY co.Name;

SELECT co.Name, COUNT(*) FROM country co
RIGHT JOIN city ci ON ci.CountryCode=co.Code GROUP BY co.Name;

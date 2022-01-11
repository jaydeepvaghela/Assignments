CREATE DATABASE testDB;

CREATE TABLE JaydeepData (
    PersonID int,
    LastName varchar(25),
    FirstName varchar(25),
    Address varchar(255),
    City varchar(25)
);

INSERT INTO JaydeepData(PersonID, LastName, FirstName, Address, City)
VALUES ('01', 'Vaghela', 'Jaydeep', '4006', 'Bhavnagar'),
 ('02', 'Vaghela', 'Sagar', '4007', 'Ahmedabad'),
 ('03', 'Vaghela', 'Meera', '4008', 'Surat');

SELECT * FROM JaydeepData;

UPDATE JaydeepData SET City = 'Mumbai' WHERE PersonID = 2;

ALTER TABLE JaydeepData ADD Gender varchar(10);

UPDATE JaydeepData SET Gender = 'Male' WHERE PersonID = 1;
UPDATE JaydeepData SET Gender = 'Male' WHERE PersonID = 2;
UPDATE JaydeepData SET Gender = 'Female' WHERE PersonID = 3;

SELECT DISTINCT (Gender) FROM JaydeepData;

SELECT * FROM JaydeepData ORDER BY PersonID DESC;

SELECT * FROM JaydeepData WHERE FirstName LIKE 'J%';

SELECT COUNT(*) FROM JaydeepData GROUP BY Gender;

ALTER TABLE JaydeepData DROP Column Gender;

DELETE FROM JaydeepData;


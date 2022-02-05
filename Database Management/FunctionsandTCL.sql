CREATE Database DBJaydeep;

CREATE TABLE SchoolData ( 
	ID INT, 
	StudentName INT, 
	EmailID VARCHAR(40)
);  

ALTER TABLE SchoolData
ALTER Column StudentName varchar(20);

INSERT INTO SchoolData VALUES
(1, 'Ashok', 'ashok@gmail.com'),
(2, 'Suresh', 'suresh@gmail.com'),
(3, 'Ramesh', 'ramesh@gmail.com'),
(4, 'Mohan', 'mohandas@gmail.com');

/*************** ROLLBACK ****************/

BEGIN TRANSACTION
INSERT INTO SchoolData VALUES (5, 'Balram', 'balram@gmail.com');
SELECT * FROM SchoolData;
ROLLBACK TRANSACTION
SELECT * FROM SchoolData;

/*************** COMMIT ****************/

BEGIN TRANSACTION
INSERT INTO SchoolData VALUES
(5, 'Raman', 'ashok@gmail.com'),
(6, 'Jayesh', 'suresh@gmail.com');
COMMIT TRANSACTION
SELECT * FROM SchoolData;

/************** Aggregate functions ***************/

SELECT COUNT(*) FROM SchoolData; /*  return 6  */

SELECT AVG(ID) FROM SchoolData;  /*  return 3  */

SELECT MIN(ID) FROM SchoolData;  /*  return 1  */

SELECT MAX(ID) FROM SchoolData;  /*  return 6  */

SELECT SUM(ID) FROM SchoolData;  /*  return 21  */

/************** Scalar functions ***************/

SELECT LOWER(StudentName) FROM SchoolData; /*  return in lowercase  */

SELECT UPPER(StudentName) FROM SchoolData; /*  return in uppercase  */

SELECT LEN(StudentName) FROM SchoolData; /*  return length of the string */

/************** GRANT AND REVOKE COMMANDS ***************/

CREATE LOGIN jaydeep WITH Password ='pass111';

CREATE USER jaydeep from LOGIN jaydeep;

GRANT delete, insert, select ON SchoolData To jaydeep;

REVOKE insert, select ON SchoolData To jaydeep;


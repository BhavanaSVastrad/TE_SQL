CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;


CREATE TABLE Workers (
WORKER_ID INT NOT NULL PRIMARY KEY ,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

INSERT INTO Workers
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(001,'BHAVANA', 'VASTRAD', 20000, '2013-02-25 09:00:00', 'HR'),
(002,'SAHANA', 'V', 5000, '2015-02-10 09:00:00', 'ADMIN'),
(003,'DEEPA', 'S', 25000, '2014-05-16 09:00:00', 'HR'),
(004,'ARYAN', 'YALAVATHIMATH', 8000, '2016-12-20 09:00:00', 'ADMIN'),
( 005,'ARNAV', 'JAIN', 21000, '2015-08-29 09:00:00', 'ADMIN'),
( 006,'ANVITHA', 'JOSHI', 20000, '2017-02-12 09:00:00', 'ACCOUNT'),
(007,'SHARANAYYA', 'C', 15000, '2018-03-23 09:00:00', 'ADMIN'),
(008,'NITHYA', 'PATIDAR', 18000, '2014-05-02 09:00:00', 'ACCOUNT');
(009,'Nasreen', 'P', 18000, '2017-05-02 09:00:00', 'ACCOUNT');

UPDATE Workers set FIRST_NAME='SATISH' where WORKER_ID=007;
UPDATE Workers set FIRST_NAME='VIPUL' where WORKER_ID=008;

CREATE TABLE Bonus (
WORKER_REF_ID INT,
BONUS_AMOUNT INT,
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Workers(WORKER_ID)
       ON DELETE CASCADE
);

INSERT INTO Bonus
(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(001, 5000, '2015-04-20 09:00:00'),
(002, 3000, '2015-08-11 09:00:00'),
(003, 4000, '2015-04-20 09:00:00'),
(001, 4500, '2015-04-20 09:00:00'),
(002, 3500, '2015-08-11 09:00:00');

CREATE TABLE Title (
WORKER_REF_ID INT,
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Workers(WORKER_ID)
       ON DELETE CASCADE
);

INSERT INTO Title
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');

--Q-1. Write an SQL query to fetch %FIRST_NAME% from Worker table using the alias name as &lt;WORKER_NAME&gt;.
Select FIRST_NAME AS WORKER_NAME from Workers;

--Q-2. Write an SQL query to fetch %FIRST_NAME% from Worker table in upper case.
Select upper(FIRST_NAME) from Workers;

--Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Workers table.
Select distinct DEPARTMENT from Workers;

--Q-4. Write an SQL query to print the first three characters of% FIRST_NAME from Worker table.
Select substring(FIRST_NAME,1,3) from Workers;

--Q-5. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
Select distinct len(DEPARTMENT) from Workers;

--Q-6. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
Select CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'COMPLETE_NAME' from Workers;

--Q-7. Write an SQL query to print details for Workers with the first name as %Vipul% and %Satish% from Worker table.
Select * from Workers where FIRST_NAME in ('VIPUL','SATISH');

--Q-8. Write an SQL query to print details of Workers with DEPARTMENT name as %Admin%.
Select * from Workers where DEPARTMENT like 'Admin%';

--Q-9. Write an SQL query to print details of the Workers whose FIRST_NAME ends with %a%.
Select * from Workers where FIRST_NAME like '%a';

--Q-10. Write an SQL query to print details of the Workers whose FIRST_NAME contains %a%.
Select * from Workers where FIRST_NAME like '%a%';
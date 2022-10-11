USE ORG;

CREATE TABLE Employee(
EID int,
EFName varchar(20),
ELName varchar(30)
);

--SEQUENCE
create sequence EmpID as int start with 20 increment by 2
insert into Employee values(NEXT VALUE FOR EmpID,'Elena', 'Gilbert')
insert into Employee values(NEXT VALUE FOR EmpID,'Damon', 'Salvatore')
insert into Employee values(NEXT VALUE FOR EmpID,'Stefan', 'Salvatore')
insert into Employee values(NEXT VALUE FOR EmpID,'Bonnie','Bennett')

select * from Employee

--INDEX
--clustered index on trainee table
create clustered index ID on Employee(EID)

--Non clustered index on trainee table
create index FNAME on Employee(EFName)




--SYNONYM
CREATE SYNONYM Emp for Employee
select * from Emp where EFName='Elena'

--VIEWS

CREATE VIEW work_dep
as
select * from Workers where DEPARTMENT ='HR'

select * from work_dep
select * from Workers
insert into work_dep values(75,'Mike', 'John',2500, 2010-01-08, 'Trainee')

select * from Workers


select * from Bonus 

select w.worker_id,w.first_name,w.salary,w.DEPARTMENT,b.bonus_amount
from Workers as w inner join Bonus as b on w.WORKER_ID=b.WORKER_REF_ID;


create view BonusWork
as
select w.worker_id,w.first_name,w.salary,w.DEPARTMENT,b.bonus_amount
from Workers as w inner join Bonus as b on w.WORKER_ID=b.WORKER_REF_ID;

select * from BonusWork

--String functions
SELECT CONCAT('TIETO', 'EVRY') as Concat; --concat

SELECT LEN('TIETO EVRY') as Length; --Length

SELECT SUBSTRING('SQL Tutorial', 1, 3) AS substring; --substring

SELECT TRIM('    Tietoevry     ') AS TrimmedString;  --Remove leading and trailing spaces from a string

SELECT UPPER(' Trainee software Engineer') as ToUpper; --to upper case

SELECT REVERSE('Tietoevry Training')as Reverse; --reverse

SELECT REPLICATE('SQL Tutorial ', 4) as Replicate; --replicate 3 times


--MATH FUNCTIONS
SELECT ABS(-100) as AbsOutput

SELECT LOG10(100) as Log10Output

SELECT POWER(2,5) as PowerOutput

SELECT SIN(1.5) as SinOutput

SELECT CEILING(2.986) as CeilingOutput

SELECT FLOOR(0.876) as FloorOutput

SELECT ROUND(6.7945,1) as RoundOutput

SELECT SQUARE(6) as SquareOutput

SELECT RADIANS(180) as Radian_Output

--DATE AND TIME FUNCTIONS


--print the only date of given value
SELECT DAY('2000-06-18 04:10:11') as Day_Output --as Month_Output, as Year_Output

--add the 2 year to the given year
SELECT DATEADD(year, 2, '2000/06/18') as DateAdd_Output

--Find the difference between the year
SELECT DATEDIFF(year, '2000/06/18', '2022/06/18') as DateDiff_Output

--Check if the enter date is valid or not
SELECT ISDATE('2022-10-07') as Valid_dateOutput --1
SELECT ISDATE('Invalid!') as Invalid_dateOutput --0

--Gives the specific part of date
SELECT DATEPART(MONTH, '2022/06/18') as DatePart_Output

--Gives the date from its part
SELECT DATEFROMPARTS(2000, 06, 18) as DateFrom_Output

--Gives the date and time of SQL server
SELECT SYSDATETIME() as SysDateTime_Output

--print the current date with time
SELECT CURRENT_TIMESTAMP as Current_Date_Time
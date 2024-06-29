Create database employeedetail;

create table employeedetails(
Empid int,
FullName varchar(50),
ManagerId int,
DateOfJoining date,
City varchar(50)
);
 
 Insert into employeedetails (Empid,FullName,ManagerId,DateOfJoining,City )
values
(121	,'John Snow',	321,	'2019/01/31',	'Toronto'),
(321,	'Walter White',	986,	'2020/01/30','California'),
(421,	'Kuldeep Rana',	876,	'2021/11/27',	'New Delhi');
 
 select*from employeedetails

 create table employeesalary(EmpId int,
Project varchar(10),
Salary	varchar(10),
Variable varchar(10)
);
 
 insert into employeesalary(EmpId ,Project ,Salary	,Variable )
values(121,	'P1',	8000,	500),
(321,	'P2',	10000	,1000),
(421,	'P1',	12000,	0);

select* from employeesalary

SELECT *
FROM employeedetails
WHERE Empid NOT IN (
    SELECT EmpId
    FROM employeesalary
);

SELECT *
FROM employeedetails
WHERE Empid NOT IN (
    SELECT EmpId
    FROM employeesalary
);
 
 SELECT *
FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020;

SELECT ed.*
FROM EmployeeDetails ed
INNER JOIN EmployeeSalary es ON ed.Empid = es.EmpId;
 

 SELECT Project, COUNT(*) AS EmployeeCount
FROM EmployeeSalary
GROUP BY Project;

SELECT ed.FullName, COALESCE(es.Salary, 'Salary not available') AS Salary
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es ON ed.Empid = es.EmpId;

SELECT e1.*
FROM EmployeeDetails e1
INNER JOIN EmployeeDetails e2 ON e1.Empid = e2.ManagerId;

SELECT *
FROM EmployeeDetails
WHERE Empid IN (
    SELECT Empid
    FROM EmployeeDetails
    GROUP BY Empid
    HAVING COUNT(*) > 1
);

 SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNum
    FROM employeedetails
) AS NumberedRows
WHERE RowNum % 2 = 1;

 
 SELECT EmpId, FullName
FROM employeedetails
WHERE ManagerId = 986;

SELECT DISTINCT Project
FROM EmployeeSalary;

SELECT COUNT(*) AS EmployeeCount
FROM EmployeeSalary
WHERE Project = 'P1';

SELECT 
    MAX(CAST(Salary AS DECIMAL(10,2))) AS MaxSalary,
    MIN(CAST(Salary AS DECIMAL(10,2))) AS MinSalary,
    AVG(CAST(Salary AS DECIMAL(10,2))) AS AvgSalary
FROM EmployeeSalary;

SELECT EmpId
FROM EmployeeSalary
WHERE Salary BETWEEN 9000 AND 15000;
 
SELECT *
FROM employeedetails
WHERE City = 'Toronto' 
AND ManagerId = 321;
 

 SELECT *
FROM employeedetails
WHERE City = 'California' 
OR ManagerId = 321;

SELECT *
FROM employeesalary
WHERE Project != 'P1';

 SELECT ed.EmpId,
       ed.FullName,
       (CAST(es.Salary AS DECIMAL(10,2)) + CAST(es.Variable AS DECIMAL(10,2))) AS TotalSalary
FROM employeedetails ed
INNER JOIN employeesalary es ON ed.EmpId = es.EmpId;
 

 SELECT *
FROM employeedetails
WHERE FullName LIKE '__hn%';


SELECT Empid
FROM EmployeeDetails
UNION
SELECT EmpId
FROM EmployeeSalary;

SELECT *
FROM EmployeeDetails ed
INNER JOIN EmployeeSalary es ON ed.Empid = es.EmpId;
 
 
 SELECT t1.*
FROM EmployeeDetails t1
LEFT JOIN EmployeeSalary t2 ON t1.Empid = t2.EmpId
WHERE t2.EmpId IS NULL;
 

 SELECT ed.Empid
FROM EmployeeDetails ed
INNER JOIN EmployeeSalary es ON ed.Empid = es.EmpId;

SELECT ed.Empid
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es ON ed.Empid = es.EmpId
WHERE es.EmpId IS NULL;


SELECT 
    FullName,
    REPLACE(FullName, ' ', '_') AS FullName_With_Underscore
FROM employeedetails;
 

 
 SELECT EmpId, ManagerId
FROM employeedetails;
 

 SELECT LEFT(FullName, CHARINDEX(' ', FullName + ' ') - 1) AS FirstName
FROM EmployeeDetails;
 
 SELECT UPPER(FullName) AS UppercaseName, 
       LOWER(City) AS LowercaseCity
FROM EmployeeDetails;
 
 SELECT 
    SUM(LEN(FullName) - LEN(REPLACE(FullName, 'n', ''))) AS Count_of_n
FROM EmployeeDetails;
 

 UPDATE EmployeeDetails
SET FullName = LTRIM(RTRIM(FullName));
  
  SELECT ed.*
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es ON ed.Empid = es.EmpId
WHERE es.EmpId IS NULL;

 
 SELECT ed.FullName
FROM EmployeeDetails ed
JOIN EmployeeSalary es ON ed.Empid = es.EmpId
WHERE CAST(es.Salary AS DECIMAL(10,2)) BETWEEN 5000 AND 10000;


SELECT GETDATE() AS CurrentDateTime;

SELECT *
FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020;

SELECT ed.*
FROM EmployeeDetails ed
INNER JOIN EmployeeSalary es ON ed.Empid = es.EmpId;


SELECT Project, COUNT(*) AS EmployeeCount
FROM EmployeeSalary
GROUP BY Project
ORDER BY COUNT(*) DESC;

SELECT ed.FullName, es.Salary, es.Variable
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es ON ed.Empid = es.EmpId;

  
 CREATE TABLE EmployeeInfo (
    EmpId INT PRIMARY KEY,
    EmpFname VARCHAR(50),
    EmpLname VARCHAR(50),
    Department VARCHAR(100),
    Project VARCHAR(100),
    Address VARCHAR(255),
    DOB DATE,
    Gender VARCHAR(10)
);

 INSERT INTO EmployeeInfo (EmpId, EmpFname, EmpLname, Department, Project, Address, DOB, Gender)
VALUES 
(1, 'sanjay', 'mehra', 'HR', 'P1', 'Hyderabad', '1976-12-01', 'Male'),
(2, 'ananya', 'mishra', 'Admin', 'P2', 'Delhi', '1968-05-02', 'Female'),
(3, 'rohan', 'Diwan', 'Account', 'P3', 'Mumbai', '1980-01-01', 'Male'),
(4, 'sonia', 'kulkarni', 'HR', 'P1', 'Hyderabad', '1992-04-02', 'Female'),
(5, 'ankit', 'kapoor', 'Admin', 'P2', 'Delhi',  '1994-07-03', 'Male');

Select * from EmployeeInfo

  


 
 
 CREATE TABLE EmployeePosition (
    EmpId INT PRIMARY KEY,
    EmpPosition VARCHAR(100),
    DateOfJoining DATE,
    Salary DECIMAL(10, 2)
);
 
 INSERT INTO EmployeePosition (EmpId, EmpPosition, DateOfJoining, Salary)
VALUES 
(1, 'Manager', '2022-05-1', 500000.00),
(2, 'Executive', '2022-05-2', 75000.00),
(3, 'Manager', '2022-05-1', 90000.00),
(4, 'Lead', '2022-05-2', 85000.00),
(5, 'Executive', '2022-05-1', 300000.00);
  
Select * from EmployeePosition

SELECT UPPER(EmpFname) AS EmpName
FROM EmployeeInfo;

SELECT COUNT(*) AS NumberOfEmployees
FROM EmployeeInfo
WHERE Department = 'HR';


SELECT GETDATE() AS CurrentDate;

SELECT LEFT(EmpLname, 4) AS FirstFourChars
FROM EmployeeInfo;

 SELECT 
    CASE 
        WHEN CHARINDEX('(', Address) > 0 THEN 
            SUBSTRING(Address, 1, CHARINDEX('(', Address) - 2) 
        ELSE 
            Address 
    END AS PlaceName
FROM EmployeeInfo;

SELECT *
INTO NewEmployeeInfo
FROM EmployeeInfo;

 
 SELECT *
FROM EmployeePosition
WHERE Salary BETWEEN 50000 AND 100000;
 

 SELECT *
FROM EmployeeInfo
WHERE EmpFname LIKE 'S%';

 SELECT TOP 10 *
FROM EmployeeInfo;

 
 SELECT CONCAT(EmpFname, ' ', EmpLname) AS FullName
FROM EmployeeInfo;

SELECT Gender, COUNT(*) AS NumberOfEmployees
FROM EmployeeInfo
WHERE DOB BETWEEN '1970-05-02' AND '1975-12-31'
GROUP BY Gender;

SELECT *
FROM EmployeeInfo
ORDER BY EmpLname DESC, Department ASC;

SELECT *
FROM EmployeeInfo
WHERE EmpLname LIKE '____A';

SELECT *
FROM EmployeeInfo
WHERE EmpFname NOT IN ('Sanjay', 'Sonia');

SELECT *
FROM EmployeeInfo
WHERE Address = 'DELHI(DEL)';

SELECT e1.EmpId, e1.EmpPosition AS EmployeePosition, e2.EmpPosition AS ManagerPosition
FROM EmployeePosition e1
JOIN EmployeePosition e2 ON e1.EmpId = e2.EmpId
WHERE e1.EmpPosition != e2.EmpPosition;


SELECT Department, COUNT(*) AS EmployeeCount
FROM EmployeeInfo
GROUP BY Department
ORDER BY COUNT(*) ASC;

SELECT EI.*
FROM EmployeeInfo EI
INNER JOIN EmployeePosition EP ON EI.EmpId = EP.EmpId;

 SELECT MIN(Salary) AS MinSalary1, 
       (SELECT MIN(Salary) FROM EmployeePosition WHERE Salary > (SELECT MIN(Salary) FROM EmployeePosition)) AS MinSalary2,
       MAX(Salary) AS MaxSalary1,
       (SELECT MAX(Salary) FROM EmployeePosition WHERE Salary < (SELECT MAX(Salary) FROM EmployeePosition)) AS MaxSalary2
FROM EmployeePosition;

SELECT Salary
FROM (
    SELECT Salary, ROW_NUMBER() OVER (ORDER BY Salary DESC) AS SalaryRank
    FROM EmployeePosition
) AS RankedSalaries
WHERE SalaryRank = 1;

SELECT EmpId, COUNT(*)
FROM EmployeeInfo
GROUP BY EmpId
HAVING COUNT(*) > 1;

SELECT e1.EmpId AS Employee1, e1.EmpFname AS Employee1Name,
       e2.EmpId AS Employee2, e2.EmpFname AS Employee2Name,
       e1.Department
FROM EmployeeInfo e1
JOIN EmployeeInfo e2 ON e1.Department = e2.Department
WHERE e1.EmpId < e2.EmpId;

SELECT *
FROM EmployeeInfo
ORDER BY EmpId DESC

SELECT Salary
FROM (
    SELECT Salary, ROW_NUMBER() OVER (ORDER BY Salary DESC) AS SalaryRank
    FROM EmployeePosition
) AS RankedSalaries
WHERE SalaryRank = 3;


-- Display the first record
SELECT *
FROM EmployeeInfo
ORDER BY EmpId ASC


-- Display the last record
SELECT *
FROM EmployeeInfo
ORDER BY EmpId DESC


 SELECT Department
FROM EmployeeInfo
GROUP BY Department
HAVING COUNT(*) < 2;

 


 SELECT EmpPosition, SUM(Salary) AS TotalSalary
FROM EmployeePosition
GROUP BY EmpPosition;


SELECT TOP 50 PERCENT *
FROM EmployeeInfo;

 


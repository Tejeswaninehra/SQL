create database employee;

Create table employee_table(
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
    joining_date DATE,
    department VARCHAR(50),
    gender CHAR(1)
);
 
INSERT INTO employee_table (employee_id, first_name, last_name, salary, joining_date, department, gender)
VALUES
(1, 'Vikas', 'Ahalwat', 600000, '2013-12-02 11:16', 'IT' ,'M');
INSERT INTO employee_table (employee_id, first_name, last_name, salary, joining_date, department, gender)
VALUES
(2, 'Nikita', 'Jain', 540000, '2013-02-14 11:16', 'HR', 'F'),
(3, 'Ashish', 'Kumar', 1000000, '2013-02-15 11:16', 'IT', 'M'),
(4, 'Nikhil', 'Sharma', 480000, '2013-02-16 11:16', 'HR', 'M'),
(5, 'Anish', 'Kadian', 500000, '2013-02-15 11:16', 'Paroll', 'M');

SELECT * FROM employee_table

SELECT employee_id, first_name, last_name, salary, joining_date, department, gender
FROM employee_table;
 
 SELECT first_name
FROM employee_table;

SELECT UPPER(First_Name) AS "First Name"
FROM employee_table;


SELECT CONCAT(First_Name, ' ', Last_Name) AS "Name"
FROM employee_table;

SELECT *
FROM employee_table
WHERE First_Name = 'Vikas';

SELECT *
FROM employee_table
WHERE First_Name LIKE 'A%';

SELECT *
FROM employee_table
WHERE First_Name LIKE '%h';

SELECT *
FROM employee_table
WHERE first_name LIKE '[a-p]%';

SELECT *
FROM employee_table
WHERE First_Name NOT LIKE '[a-p]%';


SELECT *
FROM employee_table
WHERE Gender LIKE '_le' AND LEN(Gender) = 4;

SELECT *
FROM employee_table
WHERE First_Name LIKE 'A____';

SELECT *
FROM employee_table
WHERE First_Name LIKE 'Vik%%as' ESCAPE '\';

SELECT DISTINCT Department
FROM employee_table;
 
 SELECT MAX(Salary) AS HighestSalary
FROM employee_table;

SELECT MIN(Salary) AS LowestSalary
FROM employee_table;

SELECT FORMAT(joining_date, 'dd MMM yyyy') AS FormattedJoining_Date
FROM employee_table;


SELECT FORMAT(Joining_Date, 'yyyy/MM/dd') AS FormattedJoining_Date
FROM employee_table;

 
 SELECT YEAR(Joining_Date) AS JoiningYear
FROM employee_table;


 SELECT MONTH(joining_date) AS JoiningMonth
FROM employee_table;

 SELECT GETDATE() AS CurrentDate;

 SELECT GETUTCDATE() AS CurrentUTCDate;
  
  SELECT 
    First_Name,
    GETDATE() AS CurrentDate,
    Joining_Date,
    DATEDIFF(MONTH, Joining_Date, GETDATE()) AS MonthsDifference
FROM employee_table;


SELECT 
    First_Name,
    GETDATE() AS CurrentDate,
    Joining_Date,
    DATEDIFF(DAY, Joining_Date, GETDATE()) AS DaysDifference
FROM employee_table;

SELECT *
FROM employee_table
WHERE YEAR(Joining_Date) = 2013;

SELECT *
FROM employee_table
WHERE MONTH(Joining_Date) = 1;

SELECT COUNT(*) AS EmployeeCount
FROM employee_table;

SELECT TOP 1 *
FROM employee_table;

SELECT *
FROM employee_table
WHERE First_Name IN ('Vikas', 'Ashish', 'Nikhil');


SELECT *
FROM employee_table
WHERE First_Name NOT IN ('Vikas', 'Ashish', 'Nikhil');

SELECT RTRIM(First_Name) AS TrimmedFirstName
FROM employee_table;

SELECT LTRIM(First_Name) AS TrimmedFirstName
FROM employee_table;



SELECT 
    First_Name,
    CASE 
        WHEN Gender = 'M' THEN 'Male'
        WHEN Gender = 'F' THEN 'Female'
        ELSE 'Unknown' -- Handle other cases if needed
    END AS GenderAbbreviation
FROM employee_table;


SELECT 'Hello ' + First_Name AS Greeting
FROM employee_table;


SELECT *
FROM employee_table
WHERE Salary > 600000;

SELECT *
FROM employee_table
WHERE Salary < 700000;

SELECT *
FROM employee_table
WHERE Salary BETWEEN 500000 AND 600000;

Create table Product_table(
    Product_ID INT,
    Employee_ID INT,
    Project VARCHAR(255)
);

INSERT INTO Product_table(Product_ID, Employee_ID, Project)
VALUES
(1, 1, 'Task Track'),
(2, 1, 'CLB'),
(3, 1, 'Survey Managment'),
(4, 2, 'HR Managment'),
(5, 3, 'Task Track'),
(6, 3, 'GRS'),
(7, 3, 'DDS'),
(8, 4, 'HR managment'),
(9, 6, 'GL managment');

 SELECT * FROM Product_table

 SELECT Department, SUM(Salary) AS TotalSalary
FROM employee_table
GROUP BY Department;


SELECT Department, SUM(Salary) AS TotalSalary
FROM employee_table
GROUP BY Department
ORDER BY TotalSalary ASC;


SELECT Department, SUM(Salary) AS TotalSalary
FROM employee_table
GROUP BY Department
ORDER BY TotalSalary DESC;


SELECT 
    Department,
    COUNT(*) AS TotalEmployees,
    SUM(Salary) AS TotalSalary
FROM employee_table
GROUP BY Department;


SELECT 
    Department,
    AVG(Salary) AS AverageSalary
FROM employee_table
GROUP BY Department
ORDER BY AverageSalary ASC;


SELECT 
    Department,
    MAX(Salary) AS MaxSalary
FROM employee_table
GROUP BY Department
ORDER BY MaxSalary ASC;


SELECT 
    Department,
    MIN(Salary) AS MinSalary
FROM employee_table
GROUP BY Department
ORDER BY MinSalary ASC;



SELECT 
    Department,
    MIN(Salary) AS MinSalary
FROM employee_table
GROUP BY Department
ORDER BY MinSalary ASC;


SELECT *
FROM employee_table
JOIN Product_table ON employee_table.Employee_ID = Product_table.Employee_ID;


SELECT employee_table.First_Name, employee_table.Last_Name, Product_table.Project
FROM employee_table
INNER JOIN Product_table ON employee_table.employee_id = Product_table.Employee_ID
ORDER BY employee_table.First_Name;


SELECT employee_table.First_Name, employee_table.Last_Name, Product_table.Project
FROM employee_table
LEFT JOIN Product_table ON employee_table.Employee_ID = Product_table.Employee_ID
ORDER BY employee_table.First_Name;


SELECT 
    employee_table.First_Name,
    employee_table.Last_Name,
    COALESCE(Product_table.Project, '-No Project Assigned') AS Project
FROM employee_table
LEFT JOIN Product_table ON employee_table.employee_id = Product_table.Employee_ID
ORDER BY employee_table.First_Name;


 SELECT 
    employee_table.First_Name,
    employee_table.Last_Name,
    COALESCE(Product_table.Project, '-No Project Assigned') AS Project
FROM Product_table
RIGHT JOIN employee_table ON employee_table.employee_id = Product_table.Employee_ID
ORDER BY employee_table.First_Name;


SELECT 
    employee_table.First_Name,
    employee_table.Last_Name,
    COALESCE(Product_table.Project, '-No Project Assigned') AS Project
FROM employee_table
FULL OUTER JOIN Product_table ON employee_table.employee_id = Product_table.Employee_ID
ORDER BY employee_table.First_Name;


SELECT 
    employee_table.First_Name,
    employee_table.Last_Name,
    COALESCE(Product_table.Project, '-No Project Assigned') AS ProjectName
FROM employee_table
FULL OUTER JOIN Product_table ON employee_table.employee_id = Product_table.Employee_ID
ORDER BY employee_table.First_Name;


SELECT 
    employee_table.First_Name,
    employee_table.Last_Name,
    COALESCE(Product_table.Project, '-No Project Assigned') AS ProjectName
FROM employee_table
FULL OUTER JOIN Product_table ON employee_table.employee_id = Product_table.Employee_ID
ORDER BY employee_table.First_Name;


SELECT 
    employee_table.First_Name,
    employee_table.Last_Name,
    Product_table.Project
FROM employee_table
JOIN Product_table ON employee_table.employee_id = Product_table.Employee_ID
GROUP BY employee_table.employee_id, employee_table.First_Name, employee_table.Last_Name, Product_table.Project
HAVING COUNT(Product_table.Product_ID) > 1
ORDER BY employee_table.First_Name, employee_table.Last_Name, Product_table.Project;



 SELECT 
    employee_table.First_Name,
    employee_table.Last_Name,
    Product_table.Project
FROM employee_table
CROSS JOIN Product_table;

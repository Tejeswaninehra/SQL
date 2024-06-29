Create Database Coachxlive;

 CREATE TABLE Students (
    StudentId INT PRIMARY KEY,
    Name VARCHAR(255),
    Surname VARCHAR(255),
    Birthdate DATE,
    Gender CHAR(1),
    Class VARCHAR(10),
    Point INT
);
 
 Select * From Students
 
 INSERT INTO Students (StudentId, Name, Surname, Birthdate, Gender, Class, Point)
VALUES
(1, 'Swati', 'Chaudhary', '2000-01-01', 'F', 'Class 10', 90),

 INSERT INTO Students (StudentId, Name, Surname, Birthdate, Gender, Class, Point)
VALUES
(2, 'Preeti', 'Nehra', '2007-07-04', 'F', 'Class 9', 80);

 INSERT INTO Students (StudentId, Name, Surname, Birthdate, Gender, Class, Point)
VALUES
(3, 'Sonal', 'Sharma', '2000-01-05', 'F', 'Class 10', 90),
(4, 'Punit', 'Chaudhary', '2005-05-04', 'M', 'Class 11', 90);

 INSERT INTO Students (StudentId, Name, Surname, Birthdate, Gender, Class, Point)
VALUES
(5, 'Ela', 'Chaudhary', '2009-01-01', 'F', 'Class 12', 90),
(6, 'Dhruv', 'Sharma', '2008-06-07', 'M', 'Class 7', 90),
(7, 'Swapnil', 'Chaudhary', '2006-06-08', 'F', 'Class 8', 90),
(8, 'taniya', 'Chaudhary', '2007-01-01', 'F', 'Class 9', 90),
(9, 'Sindhu', 'Chaudhary', '2000-08-16', 'F', 'Class 10', 90),
(10, 'Harsh', 'singh', '2004-01-20', 'M', 'Class 11', 90);

  INSERT INTO Students (StudentId, Name, Surname, Birthdate, Gender, Class, Point)
VALUES
(11, 'Saloni', 'Chaudhary', '2006-05-16', 'F', 'Class 12', 90),
(12, 'Surbhi', 'Nehra', '2000-09-01', 'F', 'Class 5', 90),
(13, 'Saurabh', 'Chaudhary', '2007-05-04', 'M', 'Class 7', 90),
(14, 'Swapnil', 'Goel', '2000-09-06', 'F', 'Class 8', 90),
(15, 'Sonika', 'Chaudhary', '2005-01-09', 'F', 'Class 9', 90),
(16, 'Tarun', 'Chaudhary', '2000-05-01', 'M', 'Class 8', 90),
(17, 'Druvi', 'Chobhey', '1999-04-08', 'F', 'Class 10', 90),
(18, 'Yash', 'Chaudhary', '2001-03-14', 'F', 'Class 11', 90),
(19, 'Arun', 'Chaudhary', '2000-02-06', 'M', 'Class 12', 90),
(20, 'Anita', 'Verma', '2002-08-01', 'F', 'Class 10', 90);

 Select * From Students
 
 SELECT Name, Surname, Class
FROM Students;
 
  SELECT *
FROM Students
WHERE Gender = 'F';
 
 SELECT DISTINCT Class
FROM Students;
 
 SELECT *
FROM Students
WHERE Gender = 'F'  AND Class = '10math';

SELECT Name, Surname, Class
FROM Students
WHERE Class IN ('10math', '10sci');

SELECT StudentId, Name, Surname
FROM Students;
 
 SELECT CONCAT(Name, ' ', Surname) AS FullName
FROM Students;

SELECT *
FROM Students
WHERE Name LIKE 'A%';
 
 


 
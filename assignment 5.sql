CREATE DATABASE TechUniversity;

 -- Add College_Table to the database schema
CREATE TABLE College_Table (
    College_ID INT PRIMARY KEY,
    College_Name VARCHAR(100),
    College_Area VARCHAR(100)
);

INSERT INTO College_Table (College_ID, College_Name, College_Area)
VALUES
(1, 'College of Engineering', 'Engineering Complex'),
(2, 'College of Arts', 'Arts Building'),
(3, 'College of Business', 'Business Center');

INSERT INTO College_Table (College_ID, College_Name, College_Area)
VALUES
(4,'College of Science', 'Science Block'),
(5,'College of Medicine', 'Medical Campus'),
(6,'College of Law', 'Law School'),
(7,'College of Education', 'Education Building'),
(8,'College of Agriculture', 'Agriculture Campus'),
(9,'College of Fine Arts', 'Fine Arts Studio'),
(10,'College of Communication', 'Communication Tower');

Select * from College_Table 





  
  -- Add Department_Table to the database schema
CREATE TABLE Department_Table (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100),
    Dept_Facility VARCHAR(100)
);

INSERT INTO Department_Table (Dept_ID, Dept_Name, Dept_Facility) 
VALUES
(1, 'Computer Science', 'Computer Labs'),
(2, 'Electrical Engineering', 'Electronics Labs'),
(3, 'English Literature', 'Library');

INSERT INTO Department_Table (Dept_ID, Dept_Name, Dept_Facility) 
VALUES
(4,'Mathematics', 'Math Labs'),
(5,'Biology', 'Biology Labs'),
(6,'Medicine', 'Medical Labs'),
(7,'Law', 'Law Library'),
(8,'Education', 'Education Labs'),
(9,'Agriculture', 'Agriculture Labs'),
(10,'Fine Arts', 'Fine Arts Studio');





Select * from Department_Table

 
 -- Add Professor_Table to the database schema
CREATE TABLE Professor_Table (
    Professor_ID INT PRIMARY KEY,
    Professor_Name VARCHAR(100),
    Professor_Subject VARCHAR(100)
);

INSERT INTO Professor_Table (Professor_ID, Professor_Name, Professor_Subject)
VALUES
(1, 'Dr. John Smith', 'Computer Science'),
(2, 'Prof. Emily Brown', 'English Literature'),
(3, 'Dr. Michael Johnson', 'Electrical Engineering');

INSERT INTO Professor_Table (Professor_ID, Professor_Name, Professor_Subject)
VALUES
(4,'Prof. Lisa Davis', 'Mathematics'),
(5,'Dr. Sarah White', 'Biology'),
(6,'Dr. David Miller', 'Medicine'),
(7,'Prof. Robert Clark', 'Law'),
(8,'Dr. Jennifer Wilson', 'Education'),
(9,'Prof. Richard Moore', 'Agriculture'),
(10,'Dr. Mary Taylor', 'Fine Arts');

Select * from Professor_Table



-- Add Student_Table to the database schema
CREATE TABLE Student_Table (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(100),
    Student_Stream VARCHAR(100)
);

INSERT INTO Student_Table (Student_ID, Student_Name, Student_Stream) 
VALUES
(1, 'Alice Johnson', 'Computer Science'),
(2, 'Bob Smith', 'Electrical Engineering'),
(3, 'Charlie Brown', 'English Literature');

INSERT INTO Student_Table (Student_ID, Student_Name, Student_Stream) 
VALUES
(4,'David Davis', 'Mathematics'),
(5,'Emma Wilson', 'Biology'),
(6,'Frank Miller', 'Medicine'),
(7,'Grace Taylor', 'Law'),
(8,'Henry Clark', 'Education'),
(9,'Ivy Moore', 'Agriculture'),
(10,'Jack White', 'Fine Arts');


 Select * from Student_Table

 SELECT College_ID, College_Name FROM College_Table;

 SELECT * FROM Student_Table;

 SELECT Professor_Name 
FROM Professor_Table 
WHERE Professor_ID = 5;


SELECT UPPER(Professor_Name) AS Professor_Name_Upper
FROM Professor_Table 
WHERE Professor_ID = 5;


SELECT Student_Name 
FROM Student_Table 
WHERE Student_Name LIKE 'A%';


SELECT College_Name 
FROM College_Table 
WHERE College_Name LIKE '%a';

ALTER TABLE Professor_Table
ADD Salary DECIMAL(10, 2);

Select * from Professor_Table


ALTER TABLE Student_Table
ADD Contact VARCHAR(100);

 SELECT * FROM Student_Table;

 SELECT SUM(Salary) AS Total_Salary
FROM Professor_Table;


 (
  SELECT 'Student' AS Record_Type, Student_ID AS ID, Student_Name AS Name, Student_Stream AS Stream
  FROM Student_Table
)
UNION ALL
(
  SELECT 'Professor' AS Record_Type, Professor_ID AS ID, Professor_Name AS Name, Professor_Subject AS Subject
  FROM Professor_Table
);




SELECT *
FROM Professor_Table
WHERE Professor_ID IS NULL OR Professor_Name IS NULL OR Professor_Subject IS NULL;


CREATE VIEW College_C_View AS
SELECT *
FROM College_Table
WHERE College_Name LIKE 'C%';
 
 select * from College_Table


 CREATE PROCEDURE GetProfessorByID
    @ProfessorID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Professor_Table
    WHERE Professor_ID = @ProfessorID;
END;
  
  SELECT *
    FROM Professor_Table

	EXEC GetProfessorByID @ProfessorID = 123; -- Replace 123 with the desired Professor_ID

	EXEC sp_rename 'College_Table', 'College_Tables_Data';
	 
	 select * from College_Tables_Data



-- Create Database
CREATE DATABASE StudentDB;

-- Use the newly created database
USE StudentDB;

-- Create the Student table with the specified schema
CREATE TABLE Student (
    Std_rollno VARCHAR(15) PRIMARY KEY,
    Std_name VARCHAR(50),
    Dept VARCHAR(10),
    C1 VARCHAR(10),
    C2 VARCHAR(10),
    C3 VARCHAR(10)
);

-- Insert at least 5 student records into the Student table
INSERT INTO Student (Std_rollno, Std_name, Dept, C1, C2, C3) VALUES 
('1', 'Alice', 'CSE', 'DBMS', 'OS', 'DS'),
('2', 'Bob', 'ECE', 'DBMS', 'OS', 'DS'),
('3', 'Charlie', 'EEE', 'DBMS', 'OS', 'DS'),
('4', 'David', 'CSE', 'DBMS', 'OS', 'DS'),
('5', 'Eve', 'CSE', 'DBMS', 'OS', 'DS');

-- Display all records in the Student table
SELECT * FROM Student;
+------------+----------+------+------+------+------+
| Std_rollno | Std_name | Dept | C1   | C2   | C3   |
+------------+----------+------+------+------+------+
|          1 | Alice    | CSE  | DBMS | OS   | DS   |
|          2 | Bob      | ECE  | DBMS | OS   | DS   |
|          3 | Charlie  | EEE  | DBMS | OS   | DS   |
|          4 | David    | CSE  | DBMS | OS   | DS   |
|          5 | Eve      | CSE  | DBMS | OS   | DS   |
+------------+----------+------+------+------+------+
5 rows in set (0.00 sec)

-- Delete Course2 and Course3 attributes from the Student table
ALTER TABLE Student DROP COLUMN C2;
ALTER TABLE Student DROP COLUMN C3;

-- Insert two new columns DoB and email into the Student table
ALTER TABLE Student ADD DoB DATE NOT NULL;
ALTER TABLE Student ADD email VARCHAR(50) NOT NULL CHECK (email LIKE '%@nitt.edu');

-- Change Course1 datatype to VARCHAR(10)
ALTER TABLE Student MODIFY C1 VARCHAR(10);

-- Update the column name ‘Std_rollno’ to ‘Std_rno’
ALTER TABLE Student RENAME COLUMN Std_rollno TO Std_rno;

-- Update all student records who pursue a course named “DBMS” to “OS”
UPDATE Student SET C1 = 'OS' WHERE C1 = 'DBMS';

-- Delete a student record with student name starting with letter ‘S’
DELETE FROM Student WHERE Std_name LIKE 'S%';

-- Display all records in which a student has born after the year 2005
SELECT * FROM Student WHERE YEAR(DoB) > 2005;

-- Simulate DROP and TRUNCATE commands
DROP TABLE Student;
TRUNCATE TABLE Student;
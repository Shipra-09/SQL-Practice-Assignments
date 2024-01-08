--- Practice SQL----------
CREATE DATABASE SQL_PRACTICE;

USE SQL_PRACTICE;
-- TABLE 1
CREATE TABLE EMPLOYEE(
EMPLOYEE_ID INT PRIMARY KEY NOT NULL,
FIRST_NAME TEXT,
LAST_NAME TEXT,
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT TEXT);

insert into EMPLOYEE  values
(1,'Anika','Arora',100000, '2020-02-14 9:00','HR'),
(2,'Veena','Verma',80000, '2011-06-15 9:00','Admin'),
(3,'Vishal','Singhal',300000, '2020-02-16 9:00','HR'),
(4,'Sushanth','Singh',500000, '2020-02-17 9:00','Admin'),
(5,'Bhupal','Bhati',500000, '2011-06-18 9:00','Admin'),
(6,'Dheeraj','Diwan',200000, '2011-06-19 9:00','Account'),
(7,'Karan','Kumar',75000, '2020-01-14 9:00','Account'),
(8,'Chandrika','Chauhan',90000, '2011-04-15 9:00','Admin');

SELECT * FROM EMPLOYEE;

-- TABLE 2

CREATE TABLE EMPLOYEE_BONUS (
EMPLOYEE_REF_ID INT,
BONUS_AMOUNT INT,
BONUS_DATE DATETIME, 
FOREIGN KEY (EMPLOYEE_REF_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID)
);

INSERT INTO EMPLOYEE_BONUS VALUES
(1,5000,'2020-02-16 0:00'),
(2,3000,'2011-06-16 0:00'),
(3,4000,'2020-02-16 0:00'),
(1,4500,'2020-02-16 0:00'),
(2,3500,'2011-06-16 0:00');

SELECT * FROM EMPLOYEE_BONUS;
-- TABLE 3

CREATE TABLE EMPLOYEE_TITLE(
EMPLOYEE_REF_ID INT,
EMPLYEE_TITLE TEXT,
AFFECTIVE_DATE DATETIME,
FOREIGN KEY (EMPLOYEE_REF_ID) 
REFERENCES EMPLOYEE(EMPLOYEE_ID));

INSERT INTO EMPLOYEE_TITLE VALUES
(1,'Manager','2016-02-20 0:00'),
(2,'Executive','2016-06-11 0:00'),
(8,'Executive','2016-06-11 0:00'),
(5,'Manager','2016-06-11 0:00'),
(4,'Asst. Manager','2016-06-11 0:00'),
(7,'Executive','2016-06-11 0:00'),
(6,'Lead','2016-06-11 0:00'),
(3,'Lead','2016-06-11 0:00');

SELECT * FROM EMPLOYEE_TITLE;

-- Tasks To Be Performed

-- 1 Display the FIRST_NAME from Employee table using the alias name as Employee_name.
SELECT FIRST_NAME AS Employee_name FROM EMPLOYEE;

-- 2 Display LAST_NAME from Employee table in upper case.
SELECT UPPER(LAST_NAME) FROM EMPLOYEE;

-- 3 Display unique values of DEPARTMENT from EMPLOYEE table.
SELECT DISTINCT DEPARTMENT FROM EMPLOYEE;

-- 4 Display the first three characters of LAST_NAME from EMPLOYEE table.
SELECT SUBSTRING(LAST_NAME,1,3) FROM EMPLOYEE;

-- 5 Display the unique values of DEPARTMENT from EMPLOYEE table and  prints its length. 
SELECT DISTINCT DEPARTMENT, char_length(DEPARTMENT) AS DEP_LEN FROM EMPLOYEE;

-- 6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME. 
 SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS FULL_NAME FROM EMPLOYEE;
 
 -- 7 DISPLAY all EMPLOYEE details from the employee table  order by FIRST_NAME Ascending.
 SELECT * FROM EMPLOYEE ORDER BY FIRST_NAME ASC;
 
 -- 8. Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending.
 SELECT * FROM EMPLOYEE ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;
 
 -- 9 Display details for EMPLOYEE with the first name as VEENA and KARAN from EMPLOYEE table.
 SELECT * FROM EMPLOYEE WHERE FIRST_NAME='VEENA' OR FIRST_NAME='KARAN';
 
 -- 10 Display details of EMPLOYEE with DEPARTMENT name as Admin.
  SELECT * FROM EMPLOYEE WHERE DEPARTMENT='ADMIN';
  
  -- 11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains V.
  SELECT * FROM EMPLOYEE WHERE FIRST_NAME LIKE 'V%'; 
  
  -- 12 DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000.
  SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 100000 and 500000;
  
  -- 13 Display details of the employees who have joined in Feb-2020.
  SELECT * FROM EMPLOYEE WHERE JOINING_DATE LIKE '2020-02%';
  
  -- 14 Display employee names with salaries >= 50000 and <= 100000.
  SELECT * FROM EMPLOYEE WHERE SALARY>=50000 AND SALARY<=100000;
  
  -- 16 DISPLAY details of the EMPLOYEES who are also Managers.
  SELECT * FROM EMPLOYEE EY JOIN EMPLOYEE_TITLE ET ON EY.EMPLOYEE_ID=ET.EMPLOYEE_REF_ID WHERE EMPLYEE_TITLE='Manager'; 
  
  -- 17 DISPLAY duplicate records having matching data in some fields of a table.
-- SELECT * FROM EMPLOYEE;
-- EXCEPT
SELECT DISTINCT * FROM EMPLOYEE;

-- 18 Display only odd rows from a table.
SELECT * FROM EMPLOYEE WHERE (EMPLOYEE_ID%2)!=0;

-- 19 Clone a new table from EMPLOYEE table.
create table employee_clone as
select * from employee;

-- drop it
drop table employee_clone;

-- 20 DISPLAY the TOP 2 highest salary from a table.
SELECT salary FROM EMPLOYEE order by salary desc limit 2; 
-- or
SELECT MAX(salary) AS highest_salary, 
       (SELECT MAX(salary) FROM employee WHERE salary < (SELECT MAX(salary) FROM employee)) AS second_highest_salary
FROM employee;  

-- 21. DISPLAY the list of employees with the same salary.  
SELECT SALARY, CONCAT(FIRST_NAME,' ',LAST_NAME) AS SAME_SALARY FROM EMPLOYEE 
WHERE SALARY IN (SELECT SALARY FROM EMPLOYEE GROUP BY salary HAVING COUNT(*)>1); 

-- 22 Display the second highest salary from a table.
SELECT MAX(salary) AS SECOND_HIGHEST FROM employee WHERE salary < (SELECT MAX(salary) FROM employee);  

-- 23 Display the first 50% records from a table. 

SELECT * FROM employee WHERE EMPLOYEE_ID <= (SELECT COUNT(EMPLOYEE_ID)/2 from employee);

-- 24. Display the departments that have less than 4 people in it.
SELECT DEPARTMENT FROM EMPLOYEE GROUP BY department HAVING COUNT(DEPARTMENT)<4;

-- 25. Display all departments along with the number of people in there.
SELECT DEPARTMENT, COUNT(DEPARTMENT) AS DD FROM EMPLOYEE GROUP BY DEPARTMENT;

-- 26 Display the name of employees having the highest salary in each department.  
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS EMPLOYEE_NAMES, SALARY, DEPARTMENT FROM EMPLOYEE 
WHERE SALARY IN(SELECT MAX(SALARY) AS SALARY FROM EMPLOYEE GROUP BY DEPARTMENT);

-- 27 Display the names of employees who earn the highest salary.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS EMPLOYEE_NAMES, SALARY, DEPARTMENT FROM EMPLOYEE 
ORDER BY SALARY DESC LIMIT 2;

-- 28 Diplay the average salaries for each department.
SELECT AVG(SALARY) AS AVG_SALARY, DEPARTMENT FROM EMPLOYEE GROUP BY DEPARTMENT;

-- 29 display the name of the employee who has got maximum bonus.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS EMPLOYEE_NAMES FROM EMPLOYEE AS EY JOIN EMPLOYEE_BONUS AS EB 
ON EY.EMPLOYEE_ID=EB.EMPLOYEE_REF_ID ORDER BY BONUS_AMOUNT DESC LIMIT 1;

-- 30 Display the first name and title of all the employees.
SELECT FIRST_NAME, EMPLYEE_TITLE FROM EMPLOYEE AS EY JOIN EMPLOYEE_TITLE AS ET ON EY.EMPLOYEE_ID=ET.EMPLOYEE_REF_ID;


use sql_practice;

-- ---------------- ASSIGNMENT MODULE 4----------------------
-- 1. Arrange the Orders dataset in decreasing order of amount.
select * from orders order by amount desc;

-- 2. Create a table with the name Employee_details1 consisting of these columns: Emp_id, Emp_name, Emp_salary.

-- TABLE 1

create table Employee_details1(
EMP_ID INT,
EMP_NAME TEXT,
EMP_SALARY INT
);
 INSERT INTO EMPLOYEE_DETAILS1 VALUES 
(1,'FERNA',5000),
(2,'APPLE',6000),
(3,'DANNY',7000),
(4,'JOHN',8000);

-- TABLE 2

CREATE TABLE EMPLOYEE_DETAILS2 (
EMP_ID INT,
EMP_NAME TEXT,
EMP_SALARY INT
);

INSERT INTO EMPLOYEE_DETAILS2 VALUES
(1,'FERNA',5000),
(6,'VISHWA',6000),
(7,'CHANDAN',7000),
(8,'VIKAS',8000);


-- 3. Apply the UNION operator on these two tables

SELECT 
    *
FROM
    EMPLOYEE_DETAILS1 
UNION SELECT 
    *
FROM
    EMPLOYEE_DETAILS2;
    
-- 4. Apply the INTERSECT operator on these two tables

SELECT * FROM EMPLOYEE_DETAILS1 INTERSECT SELECT * FROM EMPLOYEE_DETAILS2;

-- 5. Apply the EXCEPT operator on these two tables

SELECT * FROM EMPLOYEE_DETAILS1 EXCEPT SELECT * FROM EMPLOYEE_DETAILS2;






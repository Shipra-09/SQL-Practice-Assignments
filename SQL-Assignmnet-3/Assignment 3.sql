USE SQL_PRACTICE;

-- ---------------- ASSIGNMENT MODULE 3----------------------
-- 1. Create an Orders table which comprises of these columns: order_id,order_date, amount, customer_id.
 
CREATE TABLE ORDERS(
ORDER_ID INT,
ORDER_DATE DATE,
AMOUNT INT,
CUSTOMER_ID INT);

-- Inserting 5 new records. 
INSERT INTO ORDERS VALUES
(101,'2022-03-15',40000,1),
(102,'2020-03-15',10000,2),
(103,'2021-03-15',70000,3),
(104,'2023-03-15',6000,4),
(105,'2022-08-22',13000,5);

-- 2. Make an inner join on Customer and Orders tables on the customer_id column.
 SELECT * FROM CUSTOMER C INNER JOIN ORDERS O ON C.CUSTOMER_ID=O.CUSTOMER_ID;
 
 -- 3. Make left and right joins on Customer and Orders tables on the customer_id column.
 SELECT * FROM CUSTOMER C LEFT JOIN ORDERS O ON C.CUSTOMER_ID=O.CUSTOMER_ID;
 SELECT * FROM CUSTOMER C RIGHT JOIN ORDERS O ON C.CUSTOMER_ID=O.CUSTOMER_ID;
 
 -- 4. Update the Orders table and set the amount to be 100 where customer_id is 3.
 UPDATE ORDERS SET AMOUNT=100 WHERE CUSTOMER_ID=3;
 
 SELECT * FROM ORDERS;

 
 
 
 

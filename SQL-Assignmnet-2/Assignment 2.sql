use sql_practice;

-- 1. Create a customer table which comprises of these columns: customer_id, first_name, last_name, email, address, city,state,zip.

CREATE TABLE customer (
    customer_id INT,
    FIRST_NAME TEXT,
    LAST_NAME TEXT,
    EMAIL TEXT,
    ADDRESS TEXT,
    CITY TEXT,
    state TEXT,
    ZIP INT
);

-- 2. Insert 5 new records into the table
INSERT INTO CUSTOMER VALUES
(1,'SHIPRA', 'CHOUDHARY','shiprach94@gmail', 'SHIVALIK NAGAR', 'HARIDWAR', 'UTTARAKHAND', '249403'),
(2,'govind','seth','govind@12gmail.com','towerc','san jose','california',11345),
(3,'jayanth','rao','jyanth.com','towern','chennai','tamilnadu',59090),
(4,'anand','shrama','anand.com','towerf','hyderabad','andrapradesh',89890),
(5,'arunima','gowda','arunima@12gmail.com','towerh','bangalore','karnataka',577690);
 
 -- 3. Select only the first_name and last_name columns from the customer table
SELECT FIRST_NAME, LAST_NAME FROM CUSTOMER;

-- 4. Select those records where first_name starts with G and city is SanJose.
SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE 'G%'AND CITY='SAN JOSE'; 
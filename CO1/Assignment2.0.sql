-- Active: 1680321292952@@127.0.0.1@8889
create database customer;

use customer;

------------------------------------------------------
--b)SQL statements to create and populate the tables:---

CREATE TABLE CUSTOMER (
  CID INTEGER PRIMARY KEY,
  NAME TEXT
);

CREATE TABLE PRODUCT (
  PCODE INTEGER PRIMARY KEY,
  PNAME TEXT,
  PRICE REAL
);

CREATE TABLE CUST_ORDER (
  OCODE INTEGER PRIMARY KEY,
  ODATE DATE,
  CID INTEGER,
  FOREIGN KEY (CID) REFERENCES CUSTOMER (CID)
);

CREATE TABLE ORDER_PRODUCT (
  OCODE INTEGER,
  PCODE INTEGER,
  NOU INTEGER,
  PRIMARY KEY (OCODE, PCODE),
  FOREIGN KEY (OCODE) REFERENCES CUST_ORDER (OCODE),
  FOREIGN KEY (PCODE) REFERENCES PRODUCT (PCODE)
);

INSERT INTO CUSTOMER (CID, NAME) VALUES
  (1, 'John'),
  (2, 'Mary'),
  (3, 'David'),
  (4, 'Lisa');

INSERT INTO PRODUCT (PCODE, PNAME, PRICE) VALUES
  (1, 'Laptop', 800),
  (2, 'Mouse', 20),
  (3, 'Server', 2000),
  (4, 'Air conditioner', 500);

INSERT INTO CUST_ORDER (OCODE, ODATE, CID) VALUES
  (1, '2023-04-10', 1),
  (2, '2023-04-12', 2),
  (3, '2023-04-13', 3),
  (4, '2023-04-15', 4);

INSERT INTO ORDER_PRODUCT (OCODE, PCODE, NOU) VALUES
  (1, 1, 2),
  (1, 2, 1),
  (2, 1, 1),
  (2, 3, 3),
  (3, 4, 1),
  (4, 2, 2),
  (4, 3, 1);
SELECT * FROM CUSTOMER;
SELECT * FROM PRODUCT;
SELECT * FROM CUST_ORDER;
SELECT * FROM ORDER_PRODUCT;

---To ensure that product names are within Laptop, Mouse, Server, and Air conditioner, we can add a CHECK constraint to the PRODUCT table:--

ALTER TABLE PRODUCT ADD CONSTRAINT chk_pname CHECK (PNAME IN ('Laptop', 'Mouse', 'Server', 'Air conditioner'));

--------------------------------------------------------------------------------------------------------------------------------------------

-----SQL query to list the details of products whose unit price is greater than the average price of all products:

SELECT PCODE, PNAME, PRICE
FROM PRODUCT
WHERE PRICE > (SELECT AVG(PRICE) FROM PRODUCT);


------SQL query to list the customer names who have ordered more number of products:---------------------------------

SELECT c.NAME, SUM(op.NOU) as TOTAL_NOU
FROM CUSTOMER c
JOIN CUST_ORDER co ON c.CID = co.CID
JOIN ORDER_PRODUCT op ON co.OCODE = op.OCODE
GROUP BY c.NAME
ORDER BY TOTAL_NOU DESC;


-------Create a view that displays the PCODE, PNAME and NOU of the product ordered 

CREATE VIEW ORDERED_PRODUCT AS
SELECT p.PCODE, p.PNAME, op.NOU
FROM PRODUCT p
JOIN ORDER_PRODUCT op ON p.PCODE = op.PCODE;

---to retreive DATABASE
SELECT * FROM ORDERED_PRODUCT;

-----Create a function that accepts PCODE, Unit Price and NOU. Calculate the total cost of the ordered product. Return the total cost.

CREATE FUNCTION CALCULATE_TOTAL_COST (in_pcode INT, in_unit_price FLOAT, in_nou INT)
RETURNS FLOAT
BEGIN
    DECLARE total_cost FLOAT;
    SET total_cost = in_unit_price * in_nou;
    RETURN total_cost;
END;

---to call function
SELECT CALCULATE_TOTAL_COST(1, 800, 2);

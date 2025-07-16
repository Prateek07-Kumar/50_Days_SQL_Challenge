use SQL_Challenge_50_Days;

--DROP TABLE IF EXISTS customers;
-- Creating the Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);


--DROP TABLE IF EXISTS purchases;
-- Creating the Purchases table
CREATE TABLE Purchases1 (
    purchase_id INT PRIMARY KEY,
    customer_id INT,
    product_category VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Inserting sample data into Customers table
INSERT INTO Customers (customer_id, customer_name) VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Charlie'),
    (4, 'David'),
    (5, 'Emma');

-- Inserting sample data into Purchases table
INSERT INTO Purchases1 (purchase_id, customer_id, product_category) VALUES
    (101, 1, 'Electronics'),
    (102, 1, 'Books'),
    (103, 1, 'Clothing'),
    (104, 1, 'Electronics'),
    (105, 2, 'Clothing'),
    (106, 1, 'Beauty'),
    (107, 3, 'Electronics'),
    (108, 3, 'Books'),
    (109, 4, 'Books'),
    (110, 4, 'Clothing'),
    (111, 4, 'Beauty'),
    (112, 5, 'Electronics'),
    (113, 5, 'Books');



/*

Question:
Write an SQL query to find customers who have made 
purchases in all product categories.

Tables:
Customers: customer_id (INT), customer_name (VARCHAR)

Purchases: purchase_id (INT), customer_id (INT), 
product_category (VARCHAR)

Your query should return the customer_id and 
customer_name of these customers.

*/

SELECT * FROM customers;
SELECT * FROM Purchases1;


select 
	c.customer_id,
	c.customer_name
	-- COUNT(DISTINCT p.product_category) AS purchased_categories
FROM customers AS c
inner join Purchases1 as p 
on c.customer_id = p.customer_id
group by c.customer_id, c.customer_name
having count(distinct p.product_category)=
(select count(distinct product_category) from Purchases1) 


-- select count(distinct product_category) from Purchases1

-- select distinct product_category from Purchases1

/*
Task:
Write an SQL query to identify customers who have not made any purchases 
in Electronics categories.
*/

select 
	c.customer_id,
	c.customer_name
FROM customers AS c
where c.customer_id not in (
	select distinct p.customer_id
	from Purchases1 as p
where p.product_category = 'Electronics'
);


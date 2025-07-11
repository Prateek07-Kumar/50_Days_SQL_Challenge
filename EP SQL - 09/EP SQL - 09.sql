use SQL_Challenge_50_Days;

-- Create Customers table
--DROP TABLE IF EXISTS customers;
CREATE TABLE Customers1 (
    CustomerID INT,
    CustomerName VARCHAR(50)
);

-- Create Purchases table
--DROP TABLE IF EXISTS purchases;
CREATE TABLE Purchases (
    PurchaseID INT,
    CustomerID INT,
    ProductName VARCHAR(50),
    PurchaseDate DATE
);

-- Insert sample data into Customers table
INSERT INTO Customers1(CustomerID, CustomerName) VALUES
(1, 'John'),
(2, 'Emma'),
(3, 'Michael'),
(4, 'Ben'),
(5, 'John')	;

-- Insert sample data into Purchases table
INSERT INTO Purchases (PurchaseID, CustomerID, ProductName, PurchaseDate) VALUES
(100, 1, 'iPhone', '2024-01-01'),
(101, 1, 'MacBook', '2024-01-20'),	
(102, 1, 'Airpods', '2024-03-10'),
(103, 2, 'iPad', '2024-03-05'),
(104, 2, 'iPhone', '2024-03-15'),
(105, 3, 'MacBook', '2024-03-20'),
(106, 3, 'Airpods', '2024-03-25'),
(107, 4, 'iPhone', '2024-03-22'),	
(108, 4, 'Airpods', '2024-03-29'),
(110, 5, 'Airpods', '2024-02-29'),
(109, 5, 'iPhone', '2024-03-22');


/*
Apple data analyst interview question

Given two tables - Customers and Purchases, 
where Customers contains information about 
customers and Purchases contains information 
about their purchases, 

write a SQL query to find customers who 
bought Airpods after purchasing an iPhone.

*/

-- Find out all customers who bought iPhone
-- All customers who bought Airpods
-- Customer has to buy Airpods after purchasing the iPhone 


SELECT * FROM Customers1;
SELECT * FROM purchases;

select * from Purchases
where ProductName = 'iphone';

select
	c.*
	--c.CustomerID,
	--c.CustomerName,
	--p1.ProductName,
	--p1.PurchaseDate
from Customers1 c
join Purchases p1 on
c.CustomerID = p1.CustomerID
join Purchases p2 
on c.CustomerID = p2.CustomerID
where p1.ProductName = 'iPhone'
AND p2.ProductName = 'Airpods'
AND
p1.PurchaseDate < p2.PurchaseDate;


/*
-- Your task 
Find out what is the % of chance is there that the 
customer who bought MacBook will buy an Airpods
*/


SELECT * FROM Customers1;
SELECT * FROM purchases;

WITH MacBook_Customers as (
select
	DISTINCT CustomerID
FROM Purchases
WHERE ProductName = 'Macbook'
)

WITH MacBook_And_Airpods_Customers as (
select distinct m.CustomerID
from (
	select distinct CustomerID
	FROM Purchases
	where ProductName = 'Macbook'
) m
join Purchases p on m.CustomerID = p.CustomerID
where p.ProductName = 'Airpods'
)

select
	DISTINCT CustomerID
FROM Purchases
WHERE ProductName = 'Macbook'


select distinct m.CustomerID
from (
	select distinct CustomerID
	FROM Purchases
	where ProductName = 'Macbook'
) m
join Purchases p on m.CustomerID = p.CustomerID
where p.ProductName = 'Airpods'


WITH MacBook_Customers as (
select
	DISTINCT CustomerID
FROM Purchases
WHERE ProductName = 'Macbook'
),

MacBook_And_Airpods_Customers as (
	select distinct m.CustomerID
	FROM MacBook_Customers m
join Purchases p on m.CustomerID = p.CustomerID
where p.ProductName = 'Airpods'
)
select 
	round(
	CAST(count(b.CustomerID) AS float) * 100.0/ count(a.CustomerID),2
	)
	AS MacBook_to_Airpods_Percentage
FROM MacBook_Customers a
left join MacBook_And_Airpods_Customers  b on 
a.CustomerID = b.CustomerID



-- google-cloud-storage==1.41.1

-- google-cloud-bigquery==2.31.0











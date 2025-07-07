use SQL_Challenge_50_Days;

--DROP TABLE IF EXISTS Orders;
	
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);

--DROP TABLE IF EXISTS Returns;
CREATE TABLE Returns (
    ReturnID INT PRIMARY KEY,
    OrderID INT
    -- FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Orders (OrderID, OrderDate, TotalAmount) VALUES
(1, '2023-01-15', 150.50),
(2, '2023-02-20', 200.75),
(3, '2023-02-28', 300.25),
(4, '2023-03-10', 180.00),
(5, '2023-04-05', 250.80);

INSERT INTO Returns (ReturnID, OrderID) VALUES
(101, 2),
(102, 4),
(103, 5),
(104, 1),
(105, 3);

/*

Given the Orders table with columns OrderID, 
OrderDate, and TotalAmount, and the 
Returns table with columns ReturnID and OrderID, 

write an SQL query to calculate the total 
numbers of returned orders for each month

*/
-- total numbers of returns
-- group by month orders
-- LEFT JOIN 

SELECT * FROM orders;	
SELECT * FROM returns;

select 
	MONTH(o.OrderDate) AS month,
	count(r.ReturnID) as total_return
from orders o
left join returns r on
o.OrderID = r.OrderID
group by o.OrderDate
order by month


select 
	CAST(MONTH(o.OrderDate) AS VARCHAR) + '-' + CAST(YEAR(o.OrderDate) AS VARCHAR) AS month,
	count(r.ReturnID) as total_return
from orders o
left join returns r on
o.OrderID = r.OrderID
group by  MONTH(o.OrderDate), YEAR(o.OrderDate)
order by YEAR(o.OrderDate), MONTH(o.OrderDate)



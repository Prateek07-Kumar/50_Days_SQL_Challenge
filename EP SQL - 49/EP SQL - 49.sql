use SQL_Challenge_50_Days;


--DROP TABLE IF EXISTS orders;
-- Create table for orders
CREATE TABLE orders11 (
    order_id INT PRIMARY KEY IDENTITY(1,1),
    order_date DATE
);

-- Insert sample records for orders
INSERT INTO orders11 (order_date)
VALUES
    ('2024-05-01'),
    ('2024-05-01'),
    ('2024-05-01'),
    ('2024-05-02'),
    ('2024-05-02'),
    ('2024-05-02'),
    ('2024-05-03'),
    ('2024-05-03'),
    ('2024-05-03'),
    ('2024-05-03'),
    ('2024-05-03'),
    ('2024-05-04'),
    ('2024-05-04'),
    ('2024-05-04'),
    ('2024-05-04'),
    ('2024-05-04'),
    ('2024-05-05'),
    ('2024-05-05'),
    ('2024-05-05'),
    ('2024-05-05'),
    ('2024-05-06'),
    ('2024-05-06'),
    ('2024-05-06'),
    ('2024-05-06'),
    ('2024-05-06');

-- Display the records to verify


/*
-- Question:
You are given a orders table with
columns order_id, order_date

Identify the busiest day for orders along 
with the total number of orders placed on that day. 
*/

SELECT * FROM orders11;

SELECT
	TOP 1
	order_date,
	COUNT(*) as order_placed
from orders11
group by order_date
order by order_placed desc;




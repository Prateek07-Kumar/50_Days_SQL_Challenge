use SQL_Challenge_50_Days;


-- Creating table 
--DROP TABLE IF EXISTS orders;
CREATE TABLE orders7 (
    order_id INT PRIMARY KEY,
    order_date DATE,
    quantity INT
);


INSERT INTO orders7 
(order_id, order_date, quantity) 
VALUES
(1, '2023-01-02', 5),
(2, '2023-02-05', 3),
(3, '2023-02-07', 2),
(4, '2023-03-10', 6),
(5, '2023-02-15', 4),
(6, '2023-04-21', 8),
(7, '2023-05-28', 7),
(8, '2023-05-05', 3),
(9, '2023-08-10', 5),
(10, '2023-05-02', 6),
(11, '2023-02-07', 4),
(12, '2023-04-15', 9),
(13, '2023-03-22', 7),
(14, '2023-04-30', 8),
(15, '2023-04-05', 6),
(16, '2023-02-02', 6),
(17, '2023-01-07', 4),
(18, '2023-05-15', 9),
(19, '2023-05-22', 7),
(20, '2023-06-30', 8),
(21, '2023-07-05', 6);

/*
-- Question
You have amazon orders data

For each week, find the total number 
of orders. 
Include only the orders that are 
from the first quarter of 2023.

The output should contain 'week' 
and 'quantity'.

*/
-- week no from order date
-- SUM(qty)
-- where order 1st quarter 2023
-- group by week

select * from orders7;

select 
	datepart(week, order_date) as week_order,
	sum(quantity) total_qty_sold
from orders7
where DATEPART(year, order_date) = 2023
and 
	datepart(MONTH, order_date) between 1 and 3
group by datepart(week, order_date)
order by week_order;

-- Your Task
-- Find each quarter and their total qty sale

select 
	datepart(QUARTER, order_date) as quarters,
	sum(quantity) as total_qty_sold
from orders7
group by datepart(QUARTER, order_date)
order by quarters;


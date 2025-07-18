use SQL_Challenge_50_Days;

--DROP TABLE IF EXISTS orders;

CREATE TABLE orders5 (
    id INT,
    cust_id INT,
    order_date DATE,
    order_details VARCHAR(50),
    total_order_cost INT
);

INSERT INTO orders5(id, cust_id, order_date, order_details, total_order_cost) VALUES
(1, 7, '2019-03-04', 'Coat', 100),
(2, 7, '2019-03-01', 'Shoes', 80),
(3, 3, '2019-03-07', 'Skirt', 30),
(4, 7, '2019-02-01', 'Coat', 25),
(5, 7, '2019-03-10', 'Shoes', 80),
(6, 1, '2019-02-01', 'Boats', 100),
(7, 2, '2019-01-11', 'Shirts', 60),
(8, 1, '2019-03-11', 'Slipper', 20),
(9, 15, '2019-03-01', 'Jeans', 80),
(10, 15, '2019-03-09', 'Shirts', 50),
(11, 5, '2019-02-01', 'Shoes', 80),
(12, 12, '2019-01-11', 'Shirts', 60),
(13, 1, '2019-03-11', 'Slipper', 20),
(14, 4, '2019-02-01', 'Shoes', 80),
(15, 4, '2019-01-11', 'Shirts', 60),
(16, 3, '2019-04-19', 'Shirts', 50),
(17, 7, '2019-04-19', 'Suit', 150),
(18, 15, '2019-04-19', 'Skirt', 30),
(19, 15, '2019-04-20', 'Dresses', 200),
(20, 12, '2019-01-11', 'Coat', 125),
(21, 7, '2019-04-01', 'Suit', 50),
(22, 3, '2019-04-02', 'Skirt', 30),
(23, 4, '2019-04-03', 'Dresses', 50),
(24, 2, '2019-04-04', 'Coat', 25),
(25, 7, '2019-04-19', 'Coat', 125);


/*
-- Calculate the total revenue from 
each customer in March 2019. 

Include only customers who 
were active in March 2019.

Output the revenue along with the 
customer id and sort the results based 
on the revenue in descending order.
*/
-- cx_id and their revenue SUM(total order cost)
-- filter march 2019


select * from orders5;

select
	cust_id, 
	SUM(total_order_cost) as total_revenue
from orders5
where order_date between '2019-03-01'
and '2019-03-31'
group by cust_id
order by total_revenue desc


/*
-- Your Task
Find the customers who purchased from both 
March and April of 2019 and their total revenue 
*/


select
	cust_id, 
	SUM(total_order_cost) as total_revenue
from orders5
where 
	(order_date between '2019-03-01' and '2019-03-31') OR
	(order_date between '2019-04-01' and '2019-04-30')
group by cust_id
having count(distinct month(order_date)) = 2
order by total_revenue desc;


-- Both task are correct 

With month_order as (
select 
	cust_id,
	MONTH(order_date) as order_month,
	sum(total_order_cost) as month_revenue
from orders5
where order_date between '2019-03-01' and '2019-04-30'
group by cust_id, month(order_date)
)
select 
	cust_id,
	sum(month_revenue) as total_revenue
from month_order
group by cust_id
having count(distinct order_month) = 2
order by total_revenue desc;
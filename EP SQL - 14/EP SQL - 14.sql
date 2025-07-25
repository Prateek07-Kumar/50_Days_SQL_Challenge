use SQL_Challenge_50_Days;

-- DROP TABLE IF EXISTS customers;
CREATE TABLE customers2 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100)
);

--DROP TABLE IF EXISTS orders;
CREATE TABLE orders4 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10, 2),
    --FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers2 (customer_id, customer_name, customer_email) VALUES
(1, 'John Doe', 'john@example.com'),
(2, 'Jane Smith', 'jane@example.com'),
(3, 'Alice Johnson', 'alice@example.com'),
(4, 'Bob Brown', 'bob@example.com');

INSERT INTO orders4 (order_id, customer_id, order_date, order_amount) VALUES
(1, 1, '2024-01-03', 50.00),
(2, 2, '2024-01-05', 75.00),
(3, 1, '2024-01-10', 25.00),
(4, 3, '2024-01-15', 60.00),
(5, 2, '2024-01-20', 50.00),
(6, 1, '2024-02-01', 100.00),
(7, 2, '2024-02-05', 25.00),
(8, 3, '2024-02-10', 90.00),
(9, 1, '2024-02-15', 50.00),
(10, 2, '2024-02-20', 75.00);



/*


You are given two tables: orders and customers. 
The orders table contains information about orders placed by customers, including the order_id, customer_id, order_date, and order_amount. 

The customers table contains information about customers, 
including the customer_id, customer_name, and customer_email.

-- Find the top 2 customers who have spent the most money across all their orders. 
Return their names, emails, and total amounts spent.

*/
-- customer_name
-- customer_email
-- total_amt from orders
-- join based cx id form both table
-- order by total amt desc
-- limit 2

SELECT * FROM customers2;
SELECT * FROM orders4;

select top 2
	c.customer_name,
	c.customer_email as email,
	sum(o.order_amount) as total_spend
from customers2 as c
inner join orders4 o
on c.customer_id = o.customer_id 
group by c.customer_id,c.customer_name, c.customer_email
order by total_spend desc;

-- Your Task
-- Find out customers details who has placed highest orders and total count of orders and total order amount


select top 2
	c.customer_id,
	c.customer_name,
	c.customer_email as email,
	count(o.order_id) as total_orders,
	sum(o.order_amount) as total_spend
from customers2 as c
inner join orders4 o
on c.customer_id = o.customer_id
group by c.customer_id,c.customer_name, c.customer_email
having count(o.order_id) = (
	select max(total_orders) 
	from (
		select customer_id, count(order_id) as total_orders
	from orders4
	group by customer_id
	) as order_counts
);
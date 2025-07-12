use SQL_Challenge_50_Days;

-- DROP TABLE IF EXISTS orders;
-- DROP TABLE IF EXISTS returns;


-- Create the orders table
CREATE TABLE orders3 (
    order_id VARCHAR(10),
    customer_id VARCHAR(10),
    order_date DATE,
    product_id VARCHAR(10),
    quantity INT
);

-- Create the returns table
CREATE TABLE returns1 (
    return_id VARCHAR(10),
    order_id VARCHAR(10)
    );








-- Insert sample records into the orders table
INSERT INTO orders3 (order_id, customer_id, order_date, product_id, quantity)
VALUES
    ('1001', 'C001', '2023-01-15', 'P001', 4),
    ('1002', 'C001', '2023-02-20', 'P002', 3),
    ('1003', 'C002', '2023-03-10', 'P003', 8),
    ('1004', 'C003', '2023-04-05', 'P004', 2),
    ('1005', 'C004', '2023-05-20', 'P005', 3),
    ('1006', 'C002', '2023-06-15', 'P001', 6),
    ('1007', 'C003', '2023-07-20', 'P002', 1),
    ('1008', 'C004', '2023-08-10', 'P003', 2),
    ('1009', 'C005', '2023-09-05', 'P002', 3),
    ('1010', 'C001', '2023-10-20', 'P002', 1);

-- Insert sample records into the returns table
INSERT INTO returns1 (return_id, order_id)
VALUES
    ('R001', '1001'),
    ('R002', '1002'),
    ('R003', '1005'),
    ('R004', '1008'),
    ('R005', '1007');



/*

Identify returning customers based on their order history. 
Categorize customers as "Returning" if they have placed more than one return, 
and as "New" otherwise. 

Considering you have two table orders has information about sale
and returns has information about returns 

*/
-- no of return for each cx
-- orders and return
-- CASE cnt > 1 then Returning else new


SELECT * FROM orders3;
SELECT * FROM returns1;


select 
	o.customer_id,
	count(o.order_id) as total_order,
	count(r.return_id) as total_return,
	CASE
		WHEN count(return_id) > 1 THEN 'Returning'
		ELSE 'New_customer'
	END AS new_category
from orders3 o
left join returns1 r 
on o.order_id = r.order_id
group by customer_id

/*
Task:
Task:
Categorize products based on their quantity sold into three categories:

"Low Demand": Quantity sold less than or equal to 5.
"Medium Demand": Quantity sold between 6 and 10 (inclusive).
"High Demand": Quantity sold greater than 10.
Expected Output:

Product ID
Product Name
Quantity Sold
Demand Category


*/

SELECT
	product_id,
	quantity as sold_quantity,
  CASE
    WHEN quantity <= 5 THEN 'low_demand'
    WHEN quantity BETWEEN 6 AND 10 THEN 'Medium_demand'
    --- WHEN quantity > 10 THEN 'High_demand'
	ELSE 'High_demand'
  END AS Demand_Category
FROM orders3;

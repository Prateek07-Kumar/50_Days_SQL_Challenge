use SQL_Challenge_50_Days;

DROP TABLE IF EXISTS products;

-- Step 1: Create the products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    quantity_sold INT
);

-- Step 2: Insert sample records into the products table
INSERT INTO products (product_id, product_name, category, quantity_sold) VALUES
(1, 'Samsung Galaxy S20', 'Electronics', 100),
(2, 'Apple iPhone 12 Pro', 'Electronics', 150),
(3, 'Sony PlayStation 5', 'Electronics', 80),
(4, 'Nike Air Max 270', 'Clothing', 200),
(5, 'Adidas Ultraboost 20', 'Clothing', 200),
(6, 'Levis Mens 501 Jeans', 'Clothing', 90),
(7, 'Instant Pot Duo 7-in-1', 'Home & Kitchen', 180),
(8, 'Keurig K-Classic Coffee Maker', 'Home & Kitchen', 130),
(9, 'iRobot Roomba 675 Robot Vacuum', 'Home & Kitchen', 130),
(10, 'Breville Compact Smart Oven', 'Home & Kitchen', 90),
(11, 'Dyson V11 Animal Cordless Vacuum', 'Home & Kitchen', 90);



/*

Questions : 
Write SQL query to find the top-selling products in each category

assuming products table has column 
product_id, product_name, category, quantity_sold
*/
-- 1 product from each category
-- based on highest qty sold
-- rank


SELECT * FROm products;

with cte as (
select 
	product_id,
	product_name,
	category,
	quantity_sold,
RANK() over(partition by category order by quantity_sold desc) as rn
from products
)
select * from cte 
where rn=1

/*
select * 
	from products
order by category, quantity_sold desc;
*/

SELECT * 
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY category ORDER BY quantity_sold DESC) AS rank
    FROM products
) AS subquery
WHERE rank = 1;


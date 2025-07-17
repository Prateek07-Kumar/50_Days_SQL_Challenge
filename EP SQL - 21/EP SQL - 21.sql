use SQL_Challenge_50_Days;

--DROP TABLE IF EXISTS products;
-- Creating the products table
CREATE TABLE products3 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    quantity_sold INT
);

-- Inserting sample data for products
INSERT INTO products3(product_id, product_name, price, quantity_sold) VALUES
    (1, 'iPhone', 899.00, 600),
    (2, 'iMac', 1299.00, 150),
    (3, 'MacBook Pro', 1499.00, 500),
    (4, 'AirPods', 499.00, 800),
    (5, 'Accessories', 199.00, 300);



/*
-- Question 
You have a table called products with below columns
product_id, product_name, price, qty 

Calculate the percentage contribution of each product 
to total revenue?

Round the result into 2 decimal
*/

SELECT * FROM products3;

SELECT 
    product_id,
    product_name,
    ROUND(price * quantity_sold / (select SUM(price * quantity_sold) from products3) * 100, 2) AS revenue_percentage
FROM products3;


/*
-- Your Task

Find what is the contribution of MacBook Pro and iPhone
Round the result in two DECIMAL

*/

SELECT 
  ROUND(
    SUM(price * quantity_sold) * 100.0 / 
(SELECT SUM(price * quantity_sold) FROM products3), 
  2) AS combined_contribution
FROM products3
WHERE product_name IN ('MacBook Pro', 'iPhone');

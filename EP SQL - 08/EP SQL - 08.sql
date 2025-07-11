
-- Create Product table
-- DROP TABLE IF EXISTS Products;

CREATE TABLE Products1 (
    product_id int PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Insert sample records into Product table
INSERT INTO Products (product_name, category, price) VALUES
('Product A', 'Category 1', 10.00),
('Product B', 'Category 2', 15.00),
('Product C', 'Category 1', 20.00),
('Product D', 'Category 3', 25.00);


-- Create Sales table
-- DROP TABLE IF EXISTS Sales;

CREATE TABLE Sales (
    sale_id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    quantity INT,
    -- FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Insert sample records into Sales table
INSERT INTO Sales (product_id, sale_date, quantity) VALUES
(1, '2023-09-15', 5),
(2, '2023-10-20', 3),
(1, '2024-01-05', 2),
(3, '2024-02-10', 4),
(4, '2023-12-03', 1);



/*
Question

Write a SQL query to find all products that
haven't been sold in the last six months. 

Return the product_id, product_name, category, 
and price of these products.

*/

SELECT * FROM products;
SELECT * FROM sales;



select p.product_id,
	p.product_name,
	p.category,
	s.sale_date
from products p
left join sales s on
p.product_id = s.product_id
where s.sale_date is NULL OR  
s.sale_date < DATEADD(MONTH, -6, GETDATE())


select DATEADD(MONTH, -6, GETDATE())


-- Your Task select all product which has not received any sales in current year;

select p.product_id,
	p.product_name,
	p.category,
	s.sale_date
from products p
left join sales s on
p.product_id = s.product_id
where s.sale_date is NULL OR  
YEAR(s.sale_date) = YEAR(GETDATE())
-- s.sale_date < DATEADD(MONTH, GETDATE())



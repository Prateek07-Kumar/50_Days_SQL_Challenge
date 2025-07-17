use SQL_Challenge_50_Days;

--DROP TABLE IF EXISTS products;

CREATE TABLE products2 (
    product_id INT,
    product_name VARCHAR(100),
    supplier_name VARCHAR(50)
);

INSERT INTO products2 (product_id, product_name, supplier_name) VALUES
    (1, 'Product 1', 'Supplier A'),
    (1, 'Product 1', 'Supplier B'),
    (3, 'Product 3', 'Supplier A'),
    (3, 'Product 3', 'Supplier A'),
    (5, 'Product 5', 'Supplier A'),
    (5, 'Product 5', 'Supplier B'),
    (7, 'Product 7', 'Supplier C'),
    (8, 'Product 8', 'Supplier A'),
    (7, 'Product 7', 'Supplier B'),
    (7, 'Product 7', 'Supplier A'),
    (9, 'Product 9', 'Supplier B'),
    (9, 'Product 9', 'Supplier C'),
    (10, 'Product 10', 'Supplier C'),
    (11, 'Product 11', 'Supplier C'),
    (10, 'Product 10', 'Supplier A')
    
    ;

/*
-- Write a query to find products that are sold by 
both Supplier A and Supplier B, 
excluding products sold by only one supplier.

*/

-- product_id, product_name
-- sold by supplier a and B where 

select * from products2;

select 
	product_id,
	product_name,
	count(supplier_name) total_seller
from products2
where supplier_name in ('Supplier A' , 'Supplier B')
group by product_id,
		 product_name
having COUNT(distinct supplier_name) = 2



-- Your Task
-- Find the product that are selling by Supplier C and Supplier B but not Supplier A


select 
	product_id,
	product_name,
	count(supplier_name) total_seller
from products2
where supplier_name in ('Supplier B', 'Supplier C')
group by product_id,
		 product_name
having COUNT(distinct supplier_name) = 2 AND 
product_id NOT IN (
	SELECT product_id
	from products2
WHERE supplier_name = 'Supplier A'
);



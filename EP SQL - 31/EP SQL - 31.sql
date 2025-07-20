use SQL_Challenge_50_Days;

CREATE TABLE sales_data (
    seller_id VARCHAR(10),
    total_sales NUMERIC,
    product_category VARCHAR(20),
    market_place VARCHAR(10),
    month DATE
);



INSERT INTO sales_data (seller_id, total_sales, product_category, market_place, month)
VALUES
('s236', 36486.73, 'electronics', 'in', '2024-01-01'),
('s918', 24286.4, 'books', 'uk', '2024-01-01'),
('s163', 18846.34, 'electronics', 'us', '2024-01-01'),
('s836', 35687.65, 'electronics', 'uk', '2024-01-01'),
('s790', 31050.13, 'clothing', 'in', '2024-01-01'),
('s195', 14299, 'books', 'de', '2024-01-01'),
('s483', 49361.62, 'clothing', 'uk', '2024-01-01'),
('s891', 48847.68, 'electronics', 'de', '2024-01-01'),
('s272', 11324.61, 'toys', 'us', '2024-01-01'),
('s712', 43739.86, 'toys', 'in', '2024-01-01'),
('s968', 36042.66, 'electronics', 'jp', '2024-01-01'),
('s728', 29158.51, 'books', 'us', '2024-01-01'),
('s415', 24593.5, 'electronics', 'uk', '2024-01-01'),
('s454', 35520.67, 'toys', 'in', '2024-01-01'),
('s560', 27320.16, 'electronics', 'jp', '2024-01-01'),
('s486', 37009.18, 'electronics', 'us', '2024-01-01'),
('s749', 36277.83, 'toys', 'de', '2024-01-01'),
('s798', 31162.45, 'electronics', 'in', '2024-01-01'),
('s515', 26372.16, 'toys', 'in', '2024-01-01'),
('s662', 22157.87, 'books', 'in', '2024-01-01'),
('s919', 24963.97, 'toys', 'de', '2024-01-01'),
('s863', 46652.67, 'electronics', 'us', '2024-01-01'),
('s375', 18107.08, 'clothing', 'de', '2024-01-01'),
('s583', 20268.34, 'toys', 'jp', '2024-01-01'),
('s778', 19962.89, 'electronics', 'in', '2024-01-01'),
('s694', 36519.05, 'electronics', 'in', '2024-01-01'),
('s214', 18948.55, 'electronics', 'de', '2024-01-01'),
('s830', 39169.01, 'toys', 'us', '2024-01-01'),
('s383', 12310.73, 'books', 'in', '2024-01-01'),
('s195', 45633.35, 'books', 'de', '2024-01-01'),
('s196', 13643.27, 'books', 'jp', '2024-01-01'),
('s796', 19637.44, 'electronics', 'jp', '2024-01-01'),
('s334', 11999.1, 'clothing', 'de', '2024-01-01'),
('s217', 23481.03, 'books', 'in', '2024-01-01'),
('s123', 36277.83, 'toys', 'uk', '2024-01-01');


/*
-- Amazon Data Analyst Interview
-- Top Monthly Sellers

You are provided with a transactional dataset from 
Amazon that contains detailed information about 
sales across different products and marketplaces. 

Your task is to list the top 3 sellers in each 
product category for January.

The output should contain 'seller_id' , 
'total_sales' ,'product_category' , 
'market_place', and 'month'.

*/

-- seller_id TOTAL sale 
-- WHERE Jan
-- Select top 3 seller from each p_c


SELECT * FROM sales_data;

select 
	product_category,
	seller_id,
	sales
from
(
	select 
		product_category,
		seller_id,
		sum(total_sales) as sales,
		dense_rank() over(partition by product_category order by sum(total_sales) desc) as rn
	from sales_data
	where DATEPART(month, month) = 1
	group by product_category, seller_id
	) as subquery
where rn <= 3;


-- Your Task
-- Find out Each market place and their top 3 seller based on total sale


select 
	market_place,
	seller_id,
	total_sales
from
(
	select 
		market_place,
		seller_id,
		sum(total_sales) as total_sales,
		dense_rank() over(partition by market_place order by sum(total_sales) desc) as rn
	from sales_data
	where DATEPART(month, month) = 1
	group by market_place, seller_id
	) as subquery
where rn <= 3;






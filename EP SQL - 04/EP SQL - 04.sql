use SQL_Challenge_50_Days;

create table orders1(
  	category varchar(20),
	product varchar(20),
	user_id int , 
  	spend int,
  	transaction_date DATE
);

Insert into orders1 values
('appliance','refrigerator',165,246.00,'2021/12/26'),
('appliance','refrigerator',123,299.99,'2022/03/02'),
('appliance','washingmachine',123,219.80,'2022/03/02'),
('electronics','vacuum',178,152.00,'2022/04/05'),
('electronics','wirelessheadset',156,	249.90,'2022/07/08'),
('electronics','TV',145,189.00,'2022/07/15'),
('Television','TV',165,129.00,'2022/07/15'),
('Television','TV',163,129.00,'2022/07/15'),
('Television','TV',141,129.00,'2022/07/15'),
('toys','Ben10',145,189.00,'2022/07/15'),
('toys','Ben10',145,189.00,'2022/07/15'),
('toys','yoyo',165,129.00,'2022/07/15'),
('toys','yoyo',163,129.00,'2022/07/15'),
('toys','yoyo',141,129.00,'2022/07/15'),
('toys','yoyo',145,189.00,'2022/07/15'),
('electronics','vacuum',145,189.00,'2022/07/15');

select * from orders1;

/*
Find the top 2 products in the top 2 categories based on spend amount?
*/

-- top 2 category based on spend 
-- top 2 product in above best 2 category


WITH cte as (
	SELECT 
		category ,
		total_spend
	FROM 
	(
		SELECT 
			category,
			SUM(spend) AS total_spend,
			DENSE_RANK() OVER (ORDER BY SUM(spend) DESC) AS rn
		FROM orders1
		GROUP BY category
	) AS ranked_categories
	WHERE rn <= 2
)
select 
	category,
	product,
	total_spend
from (
		select 
			o.category,
			o.product,
			SUM(o.spend) AS total_spend,
			DENSE_RANK() OVER (PARTITION BY o.category ORDER BY SUM(o.spend) DESC) AS drn
		from orders1 as o
		join cte as c
		on c.category=o.category
		group by o.category, o.product
) sub
where drn <=2



--- Task find top category and product that has least spend amount


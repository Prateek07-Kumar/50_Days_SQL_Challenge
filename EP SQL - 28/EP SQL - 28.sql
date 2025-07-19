use SQL_Challenge_50_Days;

select * from walmart_eu;

/*
--Question
Write a query to find the highest-selling 
product for each customer

Return cx id, product description, 
and total count of purchase.

*/ 
-- cx all product they purchased and their total orders
-- order by by number of purchase desc
-- 1 product that has highest purchase 
-- rank 

select * 
from 
(
	select 
		customerid,
		description,
		count(*) as total_purchase,
		--sum(unitprice * quantity) as higest_price
	rank() over(partition by customerid order by count(*) desc) rn
	from walmart_eu
	group by customerid, description
	--order by customerid, total_purchase desc
) as subquery
where rn = 1
order by customerid, total_purchase desc;


/*
-- Your Task
Find each country and best selling product 
Return country_name, description, total count of sale
*/

select 
	country,
	description,
	selling_product
from 
(
	select 
		country,
		count(*) as selling_product,
		description,
		rank() over(partition by country order by count(*) desc) sales_rank
	from walmart_eu
	group by country, description
) as rank_sales
where sales_rank = 1
order by country
	ORDER BY
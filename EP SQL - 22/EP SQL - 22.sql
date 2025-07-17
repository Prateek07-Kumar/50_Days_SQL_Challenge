use SQL_Challenge_50_Days;

--DROP TABLE IF EXISTS delivery;
-- Create the Delivery table
CREATE TABLE Delivery (
    delivery_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    customer_pref_delivery_date DATE
);

-- Insert data into the Delivery table
INSERT INTO Delivery (customer_id, order_date, customer_pref_delivery_date) VALUES
(1, '2019-08-01', '2019-08-02'),
(2, '2019-08-02', '2019-08-02'),
(1, '2019-08-11', '2019-08-12'),
(3, '2019-08-24', '2019-08-24'),
(3, '2019-08-21', '2019-08-22'),
(2, '2019-08-11', '2019-08-13'),
(4, '2019-08-09', '2019-08-09'),
(5, '2019-08-09', '2019-08-10'),
(4, '2019-08-10', '2019-08-12'),
(6, '2019-08-09', '2019-08-11'),
(7, '2019-08-12', '2019-08-13'),
(8, '2019-08-13', '2019-08-13'),
(9, '2019-08-11', '2019-08-12');    



/*
-- Question

You have dataset of a food delivery company
with columns order_id, customer_id, order_date, 
pref_delivery_date


If the customer's preferred delivery date is 
the same as the order date, then the order is 
called immediate; otherwise, it is called scheduled.


Write a solution to find the percentage of immediate
orders in the first orders of all customers, 
rounded to 2 decimal places.
*/

-- find first orders of each cx
-- total cnt of first orders 
-- case immediate or scheduled
-- total immediate orders / total cnt of first orders * 100
-- round 2

SELECT * FROM Delivery;

WITH FirstOrders AS (
    SELECT 
        customer_id,
        order_date,
        customer_pref_delivery_date AS cpdd,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rn
    FROM Delivery
)
SELECT 
    ROUND(
        CAST(SUM(CASE WHEN order_date = cpdd THEN 1 ELSE 0 END) AS FLOAT) 
        * 100.0 / COUNT(*), 2
    ) AS imd_del_percentage
FROM FirstOrders
WHERE rn = 1;


/* 
-- Your task
Your Challenge:
Write an SQL query to determine the percentage
of orders where customers select next day delivery. 
We're excited to see your solution! 

-- Next Day Delivery is Order Date + 1

*/

SELECT 
    ROUND(
        CAST(SUM(CASE 
            WHEN customer_pref_delivery_date = DATEADD(DAY, 1, order_date) THEN 1 
            ELSE 0 
        END) AS FLOAT) * 100.0 / COUNT(*),
    2) AS next_day_delivery_percentage
FROM Delivery;


use SQL_Challenge_50_Days;

-- drop table hotel_bookings

-- Creating the hotel_bookings table
use SQL_Challenge_50_Days;

CREATE TABLE hotel_bookings (
    booking_id int identity(1,1) PRIMARY KEY,
    booking_date DATE,
    hotel_name VARCHAR(100),
    total_guests INT,
    total_nights INT,
    total_price DECIMAL(10, 2)
);

-- Inserting sample data for hotel bookings for 2023 and 2022
INSERT INTO hotel_bookings (booking_date, hotel_name, total_guests, total_nights, total_price) VALUES
    ('2023-01-05', 'Hotel A', 2, 3, 300.00),
    ('2023-02-10', 'Hotel B', 3, 5, 600.00),
    ('2023-03-15', 'Hotel A', 4, 2, 400.00),
    ('2023-04-20', 'Hotel B', 2, 4, 500.00),
    ('2023-05-25', 'Hotel A', 3, 3, 450.00),
    ('2023-06-30', 'Hotel B', 5, 2, 350.00),
    ('2023-07-05', 'Hotel A', 2, 5, 550.00),
    ('2023-08-10', 'Hotel B', 3, 3, 450.00),
    ('2023-09-15', 'Hotel A', 4, 4, 500.00),
    ('2023-10-20', 'Hotel B', 2, 3, 300.00),
    ('2023-11-25', 'Hotel A', 3, 2, 350.00),
    ('2023-12-30', 'Hotel B', 5, 4, 600.00),
    ('2022-01-05', 'Hotel A', 2, 3, 300.00),
    ('2022-02-10', 'Hotel B', 3, 5, 600.00),
    ('2022-03-15', 'Hotel A', 4, 2, 400.00),
    ('2022-04-20', 'Hotel B', 2, 4, 500.00),
    ('2022-05-25', 'Hotel A', 3, 3, 450.00),
    ('2022-06-30', 'Hotel B', 5, 2, 350.00),
    ('2022-07-05', 'Hotel A', 2, 5, 550.00),
    ('2022-08-10', 'Hotel B', 3, 3, 450.00),
    ('2022-09-15', 'Hotel A', 4, 4, 500.00),
    ('2022-10-20', 'Hotel B', 2, 3, 300.00),
    ('2022-11-25', 'Hotel A', 3, 2, 350.00),
    ('2022-12-30', 'Hotel B', 5, 4, 600.00);


/*
-- Write a SQL query to find out each hotal best 
performing months based on revenue 
*/
-- hotel_name, revenue for each month -- group by
-- window function ranking 


SELECT * FROM hotel_bookings;

SELECT * 
FROM (
    SELECT 
        year,
        month,
        hotel_name,
        revenue,
        RANK() OVER (
            PARTITION BY year, hotel_name 
            ORDER BY revenue DESC
        ) AS rnk
    FROM (
        SELECT 
            YEAR(booking_date) AS year,
            MONTH(booking_date) AS month,
            hotel_name,
            SUM(total_price) AS revenue
        FROM hotel_bookings
        GROUP BY 
            YEAR(booking_date),
            MONTH(booking_date),
            hotel_name
    ) AS total_month_revenue
) AS subquery
WHERE rnk = 1;

use SQL_Challenge_50_Days;

-- UBER Interview Question

--Drop the table if it exists
DROP TABLE IF EXISTS uber_ride;

-- Create the Uber ride table
CREATE TABLE uber_ride (
    ride_id INT PRIMARY KEY IDENTITY(1,1),
    ride_timestamp DATETIME,
    ride_status VARCHAR(20)  -- "ride_completed", "cancelled_by_driver" or "cancelled_by_user"
);

-- Insert sample records
INSERT INTO uber_ride (ride_timestamp, ride_status)
VALUES
    ('2024-05-09 08:30:00', 'cancelled_by_driver'),
    ('2024-05-09 09:00:00', 'cancelled_by_user'),
    ('2024-05-09 10:00:00', 'ride_completed'),
    ('2024-05-09 11:00:00', 'cancelled_by_user'),
    ('2024-05-09 12:00:00', 'cancelled_by_driver'),
    ('2024-05-09 13:00:00', 'cancelled_by_user'),
    ('2024-05-09 14:00:00', 'cancelled_by_user'),
    ('2024-05-09 15:00:00', 'cancelled_by_user'),
    ('2024-05-09 16:00:00', 'ride_completed'),
    ('2024-05-09 17:00:00', 'cancelled_by_user'),
    ('2024-05-09 18:00:00', 'ride_completed'),
    ('2024-05-09 19:00:00', 'cancelled_by_user'),
    ('2024-05-09 20:00:00', 'cancelled_by_user'),
    ('2024-05-09 21:00:00', 'cancelled_by_user'),
    ('2024-05-09 22:00:00', 'cancelled_by_driver'),
    ('2024-05-09 13:00:00', 'cancelled_by_user'),
    ('2024-05-09 14:00:00', 'cancelled_by_user'),
    ('2024-05-09 15:00:00', 'cancelled_by_user'),
    ('2024-05-09 16:00:00', 'ride_completed'),
    ('2024-05-09 17:00:00', 'cancelled_by_user'),
    ('2024-05-09 18:00:00', 'cancelled_by_driver'),
    ('2024-05-09 19:00:00', 'cancelled_by_user'),
    ('2024-05-09 20:00:00', 'cancelled_by_user'),
    ('2024-05-09 21:00:00', 'cancelled_by_user'),
    ('2024-05-09 22:00:00', 'cancelled_by_driver');

-- Check the records
SELECT * FROM uber_ride;

-- Check the records
SELECT * FROM uber_ride;



-- Check the records
SELECT * FROM uber_ride;

-- Check the records
SELECT * FROM uber_ride;

-- Check the records
SELECT * FROM uber_ride;

-- UBER Data Analyst Interview Question
/*
You are given a uber_ride table with columns
ride_id, ride_time_stamp, ride_status.
(which has information about the ride)


Find out % of ride cancelled by uber_driver

*/

-- total cnt of cancelled ride
-- total ride that was cancelled by driver
-- 2/1 * 100

SELECT * FROM uber_ride;

SELECT 
    ROUND(CAST(SUM(CASE 
                WHEN ride_status = 'cancelled_by_driver' THEN 1 
                ELSE 0 
            END) AS FLOAT) /
        CAST(
            (SELECT COUNT(*) FROM uber_ride WHERE ride_status <> 'ride_completed') AS FLOAT
        ) * 100, 
    2) AS percentage_ride_cancelled_driver
FROM uber_ride;

-- -- Your Task is to find out how how many ride were cancelled by user in the evening 
-- hour > 17 is considered as evening 


select
	count(*) AS cancelled_by_user_evening
from uber_ride
where ride_status = 'cancelled_by_user'
and DATEPART(hour, ride_timestamp) > 17;


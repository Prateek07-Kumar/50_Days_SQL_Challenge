use SQL_Challenge_50_Days;

CREATE TABLE bookings
                    (
                        id INT,
                        hotel_name VARCHAR(15),
                        booking_date date,
                        cust_id INT,
                        adult INT,
                        payment_type VARCHAR(10)
                    );

-- inserting records

INSERT INTO bookings (id, hotel_name, booking_date, cust_id, adult, payment_type) VALUES
(1, 'Hotel A', '2022-05-06', 1001, 2, 'Credit'),
(2, 'Hotel B', '2022-05-06', 1002, 1, 'Cash'),
(3, 'Hotel C', '2022-05-07', 1003, 3, 'Credit'),
(4, 'Hotel D', '2022-05-07', 1004, 2, 'Cash'),
(5, 'Hotel E', '2022-05-05', 1005, 1, 'Credit'),
(6, 'Hotel A', '2022-05-07', 1006, 2, 'Cash'),
(7, 'Hotel B', '2022-05-06', 1007, 3, 'Credit'),
(8, 'Hotel C', '2022-05-08', 1008, 1, 'Cash'),
(9, 'Hotel D', '2022-05-09', 1009, 2, 'Credit'),
(10, 'Hotel E', '2022-05-10', 1010, 3, 'Cash'),
(11, 'Hotel A', '2022-05-14', 1011, 1, 'Credit'),
(12, 'Hotel B', '2022-05-21', 1012, 2, 'Cash'),
(13, 'Hotel C', '2022-05-13', 1013, 3, 'Credit'),
(14, 'Hotel D', '2022-05-14', 1014, 1, 'Cash'),
(15, 'Hotel E', '2022-05-15', 1015, 2, 'Credit'),
(16, 'Hotel A', '2022-05-21', 1016, 3, 'Cash'),
(17, 'Hotel B', '2022-05-17', 1017, 1, 'Credit'),
(18, 'Hotel C', '2022-05-18', 1018, 2, 'Cash'),
(19, 'Hotel D', '2022-05-19', 1019, 3, 'Credit'),
(20, 'Hotel E', '2022-05-20', 1020, 1, 'Cash'),
(21, 'Hotel A', '2022-05-28', 1021, 2, 'Credit'),
(22, 'Hotel B', '2022-05-22', 1022, 3, 'Cash'),
(23, 'Hotel C', '2022-05-23', 1023, 1, 'Credit'),
(24, 'Hotel D', '2022-05-24', 1024, 2, 'Cash'),
(25, 'Hotel E', '2022-05-25', 1025, 3, 'Credit'),
(26, 'Hotel A', '2022-06-04', 1026, 1, 'Cash'),
(27, 'Hotel B', '2022-06-04', 1027, 2, 'Credit'),
(28, 'Hotel C', '2022-05-28', 1028, 3, 'Cash'),
(29, 'Hotel D', '2022-05-29', 1029, 1, 'Credit'),
(30, 'Hotel E', '2022-06-25', 1030, 2, 'Cash'),
(31, 'Hotel A', '2022-06-18', 1031, 3, 'Credit'),
(32, 'Hotel B', '2022-06-02', 1032, 1, 'Cash'),
(33, 'Hotel C', '2022-06-03', 1033, 2, 'Credit'),
(34, 'Hotel D', '2022-06-04', 1034, 3, 'Cash'),
(35, 'Hotel E', '2022-06-05', 1035, 1, 'Credit'),
(36, 'Hotel A', '2022-07-09', 1036, 2, 'Cash'),
(37, 'Hotel B', '2022-06-06', 1037, 3, 'Credit'),
(38, 'Hotel C', '2022-06-08', 1038, 1, 'Cash'),
(39, 'Hotel D', '2022-06-09', 1039, 2, 'Credit'),
(40, 'Hotel E', '2022-06-10', 1040, 3, 'Cash'),
(41, 'Hotel A', '2022-07-23', 1041, 1, 'Credit'),
(42, 'Hotel B', '2022-06-12', 1042, 2, 'Cash'),
(43, 'Hotel C', '2022-06-13', 1043, 3, 'Credit'),
(44, 'Hotel D', '2022-06-14', 1044, 1, 'Cash'),
(45, 'Hotel E', '2022-06-15', 1045, 2, 'Credit'),
(46, 'Hotel A', '2022-06-24', 1046, 3, 'Cash'),
(47, 'Hotel B', '2022-06-24', 1047, 1, 'Credit'),
(48, 'Hotel C', '2022-06-18', 1048, 2, 'Cash'),
(49, 'Hotel D', '2022-06-19', 1049, 3, 'Credit'),
(50, 'Hotel E', '2022-06-20', 1050, 1, 'Cash');


/*
-- Question
Find the hotel name and their total numbers
of weekends bookings
sort the data higher number first!
*/

-- hotel_name,
-- total no of bookings which basically for weekends
-- Group by by hotel_name
-- order by total booking

select * from bookings;

select 
	hotel_name,
	sum(case
		When datename(weekday, booking_date) IN ('Saturday', 'Sunday') 
		then 1 
	else 0
	end) as total_no_booking
from bookings
group by hotel_name
order by total_no_booking desc


-- Your Task
-- Find out hotel_name and their total number of booking by credit card and cash

select 
	hotel_name,
	sum(case When payment_type = 'credit' then 1 else 0 end) as credit_card_booking,
	sum(case When payment_type = 'cash' then 1 else 0 end) as cash_booking
from bookings
group by hotel_name
order by hotel_name;

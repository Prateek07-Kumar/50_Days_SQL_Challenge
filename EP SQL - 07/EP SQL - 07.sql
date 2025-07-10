use SQL_Challenge_50_Days;

-- DROP TABLE IF EXISTS employees;

-- Create the employee_salary table
CREATE TABLE employees2 (
    emp_id INT,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);



-- Insert all records again to simulate duplicates
INSERT INTO employees2(emp_id, name, department, salary) VALUES
(1, 'John Doe', 'Finance', 60000.00),
(2, 'Jane Smith', 'Finance', 65000.00), 
(2, 'Jane Smith', 'Finance', 65000.00),   -- Duplicate
(9, 'Lisa Anderson', 'Sales', 63000.00),
(9, 'Lisa Anderson', 'Sales', 63000.00),  -- Duplicate
(9, 'Lisa Anderson', 'Sales', 63000.00),  -- Duplicate
(10, 'Kevin Martinez', 'Sales', 61000.00);


/*
Question:

How would you identify duplicate entries in
a SQL in given table employees columns are 
emp_id, name, department, salary

*/


-- ------------------------
-- My Solution
-- ------------------------

SELECT * FROM employees2;

select emp_id, name,  
	count(1) as total_count 
	from employees2
group by emp_id, name
having count(1) > 1;

-- Approach 2

select * 
from (
	SELECT *,
	row_number() over(partition by name order by name) as rn
FROM employees2
) as sub
where rn > 1;

-- Task - Identify employee details who is appearing more than twice in the table employees

select * 
from (
	SELECT *,
	row_number() over(partition by name order by name) as rn
FROM employees2
) as sub
where rn > 2;


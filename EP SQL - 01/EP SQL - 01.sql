create database SQL_Challenge_50_Days;

use SQL_Challenge_50_Days;

-- Create the employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY IDENTITY(1,1),  -- Auto-incrementing primary key
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Insert records for three departments
INSERT INTO employees (name, department, salary) VALUES 
('John Doe', 'Engineering', 63000),
('Jane Smith', 'Engineering', 55000),
('Michael Johnson', 'Engineering', 64000),
('Emily Davis', 'Marketing', 58000),
('Chris Brown', 'Marketing', 56000),
('Emma Wilson', 'Marketing', 59000),
('Alex Lee', 'Sales', 58000),
('Sarah Adams', 'Sales', 58000),
('Ryan Clark', 'Sales', 61000);

-- Write the SQL query to find the second highest salary

select * from employees;

select max(salary) as second_higest_salary
from employees
where salary < 
		(select max(salary) 
			from employees)

SELECT salary
FROM employees
ORDER BY salary DESC
OFFSET 1 ROW FETCH NEXT 1 ROWS ONLY;

-- ADDED new records
INSERT INTO employees (name, department, salary)
VALUES ('Zara', 'IT', 63000);
;


-- Window function dense_rank

with cte as (
select *,
dense_rank() over(order by salary desc) as rn
from employees
)
select salary from cte
where rn=2
----------------------------------------------------------------------------------------

select * from (
select *,
dense_rank() over(order by salary desc) as rn
from employees
) as subquery
where rn=2

 
 
-- Your Task 

-- Question: Get the details of the employee with the second-highest salary from each department

select * from employees;

with RankedSalaries  as (
select 
	employee_id,
	name,
	department,
	salary
,DENSE_RANK() over(partition by department order by salary desc) as rank_in_dept
from employees
)
-- select * from RankedSalaries 
-- where rank_in_dept = 2
select 
	employee_id,
	name,
	department,
	salary
from RankedSalaries 
where rank_in_dept = 2;




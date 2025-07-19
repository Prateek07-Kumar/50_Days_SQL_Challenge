use SQL_Challenge_50_Days;

CREATE TABLE employees7 (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10, 2),
    manager_id INT
);

INSERT INTO employees7 (employee_id, employee_name, department, salary, manager_id)
VALUES
    (1, 'John Doe', 'HR', 50000.00, NULL),
    (2, 'Jane Smith', 'HR', 55000.00, 1),
    (3, 'Michael Johnson', 'HR', 60000.00, 1),
    (4, 'Emily Davis', 'IT', 60000.00, NULL),
    (5, 'David Brown', 'IT', 65000.00, 4),
    (6, 'Sarah Wilson', 'Finance', 70000.00, NULL),
    (7, 'Robert Taylor', 'Finance', 75000.00, 6),
    (8, 'Jennifer Martinez', 'Finance', 80000.00, 6);

/*
-- Question
You have a employees table with columns emp_id, emp_name,
department, salary, manager_id (manager is also emp in the table))

Identify employees who have a higher salary than their manager. 
*/

select * from employees7;

select 
	e1.employee_id,
	e1.employee_name,
	e1.department,
	e1.salary,
	e1.manager_id,
	e2.employee_name as manager_name,
	e2.salary as manager_salary
from employees7 as e1
inner join employees7 as e2
on e1.manager_id = e2.manager_id
where e1.salary > e2.salary


-- Your task
-- Find all the employee who has salary greater than average salary?

SELECT 
    employee_id,
    employee_name,
    department,
    salary,
    (SELECT AVG(salary) FROM employees7) AS average_salary
FROM 
    employees7
WHERE 
    salary > (SELECT AVG(salary) FROM employees7);




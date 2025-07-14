use SQL_Challenge_50_Days;

-- DROP TABLE IF EXISTS employees;
CREATE TABLE employees5 (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT,
    --FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);

INSERT INTO employees5(emp_id, name, manager_id) VALUES
(1, 'John Doe', NULL),        -- John Doe is not a manager
(2, 'Jane Smith', 1),          -- Jane Smith's manager is John Doe
(3, 'Alice Johnson', 1),       -- Alice Johnson's manager is John Doe
(4, 'Bob Brown', 3),           -- Bob Brown's manager is Alice Johnson
(5, 'Emily White', NULL),      -- Emily White is not a manager
(6, 'Michael Lee', 3),         -- Michael Lee's manager is Alice Johnson
(7, 'David Clark', NULL),      -- David Clark is not a manager
(8, 'Sarah Davis', 2),         -- Sarah Davis's manager is Jane Smith
(9, 'Kevin Wilson', 2),        -- Kevin Wilson's manager is Jane Smith
(10, 'Laura Martinez', 4);     -- Laura Martinez's manager is Bob Brown


/*
You have a table named employees containing information about employees, 
including their emp_id, name, and manager_id. 
The manager_id refers to the emp_id of the employee's manager.


write a SQL query to retrieve all employees' 
details along with their manager's names based on the manager ID

*/

SELECT * FROM employees5;

select 
	e1.emp_id,
	e1.name,
	e1.manager_id,
	e2.name as manager_name
from employees5 e1
cross join 
	employees5 e2
where e1.manager_id = e2.emp_id


-- Your Task
-- Write a SQL query to find the names of all employees who are also managers. 
-- In other words, retrieve the names of employees who appear as managers in the manager_id column.


select 
	distinct e.name
from employees5 as e
where emp_id in (
select distinct manager_id
from employees5
	WHERE manager_id is not null
);
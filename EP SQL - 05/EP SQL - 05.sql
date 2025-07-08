use SQL_Challenge_50_Days;

DROP TABLE IF EXISTS Employees;
-- Create the Employee table
CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

-- Insert sample records into the Employee table
INSERT INTO Employees1(EmployeeID, Name, Department, Salary, HireDate) VALUES
(101, 'John Smith', 'Sales', 60000.00, '2022-01-15'),
(102, 'Jane Doe', 'Marketing', 55000.00, '2022-02-20'),
(103, 'Michael Johnson', 'Finance', 70000.00, '2021-12-10'),
(104, 'Emily Brown', 'Sales', 62000.00, '2022-03-05'),
(106, 'Sam Brown', 'IT', 62000.00, '2022-03-05'),	
(105, 'Chris Wilson', 'Marketing', 58000.00, '2022-01-30');

select * from Employees1;

/*

Write a SQL query to retrieve the 
third highest salary from the Employee table.
*/

select Salary as 
	third_higest_salary from
(select *, 
	DENSE_RANK() over(order by Salary desc) as rn from 
	Employees1
WHERE Salary in (
	select salary from Employees1)
) as sub
where rn = 3


--task find the employee details who has higest salary from each department

WITH RankedSalaries AS (
    SELECT *,
           RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
    FROM employees
)
SELECT *
FROM RankedSalaries
WHERE salary_rank = 1;




use SQL_Challenge_50_Days;

-- Create Employee table
--DROP TABLE IF EXISTS employees;

CREATE TABLE employees3 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary NUMERIC(10, 2)
);

-- Insert sample records into Employee table
INSERT INTO employees3 (EmployeeID, FirstName, LastName, Department, Salary) VALUES
(1, 'John', 'Doe', 'Finance', 75000.00),
(2, 'Jane', 'Smith', 'HR', 60000.00),
(3, 'Michael', 'Johnson', 'IT', 45000.00),
(4, 'Emily', 'Brown', 'Marketing', 55000.00),
(5, 'David', 'Williams', 'Finance', 80000.00),
(6, 'Sarah', 'Jones', 'HR', 48000.00),
(7, 'Chris', 'Taylor', 'IT', 72000.00),
(8, 'Jessica', 'Wilson', 'Marketing', 49000.00);


/*

Write a SQL query to classify employees into three categories based on their salary:

"High" - Salary greater than $70,000
"Medium" - Salary between $50,000 and $70,000 (inclusive)
"Low" - Salary less than $50,000

Your query should return the EmployeeID, FirstName, LastName, Department, Salary, and 
a new column SalaryCategory indicating the category to which each employee belongs.

*/

select * from employees3;

SELECT 
	*,
	CASE
		WHEN Salary > 70000 THEN 'Heigher' 
		WHEN Salary BETWEEN 50000 AND 70000 THEN 'Medium'
		ELSE 'Lower_Salary'
	END AS SalaryCategory
FROM employees3;



-- Your Task is to find out count of 
-- employee for each salary category?

SELECT 
	CASE
		WHEN Salary > 70000 THEN 'Heigher' 
		WHEN Salary BETWEEN 50000 AND 70000 THEN 'Medium'
		ELSE 'Lower_Salary'
	END AS SalaryCategory,
	COUNT(*) AS employee_count
FROM employees3
GROUP BY 
	CASE
		WHEN Salary > 70000 THEN 'Heigher' 
		WHEN Salary BETWEEN 50000 AND 70000 THEN 'Medium'
		ELSE 'Lower_Salary'
	END;



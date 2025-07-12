use SQL_Challenge_50_Days;

--DROP TABLE IF EXISTS Employees;
-- Create Employees table
CREATE TABLE Employees4 (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- Insert sample data into Employees table
INSERT INTO Employees4 (id, name) VALUES
    (1, 'Alice'),
    (7, 'Bob'),
    (11, 'Meir'),
    (90, 'Winston'),
    (3, 'Jonathan');


--DROP TABLE IF EXISTS EmployeeUNI;
-- Create EmployeeUNI table
CREATE TABLE EmployeeUNI (
    id INT PRIMARY KEY,
    unique_id INT
);

-- Insert sample data into EmployeeUNI table
INSERT INTO EmployeeUNI (id, unique_id) VALUES
    (3, 1),
    (11, 2),
    (90, 3);



/*

Write a solution to show the unique ID of each user, 
If a user does not have a unique ID replace just show null.

Return employee name and their unique_id.
*/

SELECT * FROM Employees4;
SELECT * FROM EmployeeUNI;

select e.name,
	eu.unique_id
from Employees4 e
left join EmployeeUNI eu 
on eu.id = e.id


-- Your task to replace null values to 0 for the employee who doesn't have unique id

select 
	e.name,
	--eu.unique_id,
	coalesce(unique_id ,0) as null_column
from Employees4 e
left join EmployeeUNI eu 
on eu.id = e.id;


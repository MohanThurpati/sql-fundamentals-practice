-- Drop the table if it already exists
DROP TABLE IF EXISTS employees;
-- Create the employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10, 2) CHECK (salary > 0),
    joining_date DATE NOT NULL,
    age INT CHECK (age >= 18)
);

-- Insert data into employees table
INSERT INTO employees (first_name, last_name, department, salary, joining_date, age)
 VALUES ('Mohan', 'Thurpati', 'IT', 60000.00, '2022-05-01', 29),
		('Rama', 'Patel', 'HR', 55000.00, '2021-08-15', 32),
		('Ravi', 'Kumar', 'Finance', 70000.00, '2020-03-10', 35),
		('Shiva', 'Varma', 'IT', 65000.00, '2019-11-22', 28),
		('Rashekar', 'Reddy', 'Operations', 50000.00, '2023-01-10', 26);

--To See Table Data
  SELECT * FROM employees;
  
-- Assignment Questions
--Q1: Retrieve all employees’ first_name and their departments.
	SELECT
		first_name,
		department
	FROM
		employees;

--Q2: Update the salary of all employees in the 'IT' department by increasing it by 10%.
	UPDATE employees
	SET
		salary = salary * 1.10
	WHERE
		department = 'IT';
	
	SELECT
		*
	FROM
		employees;

--Q3: Delete all employees who are older than 34 years.
	DELETE FROM employees
	WHERE
		age > 34;

--To Verify update
  SELECT * FROM employees;		

--Q4: Add a new column `email` to the `employees` table.
	ALTER TABLE employees
	ADD COLUMN email VARCHAR(100);

--Q5: Rename the `department` column to `dept_name`.
	ALTER TABLE employees
	RENAME COLUMN department TO dept_name;
	
	SELECT
		*
	FROM
		employees;

--Q6: Retrieve the names of employees who joined after January 1, 2021.
	SELECT
		first_name,
		last_name,
		joining_date
	FROM
		employees
	WHERE
		joining_date > '2021-01-01';

--Q7: Change the data type of the `salary` column to `INTEGER`.
	ALTER TABLE employees
	ALTER COLUMN salary TYPE INTEGER;

--Q8: List all employees with their age and salary in descending order of salary.
	SELECT
	   first_name,
	   last_name,
		age,
		salary
	FROM
		employees
	ORDER BY
		salary DESC;

--Q9: Insert a new employee with the following details: 
-- ('Raj', 'Singh', 'Marketing', 60000, '2023-09-15', 30)
   INSERT INTO employees (first_name, last_name, dept_name, salary, joining_date, age)
    VALUES ('Raj', 'Singh', 'Marketing', 60000, '2023-09-15', 30);

--Q10: Update age of employee +1 to every employee 
	UPDATE employees
	SET
		age = age + 1;

----To Verify update
  SELECT * FROM employees;
--Q11. Find the total salary paid to each department.
	 SELECT
		dept_name,
		SUM(salary) AS total_salary
	FROM
		employees
	GROUP BY
		dept_name;

--Q12. Find the average salary of employees in each department.
	 SELECT
		dept_name,
		ROUND(AVG(salary),2) AS avg_salary
	FROM
		employees
	GROUP BY
		dept_name;

--Q13. Display the top 3 highest-paid employees.
	SELECT
	   employee_id,
	   first_name,
	   last_name,
	   salary
	FROM
		employees
	ORDER BY
		salary DESC
	LIMIT 3;     

--Q14. Find departments that have more than one employee.
	SELECT
		dept_name,
		COUNT(*) AS dept_count
	FROM
		employees
	GROUP BY
		dept_name
	HAVING
		COUNT(*) > 1;
	
--Q15. Find employees who joined after January 1, 2021 and earn more than ₹55,000.
	SELECT
		first_name,
		last_name,
		salary,
		joining_date
	FROM
		employees
	WHERE
		joining_date > '2021-01-01' and salary>55000;

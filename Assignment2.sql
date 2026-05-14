CREATE DATABASE emp_db;
USE emp_db;

CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    exp INT CHECK (exp >= 2),
    salary INT CHECK (salary BETWEEN 12000 AND 30000),
    department VARCHAR(20) CHECK (department IN ('HR','Sales','Accts','IT')),
    manager_name VARCHAR(50)
);

INSERT INTO employee(name, exp, salary, department, manager_name) VALUES
('Ramit', 3, 15000, 'HR', 'Amit'),
('Mukul', 5, 20000, 'IT', 'Rahul'),
('Anshul', 4, 18000, 'Sales', 'Sourabh'),
('Sachin', 6, 25000, 'Accts', 'Suresh'),
('Shivam', 3, 14000, 'HR', 'Rajan');

--Q1
SELECT employee_id, name, salary FROM employee;

--Q2
SELECT 
employee_id AS 'Employee ID',
name AS 'Name of Employee',
salary AS 'Salary of Employee'
FROM employee;

--Q3
SELECT name, salary, salary + 1000 AS incremented_salary
FROM employee;

--Q4
SELECT department, SUM(salary) 
FROM employee
GROUP BY department;

--Q5
SELECT department, 
SUM(salary) AS total_salary,
MAX(salary) AS max_salary,
AVG(salary) AS avg_salary
FROM employee
GROUP BY department;

--Q6
SELECT * FROM employee
ORDER BY salary ASC;

--Q7
SELECT employee_id, name,
ROW_NUMBER() OVER() AS sequence_no
FROM employee;

--Q8
SELECT employee_id, name, salary,
RANK() OVER(ORDER BY salary DESC) AS rank_no
FROM employee;

--Q9 Q10 Q11
ALTER TABLE employee
ADD age INT DEFAULT 26 CHECK(age BETWEEN 26 AND 60);
UPDATE employee SET age = 26;

--Q12
SELECT COUNT(DISTINCT department) FROM employee;

--Q13
SELECT UPPER(name) FROM employee;

--Q14
SELECT SUBSTRING(name,1,4) FROM employee;

--Q15
SELECT name, INSTR(name,'a') FROM employee;

--Q16
SELECT department, COUNT(*) 
FROM employee
GROUP BY department;

--Q17
SELECT manager_name, COUNT(*) 
FROM employee
GROUP BY manager_name;

--Q18
SELECT * FROM employee
WHERE employee_id IN (101,102,110);

--Q19
SELECT * FROM employee
WHERE employee_id BETWEEN 100 AND 110;

--Q20
SELECT * FROM employee
WHERE department = 'HR';

--Q21
SELECT * FROM employee
WHERE department IN ('HR','Accts');

--Q22
SELECT * FROM employee
WHERE name LIKE 'A%';

__Q23
SELECT * FROM employee
WHERE name LIKE '%a%';

--Q24
SELECT department, AVG(salary)
FROM employee
GROUP BY department
HAVING AVG(salary) < 12000;

--Q25
SELECT * FROM employee
WHERE department != 'Accts'
AND salary NOT BETWEEN 10000 AND 20000;


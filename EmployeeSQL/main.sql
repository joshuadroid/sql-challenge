-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON (s.emp_no = e.emp_no);


-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > '1985-12-31' AND hire_date < '1987-1-1';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name
FROM dept_managers dm
JOIN employees e
ON (dm.emp_no = e.emp_no)
JOIN departments d
ON (d.dept_no = dm.dept_no);
-- SELECT * FROM employees WHERE emp_title_id = 'm0001' This statement = 24 rows. Checking work :) 

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emps de
ON (e.emp_no = de.emp_no)
JOIN departments d
ON (de.dept_no = d.dept_no);

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
JOIN dept_emps de
ON (e.emp_no = de.emp_no)
JOIN departments d
ON (de.dept_no = d.dept_no);

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- Run this first to create the view for the following query!

-- CREATE VIEW sales_and_dev_emps AS
-- SELECT e.emp_no, e.last_name, e.first_name
-- FROM employees e
-- WHERE emp_no IN (
-- 	SELECT emp_no
-- 	FROM dept_emps
-- 	WHERE dept_no IN (
-- 		SELECT d.dept_no
-- 		FROM departments d
-- 		WHERE d.dept_no = 'd007' OR d.dept_no = 'd005'
-- 	)
-- )

SELECT * FROM sales_and_dev_emps ORDER BY emp_no;
-- View established!
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM sales_and_dev_emps e
JOIN dept_emps de
ON (e.emp_no = de.emp_no)
JOIN departments d
ON (de.dept_no = d.dept_no)
WHERE de.dept_no = 'd007' OR de.dept_no = 'd005'
ORDER BY emp_no;


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(last_name), last_name 
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;







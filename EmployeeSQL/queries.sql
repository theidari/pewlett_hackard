----------------------------Data Analysis-----------------------------------------------
-- 1. List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e JOIN salaries s ON e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
SELECT  e.first_name, e.last_name, e.hire_date
FROM employees e 
WHERE e.hire_date BETWEEN '1986-1-1' AND '1987-1-1';

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT d.dept_no,d.dept_name, e.emp_no, e.last_name, e.first_name
FROM department d 
JOIN department_managers dm ON d.dept_no = dm.dept_no
JOIN employees e ON dm.emp_no=e.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees e 
JOIN department_employees de ON de.emp_no=e.emp_no
JOIN department d ON d.dept_no = de.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT e.first_name, e.last_name, e.sex
FROM employees e 
WHERE e.first_name='Hercules' AND e.last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN department_employees de ON de.emp_no=e.emp_no
JOIN department d ON d.dept_no = de.dept_no
WHERE d.dept_name='Sales';

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN department_employees de ON de.emp_no=e.emp_no
JOIN department d ON d.dept_no = de.dept_no
WHERE d.dept_name='Sales' OR d.dept_name='Development';

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN department_employees de ON de.emp_no=e.emp_no
JOIN department d ON d.dept_no = de.dept_no
WHERE d.dept_name in ('Sales', 'Development');

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT (last_name) AS frequency
FROM employees 
GROUP BY last_name
ORDER BY frequency DESC;
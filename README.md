<p align="left">
<img src="https://github.com/theidari/sql-challenge/blob/main/Design/header.png" width="332"><img src="https://github.com/theidari/sql-challenge/blob/main/Design/project_overview.png" width="128"><img src="https://github.com/theidari/sql-challenge/blob/main/Design/code.png" width="128"><img src="https://github.com/theidari/sql-challenge/blob/main/Design/result.png" width="128">
<img src="https://github.com/theidari/sql-challenge/blob/main/Design/reference.png" width="96">
</p>
<p align="center">
<img src="https://github.com/theidari/sql-challenge/blob/main/Design/purple_break_line.png" width="900">
</p>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This Project discusses an exploration on the people database who employed at Pewlett Hackard (a fictional company) during the <b>1980s</b> and <b>1990s</b>. There are only six CSV records remaining in the employee database from that period.

<p align="center">
$\space \mathbf{\color{purple}\langle}\space \mathbf{\color{purple}Objective}\space \mathbf{\color{purple}\rangle}$</br>
Design the tables to store the data from the CSV files, import the CSV files into a SQL database, and then answer data-related questions in 
$\space \mathtt{\color{purple}1.}$ Data Modeling
$\space \mathtt{\color{purple}2.}$ Data Engineering
$\space \mathtt{\color{purple}3.}$ Data Analysis
parts.
</p>

<h4>Methods, Software and Attribution</h4>

<p align="left">
<img src="https://github.com/theidari/sql-challenge/blob/main/Design/project_overview2%20.png" width="120px"">
</p>

<a href="https://en.wikipedia.org/wiki/Entity%E2%80%93relationship_model"><b>Entity-Relationship Diagrams (ERD)</b></a> was used as basic modeling technique in this project. This technique was performed using <a href="https://www.quickdatabasediagrams.com/"><b>QUICK DBD</b></a> app. ERD identified six employee database entities such as $\space \mathsf{\color{purple}Employees}$, $\space \mathsf{\color{purple}Department} \space \mathsf{\color{purple}Employees}$, $\space \mathsf{\color{purple}Department} \space \mathsf{\color{purple}Managers}$, $\space \mathsf{\color{purple}Salaries}$, $\space \mathsf{\color{purple}Titles}$, $\space \mathsf{\color{purple}Department}$. The result of the modeling was drawn in figure [1].

<p align="center">
<img src="https://raw.githubusercontent.com/theidari/sql-challenge/b19249f89ee566387a579f1f07daf2cdfa4573f5/OutputData/Data%20Modeling%20(Entity%20Relationship%20Diagram)/Pewlett_Hackard_ERD.svg" width="760px" height="500px">
</p>

Data Analysis:

1. List the employee number, last name, first name, sex, and salary of each employee
```SQL
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e JOIN salaries s ON e.emp_no = s.emp_no;
```
2. List the first name, last name, and hire date for the employees who were hired in 1986
```SQL
SELECT  e.first_name, e.last_name, e.hire_date
FROM employees e 
WHERE e.hire_date BETWEEN '1986-1-1' AND '1987-1-1';
```
3. List the manager of each department along with their department number, department name, employee number, last name, and first name
```SQL
SELECT d.dept_no,d.dept_name, e.emp_no, e.last_name, e.first_name
FROM department d 
JOIN department_managers dm ON d.dept_no = dm.dept_no
JOIN employees e ON dm.emp_no=e.emp_no;
```
4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name
```SQL
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees e 
JOIN department_employees de ON de.emp_no=e.emp_no
JOIN department d ON d.dept_no = de.dept_no;
```
5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
```SQL
SELECT e.first_name, e.last_name, e.sex
FROM employees e 
WHERE e.first_name='Hercules' AND e.last_name LIKE 'B%';
```
6. List each employee in the Sales department, including their employee number, last name, and first name
```SQL
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN department_employees de ON de.emp_no=e.emp_no
JOIN department d ON d.dept_no = de.dept_no
WHERE d.dept_name='Sales';
```
7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
```SQL
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN department_employees de ON de.emp_no=e.emp_no
JOIN department d ON d.dept_no = de.dept_no
WHERE d.dept_name in ('Sales', 'Development');
```
8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
```SQL
SELECT last_name, COUNT (last_name) AS frequency
FROM employees 
GROUP BY last_name
ORDER BY frequency DESC;
```

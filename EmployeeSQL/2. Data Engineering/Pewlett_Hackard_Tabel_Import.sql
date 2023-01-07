-------------------------Creat Table and Import Data From .csv Files-------------------------
---------------------------------Creat Data Import Directory---------------------------------
CREATE PROCEDURE data_import(tablename varchar,variable varchar)
LANGUAGE plpgsql
AS $$
DECLARE
---------------------------------------------------------------------------------------------
--      Before run, modify the csv path to the location of the csv files on your system.   --
---------------------------------------------------------------------------------------------
tabdir varchar = 'C:\Users\Public\Downloads\sql-challenge\Resources\'; 
dir varchar = CONCAT(tabdir,variable,'.csv');
BEGIN
EXECUTE format('COPY %I FROM %L DELIMITER '','' CSV HEADER',tablename,dir);
END; $$

-------------------------------------- Departments Table ------------------------------------
-- Creat a Departments Table
CREATE TABLE department (
	dept_no varchar(4) PRIMARY KEY NOT NULL,
	dept_name varchar(30) NOT NULL);
--Import Departments Data from .csv File
CALL data_import('department','departments')
--Departments Table View
SELECT*FROM department

---------------------------------------- Titles Table ---------------------------------------
-- Creat a Titles Table
CREATE TABLE titles (
    title_id char(5) PRIMARY KEY NOT NULL,
    title varchar(30) NOT NULL);
--Import Titles Data from .csv File
CALL data_import('titles','titles')
--Titles Table View
SELECT*FROM titles

--------------------------------------- Employees Table -------------------------------------
-- Creat a Employees Table
CREATE TABLE employees (
    emp_no int PRIMARY KEY NOT NULL,
    emp_title_id char(5)   NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
    birth_date date   NOT NULL,
    first_name varchar(255)   NOT NULL,
    last_name varchar(255)   NOT NULL,
    sex char(1)   NOT NULL,
    hire_date date   NOT NULL);
--Import Employees Data from .csv File
CALL data_import('employees','employees')
--Employees Table View
SELECT*FROM employees
		
----------------------------------- Department Employees Table ------------------------------
-- Creat a Departments Employees Table
CREATE TABLE department_employees (
    emp_no int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no char(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department (dept_no));
--Import Departments Employees Data from .csv File
CALL data_import('department_employees','dept_emp')
--Departments Employees Table View
SELECT*FROM department_employees

------------------------------------- Department Managers Table -----------------------------
-- Creat a Departments Managers Table
CREATE TABLE department_managers (
    dept_no char(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department (dept_no),
	emp_no int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
--Import Departments Managers Data from .csv File
CALL data_import('department_managers','dept_manager')
--Departments Managers Table View
SELECT*FROM department_managers

----------------------------------------- Salaries Table -------------------------------------
-- Creat a Salaries Table
CREATE TABLE salaries (
    emp_no int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary int NOT NULL);
--Import Salaries Data from .csv File
CALL data_import('salaries','salaries')
--Salaries Table View
SELECT*FROM salaries
----------------------------------------------------------------------------------------------

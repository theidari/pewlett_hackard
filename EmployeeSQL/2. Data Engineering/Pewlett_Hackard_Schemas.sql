-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Pewlett Hackard Entity Relationship Diagram (ERD)
-- sql challenge - U of T Data Analytics Boot Camp
CREATE TABLE "Department" (
    -- Department Number "Primary Keys, A FIXED length string e.g. d001"
    "dept_no" CHAR(4)   NOT NULL,
    -- Department Name "A VARIABLE length string e.g. Marketing"
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Department_Employees" (
    -- Employees Number "Foreign Keys, Share unique keys with Employees.emp_no one TO one"
    "emp_no" INT   NOT NULL,
    -- Department Number "Foreign Keys, Share unique keys with Department.dept_no many TO one"
    "dept_no" CHAR(4)   NOT NULL
);

CREATE TABLE "Department_Managers" (
    -- Employees Number "Foreign Keys, Share unique keys with Employees.emp_no many TO one"
    "emp_no" INT   NOT NULL,
    -- Department Number "Foreign Keys, Share unique keys with Department.dept_no many TO one"
    "dept_no" CHAR(4)   NOT NULL
);

CREATE TABLE "Salaries" (
    -- Employees Number  "Foreign Keys, Share unique keys with Employees.emp_no one TO one"
    "emp_no" INT   NOT NULL,
    -- Employees salary "Integer e.g. 54916"
    "salary" INT   NOT NULL
);

CREATE TABLE "Employees" (
    -- Employees Number "Primary Keys, Integer e.g. 475053"
    "emp_no" INT   NOT NULL,
    -- Employees title ID "Foreign Keys, Share unique keys with Titles.title_id many TO one"
    "emp_title_id" CHAR(5)   NOT NULL,
    -- Employees date of birth "A date. Format: MM/DD/YYYY"
    "birth_date" DATE   NOT NULL,
    -- Employees first name "A VARIABLE length string e.g. Berry"
    "first_name" VARCHAR(255)   NOT NULL,
    -- Employees first name "A VARIABLE length string e.g. Babb"
    "last_name" VARCHAR(255)   NOT NULL,
    -- Employees gender "A string e.g. M"
    "sex" CHAR(1)   NOT NULL,
    -- Employees hiring date "A date. Format: MM/DD/YYYY"
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Titles" (
    -- Employees title ID "Primary Keys, A FIXED length string e.g. e0002"
    "title_id" CHAR(5)   NOT NULL,
    -- Employees title Name "A VARIABLE length string e.g. Technique Leader"
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "Department_Managers" ADD CONSTRAINT "fk_Department_Managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Department_Managers" ADD CONSTRAINT "fk_Department_Managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");


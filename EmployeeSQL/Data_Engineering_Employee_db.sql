-- Create the required tables in the order as below:

-- Create "titles" table
CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARCHAR(20) NOT NULL
);

-- Create "departments" table
CREATE TABLE departments (
	dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(20) NOT NULL
);

-- Create "employees" table
CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(15) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Create "salaries" table
CREATE TABLE salaries (
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create "dept_manager" table
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT PRIMARY KEY NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create "dept_emp" table
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Check if the tables are created as expected
SELECT * FROM titles;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;

-- Loading data: Import all the csv files into the corresponding tables, in the same order as table creation (in the following order):
-- titles
-- departments
-- temp_emp/employees (follow the steps below to avoid errors because of the date formatting)
-- salaries
-- dept_manager
-- dept_emp

-- Loading "employees" table:
-- Create a staging table to upload the dates as text. 
CREATE TABLE temp_emp (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date TEXT NOT NULL,
	first_name VARCHAR(15) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date TEXT NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Check if the staging table is created as expected.
SELECT * FROM temp_emp;

-- Import the employees.csv file into the temporary table created above.

-- Check if data is loaded as expected in the temporary table.
SELECT * FROM temp_emp;

-- Copy the data from the staging table in the required format to the employees table.
INSERT INTO employees (emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
SELECT emp_no, emp_title_id, to_date(birth_date, 'MM/DD/YYYY'), first_name, last_name, sex, to_date(hire_date, 'MM/DD/YYYY')
FROM temp_emp;

-- Check if the data is uploaded in the correct format.
SELECT * FROM employees LIMIT 100;

-- Drop the temporarily created table.
DROP TABLE temp_emp;

-- After importing all csv files, check the tables to see if the data are loaded as expected.
SELECT * FROM titles;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
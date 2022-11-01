# Sql_Challenge
Employee Database: A Mystery in Two Parts

This challenge is to do a research project about people whom Pewlett Hackard (a fictional company) employed during the 1980s and 1990s. The data are available in 6 CSV files. 

This Challenge is divided into three parts: data modeling, data engineering, and data analysis.

## Data Modeling
The following ERD is created based on the data available in the 6 CSV files:
![image](https://user-images.githubusercontent.com/111614210/199314476-d63cd12b-405c-4dfd-8e35-c1e89de8da68.png)

The ERD and Schema documentation can be found in **ERD_Employee_db.png** and **Employee Schema.pdf**.

## Data Engineering
As part of this activity, the following activities were performed using PostgreSQL:
1) Created the database Employee_db.
2) Created the following tables in the database based on the input csv files:
    - titles
    - departments
    - employees
    - salaries
    - dept_manager
    - dept_emp
3) Loaded the tables above, with the data from csv files.
4) The employees csv files had inconsistently formatted date values. So in order to avoid issues, the following was done:
    - A staging table (temp-emp) was created to upload the dates as text.
    - Loaded the data on to the staging table.
    - Copied the data from the staging table in the required format to the employees table.
    - Dropped the staging table after successfully loading the employee table.
    
The sql used to create the tables in the database can be found in **Data_Engineering_Employee_db.sql**

## Data Analysis
The following were analysed by quering the database:
1)  List the employee number, last name, first name, sex, and salary of each employee.
    ![image](https://user-images.githubusercontent.com/111614210/199320429-20510a2d-9e35-44a2-93e5-15e76f1b6a67.png)

2)  List the first name, last name, and hire date for the employees who were hired in 1986.
    ![image](https://user-images.githubusercontent.com/111614210/199320728-7470d78f-10b6-436a-a83f-fd1711ed87be.png)
  
3)  List the manager of each department along with their department number, department name, employee number, last name, and first name.
    ![image](https://user-images.githubusercontent.com/111614210/199321247-b6537dc5-6e2a-4246-9f5d-3d166b334660.png)

4)  List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
    ![image](https://user-images.githubusercontent.com/111614210/199321555-28504cb2-f4f0-4d7c-89ef-409a589dae0f.png)

5)  List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
    ![image](https://user-images.githubusercontent.com/111614210/199321791-438433e1-26a6-4fbf-b964-b1b340edab52.png)

6)  List each employee in the Sales department, including their employee number, last name, and first name.
    ![image](https://user-images.githubusercontent.com/111614210/199322068-c83d22b3-b32e-44d9-9d65-fdad1fe2c2c4.png)

7)  List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
    ![image](https://user-images.githubusercontent.com/111614210/199322332-b96e7c3f-00d8-49ac-b239-47ad806637da.png)

8)  List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
    ![image](https://user-images.githubusercontent.com/111614210/199322553-5fe91078-8cd5-4395-b61b-f33944e5341d.png)

The sql used for data analysis can be found in **Data_Analysis_Employee_db.sql**

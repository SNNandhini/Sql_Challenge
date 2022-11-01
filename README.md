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


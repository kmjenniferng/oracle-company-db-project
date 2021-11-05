# Company Database Project


The purpose of this project is to 
1. create a company database by using Oracle Database Express Edition
2. create reports based on the data in company database

### 1.1 Install Company Database Schemas
To install company database schemas, run **create_company_db_tables.sql** and **insert_company_db_data.sql** files in SQL Plus terminal.

```
@create_company_db_tables.sql
@insert_company_db_data.sql
```

### 1.2 Company Schema Diagram
In company database, we have 5 tables

**EMPLOYEE** (*ID, FIRST_NAME, LAST_NAME, BIRTH_DATE, SEX, SALARY, **SUPERVISOR_ID, **BRANCH_ID)
- employee table stores all employee data including employee id, first name, last name, birth date, sex, salary, supervior employee id and branch id.

**BRANCH** (*ID, NAME, **MANAGER_ID, MANAGER_START_DATE)
- branch table stores all the information related to a branch including branch id, branch name, branch manager employee id, branch manager start date.

**CLIENT** (*ID, NAME, **BRANCH_ID)
- client table stores all the information related to a client including client id, client name, branch id that each client belongs to.

**BRANCH_SUPPLIER** (*BRANCH_ID, *SUPPLIER_NAME, SUPPLY_TYPE)
- branch_supplier table stores all the supplier information including supplier name and supply type that a branch works with.

**WORKS_WITH** (*EMPLOYEE_ID, *CLIENT_ID, TOTAL_SALES)
- works_with table store the total sales for each employee based on the client that he/she works with.

*Primary key
**Foreign key

For more details, please see [company schema diagram](https://github.com/kmjenniferng/oracle-company-db-project/blob/main/company_db_table_details.pdf)

### 2.1 Create an employee data report
To create an employee data report, run **create_employee_data_report.sql** file in SQL Developer.

```
select emp.id as "EMPLOYEE_ID",
emp.first_name, emp.last_name, emp.birth_date, emp.sex, 
branch.name as "BRANCH_NAME",
manager.first_name || ' ' || manager.last_name as "MANAGER_NAME"
from employee emp
left join branch on (emp.branch_id = branch.id)
left join employee manager on (emp.supervisor_id = manager.id);
```
This [report](https://github.com/kmjenniferng/oracle-company-db-project/blob/main/employees_data_report.xls) will show all the related data of each employee including employee id, employee first name, employee last name, birth date, sex, a branch that an employee belongs to, manager name of each employee.


### 2.2 Create a yearly report to show total sales of each employee has with client details
To create a yearly report to show total sales, run **create_yearly_report_total_sales_employee_with_client_details.sql** file in SQL Developer.

```
select emp.id as "EMPLOYEE_ID",
emp.first_name, emp.last_name,
branch.name as "BRANCH_NAME",
manager.first_name || ' ' || manager.last_name as "MANAGER_NAME",
emp_total_sales.client_name,
emp_total_sales.total_sales
from employee emp
left join branch on (emp.branch_id = branch.id)
left join employee manager on (emp.supervisor_id = manager.id)
left join (
select works_with.employee_id, client.name as client_name, works_with.total_sales
from works_with, client
where works_with.client_id = client.id) emp_total_sales on (emp_total_sales.employee_id = emp.id)
order by emp.id;
```
This yearly [report](https://github.com/kmjenniferng/oracle-company-db-project/blob/main/employees_total_sales_with_client_details_yearly_report.xls) will show employee id, employee first name, employee last name, a branch that an employee belongs to, manager name of each employee, client name, total sales of each employee has.


### 2.3 Create a yearly report to show sum of total sales for each employee
To create a yearly report to show sum of total sales for each employee, run **create_yearly_report_sum_total_sales_employee.sql** file in SQL Developer.

```
select emp.id as "EMPLOYEE_ID",
emp.first_name, emp.last_name,
branch.name as "BRANCH_NAME",
manager.first_name || ' ' || manager.last_name as "MANAGER_NAME",
emp_total_sales.total_sales as "SUM_OF_TOTAL_SALES"
from employee emp
left join branch on (emp.branch_id = branch.id)
left join employee manager on (emp.supervisor_id = manager.id)
left join (select employee_id, sum(total_sales) as total_sales
from works_with group by employee_id) emp_total_sales on (emp.id = emp_total_sales.employee_id);
```
This yearly [report](https://github.com/kmjenniferng/oracle-company-db-project/blob/main/employees_sum_of_total_sales_yearly_report.xls) will show employee id, employee first name, employee last name, a branch that an employee belongs to, manager name of each employee, sum of total sales for each employee has.

-- Create employees data report

select emp.id as "EMPLOYEE_ID",
emp.first_name, emp.last_name, emp.birth_date, emp.sex, 
branch.name as "BRANCH_NAME",
manager.first_name || ' ' || manager.last_name as "MANAGER_NAME"
from employee emp
left join branch on (emp.branch_id = branch.id)
left join employee manager on (emp.supervisor_id = manager.id);

-- Create employees total sales yearly report with client details

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

-- Create sum of total sales for employees yearly report

select emp.id as "EMPLOYEE_ID",
emp.first_name, emp.last_name, emp.birth_date, emp.sex, 
branch.name as "BRANCH_NAME",
manager.first_name || ' ' || manager.last_name as "MANAGER_NAME",
emp_total_sales.total_sales
from employee emp
left join branch on (emp.branch_id = branch.id)
left join employee manager on (emp.supervisor_id = manager.id)
left join (select employee_id, sum(total_sales) as total_sales
from works_with group by employee_id) emp_total_sales on (emp.id = emp_total_sales.employee_id);
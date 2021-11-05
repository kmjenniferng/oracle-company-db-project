-- Create a yearly report to show total sales of each employee with client details

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
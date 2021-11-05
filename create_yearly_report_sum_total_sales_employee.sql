-- Create yearly report to show sum of the total sales for each employee

select emp.id as "EMPLOYEE_ID",
emp.first_name, emp.last_name,
branch.name as "BRANCH_NAME",
manager.first_name || ' ' || manager.last_name as "MANAGER_NAME",
emp_total_sales.total_sales
from employee emp
left join branch on (emp.branch_id = branch.id)
left join employee manager on (emp.supervisor_id = manager.id)
left join (select employee_id, sum(total_sales) as total_sales
from works_with group by employee_id) emp_total_sales on (emp.id = emp_total_sales.employee_id);
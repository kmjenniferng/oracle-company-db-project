-- Create employees data report

select emp.id as "EMPLOYEE_ID",
emp.first_name, emp.last_name, emp.birth_date, emp.sex, 
branch.name as "BRANCH_NAME",
manager.first_name || ' ' || manager.last_name as "MANAGER_NAME"
from employee emp
left join branch on (emp.branch_id = branch.id)
left join employee manager on (emp.supervisor_id = manager.id);
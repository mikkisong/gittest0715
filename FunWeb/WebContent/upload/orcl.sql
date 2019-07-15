select last_name, salary
from employees
where salary > (select salary from employees where last_name = 'Abel');

select last_name, job_id, salary
from employees
where salary = (select MIN(salary) from employees);

select department_id, min(salary)
from employees
group by department_id
having min(salary) > (select min(salary) from employees where department_id = 50)
order by department_id


select a.last_name, a.salary, a.department_id, to_char(b.salavg, '$99,999')
from employees a join (select department_id, avg(salary) salavg from employees group by department_id) b
on a.department_id = b.department_id
and a.salary > b.salavg;


select avg(salary) 
from employees


select employee_id, last_name, salary
from employees
where salary >=  (select avg(salary) from employees)
order by salary asc
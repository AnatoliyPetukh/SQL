--1. Display all employees whose salaries are in the database, along with their salaries
--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами

select employees.employee_name, salary.monthly_salary
from employee_salary 
inner join employees on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id;

-- 2. Display all employees whose salary is less than 2000
-- 2. Вывести всех работников у которых ЗП меньше 2000

select employees.employee_name, salary.monthly_salary
from employee_salary 
inner join employees on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where salary.monthly_salary<2000;

--3. Display all salary positions for which no employee is assigned. (There is a salary, but it is not clear who receives it.)
--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select salary.monthly_salary, employee_salary.employee_id 
from salary 
left join employee_salary on salary.id = employee_salary.salary_id
where employee_salary.employee_id is null;

-- 4. Display all salary positions less than 2000 for which no employee is assigned (There is a salary, but it is not clear who receives it)
-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен (ЗП есть, но не понятно кто её получает)

select salary.monthly_salary, employee_salary.employee_id 
from salary 
left join employee_salary on salary.id = employee_salary.salary_id
where employee_salary.employee_id is null and salary.monthly_salary < 2000;

-- 5. Find all employees who have not been paid their salary
-- 5. Найти всех работников кому не начислена ЗП

select employees.employee_name , employee_salary.salary_id 
from employees 
left join employee_salary on employees.id  = employee_salary.employee_id
where employee_salary.salary_id  is null;

-- 6. Display all employees with their job titles
-- 6. Вывести всех работников с названиями их должности

select employees.employee_name , roles.role_name 
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id;

-- 7. Display names and job titles only for Java developers
-- 7. Вывести имена и должность только Java разработчиков

select employees.employee_name , roles.role_name 
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
where roles.role_name ilike '%java%';

-- 8. Display names and job titles only for Python developers
-- 8. Вывести имена и должность только Python разработчиков

select employees.employee_name , roles.role_name 
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
where roles.role_name ilike '%python%';

-- 9. Display names and job titles of all QA engineers
-- 9. Вывести имена и должность всех QA инженеров

select employees.employee_name , roles.role_name 
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
where roles.role_name ilike '%qa%';

-- 10. Display names and job titles of manual QA engineers
-- 10. Вывести имена и должность ручных QA инженеров

select employees.employee_name , roles.role_name 
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
where roles.role_name ilike '%qa%' and roles.role_name ilike '%manual%';

-- 11. Display names and job titles of QA automation specialists
-- 11. Вывести имена и должность автоматизаторов QA

select employees.employee_name , roles.role_name 
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
where roles.role_name ilike '%qa%' and roles.role_name ilike '%automation%';

-- 12. Display names and salaries of Junior specialists.
-- 12. Вывести имена и зарплаты Junior специалистов

select employees.employee_name , salary.monthly_salary
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where roles.role_name ilike '%junior%';

-- 13. Display names and salaries of Middle specialists
-- 13. Вывести имена и зарплаты Middle специалистов

select employees.employee_name , salary.monthly_salary
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where roles.role_name ilike '%middle%';

-- 14. Display names and salaries of Senior specialists
-- 14. Вывести имена и зарплаты Senior специалистов

select employees.employee_name , salary.monthly_salary
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where roles.role_name ilike '%senior%';

-- 15. Display salaries of Java developers
-- 15. Вывести зарплаты Java разработчиков

select salary.monthly_salary
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where roles.role_name ilike '%java%';

-- 16. Display salaries of Python developers.
-- 16. Вывести зарплаты Python разработчиков

select salary.monthly_salary
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where roles.role_name ilike '%python%';

-- 17. Display names and salaries of Junior Python developers
-- 17. Вывести имена и зарплаты Junior Python разработчиков

select employees.employee_name , salary.monthly_salary
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where roles.role_name ilike '%junior%' and roles.role_name ilike '%python%';

-- 18. Display names and salaries of Middle JS developers
-- 18. Вывести имена и зарплаты Middle JS разработчиков

select employees.employee_name , salary.monthly_salary
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where roles.role_name ilike '%middle%' and roles.role_name ilike '%j%s%';

-- 19. Display names and salaries of Senior Java developers
-- 19. Вывести имена и зарплаты Senior Java разработчиков

select employees.employee_name , salary.monthly_salary
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where roles.role_name ilike '%senior%' and roles.role_name ilike '%java%';

-- 20. Display salaries of Junior QA engineers
-- 20. Вывести зарплаты Junior QA инженеров

select salary.monthly_salary
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where roles.role_name ilike '%junior%' and roles.role_name ilike '%qa%';

-- 21. Display the average salary of all Junior specialists
-- 21. Вывести среднюю зарплату всех Junior специалистов

select avg(salary.monthly_salary)
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where roles.role_name ilike '%junior%';

-- 22. Display the sum of salaries of JS developers
-- 22. Вывести сумму зарплат JS разработчиков

select sum(salary.monthly_salary)
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where roles.role_name ilike '%j%s%';

-- 23. Display the minimum salary of QA engineers
-- 23. Вывести минимальную ЗП QA инженеров

select min(salary.monthly_salary)
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where roles.role_name ilike '%qa%';

-- 24. Display the maximum salary of QA engineers
-- 24. Вывести максимальную ЗП QA инженеров

select max(salary.monthly_salary)
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where roles.role_name ilike '%qa%';

-- 25. Display the number of QA engineers
-- 25. Вывести количество QA инженеров

select count(employees.employee_name)
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where roles.role_name ilike '%qa%';

-- 26. Display the number of Middle specialists
-- 26. Вывести количество Middle специалистов

select count(employees.employee_name)
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where roles.role_name ilike '%middle%';

-- 27. Display the number of developers
-- 27. Вывести количество разработчиков

select count(employees.employee_name)
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where roles.role_name ilike '%dev%';

-- 28. Display the total salary fund of developers
-- 28. Вывести фонд (сумму) зарплаты разработчиков

select sum(salary.monthly_salary)
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where roles.role_name ilike '%dev%';

-- 29. Display names, job titles, and salaries of all specialists in ascending order
-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select employees.employee_name , roles.role_name , salary.monthly_salary 
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
order by salary.monthly_salary asc;

-- 30. Display names, job titles, and salaries of all specialists in ascending order for specialists with salaries between 1700 and 2300.
-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select employees.employee_name , roles.role_name , salary.monthly_salary 
from employees inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where salary.monthly_salary between 1700 and 2300
order by salary.monthly_salary asc;

-- 31. Display names, job titles, and salaries of all specialists in ascending order for specialists with salaries less than 2300
-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employees.employee_name , roles.role_name , salary.monthly_salary 
from employees inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where salary.monthly_salary < 2300
order by salary.monthly_salary asc;

-- 32. Display names, job titles, and salaries of all specialists in ascending order for specialists with salaries of 1100, 1500, and 2000
-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select employees.employee_name , roles.role_name , salary.monthly_salary 
from employees 
inner join roles_employee on employees.id = roles_employee.employee_id
inner join roles on roles.id = roles_employee.role_id
inner join employee_salary on employees.id = employee_salary.employee_id
inner join salary on salary.id = employee_salary.salary_id
where salary.monthly_salary in (1100,1500,2000)
order by salary.monthly_salary asc;
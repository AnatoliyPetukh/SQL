-- Создать таблицу employees
-- id. serial,  primary key,
-- employee_name. Varchar(50), not null

create table employees(
id serial primary key,
employee_name varchar(50) not null
)

select * from employees;

-- Наполнить таблицу employee 70 строками

insert into employees (employee_name)
values ('John Doe'),
       ('Jane Smith'),
       ('Bob Johnson'),
       ('Alice Lee'),
       ('Tom Brown'),
       ('Mary Chen'),
       ('Frank Kim'),
       ('Julia Park'),
       ('David Lee'),
       ('Sarah Jones'),
       ('Kevin Wang'),
       ('Emily Kim'),
       ('Samuel Lee'),
       ('Olivia Davis'),
       ('Ethan Smith'),
       ('Sophie Kim'),
       ('Jacob Lee'),
       ('Grace Chen'),
       ('Mia Kim'),
       ('Luke Chen'),
       ('Lily Kim'),
       ('Daniel Lee'),
       ('Hannah Lee'),
       ('Andrew Kim'),
       ('Nora Chen'),
       ('Michael Kim'),
       ('Luna Kim'),
       ('Matthew Lee'),
       ('Evelyn Kim'),
       ('Anthony Kim'),
       ('Jasmine Chen'),
       ('Christopher Lee'),
       ('Mila Kim'),
       ('Leo Kim'),
       ('Victoria Chen'),
       ('William Lee'),
       ('Ava Kim'),
       ('Ryan Kim'),
       ('Isabella Chen'),
       ('Charles Lee'),
       ('Sophia Kim'),
       ('Alex Lee'),
       ('Ella Chen'),
       ('Henry Kim'),
       ('Chloe Kim'),
       ('Nicholas Lee'),
       ('Avery Kim'),
       ('Adam Lee'),
       ('Emma Chen'),
       ('Joseph Kim'),
       ('Audrey Kim'),
       ('George Lee'),
       ('Elizabeth Chen'),
       ('Daniel Kim'),
       ('Zoe Kim'),
       ('James Lee'),
       ('Madison Kim'),
       ('Benjamin Kim'),
       ('Aria Chen'),
       ('Joshua Lee'),
       ('Sofia Kim'),
       ('David Kim'),
       ('Aaliyah Kim'),
       ('William Kim'),
       ('Arianna Chen'),
       ('Jacob Kim'),
       ('Aurora Kim'),
       ('Alexander Lee'),
       ('Scarlett Chen'),
       ('Eric Kim');
      
-- Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null
       
create table salary(
id serial primary key,
monthly_salary int not null
);

-- Наполнить таблицу salary 15 строками: 
-- 1000
-- 1100
-- 1200
-- 1300
-- 1400
-- 1500
-- 1600
-- 1700
-- 1800
-- 1900
-- 2000
-- 2100
-- 2200
-- 2300
-- 2400
-- 2500

insert into salary (monthly_salary)
select generate_series(1000, 2500, 100);

select * from salary;

drop table roles cascade;

-- Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_id. Int, not null

create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null
);

select * from employee_salary;

-- Наполнить таблицу employee_salary 40 строками:
-- в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary (employee_id, salary_id)
values (1, 3),
    (2, 14),
    (3, 6),
    (4, 10),
    (5, 9),
    (6, 11),
    (7, 6),
    (8, 4),
    (9, 6),
    (10, 2),
    (11, 15),
    (12, 8),
    (13, 7),
    (14, 1),
    (15, 15),
    (16, 3),
    (17, 9),
    (18, 6),
    (19, 8),
    (20, 11),
    (21, 2),
    (22, 4),
    (23, 12),
    (24, 4),
    (25, 6),
    (26, 9),
    (27, 10),
    (28, 11),
    (29, 7),
    (30, 1),
    (71, 3),
    (72, 14),
    (73, 6),
    (74, 10),
    (75, 9),
    (76, 11),
    (77, 6),
    (78, 4),
    (79, 6),
    (80, 2);
   
   drop table employee_salary cascade

-- Создать таблицу roles
-- id. Serial  primary key,
-- role_name. int, not null, unique
   
create table roles(
id serial primary key,
role_name int unique not null
)

select * from roles

-- Поменять тип столба role_name с int на varchar(30)

alter table roles
alter column role_name type varchar(30);

-- Наполнить таблицу roles 20 строками

insert into roles (role_name)
values ('Junior Python developer'),
    ('Middle Python developer'),
    ('Senior Python developer'),
    ('Junior Java developer'),
    ('Middle Java developer'),
    ('Senior Java developer'),
    ('Junior JavaScript developer'),
    ('Middle JavaScript developer'),
    ('Senior JavaScript developer'),
    ('Junior Manual QA engineer'),
    ('Middle Manual QA engineer'),
    ('Senior Manual QA engineer'),
    ('Project Manager'),
    ('Designer'),
    ('HR'),
    ('CEO'),
    ('Sales manager'),
    ('Junior Automation QA engineer'),
    ('Middle Automation QA engineer'),
    ('Senior Automation QA engineer');
   
-- Создать таблицу roles_employee
-- id. Serial  primary key,
-- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
   
create table roles_employee(
id serial primary key,
employee_id int unique not null,
role_id int not null,
foreign key (employee_id)
	references employees(id),
foreign key (role_id)
	references roles(id)
)

drop table roles_employee cascade

select * from roles_employee

-- Наполнить таблицу roles_employee 40 строками:

insert into roles_employee (employee_id,role_id)
values (5, 7),
(12, 3),
(45, 17),
(22, 11),
(68, 18),
(1, 4),
(50, 14),
(29, 2),
(62, 9),
(39, 16),
(6, 2),
(18, 8),
(43, 10),
(60, 13),
(21, 18),
(3, 6),
(30, 7),
(55, 12),
(11, 1),
(24, 6),
(64, 15),
(37, 3),
(8, 17),
(56, 13),
(27, 1),
(57, 16),
(34, 2),
(42, 8),
(69, 10),
(17, 14),
(9, 19),
(26, 11),
(48, 19),
(52, 1),
(67, 5),
(19, 5),
(25, 4),
(33, 9),
(59, 12),
(13, 12);

select employees.employee_name, salary.monthly_salary
from ((employee_salary inner join employees on employees.id = employee_salary.employee_id)
inner join salary on salary.id = employee_salary.salary_id);

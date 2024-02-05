create table employees
(
    id   serial primary key,
    name varchar(255)
);

create table departments
(
    id       serial primary key,
    name     varchar(255),
    employee_id int references employees (id)
);

insert into employees(name)
    values ('Employee 1'),
           ('Employee 2'),
           ('Employee 3'),
           ('Employee 4'),
           ('Employee 5'),
           ('Employee 6'),
           ('Employee 7');

insert into departments(name, employee_id)
    values ('Department 1', 1),
           ('Department 2', 2),
           ('Department 3', 3),
           ('Department 4', null),
           ('Department 5', null),
           ('Department 6', 4),
           ('Department 6', 5),
           ('Department 6', 6),
           ('Department 5', 7);

/* inner join */
select * from departments join employees e on e.id = departments.employee_id order by departments.name;

/* 2. Выполнить запросы с left, right, full, cross соединениями */
/* left join, all departments */
select * from departments d
                  left join employees e on d.employee_id = e.id;

/* left join, all employee */
select * from employees e
          left join departments d on e.id = d.employee_id;

/* right join, employee */
select * from departments d
          right join employees e on d.employee_id = e.id;

/* full join, all */
select * from departments d
          full join employees e on d.employee_id = e.id;

/* analog by union */
select * from departments d
          left join employees e on d.employee_id = e.id
union
select * from departments d
          right join employees e on d.employee_id = e.id;

/* cross join */
select * from departments d
          cross join employees e;

/* 3. Используя left join найти департаменты, у которых нет работников */
select * from departments d
                  left join employees e on d.employee_id = e.id
where e.id is null;

/* 4. Используя left и right join написать запросы, которые давали бы одинаковый результат */
select d.name, e.name from employees e
                  left join departments d on e.id = d.employee_id order by d.name;

select d.name, e.name from departments d
                  right join employees e on d.employee_id = e.id order by d.name;
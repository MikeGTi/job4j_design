create table if not exists companies
(
    id   int primary key,
    city text
);

create table if not exists goods
(
    id         int primary key,
    name       text,
    company_id int references companies (id),
    price      int
);

create table if not exists sales_managers
(
    id          int primary key,
    last_name   text,
    first_name  text,
    company_id  int references companies (id),
    manager_fee int
);

create table if not exists managers
(
    id         int primary key,
    company_id int references companies (id)
);

insert into companies
values (1, 'Москва'),
       (2, 'Нью-Йорк'),
       (3, 'Мюнхен');

insert into goods
values (1, 'Небольшая квартира', 3, 5000),
       (2, 'Квартира в центре', 1, 4500),
       (3, 'Квартира у метро', 1, 3200),
       (4, 'Лофт', 2, 6700),
       (5, 'Загородный дом', 2, 9800);

insert into sales_managers
values (1, 'Доу', 'Джон', 2, 2250),
       (2, 'Грубер', 'Ганс', 3, 3120),
       (3, 'Смит', 'Сара', 2, 1640),
       (4, 'Иванов', 'Иван', 1, 4500),
       (5, 'Купер', 'Грета', 3, 2130);

insert into managers
values (1, 2),
       (2, 3),
       (4, 1);


/* Scalar sub-query */
select * from sales_managers
    where manager_fee > (select avg(manager_fee) from sales_managers);

select name as real_estate, price, (select avg(price) from goods) as avg_price from goods;

/* Multi-rows sub-query */
/* average freelance fee */
select avg(manager_fee) from sales_managers
    where sales_managers.id not in (select managers.id from managers);

/* freelancers list */
select concat(first_name, ' ', last_name) as name, manager_fee from sales_managers
where sales_managers.id not in (select managers.id from managers);

/* Correlated sub-query */
select city,
       (select count(*) from goods as g
        where c.id = g.company_id) as total_goods
from companies c
order by total_goods desc;

/* analog on join */
select c.city, count(g.name) as total_goods
    from companies c
join goods g on c.id = g.company_id
group by c.city
order by total_goods desc;

select first_name, last_name, manager_fee from sales_managers sm1
where sm1.manager_fee >= (select avg(manager_fee)
                          from sales_managers sm2
                          where sm2.company_id = sm1.company_id)
order by manager_fee desc;

/* Sub-query in having command */
select company_id, avg(price) as average_price
from goods
group by company_id
having avg(price) > (select max(price) from goods) / 2;

SELECT company_id, AVG(price) AS average_price
FROM goods
GROUP BY company_id
HAVING AVG(price) > (SELECT MAX(price) FROM goods) / 2;

/* Task */
create table if not exists customers
(
    id         serial primary key,
    first_name text,
    last_name  text,
    age        int,
    country    text
);

create table if not exists orders
(
    id          serial primary key,
    amount      int,
    customer_id int references customers (id)
);

insert into customers (first_name, last_name, age, country)
    values ('Name1', 'Surname1', 1, 'Country1'),
           ('Name2', 'Surname2', 2, 'Country2'),
           ('Name3', 'Surname3', 3, 'Country3'),
           ('Name4', 'Surname4', 4, 'Country4'),
           ('Name5', 'Surname5', 5, 'Country5'),
           ('Name6', 'Surname6', 6, 'Country6'),
           ('Name7', 'Surname7', 7, 'Country7'),
           ('Name8', 'Surname8', 1, 'Country1'),
           ('Name9', 'Surname9', 2, 'Country2'),
           ('Name10', 'Surname10', 3, 'Country3'),
           ('Name11', 'Surname11', 4, 'Country4'),
           ('Name12', 'Surname12', 5, 'Country5'),
           ('Name13', 'Surname13', 6, 'Country6'),
           ('Name14', 'Surname14', 7, 'Country7'),
           ('Name15', 'Surname15', 8, 'Country8');

insert into orders (amount, customer_id)
    values (3, 1),
           (0, 2),
           (1, 3),
           (5, 4),
           (6, 5),
           (4, 6),
           (1, 7),
           (1, 8),
           (2, 9),
           (0, 10),
           (2, 11),
           (0, 12),
           (3, 13),
           (9, 14);

/* 1. Min age customers list */
select concat(first_name, ' ', last_name) as full_name, age as min_age from customers c1
    where c1.age = (select min(age) from customers c2);

/* 2. Zero orders customers list */
select concat(first_name, ' ', last_name) as full_name from customers c1
    where c1.id not in (select o1.id from orders o1)
       or c1.id in (select o1.id from orders o1 where o1.amount = 0);

/* alternative join */
select concat(first_name, ' ', last_name) as full_name from customers c1
    full join
        orders o on c1.id = o.customer_id
where o.amount = 0 or o.amount is null;

alter sequence orders_id_seq restart with 1;
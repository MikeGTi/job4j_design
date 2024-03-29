/* 1. Select */
create table if not exists movies(
     id int not null primary key,
     name text,
     producer text,
     category_id int
);

create table if not exists reviews (
      review_id int PRIMARY KEY,
      review text,
      movie_id int
);

insert into movies values(1, 'name_1', 'producer_1', 1);
insert into movies values(2, 'name_2', 'producer_2', 2);
insert into movies values(3, 'name_3', 'producer_3', 3);
insert into movies values(4, 'name_4', 'producer_4', 4);
insert into movies values(5, 'name_5', 'producer_3', 1);
insert into movies values(6, 'name_6', 'producer_2', 2);
insert into movies values(7, 'name_7', 'producer_4', 3);
insert into movies values(8, 'name_8', 'producer_1', 1);
insert into movies values(9, 'name_9', 'producer_3', 2);
insert into movies values(10, 'name_10', 'producer_1', 1);

insert into reviews values(1, 'review_1', 1);
insert into reviews values(2, 'review_2', 2);
insert into reviews values(3, 'review_3', 3);
insert into reviews values(4, 'review_4', null);

select category_id, count(category_id) from movies group by category_id order by category_id;

select m.name, m.producer, r.review from movies m
    right join reviews r on m.id = r.movie_id;

create table if not exists transactions(
       id int not null primary key,
       purpose text,
       client_id int,
       amount int,
       payment_date timestamp
);

insert into transactions values(1, 'Credit', 1, 132, '2022-06-01 12:00:00');
insert into transactions values(2, 'Current payment', 2, 94, '2022-06-01 12:00:00');
insert into transactions values(3, 'Service', 3, 194, '2022-06-01 12:00:00');
insert into transactions values(4, 'Vacation', 4, 254, '2022-06-01 12:00:00');
insert into transactions values(5, 'Credit', 1, 244, '2022-06-01 12:00:00');
insert into transactions values(6, 'Current payment', 2, 114, '2022-06-01 12:00:00');
insert into transactions values(7, 'Service', 3, 178, '2022-06-01 12:00:00');
insert into transactions values(8, 'Vacation', 4, 196, '2022-06-01 12:00:00');
insert into transactions values(9, 'Credit', 1, 198, '2022-06-01 12:00:00');
insert into transactions values(10, 'Current payment', 2, 78, '2022-06-01 12:00:00');
insert into transactions values(11, 'Service', 3, 156, '2022-06-01 12:00:00');
insert into transactions values(12, 'Vacation', 4, 152, '2022-06-01 12:00:00');

-- numeric(n, m) n - total digits, m - after point
select avg(distinct amount)::numeric(5, 2) from transactions;
select purpose, avg(distinct amount)::numeric(5, 1) from transactions group by purpose order by purpose;
select sum(distinct amount) from transactions;
select purpose, sum(amount) from transactions group by purpose order by purpose desc;
select purpose, avg(amount)::numeric(4, 1), sum(amount) from transactions group by purpose order by purpose;
select purpose, max(amount)::numeric(4, 1) from transactions group by purpose order by purpose;
select * from transactions where amount between 100 and 200;
select * from transactions where amount between 80 and 190
                             and payment_date not between '2022-02-01 12:00:00' and '2022-03-01 12:00:00';

/* 2. Where */
create table if not exists customers(
    id int not null primary key,
    first_name text,
    last_name text,
    active boolean,
    email text
);

insert into customers values(1, 'Petr', 'Arsentev', true, 'parsentev@bk.ru');
insert into customers values(2, 'Andrey', 'Hincu', false, 'anincu@bk.ru');
insert into customers values(3, 'Rail', 'Shamsemuhametov', true, 'rsham@bk.ru');
insert into customers values(4, 'Elena', 'Kartashova', false, 'ekart@bk.ru');
insert into customers values(5, 'Lana', 'Sergeeva', true, 'lserg@bk.ru');
insert into customers values(6, 'Ann', 'Furs', true, 'ann@bk.ru');
insert into customers values(7, 'Anne', 'Dow', true, 'anne@bk.ru');
insert into customers values(8, 'Annie', 'Sergeeva', true, 'annie@bk.ru');

select * from customers where active = true;
select * from customers where length(first_name) > 4;
select * from customers where id <= 3;
select * from customers where length(last_name) != 8;
select * from customers where length(first_name) >= 5 and active = false;
select * from customers where first_name like 'An%' and length(first_name) between 3 and 5;

create table if not exists airplanes(
    id int not null primary key,
    model text,
    range int,
    capacity int
);

insert into airplanes1 values(1, 'Airbus-320-200', 5700, 180);
insert into airplanes1 values(2, 'Airbus-321-200', 5600, 220);
insert into airplanes1 values(3, 'Airbus-319-100', 6700, 150);
insert into airplanes1 values(4, 'Cessna 208 Caravan', 1200, 13);
insert into airplanes1 values(5, 'Boeing 777-300', 11100, 450);
insert into airplanes1 values(6, 'Boeing 767-300', 7900, 350);
insert into airplanes1 values(7, 'Boeing 737-300', 4200, 145);
insert into airplanes1 values(8, 'Sukhoi SuperJet-100', 3000, 98);
insert into airplanes1 values(9, 'Bombardier CRJ-200', 2700, 50);

select * from airplanes1 where model like 'Airbus%'; -- % - string
select * from airplanes1 where model like '___b%'; -- '_' - any symbol
select * from airplanes1 where model not like all (array['Airbus%', 'Boeing%']);
select * from airplanes1 where model not like 'Airbus%' and model not like 'Boeing%';
select * from airplanes1 where model not like 'Airbus%' and model not like 'Boeing%' limit 1;

/* 3. Join */
create table if not exists colors (
      id int primary key,
      name text
);

create table if not exists actions (
       number int primary key,
       description text,
       color_id int references colors(id)
);

insert into colors values
            (1, 'red'),
            (2, 'black'),
            (3, 'green'),
            (4, 'yellow'),
            (5, 'blue'),
            (6, 'white'),
            (7, 'brown');

insert into actions values (1, 'draw red', 1);
insert into actions values (2, 'use black hole', 2);

select name, description from colors
    join actions a on colors.id = a.color_id;

select name, description from colors
    join actions a on colors.id = a.color_id;

select id, name, number, description from colors
    left join actions a on colors.id = a.color_id;

select id, name, number, description from colors
    right join actions a on colors.id = a.color_id;

select id, name, number, description, color_id from colors
    full outer join actions a on colors.id = a.color_id;

select * from colors c
    natural join actions a;

/* https://github.com/mnickw/UGMK_Trans_test/blob/main/README.md */
/* Необходимо написать SQL запрос, который выведет все возможные сочетания для значений переменной, где n = 7 и k = 4.
   Пример: Табличная переменная @Colors:*/
with colorIdNameTable as (
    select ROW_NUMBER() over (order by c1.name) as id, c1.name from colors as c1
)

select c1.name as name1, c2.name as name2, c3.name as name3, c4.name as name4
from colorIdNameTable c1
         join colorIdNameTable c2
              on c1.id < c2.id
         join colorIdNameTable c3
              on c2.id < c3.id
         join colorIdNameTable c4
              on c3.id < c4.id;


create table if not exists cars (
                                    id int primary key,
                                    model text
);

create table if not exists engines (
                                       id int primary key,
                                       volume decimal,
                                       power int,
                                       car_id int references cars(id)
);

insert into cars values (1, 'Toyota Camry');
insert into cars values (2, 'Kia Rio');
insert into cars values (3, 'Audi A6');
insert into cars values (4, 'Renault Sandero');

insert into engines values (1234, 2.5, 181, 1);
insert into engines values (1479, 1.6, 123, null);
insert into engines values (5678, 1.2, 75, 4);
insert into engines values (5072, 3.0, 231, null);

select c.id, c.model, e.volume, e.power from cars c
      join engines e on c.id = e.car_id;

select c.id, model, e.id, volume, power from cars c
    left join engines e on c.id = e.car_id;

select c.id, model, e.id, volume, power from cars c
     right join engines e on c.id = e.car_id;

select * from cars c
      full outer join engines e on c.id = e.car_id;

select c.model, e.volume, e.power from cars c
    natural left join engines e;

select * from cars c
    natural right join engines e;

create table if not exists accounts (
    id int primary key,
    login text,
    email text,
    password text
);

create table if not exists users (
     u_id int primary key,
     email text,
     name text,
     account_id int references accounts(id));

create table if not exists payment (
     id int primary key,
     amount decimal,
     payment_date date,
     account_id int references accounts(id)
);

insert into accounts values (1, 'login_1', 'for_auth_1@mail.ru', '12345');
insert into accounts values (2, 'login_2','for_auth_1@bk.ru', '67890');

insert into users values (1, 'email_1@mail.ru', 'first_name', 1);
insert into users values (2, 'email_2@bk.ru', 'second_name', 2);

insert into payment values (1, 100.0, '2022-09-09', 1);
insert into payment values (2, 200.0, '2022-08-08', 2);

select id, login, password, u.email, name from users u
               inner join accounts a on u.account_id = a.id;

select a.id, a.email, a.password, u.email, u.name from accounts a
               inner join users u on a.id = u.account_id;

select a.id, a.email, a.password, u.u_id, u.email, u.name from accounts a
       left join users u on a.id = u.account_id;

select a.id, a.email, a.password, u.u_id, u.email, u.name from accounts a
       right join users u on a.id = u.account_id;

select u_id, u.email, name, login, password, amount, payment_date from users u
    join accounts a on u.account_id = a.id
    join payment p on a.id = p.account_id;


create table if not exists departments (
                             id int primary key,
                             name text not null
);

create table if not exists employees (
                           id int primary key,
                           name text,
                           department_id int references departments(id)
);

insert into departments values (1, 'Sales'),
                               (2, 'Marketing'),
                               (3, 'HR'),
                               (4, 'IT'),
                               (5, 'Production');

insert into employees values (1, 'Ivan Ivanov', 1),
                             (2, 'Petr Petrov', 1),
                             (3, 'Olga Sergeeva', 2),
                             (4, 'Michael Shnurov', 3),
                             (5, 'Irina Trubkina', 4),
                             (6, 'Evgenii Shtukov', null);

/* all row reference */
select e.name, d.name from employees e
         full outer join departments d
        on e.department_id = d.id;

/* row wo reference */
select e.name, d.name from employees e
       full outer join departments d
                       on e.department_id = d.id
where e.name is null or d.name is null;

/* departments wo employee */
select e.name, d.name from employees e
                               full outer join departments d
                                               on e.department_id = d.id
where e.name is null;

/* emploees wo departments */
select e.name, d.name from employees e
                               full outer join departments d
                                               on e.department_id = d.id
where d.name is null;

select * from employees
    natural join departments d;




create table if not exists letters (
                         l_id int primary key,
                         label char(1)
);

create table if not exists numbers (
                         n_id int primary key,
                         score int
);

insert into letters values (1, 'A'),
                           (2, 'B');

insert into numbers values (1, 1),
                           (2, 2),
                           (3, 3);

select * from letters
    cross join numbers n;


create table if not exists authors (
                         a_id int primary key,
                         a_name text
);

create table if not exists books (
                       b_id int primary key,
                       b_name text,
                       author_id int references authors(a_id)
);

insert into authors values (1, 'Bruce Eckel'),
                           (2, 'Robert Lafore'),
                           (3, 'Andrew Tanenbaum');

insert into books values (1, 'Modern Operating System', 3),
                         (2, 'Thinking in Java', 1),
                         (3, 'Computer Architecture', 3);

select a_name, b_name from authors
    cross join books;

select a_name, b_name from authors
           inner join books on true;

select a_name, b_name from authors, books;


create table if not exists employees2 (
                           e_id int primary key,
                           name text,
                           superviser_id int references employees2(e_id)
);

insert into employees2 values (1, 'Petr', null),
                             (2, 'Andrey', 1),
                             (3, 'Elena', 1),
                             (4, 'Anna', 2),
                             (5, 'Stas', 2),
                             (6, 'Sergey', 3),
                             (7, 'Alex', 3),
                             (8, 'Michael', 3);

select m2.name superviser, e2.name employee from employees2 e2
inner join employees2 m2
on e2.e_id = m2.superviser_id;

select e2.name, m2.name from employees2 e2
     left join employees2 m2
                on e2.superviser_id = m2.e_id;


create table if not exists films (
                       film_id int primary key,
                       title text,
                       length int
);

insert into films values (1, 'Resurrection Silverado', 117),
                         (2, 'Graffiti Love', 117),
                         (3, 'Affair Prejudice', 117),
                         (4, 'Hurricane Affair', 49),
                         (5, 'Hook Chariots', 49),
                         (6, 'Heavenly Gun', 49),
                         (7, 'Doors President', 49),
                         (8, 'Sense Greek', 54),
                         (9, 'October Submarine', 54),
                         (10, 'Kill Brotherhood', 54);

/* films with equal length */
select f1.title, f2.title, f1.length from films f1
    inner join films f2 on f1.length = f2.length and not f1.title = f2.title;

/*31. GROUP BY, WHERE и HAVING 1*/
/*Необходимо определить авиакомпании, у которых с '2023-01-05' по '2023-01-10'
  будет выполнено более одного рейса. Необходимо вывести название авиакомпании
  и количество рейсов. Группировка будет по названию авиакомпании.*/

create table if not exists airlines
(
    id           INT PRIMARY KEY,
    name         VARCHAR(255),
    country      VARCHAR(255),
    headquarters VARCHAR(255)
);

create table if not exists airplanes
(
    id               INT PRIMARY KEY,
    model            VARCHAR(255),
    manufacturer     VARCHAR(255),
    seating_capacity INT
);

create table if not exists flights
(
    id              INT PRIMARY KEY,
    airline_id      INT REFERENCES airlines (id),
    airplane_id     INT REFERENCES airplanes (id),
    departure_date  DATE,
    flight_duration DECIMAL(5, 2)
);

insert into airlines (id, name, country, headquarters)
values (1, 'Lufthansa', 'Germany', 'Cologne'),
       (2, 'Delta Air Lines', 'USA', 'Atlanta'),
       (3, 'Emirates', 'UAE', 'Dubai'),
       (4, 'Air France', 'France', 'Paris'),
       (5, 'Singapore Airlines', 'Singapore', 'Singapore');

insert into airplanes (id, model, manufacturer, seating_capacity)
values (1, '737', 'Boeing', 150),
       (2, 'A320', 'Airbus', 170),
       (3, '777', 'Boeing', 300),
       (4, 'A380', 'Airbus', 555),
       (5, '747', 'Boeing', 416),
       (6, 'E190', 'Embraer', 100),
       (7, 'A350', 'Airbus', 440),
       (8, 'CRJ900', 'Bombardier', 90),
       (9, 'MD-11', 'McDonnell Douglas', 290),
       (10, '72', 'ATR', 70);

insert into flights (id, airline_id, airplane_id, departure_date, flight_duration)
values (1, 1, 1, '2023-01-01', 2.5),
       (2, 2, 3, '2023-01-02', 3.0),
       (3, 3, 4, '2023-01-03', 8.5),
       (4, 4, 2, '2023-01-04', 2.0),
       (5, 5, 5, '2023-01-05', 7.5),
       (6, 1, 6, '2023-01-06', 1.5),
       (7, 2, 7, '2023-01-07', 4.0),
       (8, 3, 8, '2023-01-08', 6.5),
       (9, 4, 9, '2023-01-09', 5.0),
       (10, 5, 10, '2023-01-10', 3.5),
       (11, 1, 1, '2023-01-11', 2.0),
       (12, 2, 2, '2023-01-12', 1.0),
       (13, 3, 3, '2023-01-13', 4.5),
       (14, 4, 4, '2023-01-14', 2.5),
       (15, 5, 5, '2023-01-15', 6.0),
       (16, 3, 3, '2023-03-16', 4.5);

select * from airlines a
    inner join flights f on f.airline_id = f.id;

select * from flights f
    inner join airlines a on a.id = f.airline_id;

/* 31. Определить авиакомпании, у которых с '2023-01-05' по '2023-01-10' будет выполнено
   более одного рейса. Необходимо вывести название авиакомпании и количество рейсов.*/
select j.name, count(j.name)  from (select * from flights f
                                        inner join airlines a on f.airline_id = a.id) as j
where j.departure_date between symmetric '2023-01-05' and '2023-01-10'
group by j.name
having count(j.name) > 1;

/* 32. Определите среднюю продолжительность полетов для каждого производителя самолетов,
   в результаты должны попасть только те производители у кого средняя продолжительность
   больше 4. Необходимо вывести производителя и среднюю продолжительность полета.*/
select j2.manufacturer, avg(j2.flight_duration) from ((select * from flights f
                                                         inner join airlines a on a.id = f.airline_id) as j1
                                                         inner join airplanes ap on ap.id = j1.airplane_id) as j2
group by j2.manufacturer
having avg(j2.flight_duration) > 4;

/* 33. Подсчитайте общее количество рейсов и среднюю длительность полетов для каждой авиакомпании,
   в результаты должны попасть только те рейсы средняя продолжительность которых больше 3.
   Необходимо вывести название авиакомпании, общее число рейсов, среднюю продолжительность полета.*/
select j2.name, count(j2.name), avg(j2.flight_duration) from ((select * from flights f
                                                 inner join airlines a on a.id = f.airline_id) as j1
                                                 inner join airplanes ap on ap.id = j1.airplane_id) as j2
group by j2.name
having avg(j2.flight_duration) > 3;

/* 34. Определите авиакомпанию с наибольшим количеством самолетов. Необходимо вывести название
   авиакомпании и общее число самолетов.*/
/* base */
select * from flights f
                  inner join airlines a on a.id = f.airline_id
                  inner join airplanes ap on ap.id = airplane_id;

/* I variant, cost 63 */
explain analyse
    select j2.name, count(j2.airplane_id) from ((select * from flights f
            inner join airlines a on a.id = f.airline_id) as j1
            inner join airplanes ap on ap.id = j1.airplane_id) as j2
group by j2.name
order by count(j2.airplane_id) desc
limit 1;

/* II variant, cost 126 */
explain analyse
select name, c as count from (select j2.name, count(j2.airplane_id) c from ((select * from flights f
                                               inner join airlines a on a.id = f.airline_id) as j1
                                               inner join airplanes ap on ap.id = j1.airplane_id) as j2
                              group by j2.name) as j3
group by name, count
having j3.c = (select max(c) from (select count(airplane_id) c from (select * from flights f
                           inner join airlines a on a.id = f.airline_id
                           inner join airplanes ap on ap.id = airplane_id) as m1 group by name) as m1);

/* 41. GROUP BY, WHERE и HAVING 11 */
create table if not exists products
(
    id    SERIAL PRIMARY KEY,
    name  VARCHAR(255)   NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

create table if not exists customers
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

create table if not exists sales
(
    id     SERIAL PRIMARY KEY,
    product_id  INT REFERENCES products (id),
    customer_id INT REFERENCES customers (id),
    amount      INT NOT NULL,
    sale_year   INT,
    sale_month  INT
);

insert into products (name, price)
values ('Product A', 10.99),
       ('Product B', 20.49),
       ('Product C', 15.75),
       ('Product D', 8.99),
       ('Product E', 12.50),
       ('Product F', 18.99),
       ('Product G', 22.00);

insert into customers (name)
values ('Customer 1'),
       ('Customer 2'),
       ('Customer 3'),
       ('Customer 4'),
       ('Customer 5');

insert into sales (product_id, customer_id, amount, sale_year, sale_month)
values (1, 1, 2, 2023, 1),
       (2, 2, 1, 2023, 2),
       (3, 3, 3, 2023, 3),
       (4, 4, 4, 2023, 4),
       (5, 5, 2, 2023, 5),
       (6, 1, 1, 2023, 4),
       (7, 2, 3, 2023, 3),
       (1, 3, 2, 2023, 1),
       (2, 4, 4, 20235, 5),
       (3, 5, 1, 2023, 2),
       (4, 1, 3, 2023, 1),
       (5, 2, 2, 2023, 3),
       (6, 3, 1, 2023, 5),
       (7, 4, 4, 2023, 4),
       (1, 5, 3, 2023, 2),
       (2, 1, 2, 2023, 1),
       (3, 2, 1, 2023, 3);

select j1.id "id", j1.name "name" from (select p.id "id", p.name "name" from sales s
                                                                   join products p on s.product_id = p.id
                                                                   join customers c on s.customer_id = c.id
                                                                where s.sale_year = 2023) j1
group by j1.id, j1.name
having  count(name) = 2;

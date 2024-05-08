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

/* db cars, engines */
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

create table if not exists categories2
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

create table if not exists products2
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100)   NOT NULL,
    quantity    INTEGER        NOT NULL,
    price       NUMERIC(10, 2) NOT NULL,
    category_id INTEGER REFERENCES categories2 (id)
);

insert into categories2 (name)
values ('Электроника'),
       ('Одежда'),
       ('Бытовая техника'),
       ('Книги'),
       ('Спортинвентарь');

insert into products2 (name, quantity, price, category_id)
values ('Смартфон', 20, 1000.00, 1),
       ('Наушники', 15, 200.00, 1),
       ('Футболка', 30, 25.00, 2),
       ('Джинсы', 25, 50.00, 2),
       ('Холодильник', 10, 800.00, 3),
       ('Пылесос', 12, 150.00, 3),
       ('Роман', 40, 10.00, 4),
       ('Энциклопедия', 20, 30.00, 4),
       ('Футбольный мяч', 20, 15.00, 5),
       ('Теннисная ракетка', 15, 50.00, 5),
       ('Ноутбук', 18, 1200.00, 1),
       ('Тостер', 8, 40.00, 3),
       ('Футболка', 25, 20.00, 2),
       ('Спортивный костюм', 12, 70.00, 5),
       ('Научная литература', 30, 15.00, 4);

/* найти все продукты в категории 'Электроника' */
select * from products2 where category_id = (select id from categories2 c where c.name = 'Электроника');

/* найти все категории, в которых есть продукты с количеством больше 30 */
select c.id, c.name from products2 p2
    join categories2 c on c.id = p2.category_id
where p2.quantity > 30
group by c.id, c.name;

/* найти все продукты с ценой выше средней цены по всем продуктам */
select * from products2 p2
where p2.price > (select avg(products2.price) from products2);

/* найти все продукты, их количество и категорию, где количество продукта больше,
   чем среднее количество продукта во всех категориях */
select p2.name as name, quantity,  c.name as category_name from products2 p2
      join categories2 c on c.id = p2.category_id
where p2.quantity > (select avg(products2.quantity) from products2);

/* найти все категории, в которых есть продукты с ценой выше 1000 */
select c.id, c.name from products2 p2
                             join categories2 c on c.id = p2.category_id
where p2.price > 1000
group by c.id, c.name;

/* найти все продукты с ценой выше максимальной цены в категории 'Одежда' */
select p2.id, p2.name, quantity, price, category_id from products2 p2
                             join categories2 c on c.id = p2.category_id
where p2.price > (select max(price) from products2 p2
                  where p2.category_id = (select id from categories2 c2 where c2.name = 'Одежда'));

/* sub-query max price */
select max(price) from products2 p2
    where p2.category_id = (select id from categories2 c2 where c2.name = 'Одежда');

/* найти все категории, в которых есть продукты с количеством меньше 20 и ценой выше 500 */
select * from categories2 c2
         where c2.id in (select p2.category_id from products2 p2 where quantity < 20 and price > 500);

/* sub-query products */
select * from products2 p2 where quantity < 20 and price > 500;

/* найти все продукты, не относящиеся к категории 'Бытовая техника' */
select * from products2 p2
      where p2.category_id in (select id from categories2 c2 where c2.name <> 'Бытовая техника');

/* найти все продукты, цена которых выше средней цены по продуктам, в их категории */
select id, name, quantity, price, category_id from products2 p1
    where p1.price > (select avg(price) from products2 p2
                        where p1.category_id = p2.category_id
                        group by category_id);

/* sub-query avg */
select avg(price) from products2 p2
where p2.category_id = 4
group by category_id;

/* найти все категории, в которых есть хотя бы один товар, название которого начинается с буквы Н */
select distinct c2.id, c2.name from products2 p2
      join categories2 c2 on p2.category_id = c2.id
 where p2.name like 'Н%';


create table if not exists users2
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age  INT
);

create table if not exists orders
(
    id          SERIAL PRIMARY KEY,
    user_id     INT,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES users2 (id)
);

insert into users2 (name, age)
values ('Alice', 25),
       ('Bob', 30),
       ('Charlie', 35),
       ('David', 40),
       ('Emma', 22);

insert into orders (user_id, total_price)
values (1, 100.00),
       (2, 75.50),
       (3, 200.25),
       (4, 150.75),
       (5, 50.20),
       (1, 120.00),
       (2, 90.80),
       (3, 180.60),
       (4, 210.40),
       (4, 175.30),
       (5, 95.25),
       (1, 80.30),
       (2, 65.50),
       (3, 150.00),
       (4, 100.75),
       (5, 70.90);

/* получить имя пользователя и указание о том является ли их возраст больше общего среднего возраста */
select u2.name, (select avg(age) from users2 u1) < age as is_more_average_age from users2 u2;

/* получить суммарное количество заказов для каждого пользователя */
select u1.id,
       u1.name,
       (select count(or1.user_id) from orders or1 where u1.id = or1.user_id) as orders_count
from users2 u1;

/* объединить заказы по группам по user_id,
   посчитать во сколько раз средняя цена по группе больше минимальной цены в общем по всем заказам */
select
    or2.user_id,
    (select avg(total_price) from orders or1 where or1.user_id = or2.user_id group by user_id)
        /
    (select min(total_price) from orders)
from orders or2
group by or2.user_id;

/* sub-query min, avg */
select min(total_price) from orders;
select avg(total_price) from orders group by user_id;

/* получить идентификаторы пользователей с наибольшим числом заказов */
select
    u2.id,
    (select count(or1.user_id) order_count from orders or1
        where or1.user_id = u2.id
     group by or1.user_id) or2
from users2 u2
where u2.id = (select max(order_count2) from (select or3.user_id, count(or3.user_id) order_count2 from orders or3
                                              group by or3.user_id) or4);

/* sub-query count */
select or1.user_id, count(or1.user_id) order_count from orders or1
group by or1.user_id;

/* sub-query max */
select max(order_count2) from (select or3.user_id, count(or3.user_id) order_count2 from orders or3
                               group by or3.user_id) c1;

/* add tables for next task */
create table if not exists products3
(
    id           SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    price        DECIMAL(10, 2)
);

create table if not exists order_items
(
    id         SERIAL PRIMARY KEY,
    order_id   INT,
    product_id INT,
    quantity   INT,
    price      DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders (id),
    FOREIGN KEY (product_id) REFERENCES products (id)
);

insert into products3 (product_name, price)
values ('Товар 1', 10.00),
       ('Товар 2', 15.50),
       ('Товар 3', 20.25),
       ('Товар 4', 25.75),
       ('Товар 5', 30.20);

insert into order_items (order_id, product_id, quantity, price)
values (1, 1, 2, 20.00),
       (2, 2, 1, 15.50),
       (3, 3, 3, 60.75),
       (4, 4, 2, 51.50),
       (5, 5, 1, 30.20),
       (6, 1, 1, 40.00),
       (7, 2, 4, 40.80),
       (8, 3, 2, 36.60),
       (9, 4, 3, 84.30),
       (10, 5, 1, 45.25),
       (11, 1, 2, 60.60),
       (12, 2, 1, 65.50),
       (13, 3, 3, 150.00),
       (14, 4, 2, 100.75),
       (15, 5, 1, 70.90);

/* получить список товаров и их цен вместе с общим количеством проданных единиц каждого товара */
select product_name,
       price,
       (select sum(quantity) as total_sold
        from order_items oritm1
        where oritm1.product_id = pr1.id
        group by product_id
        ) total_sold
from products3 pr1;

/* sub-query sum */
select product_id, sum(quantity) as total_sold
from order_items
group by product_id;

/* получить список пользователей и их общей суммы заказов,
   отсортированных по сумме заказов по убыванию */
select * from users2;

select * from order_items;

select * from orders;

select u1.id,
       u1.name,
       (select sum(total_price)
        from orders or1
        where or1.user_id = u1.id
        group by user_id
       ) total_order_sum
from users2 u1
order by total_order_sum desc;

/* получить средние цены товаров, проданных каждым пользователем */
select u1.id,
       u1.name,
       (select
            avg(sum_item_price)
        from (select user_id,
                     (select sum(price)
                      from order_items orit1
                      where orit1.order_id = or1.id
                      group by order_id) sum_item_price
              from orders or1) usid2
        where usid2.user_id = u1.id
        group by user_id) average_item_price
from users2 u1;

/* sub-query avg price */
select order_id, avg(price)
from order_items
group by order_id;

/* sub-query orders id */
select user_id,
       (select sum(price)
        from order_items orit1
        where orit1.order_id = or1.id
        group by order_id) sum_item_price
from orders or1;

/* получить общее количество проданных единиц каждого товара */
select p3.id,
       (select
            sum1
        from (select product_id, sum(quantity) sum1 from order_items
              group by product_id) full1
        where full1.product_id = p3.id) total_sold
from products3 p3;

/* sub-query sum */
select product_id, sum(quantity) from order_items
group by product_id;

/* получить список пользователей с количеством заказов по каждому пользователю */
select u2.id,
       (select count(user_id)
        from orders o1
        where u2.id = o1.user_id
        group by user_id)
from users2 u2;

/* sub-query count */
select count(user_id)
from orders
group by user_id;

/* получить список товаров с их ценами и индикатором, является ли товар самым дорогим в магазине */
select p3.id,
       p3.product_name,
       p3.price,
       (p3.price = (select max(price) from products3)) is_most_expensive
from products3 p3;

/* sub-query max */
select max(price) from products3;

/* db tables: airlines3, airplanes3 */
create table if not exists airlines3
(
    id      SERIAL PRIMARY KEY,
    name    VARCHAR(100),
    country VARCHAR(100)
);

create table if not exists airplanes3
(
    id               SERIAL PRIMARY KEY,
    model            VARCHAR(100),
    manufacturer     VARCHAR(100),
    seating_capacity INTEGER,
    airline_id       INTEGER REFERENCES airlines3 (id)
);

insert into airlines3 (name, country)
values ('American Airlines', 'United States'),
       ('Delta Air Lines', 'United States'),
       ('United Airlines', 'United States'),
       ('British Airways', 'United Kingdom'),
       ('Lufthansa', 'Germany'),
       ('Air France', 'France'),
       ('Emirates', 'United Arab Emirates');

insert into airplanes3 (model, manufacturer, seating_capacity, airline_id)
values ('Boeing 737', 'Boeing', 150, 1),
       ('Boeing 777', 'Boeing', 350, 1),
       ('Airbus A320', 'Airbus', 180, 2),
       ('Airbus A330', 'Airbus', 300, 2),
       ('Boeing 787', 'Boeing', 250, 3),
       ('Airbus A380', 'Airbus', 500, 4),
       ('Boeing 747', 'Boeing', 400, 4),
       ('Airbus A350', 'Airbus', 325, 5),
       ('Airbus A320', 'Airbus', 180, 6),
       ('Airbus A340', 'Airbus', 300, 6),
       ('Boeing 777', 'Boeing', 350, 7),
       ('Boeing 787', 'Boeing', 250, 7),
       ('Boeing 737', 'Boeing', 150, 7),
       ('Airbus A380', 'Airbus', 500, 7),
       ('Boeing 747', 'Boeing', 400, 7),
       ('Boeing 737', 'Boeing', 150, 7),
       ('Boeing 777', 'Boeing', 350, 7),
       ('Airbus A320', 'Airbus', 180, 7),
       ('Boeing 787', 'Boeing', 250, 7),
       ('Airbus A330', 'Airbus', 300, 7),
       ('Boeing 747', 'Boeing', 400, 7),
       ('Airbus A380', 'Airbus', 500, 7);

/* получить список всех авиакомпаний и количество самолетов, которые они эксплуатируют */
select name,
       (select airplane_count
        from (select
                  airline_id,
                  count(airline_id) airplane_count
              from airplanes3 arp3
              group by airline_id) c1
        where id = c1.airline_id
        )
from airlines3 ar3;

/* sub-query count */
select * from airlines3 ar3;
select * from airplanes3 arp3;

select count(airline_id) from airplanes3 arp3
group by airline_id;

/* получить среднюю вместимость самолетов для авиакомпаний каждой страны */
select
    country,
    avg(seating_capacity) average_seating_capacity
from (
         select * from airlines3 al3
                           join airplanes3 ap3 on al3.id = ap3.airline_id) j1
group by country;

/* sub-query avg */
select avg(seating_capacity) from airplanes3 ap3
group by ap3.airline_id;

select country, count(country) airlines_count from airlines3
group by country;

/* получить список всех моделей самолетов и их производителей, которые не превышают 200 мест в салоне */
select model, manufacturer from (select ap3.id ap_id, * from airlines3 al3
               join airplanes3 ap3 on al3.id = ap3.airline_id) j1
where seating_capacity < 200
order by j1.ap_id;

/* получить список стран, в которых действуют не менее 3 авиакомпаний */
select country from airlines3 al3
group by country
having count(id) > 2;

/* получить все самолеты, принадлежащие авиакомпаниям из определенной страны - Germany */
select * from airplanes3
where airline_id in (select id from airlines3 where country = 'Germany');

/* получить все самолеты, модели которых принадлежат компаниям из определенных стран (USA и Canada) */
select * from airplanes3
where airline_id in (select id from airlines3 where country in ('Germany', 'France')); /* 'USA', 'Canada' */

/* получить все самолеты, произведенные в странах, где нет авиакомпаний по данным, представленным в БД */
select * from airplanes4 ap4
where ap4.country not in (select country from airlines4);

/* получить все самолеты, у которых вместимость равна вместимости хотя бы одного самолета
   определенной авиакомпании и авиакомпании отличны от той которую мы ищем (airline_id = 2) */
select * from airplanes3 ap4
where (ap4.seating_capacity = any(select seating_capacity from (select * from airlines3 al3
                                                                join airplanes3 ap3 on al3.id = ap3.airline_id
                                                                where airline_id = 2) j1))
and  ap4.airline_id <> 2;

/* получить все самолеты с вместимостью, превышающей среднюю вместимость всех самолетов */
select * from airplanes3 ap4
where ap4.seating_capacity > (select avg(seating_capacity) from airplanes3);

/* получить все самолеты, у которых вместимость меньше,
   чем минимальная вместимость самолетов одной определенной авиакомпании (airline_id = 3) */
select * from airplanes3 ap4
where ap4.seating_capacity < (select min(seating_capacity) from airlines3 al3
                              join airplanes3 ap3 on al3.id = ap3.airline_id
                              where airline_id = 3);

/* получить все самолеты, у которых вместимость больше, чем у любого самолета авиакомпании из определенной страны (Spain) */
select * from airplanes3 ap4
where ap4.seating_capacity > any(select seating_capacity from airlines3 al3
                                 join airplanes3 ap3 on al3.id = ap3.airline_id
                                 where al3.country = 'Spain');

/* получить все самолеты, произведенные в той же стране, что и авиакомпания */
select * from airplanes3 ap3
where exists(select 1 from airlines3 al3 where ap3.airline_id = al3.id and ap3.country = al3.country);

/* sub-query join */
select * from airlines3 al3
    join airplanes3 ap3 on al3.id = ap3.airline_id;

/* db tables: categories4, products4 */
create table if not exists categories4
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

create table if not exists products4
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100)   NOT NULL,
    quantity    INTEGER        NOT NULL,
    price       NUMERIC(10, 2) NOT NULL,
    category_id INTEGER REFERENCES categories4 (id)
);

insert into categories4 (name)
values ('Электроника'),
       ('Продукты питания'),
       ('Одежда'),
       ('Книги'),
       ('Косметика');

insert into products4 (name, quantity, price, category_id)
values ('Смартфон', 10, 1000.00, 1),
       ('Ноутбук', 15, 1500.00, 1),
       ('Молоко', 20, 2.50, 2),
       ('Хлеб', 25, 1.50, 2),
       ('Футболка', 30, 20.00, 3),
       ('Джинсы', 35, 50.00, 3),
       ('Роман', 40, 15.00, 4),
       ('Учебник', 45, 30.00, 4),
       ('Шампунь', 50, 5.00, 5),
       ('Крем', 55, 10.00, 5),
       ('Наушники', 60, 150.00, 1),
       ('Планшет', 65, 500.00, 1),
       ('Сыр', 70, 4.00, 2),
       ('Масло', 75, 3.00, 2),
       ('Платье', 80, 40.00, 3),
       ('Пиджак', 85, 80.00, 3),
       ('Поэма', 90, 20.00, 4),
       ('Справочник', 95, 25.00, 4),
       ('Тушь', 100, 15.00, 5),
       ('Тени для век', 105, 20.00, 5),
       ('Игровая консоль', 110, 300.00, 1),
       ('Bluetooth гарнитура', 115, 110.00, 1),
       ('Экшн камера', 120, 800.00, 1);

insert into categories4 (name)
values ('Электроника'),
       ('Одежда'),
       ('Косметика'),
       ('Кухонная утварь'),
       ('Игрушки'),
       ('Книги'),
       ('Спортивные товары'),
       ('Цветы'),
       ('Мебель');

insert into products4 (name, quantity, price, category_id)
values ('Смартфон', 10, 500.00, 1),
       ('Ноутбук', 5, 1000.00, 1),
       ('Футболка', 20, 20.00, 2),
       ('Джинсы', 15, 40.00, 2),
       ('Тушь для ресниц', 30, 10.00, 3),
       ('Помада', 25, 15.00, 3),
       ('Чайник', 8, 15.00, 4),
       ('Сковорода', 10, 20.00, 4),
       ('Мяч', 15, 10.00, 5),
       ('Кукла', 20, 8.00, 5),
       ('Робот-трансформер', 10, 25.00, 5),
       ('Война и мир', 12, 30.00, 6),
       ('Преступление и наказание', 10, 25.00, 6),
       ('Футбольный мяч', 25, 15.00, 7),
       ('Штанга', 20, 50.00, 7),
       ('Шампунь', 18, 5.00, 3),
       ('Мыло', 20, 3.00, 3),
       ('Телефон', 12, 450.00, 1),
       ('Планшет', 8, 300.00, 1),
       ('Джемпер', 15, 30.00, 2),
       ('Брюки', 10, 35.00, 2),
       ('Крем для лица', 22, 12.00, 3),
       ('Гель для душа', 28, 8.00, 3),
       ('Чай', 30, 7.00, 4),
       ('Тарелка', 20, 5.00, 4),
       ('Мяч для баскетбола', 18, 12.00, 5),
       ('Машинка', 22, 7.00, 5),
       ('Книга по SQL', 8, 20.00, 6),
       ('Книга по Python', 10, 18.00, 6),
       ('Штанга для жима', 15, 40.00, 7);

/* найти категорию с самым высоким количеством продуктов. Выведите ее имя и количество продуктов в ней */
select subquery.name category_name,
       product_count
from (select c4.name,
             count(p4.name) product_count
      from categories4 c4
      join products4 p4 on c4.id = p4.category_id
      group by c4.name) subquery
order by product_count desc
limit 1;

/*получить список категорий со средней ценой продуктов, отсортированных по возрастанию */
select subquery.name category_name,
       average_price
from (select c4.name,
             avg(p4.price) average_price
      from categories4 c4
               join products4 p4 on c4.id = p4.category_id
      group by c4.name) subquery
order by average_price;

/* получить список категорий, в которых средняя цена продуктов превышает среднюю цену по всем категориям.
   Выведите название и среднюю цену в категориях */
select subquery.name category_name,
       average_price
from (select c4.name,
             avg(p4.price) average_price
      from categories4 c4
               join products4 p4 on c4.id = p4.category_id
      group by c4.name) subquery
where average_price > (select avg(price) from products4)
order by average_price;

/* получить список категорий, где количество продуктов меньше среднего количества продуктов по всем категориям */
select category_name from
    (select c4.name category_name, c4.id cat_id, p4.category_id prod_cat_id
     from categories4 c4
     join products4 p4 on c4.id = p4.category_id) subquery
group by cat_id, category_name, prod_cat_id
having count(prod_cat_id) < (select avg(prod_by_cat) from (select count(p5.name) prod_by_cat from products4 p5 group by category_id) pr1)
order by cat_id;

/* sub-queries avg(count) join */
select avg(prod_by_cat) from (select count(id) prod_by_cat from products4 group by category_id) pr1;

select * from
    (select c4.name category_name, p4.id product_id, *
     from categories4 c4
     join products4 p4 on c4.id = p4.category_id) j1;

/* получить список категорий, в которых есть продукты с количеством больше или равном 100 */
select category_name, count(quantity) products_count from
    (select c4.name category_name, p4.quantity
     from categories4 c4
     join products4 p4 on c4.id = p4.category_id
     ) subquery
where subquery.quantity > 99
group by category_name;

/* получить список категорий, в которых все продукты стоят дороже 50 единиц */
select category_name from
    (select c4.name category_name, p4.price
     from categories4 c4
              join products4 p4 on c4.id = p4.category_id
    ) subquery
group by category_name
having avg(subquery.price) > 50;

/* получить список категорий с указанием самой низкой цены в категории */
select category_name, min_price from
    (select c4.name category_name, min(p4.price) min_price
     from categories4 c4
              join products4 p4 on c4.id = p4.category_id
    group by category_name) subquery
order by min_price;

/* найти все категории, в которых количество продуктов больше 4 */
/* explain cost 32 */
select id, name from categories4
where id in (select category_id from products4 p4 group by category_id having count(id) > 4);

/* explain cost 40 */
select id, name from
    (select c4.id id, c4.name, count(p4.id) prod_count
     from categories4 c4
              join products4 p4 on c4.id = p4.category_id
     group by c4.id) subquery
where prod_count > 4
order by id;

/* найти все категории, в которых суммарное количество продуктов больше 100 */
/* explain cost 32 */
select id, name from categories4
where id in (select category_id from products4 p4 group by category_id having sum(quantity) > 100);

/* explain cost 40 */
select id, name from
    (select c4.id id, c4.name, sum(p4.quantity) prod_quantity_sum
     from categories4 c4
              join products4 p4 on c4.id = p4.category_id
     group by c4.id) subquery
where prod_quantity_sum > 100
order by id;

/* найти все продукты, цена которых выше цены любого продукта в категории "Электроника" */
select * from products4
where price > any(select price
                  from products4
                  where category_id = (select id
                                       from categories4 c4
                                       where c4.name = 'Электроника'));

/* найти все продукты, цена которых равна цене любого продукта в категории "Одежда" */
select * from products4
where price = any(select price
                  from products4
                  where category_id = (select id
                                       from categories4 c4
                                       where c4.name = 'Одежда'));

/* найти все продукты, цена которых ниже минимальной цены любого продукта в категории "Книги" */
select * from products4
where price < any(select min(price)
                  from products4
                  where category_id = (select id
                                       from categories4 c4
                                       where c4.name = 'Книги')
                  group by category_id);

/* найти все продукты, цена которых выше максимальной цены продукта в категории "Косметика" */
select * from products4
where price > any(select max(price)
                  from products4
                  where category_id = (select id
                                       from categories4 c4
                                       where c4.name = 'Косметика'));

/* найти все продукты, количество которых меньше минимального количества продуктов в категории "Игрушки" */
select * from products4
where quantity < (select min(quantity)
                  from products4
                  where category_id = (select c4.id
                                       from categories4 c4
                                       where c4.name = 'Игрушки'));

/* найти все категории, в которых нет ни одного продукта */
select id, name from categories4 c4
where not exists(select 1
                 from products4 p4
                 where c4.id = p4.category_id);

/* db tables: film_companies2, directors2, movies2 */
create table if not exists film_companies2
(
    id            SERIAL PRIMARY KEY,
    name          VARCHAR(255) NOT NULL,
    country       VARCHAR(50),
    founding_year INTEGER
);

create table if not exists directors2
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    birth_date  DATE,
    nationality VARCHAR(50)
);

create table if not exists movies2
(
    id           SERIAL PRIMARY KEY,
    title        VARCHAR(255) NOT NULL,
    release_year INTEGER,
    duration     INTEGER,
    budget       NUMERIC(15, 2),
    company_id   INTEGER REFERENCES film_companies2 (id),
    director_id  INTEGER REFERENCES directors2 (id)
);

insert into film_companies2 (name, country, founding_year)
values ('Warner Bros', 'США', 1923),
       ('Universal Pictures', 'США', 1912),
       ('Paramount Pictures', 'США', 1912),
       ('Walt Disney Pictures', 'США', 1923),
       ('20th Century Studios', 'США', 1935),
       ('Touchstone Pictures', 'США', 1984);

insert into directors2 (name, birth_date, nationality)
values ('The Wachowski Brothers', '1965-06-21', 'USA'),
       ('Steven Spielberg', '1946-12-18', 'USA'),
       ('Christopher Nolan', '1970-07-30', 'Great Britain'),
       ('Quentin Tarantino', '1963-03-27', 'USA'),
       ('Martin Scorsese', '1942-11-17', 'USA'),
       ('James Cameron', '1954-08-16', 'Canada'),
       ('Peter Jackson', '1961-10-31', 'New Zealand'),
       ('Ridley Scott', '1937-11-30', 'Great Britain'),
       ('Tim Burton', '1958-08-25', 'USA'),
       ('David Fincher', '1962-08-28', 'USA'),
       ('Frank Darabont', '1959-01-28', 'USA'),
       ('Francis Ford Coppola', '1939-04-07', 'USA'),
       ('Jonathan Demme', '1944-02-22', 'USA'),
       ('Robert Lee Zemeckis', '1952-05-14', 'USA'),
       ('Manoj Nelliyattu Shyamalan', '1970-08-06', 'USA'),
       ('Roger Allers', '1949-06-29', 'USA');

insert into movies2 (title, release_year, duration, budget, company_id, director_id)
values ('The Matrix', 1999, 136, 63000000.00, 1, 1),
       ('Inception', 2010, 148, 160000000.00, 1, 3),
       ('Pulp Fiction', 1994, 154, 8500000.00, 3, 4),
       ('The Shawshank Redemption', 1994, 142, 25000000.00, 2, 11),
       ('The Godfather', 1972, 177, 6000000.00, 3, 12),
       ('The Dark Knight', 2008, 152, 185000000.00, 1, 3),
       ('Jurassic Park', 1993, 127, 63000000.00, 2, 2),
       ('Schindler List', 1993, 195, 22000000.00, 2, 2),
       ('Fight Club', 1999, 139, 63000000.00, 5, 10),
       ('The Silence of the Lambs', 1991, 118, 19000000.00, 3, 13),
       ('Forrest Gump', 1994, 142, 55000000.00, 3, 14),
       ('Goodfellas', 1990, 146, 25000000.00, 1, 5),
       ('The Lord of the Rings: The Return of the King', 2003, 201, 94000000.00, 4, 7),
       ('Avatar', 2009, 162, 237000000.00, 5, 6),
       ('The Godfather: Part II', 1974, 202, 13000000.00, 3, 12),
       ('The Green Mile', 1999, 189, 60000000.00, 2, 11),
       ('The Sixth Sense', 1999, 107, 40000000.00, 6, 15),
       ('The Departed', 2006, 151, 90000000.00, 1, 5),
       ('Gladiator', 2000, 155, 103000000.00, 2, 8),
       ('The Lion King', 1994, 88, 79300000.00, 4, 16),
       ('Jaws', 1975, 124, 7000000.00, 2, 2),
       ('Edward Scissorhands', 1990, 105, 20000000.00, 5, 9);

/* получить список всех фильмов, выпущенных до 2000 года и
   снятых режиссерами старше 50 лет на момент выпуска фильма (where, in) */
select title from movies2 m2
where m2.release_year < 2001  and
      (cast(m2.release_year as double precision) - (select date_part('year', d2.birth_date) from directors2 d2 where m2.director_id = d2.id)) > 50;

/* получить список всех фильмов, продолжительность которых больше средней продолжительности всех фильмов,
   выпущенных киностудией "Paramount Pictures" */
select m2.title
from movies2 m2
where m2.duration > (select avg(duration)
                     from movies2 m2
                     where m2.company_id = (select id
                                            from film_companies2 fc2
                                            where fc2.name = 'Paramount Pictures'));

/* sub-query avg */
select avg(m2.duration)
from movies2 m2
where m2.company_id = (select id
                       from film_companies2 fc2
                       where fc2.name = 'Paramount Pictures');

/* получить суммарный бюджет всех фильмов, снятых режиссером "Quentin Tarantino" */
select sum(m2.budget)
from movies2 m2
where m2.director_id = (select id
                       from directors2 d2
                       where d2.name = 'Quentin Tarantino');

/* получить количество фильмов, выпущенных каждой киностудией */
select fc2.name film_company,
       (select count(m2.id) from movies2 m2
        where m2.company_id = fc2.id
        group by m2.company_id) movies_count
from film_companies2 fc2;

/* получить список всех фильмов с бюджетом выше среднего */
select m1.title from movies2 m1
where m1.budget > (select avg(m2.budget) from movies2 m2);

/* получить среднюю длительность фильмов, выпущенных киностудией "Universal Pictures" */
select avg(duration) from movies2 m2
where m2.company_id = (select id
                       from film_companies2 fc2
                       where fc2.name = 'Universal Pictures');

/* получить список всех фильмов, выпущенных киностудией "Warner Bros" */
select (title) from movies2 m2
where m2.company_id = (select id
                       from film_companies2 fc2
                       where fc2.name = 'Warner Bros');

/* получить список всех фильмов и их режиссеров */
/* cost 1153 */
select title,
       (select name from directors2 d2 where m2.director_id = d2.id) director
from movies2 m2;

/* cost 25 */
select title, name director from movies2 m2
    join directors2 d2 on d2.id = m2.director_id;

/* получить список всех фильмов, чьи бюджеты превышают бюджет любого фильма, выпущенного киностудией "Walt Disney Pictures" */
/* where, all */
/* cost 846 */
select title
from movies2 m2
where budget > all(select budget from movies2 m2
                   where m2.company_id = (select id
                                          from film_companies2 fc2
                                          where fc2.name = 'Walt Disney Pictures'));
/* cost 35 */
select title
from movies2 m2
where budget > (select max(budget) from movies2 m2
                where m2.company_id = (select id
                                       from film_companies2 fc2
                                       where fc2.name = 'Walt Disney Pictures'));

/* sub-query max */
select max(budget) from movies2 m2
where m2.company_id = (select id
                       from film_companies2 fc2
                       where fc2.name = 'Walt Disney Pictures');

/* получить список всех фильмов, длительность которых больше любого фильма, снятого режиссером "Steven Spielberg" */
select title
from movies2 m1
where duration > (select max(m2.duration) from movies2 m2
                  where m2.director_id = (select id
                                          from directors2 d2
                                          where d2.name = 'Steven Spielberg'));

/* получить список всех киностудий, которые выпустили хотя бы один фильм после 2000 года */
select distinct name from film_companies2 fc2
where exists(select 1 from movies2 m2 where fc2.id = m2.company_id and release_year > 2000);

/* получить список всех фильмов, чьи бюджеты меньше бюджета любого фильма, выпущенного киностудией "Universal Pictures" */
select title
from movies2 m1
where budget < (select min(m2.budget) from movies2 m2
                  where m2.company_id = (select id
                                          from film_companies2 fc2
                                          where fc2.name = 'Universal Pictures'));

/* получить список всех киностудий, которые выпустили фильмы в 1990 году */
select distinct fc2.name from film_companies2 fc2
where fc2.id = (select company_id from movies2 m2 where fc2.id = m2.company_id and m2.release_year = 1990);

/* получить список всех фильмов, чьи бюджеты превышают бюджет любого фильма, выпущенного киностудией "Touchstone Pictures" */
select title
from movies2 m1
where budget > (select max(m2.budget) from movies2 m2
                where m2.company_id = (select id
                                       from film_companies2 fc2
                                       where fc2.name = 'Touchstone Pictures'));

/* получить список всех киностудий, которые не выпустили фильмы в 1975 году */
select distinct fc2.name from film_companies2 fc2
where fc2.id not in(select company_id from movies2 m2 where m2.release_year = 1975);

/* получить список всех фильмов, чьи бюджеты выше среднего бюджета фильмов, выпущенных киностудией "20th Century Studios" */
select title
from movies2 m1
where budget > (select avg(m2.budget) from movies2 m2
                where m2.company_id = (select id
                                       from film_companies2 fc2
                                       where fc2.name = '20th Century Studios'));

/* получить список всех киностудий, которые выпустили фильмы, режиссеры которых не американцы */
select distinct fc2.name from film_companies2 fc2
                           join movies2 m2 on fc2.id = m2.company_id
                           join directors2 d2 on d2.id = m2.director_id
where m2.company_id = fc2.id and
      m2.director_id in(select d2.id from directors2 d2 where lower(d2.nationality) <> 'usa')

/* wrong order */
select distinct fc2.name from film_companies2 fc2
where fc2.id in (select company_id from movies2 m2
                 where m2.company_id = fc2.id and
                         m2.director_id in(select d2.id from directors2 d2 where lower(d2.nationality) <> 'usa'));

/* sub-queries join, filtered */
select distinct * from film_companies2 fc2
join movies2 m2 on fc2.id = m2.company_id
join directors2 d2 on d2.id = m2.director_id;

select d2.id from directors2 d2 where lower(d2.nationality) <> 'usa';

/* получить список всех фильмов, чьи режиссеры сняли не менее 3 фильмов */
select m1.title from movies2 m1
where m1.director_id in(select m2.director_id from movies2 m2
                        group by m2.director_id
                        having count(m2.director_id) > 2)
order by m1.id desc;

/* получить список всех фильмов,
   длительность которых меньше средней длительности всех фильмов, выпущенных киностудией "Walt Disney Pictures" */
select title
from movies2 m1
where m1.duration < (select avg(m2.duration) from movies2 m2
                where m2.company_id = (select id
                                       from film_companies2 fc2
                                       where fc2.name = 'Walt Disney Pictures'));

/* получить список всех фильмов,
   длительность которых превышает среднюю длительность фильмов, выпущенных киностудией из США */
select title
from movies2 m1
where m1.duration > (select avg(m2.duration) from movies2 m2
                     where m2.company_id in (select id
                                             from film_companies2 fc2
                                             where fc2.country = 'USA' or fc2.country = 'США'));

/* получить список всех режиссеров, чьи фильмы были выпущены в года, кратные 5 */
select d2.name from directors2 d2
where d2.id in (select m2.director_id from movies2 m2
                where (m2.release_year % 5) = 0)
order by d2.name;

/* получить список всех фильмов, чьи бюджеты ниже бюджета любого фильма (самого дорогого), выпущенного киностудией "Paramount Pictures" */
select m1.title
from movies2 m1
where m1.budget < (select max(m2.budget) from movies2 m2
                   where m2.company_id = (select id
                                          from film_companies2 fc2
                                          where fc2.name = 'Paramount Pictures'));
/* sub-query max */
select max(m2.budget) from movies2 m2
where m2.company_id = (select id
                       from film_companies2 fc2
                       where fc2.name = 'Paramount Pictures');

/* получить список всех киностудий, которые выпустили фильмы,
   режиссеры которых не имеют фильмов с длительностью более 2 часов */
select distinct fc2.name from film_companies2 fc2
where fc2.id in(select m2.company_id from movies2 m2
                where m2.director_id in (select d2.id from directors2 d2
                                         where not exists(select 1 from movies2 m3
                                                          where d2.id = m3.director_id
                                                          and m3.duration > 120)));

/* sub-query */
select d2.id, d2.name from directors2 d2
where not exists(select 1 from movies2 m3
             where d2.id = m3.director_id
               and m3.duration > 120);

/* получить список всех фильмов, режиссеры которых не американцы */
select m2.title from movies2 m2
where m2.director_id in (select d2.id from directors2 d2
                                      where d2.nationality <> 'USA');

/* получить список всех режиссеров, чьи фильмы имеют бюджет ниже среднего бюджета всех фильмов */
select distinct d2.name from directors2 d2
where d2.id in (select m2.director_id from movies2 m2
                where m2.budget < (select avg(m3.budget) from movies2 m3));

/* получить список всех киностудий, у которых есть хотя бы один фильм, выпущенный в 70-х годах */
select distinct fc2.name from film_companies2 fc2
where fc2.id in (select m2.company_id from movies2 m2
                                      where m2.release_year between 1970 and 1979);

/* получить список всех фильмов, чьи бюджеты выше бюджетов всех фильмов, снятых режиссером "Steven Spielberg" */
select m2.title from movies2 m2
where m2.budget > (select max(m3.budget) from movies2 m3
                                         where m3.director_id = (select d2.id from directors2 d2
                                                                                 where d2.name = 'Steven Spielberg'));

/* получить список всех киностудий, которые выпустили хотя бы один фильм, снятый режиссером "Christopher Nolan" */
select distinct fc2.name from film_companies2 fc2
where fc2.id in (select m2.company_id from movies2 m2
                         where m2.director_id in (select d2.id from directors2 d2
                                                  where d2.name = 'Christopher Nolan'));

/* получить список всех фильмов, выпущенных киностудиями, основанными после 1950 года */
select m2.title from movies2 m2
where m2.company_id in (select fc2.id from film_companies2 fc2
                                      where fc2.founding_year > 1950);

/* получить список всех режиссеров, чьи фильмы имеют длительность больше средней длительности всех фильмов, выпущенных в (после) 2000-х годах */
select distinct d2.name from directors2 d2
where d2.id in (select m2.director_id from movies2 m2
                                   where m2.duration > (select avg(m3.duration) from movies2 m3
                                                                                where m3.release_year > 2000));

/* получить список всех киностудий, которые выпустили хотя бы один фильм с бюджетом более 150 миллионов */
select fc2.name from film_companies2 fc2
where fc2.id in (select m2.company_id from movies2 m2
                                      where m2.budget > 150000000);

/* получить список всех режиссеров, чьи фильмы были выпущены до их 30-летия */
select d2.name from directors2 d2
where d2.id in (select m2.director_id from movies2 m2
                                      where (m2.release_year - date_part('year', d2.birth_date)) < 30);


/* Musician etc. */
create table if not exists musician_bands
(
    id            SERIAL PRIMARY KEY,
    title         VARCHAR(255) NOT NULL,
    country       VARCHAR(50),
    genre         VARCHAR(50),
    founding_year INTEGER
);

create table if not exists albums
(
    id                SERIAL PRIMARY KEY,
    name              VARCHAR(255) NOT NULL,
    release_year      INTEGER,
    release_country   VARCHAR(255),
    label             VARCHAR(255),
    musician_bands_id INTEGER REFERENCES musician_bands (id)
);

create table if not exists songs
(
    id                  SERIAL PRIMARY KEY,
    name                VARCHAR(255) NOT NULL,
    duration_in_seconds INTEGER,
    albums_id           INTEGER REFERENCES albums (id)
);

insert into musician_bands (title, country, genre, founding_year)
values
    ('The Beatles', 'UK', 'Rock', 1960),
    ('Queen', 'UK', 'Rock', 1970),
    ('Metallica', 'USA', 'Heavy Metal', 1981),
    ('Led Zeppelin', 'UK', 'Hard Rock', 1968);

insert into albums (name, release_year, release_country, label, musician_bands_id)
values ('Abbey Road', 1969, 'UK', 'Apple Records', 1),
       ('A Night at the Opera', 1975, 'UK', 'EMI Records', 2),
       ('Metallica', 1991, 'USA', 'Elektra', 3),
       ('Led Zeppelin IV', 1971, 'UK', 'Atlantic', 4),
       ('Sgt. Peppers Lonely Hearts Club Band', 1967, 'UK', 'Parlophone', 1),
       ('The Game', 1980, 'UK', 'EMI Records', 2),
       ('News of the World', 1977, 'UK', 'Parlophone', 2),
       ('…And Justice for All', 1988, 'USA', 'Elektra', 3),
       ('ReLoad', 1997, 'USA', 'Elektra', 3),
       ('Ride the Lightning', 1984, 'USA', 'Elektra', 3),
       ('Led Zeppelin III', 1970, 'UK', 'Atlantic', 4),
       ('Sheer Heart Attack', 1974, 'UK', 'Parlophone', 2);

insert into songs (name, duration_in_seconds, albums_id)
values
    ('Come Together', 259, 1),
    ('You Never Give Me Your Money', 243, 1),
    ('Here Comes the Sun', 185, 1),
    ('Something', 182, 1),
    ('Bohemian Rhapsody', 355, 2),
    ('Love of My Life', 219, 2),
    ('Enter Sandman', 332, 3),
    ('Nothing Else Matters', 388, 3),
    ('Wherever I May Roam', 404, 3),
    ('The Unforgiven', 387, 3),
    ('Stairway to Heaven', 482, 4),
    ('Black Dog', 294, 4),
    ('Lovely Rita', 162, 5),
    ('A Day in the Life', 337, 5),
    ('Lucy in the Sky with Diamonds', 206, 5),
    ('Another One Bites the Dust', 215, 6),
    ('Crazy Little Thing Called Love', 182, 6),
    ('The Show Must Go On', 253, 6),
    ('We Are the Champions', 179, 7),
    ('We Will Rock You', 122, 7),
    ('One', 448, 8),
    ('Blackened', 402, 8),
    ('The Unforgiven II', 397, 9),
    ('The Memory Remains', 279, 9),
    ('Fade to Black', 418, 10),
    ('Ride the Lightning', 397, 10),
    ('Immigrant Song', 143, 11),
    ('Since I’ve Been Loving You', 444, 11),
    ('Now I’m Here', 250, 12),
    ('Killer Queen', 181, 12);

/* получить все альбомы, выпущенных ровно в год через 5 лет, что и альбом "Abbey Road" группы The Beatles */
select * from albums a1
where (a1.release_year - 5) = (select a2.release_year from albums a2
                               where a2.name = 'Abbey Road');

/* получить все альбомы, выпущенные после альбома "The Game" группы Queen */
select * from albums a1
where a1.release_year > (select a2.release_year from albums a2
                         where a2.name = 'The Game');

/* получить все песни с продолжительностью более 4 минут из альбома "Metallica" */
select * from songs s1
where s1.duration_in_seconds > 240
and s1.albums_id = (select a1.id from albums a1
                                 where a1.name = 'Metallica');

/* получить все альбомы, выпущенные в том же году, что и альбомы группы Queen */
select * from albums a1
where a1.release_year in (select a2.release_year from albums a2
                          where a1.musician_bands_id = (select mb1.id from musician_bands mb1
                                                        where mb1.title = 'Queen'));

/* получить все альбомы группы, основанных в 60-е годы */
select * from albums a1
where musician_bands_id in (select mb1.id from musician_bands mb1
                            where mb1.founding_year between 1960 and 1969);

/* получить количество песен в каждом альбоме */
select
    a1.name,
    (select count(s1.id) from songs s1
     where s1.albums_id = a1.id
     group by a1.id) song_count
from albums a1;

select
    (select a1.name from albums a1
      where a1.id = s1.albums_id),
    count(s1.id) song_count
from songs s1
group by s1.albums_id;

/* получить все альбомы, выпущенные в Великобритании и содержащие песни длительностью более 5 минут */
select * from albums a1
where a1.release_country = 'UK'
and a1.id in (select s1.albums_id from songs s1
              where s1.duration_in_seconds > 300);

/* получить все альбомы, выпущенные после 1975 года и содержащие песни группы Queen */
select * from (select * from albums a1
               where a1.release_year > 1975) a1
where a1.id in (select s1.albums_id from songs s1
             where s1.name in (select s2.name from songs s2
                               where s2.albums_id in (select a2.id from albums a2
                                                      where a2.musician_bands_id = (select mb2.id from musician_bands mb2
                                                                                    where mb2.title = 'Queen'))))
order by a1.id;

/* sub-query filter Queen songs names */
select s2.name from songs s2
where s2.albums_id in (select a2.id from albums a2
                       where a2.musician_bands_id = (select mb2.id from musician_bands mb2
                                                     where mb2.title = 'Queen'));

/* получить название альбома и среднюю продолжительность песен в нем (в секундах) */
select
    a1.name,
    (select avg(s1.duration_in_seconds) from songs s1
     where s1.albums_id = a1.id
     group by s1.albums_id) average_duration
from albums a1;

/* получить название группы и количество альбомов, выпущенных каждой группой */
select
    mb1.title,
    (select count(a1.id) from albums a1
     where a1.musician_bands_id = mb1.id
     group by a1.musician_bands_id) album_count
from musician_bands mb1;

/* получить название альбома и суммарную продолжительность песен в нем (в секундах) */
select
    a1.name,
    (select sum(s1.duration_in_seconds) from songs s1
     where s1.albums_id = a1.id
     group by s1.albums_id) total_duration
from albums a1;

/* получить название группы и общее количество песен группы */
select mb1.title,
       (select count(s1.id) from songs s1
        where s1.albums_id in (select a1.id from albums a1
                               where a1.musician_bands_id =
                                        (select mb2.id from musician_bands mb2 where mb1.title = mb2.title))) song_count
from musician_bands mb1;

/* получить название альбома и год его выпуска, а также количество песен в этом альбоме */
select a1.name,
       a1.release_year,
       (select count(s1.id) from songs s1
        where s1.albums_id = a1.id) song_count
from albums a1;

/* получить название альбома и название первой песни в нем (по алфавиту) */
select a1.name,
       (select s1.name from songs s1
        where s1.albums_id = a1.id
        order by s1.name
        limit 1) first_song
from albums a1;

/* получить название альбома и суммарную продолжительность песен в нем (в минутах, округленную до двух знаков после запятой) */
select
    a1.name,
    round(((select sum(s1.duration_in_seconds) from songs s1
            where s1.albums_id = a1.id
            group by s1.albums_id) / 60.0), 2) average_duration_minutes
from albums a1;

/* получить название альбома и самую короткую песню в нем (по продолжительности) */
select a1.name,
       (select s1.name from songs s1
        where s1.albums_id = a1.id
        order by s1.duration_in_seconds
        limit 1) shortest_song
from albums a1;

/* получить список всех альбомов и количество песен в каждом альбоме, учитывая только альбомы, выпущенные после 1980 года */
select a1.name,
       (select count(s1.id) from songs s1
        where s1.albums_id = a1.id) song_count
from albums a1
where a1.release_year > 1980
order by song_count, a1.release_year desc;

/* получить среднее количество песен в альбоме для каждой группы */ /* non done, ordering */
select sc1.title,
       avg(sc1.songs_count)
from (select mb1.title,
             count(s1.id) songs_count
      from songs s1
          join albums a1 on s1.albums_id = a1.id
          join musician_bands mb1 on mb1.id = a1.musician_bands_id
      group by mb1.title, a1.id) sc1
group by sc1.title
order by sc1.title,
         avg(sc1.songs_count);

select a1.name,
       count(s1.id) songs_count
from songs s1
    join albums a1 on s1.albums_id = a1.id
    join musician_bands mb1 on mb1.id = a1.musician_bands_id
group by a1.name;

/* explain cost 46 */
select
    j1.title,
    avg(j1.sng_count) average_songs_per_album
from
    (select
         mb1.title,
         count(s1.id) sng_count from songs s1
     join albums a1 on a1.id = s1.albums_id
     join musician_bands mb1 on mb1.id = a1.musician_bands_id
     group by mb1.title, s1.albums_id) j1
group by j1.title;

/* explain cost 1000 */
select distinct
    (select mb1.title from musician_bands mb1
     where alb_sngs.musician_bands_id = mb1.id) title,
     avg(alb_sngs.songs_count) average_songs_per_album
from
    (select
        a1.musician_bands_id,
        (select count(s1.id) from songs s1
         where s1.albums_id = a1.id
         group by s1.albums_id) songs_count
    from albums a1) alb_sngs
group by alb_sngs.musician_bands_id;

/* sub-query count */
select count(s1.id) from songs s1
group by s1.albums_id;

/* получить список всех альбомов, учитывая только альбомы,
   выпущенные в Великобритании, и добавить к ним количество песен в каждом альбоме */
select distinct
    a1.name,
    (select count(s1.id) from songs s1
     where s1.albums_id = a1.id) song_count
from albums a1
where a1.release_country = 'UK';

/* 99. получить список всех альбомов, учитывая только альбомы группы Queen,
   и добавить к ним количество песен в каждом альбоме */
select distinct
    a1.name,
    (select count(s1.id) from songs s1
     where s1.albums_id = a1.id) song_count
from albums a1
where a1.musician_bands_id = (select mb1.id from musician_bands mb1
                                            where mb1.title = 'Queen');

/* 100. получить список всех альбомов, учитывая только альбомы групп,
   основанных в 60-х годах, и добавить к ним количество песен в каждом альбоме */
select distinct
    a1.name,
    (select count(s1.id) from songs s1
     where s1.albums_id = a1.id) song_count
from albums a1
where a1.musician_bands_id in (select mb1.id from musician_bands mb1
                              where mb1.founding_year between 1960 and 1969);

/* 101. получить список всех песен, название альбома и название группы, к которой они принадлежат,
   упорядоченный по названию песни */
select
    s1.name song_name,
    (select a1.name from albums a1
     where a1.id = s1.albums_id) album_name,
    (select mb1.title from musician_bands mb1
     where mb1.id = (select a1.musician_bands_id from albums a1
                     where a1.id = s1.albums_id)) band_title
from songs s1
order by s1.name;

/* 102. получить среднюю продолжительность песен для каждой группы */
select
    mb1.title band_title,
   (select avg(s1.duration_in_seconds) from songs s1
    where s1.albums_id in (select a1.id from albums a1
                           where a1.musician_bands_id =
                                 (select mb2.id from musician_bands mb2 where mb1.title = mb2.title))) avg_duration
from musician_bands mb1
order by mb1.genre desc;

/* 103. получить количество альбомов и количество песен в каждом альбоме для каждой группы */
/* explain 4600 */
select
    (select mb2.title from musician_bands mb2
                      where mb2.id = ((select a2.musician_bands_id from albums a2
                                       where a2.id = j1.albums_id))) band_title,
    count(j1.albums_id) album_count,
    sum(j1.songs_by_alb_count) total_songs
from (select albums_id, count(s1.name) songs_by_alb_count from songs s1
      join albums a1 on a1.id = s1.albums_id
      join musician_bands mb1 on mb1.id = a1.musician_bands_id
      group by albums_id) j1
group by band_title;

select title band_title, albums_id, musician_bands_id, s1.name song_name from songs s1
    join albums a1 on a1.id = s1.albums_id
    join musician_bands mb1 on mb1.id = a1.musician_bands_id;

/* 104. получить все группы, у которых есть альбомы, выпущенные после 1980 года */
select
    mb1.title
from musician_bands mb1
where exists(select 1 from albums a1
             where mb1.id = a1.musician_bands_id
             and a1.release_year > 1980);

/* 105. получить все альбомы, у которых есть песни с продолжительностью более 5 минут */
select * from albums a1
where a1.id in (select s1.albums_id from songs s1
                where s1.duration_in_seconds > 300);

/* 106. получить все группы, которые не выпускали альбомов после 1990 года */
select mb1.title from musician_bands mb1
where not exists(select 1 from albums a1
                          where a1.release_year > 1989
                          and mb1.id = a1.musician_bands_id);

/* 107. получить все альбомы, у которых количество песен больше среднего количества песен по всем альбомам */
select * from albums a1
where (select count(s2.id) songs_by_alb_count2 from songs s2
       where s2.albums_id = a1.id
       group by s2.albums_id) >
        (select avg(c2.songs_by_alb_count2) from (select count(s2.id) songs_by_alb_count2 from songs s2 group by s2.albums_id) c2)
group by a1.id;

select j1.album_name from (select a1.name album_name, count(s1.name) songs_by_alb_count from albums a1
                           join songs s1 on a1.id = s1.albums_id
                           group by a1.id) j1
where j1.songs_by_alb_count > (select avg(c2.songs_by_alb_count2) from (select count(s2.id) songs_by_alb_count2 from songs s2 group by s2.albums_id) c2)
group by j1.album_name;

/* sub-query  avg(count) */
select avg(c2.songs_by_alb_count2) from (select count(s2.id) songs_by_alb_count2 from songs s2 group by s2.albums_id) c2;

/* sub-query  join */
select * from albums a1
join songs s1 on a1.id = s1.albums_id;

/* 108. получить все альбомы, у которых все песни имеют продолжительность более 3 минут */
select * from albums a1
where not exists (select 1 from songs s1
                  where s1.duration_in_seconds < 180
                  and s1.albums_id = a1.id);

/* 109. получить все альбомы, выпущенные после альбома "Ride the Lightning" группы Metallica */
select * from albums a1
where a1.release_year > (select a2.release_year from albums a2
                         where a2.musician_bands_id = (select mb1.id from musician_bands mb1
                                                       where mb1.title = 'Metallica')
                         and a2.name = 'Ride the Lightning');

/* 110. получить все песни, которые не входят в альбомы группы "Queen" */
select * from songs s1
where s1.albums_id not in(select a1.id from albums a1
                          where musician_bands_id = (select mb1.id from musician_bands mb1
                                                     where mb1.title = 'Queen'));

/* 111. получить всех музыкантов (группы), участвовавших в записи альбомов, выпущенных после 1970 года и имеющих жанр "Rock" */
select * from musician_bands mb1
where mb1.genre = 'Rock'
and exists(select 1 from albums a1
            where a1.release_year > 1970
            and mb1.id = a1.musician_bands_id);

/* 112. получить всех музыкантов (группы), участвующих в записи альбомов, выпущенных в США или Великобритании */
select distinct mb1.title, mb1.country from musician_bands mb1
where exists(select 1 from albums a1
             where a1.release_country = 'USA'
                or a1.release_country = 'UK')
order by mb1.title;

/* 113. получить все альбомы, у которых количество песен больше, чем в среднем по всем альбомам, выпущенным в 70-е годы */
select * from albums a1
where (select count(s2.id) songs_by_alb_count2 from songs s2
       where s2.albums_id = a1.id
       group by s2.albums_id) >
      (select avg(c2.songs_by_alb_count2) from (select count(s2.id) songs_by_alb_count2 from songs s2
                                                where s2.albums_id in (select a2.id from albums a2
                                                                       where a2.release_year between 1970 and 1979)
                                                group by s2.albums_id) c2)
group by a1.id;

/* 114. получить все альбомы, у которых хотя бы одна песня длится больше 6 минут и выпущены не в Великобритании */
select * from albums a1
where a1.id in (select s1.albums_id from songs s1
                where s1.duration_in_seconds > 360)
and not a1.release_country = 'UK';

/* 115. получить все песни, которые входят в альбомы, выпущенные после 1985 года группы Metallica */
select * from songs s1
where s1.albums_id in (select a1.id from albums a1
                                    where a1.release_year > 1985
                                    and a1.musician_bands_id = (select mb1.id from musician_bands mb1
                                                                              where mb1.title = 'Metallica'));

/* 116. получить все альбомы, у которых хотя бы одна песня имеет название, содержащее слово "Love" */
select * from albums a1
where a1.id in (select s1.albums_id from songs s1
                where s1.name like '%Love%');

/* sub-query like */
select s1.name from songs s1
where s1.name like '%Love%';

/* 117 получить всех музыкантов (групп), участвующих в записи альбомов, выпущенных хотя бы в одной стране из списка ('UK', 'Japan', 'Germany') */
select mb1.title, mb1.country from musician_bands mb1
where exists(select 1 from albums a1
             where a1.release_country in ('UK', 'Japan', 'Germany'));

select mb1.title, mb1.country from musician_bands mb1
where exists(select 1 from albums a1
             where a1.release_country in ('UK', 'Japan', 'Germany'));

select mb1.title, mb1.country from musician_bands mb1
where mb1.country in ('UK', 'Japan', 'Germany')
order by mb1.title;
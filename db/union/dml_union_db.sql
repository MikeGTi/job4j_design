create table if not exists customer
(
    first_name text,
    last_name  text,
    status varchar(255)
);

create table if not exists employee
(
    first_name text,
    last_name  text,
    emp_status varchar(255)
);

insert into customer (first_name, last_name, status)
values ('Иван', 'Иванов', 'Active'),
       ('Петр', 'Сергеев', 'Active'),
       ('Ирина', 'Бросова', 'Active'),
       ('Анна', 'Опушкина', 'Active'),
       ('Потап', 'Потапов', 'Current');

insert into employee (first_name, last_name, emp_status)
values ('Кристина', 'Позова',  'Active'),
       ('Михаил', 'Кругов', 'Current'),
       ('Анна', 'Опушкина', 'Active'),
       ('Иван', 'Иванов', 'Current'),
       ('Сергей', 'Петров', 'Current');

--alter sequence customer_id_seq restart with 1;

select first_name, last_name from customer
union
select first_name, last_name from employee
order by first_name, last_name;

select first_name, last_name, c.status from customer c where c.status = 'Active'
union
select first_name, last_name, e.emp_status from employee e where e.emp_status = 'Active'
order by first_name, last_name;

select e.first_name,
       e.last_name,
       c.first_name,
       c.last_name
from employee e
         inner join customer c
                    on e.first_name = c.first_name
                       and e.last_name = c.last_name;

select first_name, last_name from customer
except
select first_name, last_name from employee;

select first_name, last_name from customer
intersect
select first_name, last_name from employee;

create table if not exists referrer
(
    first_name text,
    last_name  text
);

insert into referrer
    values ('Евгений', 'Онегин'),
           ('Петр', 'Сергеев'),
           ('Александр', 'Ожегов'),
           ('Анна', 'Опушкина'),
           ('Михаил', 'Кругов');

select first_name, last_name from customer
union
select first_name, last_name from employee
union
select first_name, last_name from referrer
order by first_name, last_name;

select first_name, last_name from customer
union
select first_name, last_name from employee
except
select first_name, last_name from referrer
order by first_name, last_name;

select first_name, last_name from customer
union all
(select first_name, last_name from employee
 except
 select first_name, last_name from referrer)
order by first_name, last_name;

/* Task */
create table if not exists movie
(
    id       serial primary key,
    name     text,
    director text
);

create table if not exists book
(
    id     serial primary key,
    title  text,
    author text
);

insert into movie (name, director)
    values ('Марсианин', 'Ридли Скотт'),
           ('Матрица', 'Братья Вачовски'),
           ('Властелин колец', 'Питер Джексон'),
           ('Гарри Поттер и узник Азкабана', 'Альфонсо Куарон'),
           ('Железный человек', 'Джон Фавро');

insert into book (title, author)
    values ('Гарри Поттер и узник Азкабана', 'Джоан Роулинг'),
           ('Властелин колец', 'Джон Толкин'),
           ('1984', 'Джордж Оруэлл'),
           ('Марсианин', 'Энди Уир'),
           ('Божественная комедия', 'Данте Алигьери');

/* 2.1 - выведите названия всех фильмов, которые сняты по книге; */
select name as film_by_book_name from movie
intersect
select title from book
order by film_by_book_name;

/* 2.2 - выведите все названия книг, у которых нет экранизации; */
select title as book_wo_film from book
except
select name from movie
order by book_wo_film;

/* 2.3 - выведите все уникальные названия произведений из таблиц movie и book
   (т.е фильмы, которые сняты не по книге, и книги без экранизации) */
select title as films_books_wo_source from book
union
select name from movie
except
(select name as film_by_book_name from movie
intersect
select title from book)
order by films_books_wo_source;
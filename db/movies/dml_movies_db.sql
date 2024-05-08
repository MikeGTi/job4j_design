create table if not exists film_companies
(
    id            serial primary key,
    name          varchar(255) not null,
    country       varchar(50),
    founding_year integer
);

create table if not exists directors
(
    id          serial primary key,
    name        varchar(255) not null,
    birth_date  date,
    nationality varchar(50)
);

create table if not exists movies
(
    id           serial primary key,
    title        varchar(255) not null,
    release_year integer,
    duration     integer,
    budget       numeric(15, 2),
    company_id   integer references film_companies (id),
    director_id  integer references directors (id)
);

insert into film_companies (name, country, founding_year)
values ('Company A', 'USA', 1990),
       ('Company B', 'UK', 1985),
       ('Company C', 'Canada', 2000);

insert into directors (name, birth_date, nationality)
values ('Director X', '1970-05-15', 'USA'),
       ('Director Y', '1982-08-22', 'UK'),
       ('Director Z', '1965-12-10', 'Canada'),
       ('Director W', '1978-03-30', 'USA');

insert into movies (title, release_year, duration, budget, company_id, director_id)
values ('Movie 1', 2022, 120, 5000000, 1, 1),
       ('Movie 2', 2021, 105, 3000000, 2, 2),
       ('Movie 3', 2020, 130, 8000000, 3, 3),
       ('Movie 4', 2019, 110, 4000000, 1, 4),
       ('Movie 5', 2018, 95, 2000000, 2, 1),
       ('Movie 6', 2017, 115, 6000000, 3, 2),
       ('Movie 7', 2016, 125, 7000000, 1, 3),
       ('Movie 8', 2015, 100, 3500000, 2, 4),
       ('Movie 9', 2014, 90, 2500000, 3, 1),
       ('Movie 10', 2013, 135, 9000000, 1, 2),
       ('Movie 11', 2012, 80, 1800000, 2, 3),
       ('Movie 12', 2011, 140, 7500000, 3, 4),
       ('Movie 13', 2010, 105, 3200000, 1, 1),
       ('Movie 14', 2009, 125, 5500000, 2, 2),
       ('Movie 15', 2008, 110, 4000000, 3, 3);

/* Base join */
select * from movies
    join directors d on movies.director_id = d.id
    join film_companies fc on fc.id = movies.company_id;

/* 36. Необходимо вывести суммарный бюджет и количество фильмов для каждой кинокомпании,
   у которых хотя бы один фильм старше 2012 года.
   Должны быть выведены поля: название компании, общее число фильмов, суммарный бюджет.
   Группировка будет по названию кинокомпании */
/* Не учитывать бюджет фильмов до 2012 года включительно */
select name, count(name), sum(budget) from (select name, budget, release_year from (select fc.name, m.budget, m.release_year from movies m
                                                                                       join directors d on m.director_id = d.id
                                                                                       join film_companies fc on fc.id = m.company_id) as j1
group by name, release_year, budget) j2
where release_year > 2012
group by name
having 2012 <= any(array_agg(release_year));

/* 37. Необходимо вывести средний бюджет фильмов, выпущенных каждой кинокомпанией,
       у которых есть более 3 режиссеров и средний бюджет превышает 5 миллионов.
       В результатах запроса должно быть отражено название компании и средний бюджет.
       Группировка будет по названию кинокомпании */
select fc.name "name",
       avg(m.budget)
from movies m
    join directors d on m.director_id = d.id
    join film_companies fc on fc.id = m.company_id
group by fc.name
having count(director_id) > 3
   and avg(budget) > 5000000
order by fc.name;

select company, sum(budget) budget from (select fc.name company, m.budget, d.name director from movies m
                                                                           join directors d on m.director_id = d.id
                                                                           join film_companies fc on fc.id = m.company_id) as j1
group by company
having avg(budget) > 5000000 and count(director) > 3;

select company, avg(budget) from (select fc.name company, m.budget, d.name director from movies m
                                                    join directors d on m.director_id = d.id
                                                    join film_companies fc on fc.id = m.company_id) as j1
group by company
having count(director) > 3 and avg(budget) > 5000000
order by avg(budget) desc;

select company as name, avg(budget) from (select fc.name company, m.budget, d.name director from movies m
                                                          join directors d on m.director_id = d.id
                                                          join film_companies fc on fc.id = m.company_id) as j1
group by name
having avg(budget) > 5000000 and count(director) > 3;

/* count directors by companies */
select company, count(director) from (select fc.name company, d.name director from directors d
                                        join movies m on d.id = m.director_id
                                        join film_companies fc on m.company_id = fc.id) jcd
group by company;

/* count average films budgets */
select company, avg(budget) from (select fc.name company, m.budget from directors d
                                       join movies m on d.id = m.director_id
                                       join film_companies fc on m.company_id = fc.id) jcd
group by company;

select avg(budget) from movies
group by company_id;

select fc.name, avg_bdt from (select company_id, avg(budget) avg_bdt from movies
group by company_id
having avg(budget) > 5000000) m
join film_companies fc on m.company_id = fc.id;

with avg_budget as (select company_id, avg(budget) from movies
                    group by company_id order by avg(budget) desc)
select * from avg_budget;

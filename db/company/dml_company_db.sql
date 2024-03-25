CREATE TABLE company
(
    id integer NOT NULL,
    name character varying,
    CONSTRAINT company_pkey PRIMARY KEY (id)
);

CREATE TABLE person
(
    id integer NOT NULL,
    name character varying,
    company_id integer references company(id),
    CONSTRAINT person_pkey PRIMARY KEY (id)
);

insert into person(id, name, company_id)
    values (1, 'Name 1', 1),
           (2, 'Name 2', 2),
           (3, 'Name 3', 3),
           (4, 'Name 4', 4),
           (5, 'Name 5', 5),
           (6, 'Name 6', 5),
           (7, 'Name 7', 1);

insert into company(id, name)
    values (1, 'Company 1'),
           (2, 'Company 2'),
           (3, 'Company 3'),
           (4, 'Company 4'),
           (5, 'Company 5'),
           (6, 'Company 6');

/* Получить имена всех person, которые не состоят в компании с id = 5; */
select name from person where company_id <> 5;

/* Получить название компании для каждого человека. */
select p.name, c.name from person p join company c on p.company_id = c.id;

/* Выбрать название компании с максимальным количеством человек + количество человек в этой компании.
Нужно учесть, что таких компаний может быть несколько. */
/* I  cost 72.24, time 0.095 */
explain analyse
select * from (select company, count(person) count_person from (select p.name person, c.name company from person p join company c on p.company_id = c.id) j1
               group by company) t1
where count_person = (select max(t2.count_person) from (select count(person) count_person from (select p.name person, c.name company from person p join company c on p.company_id = c.id) j1
                                                        group by company) t2);

/* II  cost 72.24, time 0.137 */
explain analyse
select * from (select company, count(person) count_person from (select p.name person, c.name company from person p join company c on p.company_id = c.id) j1
               group by company) t1
where count_person = (select t2.count_person from (select count(person) count_person from (select p.name person, c.name company from person p join company c on p.company_id = c.id) j1
                                                        group by company) t2
                        order by count_person desc
                        limit 1);

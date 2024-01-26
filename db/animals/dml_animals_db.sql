create table fauna
(
    id             serial primary key,
    name           text,
    avg_age        int,
    discovery_date date default null
);

insert into fauna(name, avg_age, discovery_date)
    values ('Crow', 8, '1845-09-01'),
           ('Horse', 15, '1954-09-02'),
           ('Dog', 12,  '2018-09-03'),
           ('Lion', 22,  '1917-09-04'),
           ('Mouse', 1,  '2016-09-05'),
           ('Fish', 3,  '1816-09-05'),
           ('Mammoths', 50,  null);

select * from fauna where name ilike 'fish';
select * from fauna where avg_age > 3 and avg_age < 13;
select * from fauna where discovery_date is null;
select * from fauna where discovery_date < '1950-01-01';
create table if not exists cities
(
    id serial primary key,
    name text,
    population int
);

insert into cities(name, population)
    values ('Ufa', 1000000) RETURNING (id);
insert into cities(name, population)
    values ('Tokyo', 37500000) RETURNING (id);
insert into cities(name, population)
    values ('Delhi', 29400000) RETURNING (id);
insert into cities(name, population)
    values ('Shanghai', 26400000) RETURNING (id);

select * from cities;

alter sequence cities_id_seq restart with 1;
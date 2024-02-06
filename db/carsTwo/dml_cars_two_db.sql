/* create tables */
create table car_bodies (
    id serial primary key,
    name varchar(255)
);

create table car_engines (
    id serial primary key,
    name varchar(255)
);

create table car_transmissions (
    id serial primary key,
    name varchar(255)
);

create table cars (
    id serial primary key,
    name varchar(255),
    body_id integer references car_bodies(id),
    engine_id integer references car_engines(id),
    transmission_id integer references car_transmissions(id)
);

/* insert data */
insert into car_bodies (name)
    values ('Седан'),
           ('Хетчбек'),
           ('Универсал'),
           ('Джип'),
           ('Купе'),
           ('Фургон'),
           ('Полуприцеп');

insert into car_transmissions (name)
    values ('Автомат'),
           ('Робот'),
           ('Механика');

insert into car_engines (name)
    values ('Большой и мощный'),
           ('Средний'),
           ('Маленький и хилый');

insert into cars (name, body_id, transmission_id, engine_id)
    values ('Chevrolet Tahoe', 4, 1, 1),
           ('Chevrolet Corvette', 5, 3, 1),
           ('VAZ 2101', null, 3, 3),
           ('KAMAZ 4308-81', 6, 3, null),
           ('ЗАЗ 965', 1, null, null),
           ('УАЗ 469', 4, null, null);

/* select */
select * from cars;
select * from car_bodies;
select * from car_transmissions;
select * from car_engines;

/* 1. Вывести список всех машин и все привязанные к ним детали. */
select cars.id, cars.name as car_name, cb.name as body_name, ce.name as engine_name, ct.name as tranmission_name from cars
    left outer join car_bodies cb on cb.id = cars.body_id
    left outer join car_transmissions ct on ct.id = cars.transmission_id
    left outer join car_engines ce on ce.id = cars.engine_id;

/* 2. Вывести кузова, которые не используются НИ в одной машине. */
select cb.name, count(c.body_id) as usage from cars c
    right outer join car_bodies cb on c.body_id = cb.id
where c.body_id is null
group by cb.name;

/* 3. Вывести двигатели, которые не используются НИ в одной машине */
select ce.name, count(c.engine_id) as usage from cars c
    right outer join car_engines ce on c.engine_id = ce.id
where c.engine_id is null
group by ce.name;

/* 4. Вывести коробки передач, которые не используются НИ в одной машине */
select ct.name, count(c.transmission_id) as usage from cars c
    right outer join car_transmissions ct on c.transmission_id = ct.id
where c.transmission_id is null
group by ct.name;
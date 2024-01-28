create table passport(
                id serial primary key,
                seria int,
                number int);

create table people(
                id serial primary key,
                name varchar(255),
                passport_id int references passport(id) unique);

create table devices(
                id    serial primary key,
                name  varchar(255),
                price float);

create table devices_people(
                id        serial primary key,
                device_id int references devices (id),
                people_id int references people (id));

/* data insert */
insert into passport(seria, number) values (1111, 123456);
insert into passport(seria, number) values (1112, 123457);
insert into passport(seria, number) values (1113, 123458);

insert into people(name, passport_id) values ('Ivan', 1);
insert into people(name, passport_id) values ('Boris', 2);
insert into people(name, passport_id) values ('Petr', 3);
insert into people(name) values ('Vasya');
insert into people(name) values ('Anya');

insert into devices(name, price)
    values ('Apple iPhone 5', 1000),
           ('Apple MacBook Pro', 2200),
           ('Nokia 3310', 25),
           ('Acer Aspire 5', 300),
           ('Canon EOS450D', 250),
           ('Xiaomi Redmi Note 13', 300),
           ('Xiaomi Mi Pad 5 Pro', 350),
           ('Samsung Galaxy Tab S8', 550);

insert into devices_people(people_id, device_id)
    values (1, 1),
           (2, 2),
           (3, 4),
           (4, 3),
           (5, 3),
           (1, 5),
           (2, 6);

/* select */
select * from people inner
            join passport on people.passport_id = passport.id;

select people.id as person_id, name, passport_id as passport_id, seria, number as passport_number from people
            join passport on people.passport_id = passport.id;

select avg(price) as "Средняя цена", max(price) as "Максимальная цена", min(price) as "Минимальная цена" from devices;

select people.name, avg(devs.price) as "Средняя цена устр-в" from people
            join devices_people devsppls on devsppls.people_id = people.id
            join devices devs on devsppls.device_id = devs.id
            group by people.id
            order by avg(devs.price) desc;

select people.name, avg(devs.price) as "Средняя цена устр-в" from people
            join devices_people devsppls on devsppls.people_id = people.id
            join devices devs on devsppls.device_id = devs.id
            group by people.id
            having avg(devs.price) >= 300.0
            order by avg(devs.price) desc;
create table passport(
                         id serial primary key,
                         seria int,
                         number int
);

create table people(
                       id serial primary key,
                       name varchar(255),
                       passport_id int references passport(id) unique
);

insert into passport(seria, number) values (1111, 123456);
insert into passport(seria, number) values (1112, 123457);
insert into passport(seria, number) values (1113, 123458);

insert into people(name, passport_id) values ('Ivan', 1);
insert into people(name, passport_id) values ('Boris', 2);
insert into people(name, passport_id) values ('Petr', 3);
insert into people(name) values ('Vasya');
insert into people(name) values ('Anya');

select * from people inner
                         join passport on people.passport_id = passport.id;

select people.id as person_id, name, passport_id as passport_id, seria, number as passport_number from people
                  join passport on people.passport_id = passport.id;
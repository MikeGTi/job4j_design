create table owners
(
    id   serial primary key,
    name varchar(255)
);

create table devices
(
    id       serial primary key,
    name     varchar(255),
    owner_id int references owners (id)
);

insert into owners(name)
    values ('Owner 1'),
           ('Owner 2'),
           ('Owner 3');

insert into devices(name, owner_id)
    values ('Device 1', 1),
           ('Device 2', 2),
           ('Device 3', 3),
           ('Device 4', null),
           ('Device 5', null),
           ('Device 6', 1);

/* dml */
select * from devices d
                  left join owners o on d.owner_id = o.id;

/* all devices without owner */
select * from devices d
          left join owners o on d.owner_id = o.id
where o.id is null;

select * from owners o
          left join devices d on o.id = d.owner_id;

/* full join */
select * from devices d
          full join owners o on d.owner_id = o.id;

select * from devices d
                  left join owners o on d.owner_id = o.id
union
select * from devices d
                  right join owners o on d.owner_id = o.id;

/* cross join */
select * from devices d
                  cross join owners o;

/* таблица умножения */
create table numbers
(
    num int unique
);

insert into numbers(num)
values (1);
insert into numbers(num)
values (2);
insert into numbers(num)
values (3);

select n1.num as a, n2.num as b, (n1.num * n2.num) as "a*b=" from numbers n1
      cross join numbers n2;

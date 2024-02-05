create table teens
(
    id   serial primary key,
    name varchar(255),
    is_man boolean
);

insert into teens(name, is_man)
    values ('Вася', '1'),
           ('Катя', '0'),
           ('Настя', '0'),
           ('Петя', '1'),
           ('Леша', '1'),
           ('Даша', '0'),
           ('Саша', '1'),
           ('Ася', '0');

/* 5. Создать таблицу teens с атрибутами name, gender и заполнить ее.
   Используя cross join составить все возможные разнополые пары.
   Исключите дублирование пар вида Вася-Маша и Маша-Вася. */

/* variant I */
select distinct
    case when t1.name <= t2.name then t1.name else t2.name end name1,
    case when t1.name <= t2.name then t2.name else t1.name end name2
from teens t1 cross join teens t2
where not t1.is_man = t2.is_man;

/* variant II */
select t1.name, t2.name from teens t1 cross join teens t2
where not t1.is_man = t2.is_man
      and t1.name <= t2.name
order by t1.name;


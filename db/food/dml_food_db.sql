create table if not exists "type_name" (
    id serial primary key,
    name varchar(1024)
);

create table if not exists product
(
    id              serial primary key,
    name            varchar(1024),
    price           int,
    expired_date    date not null,
    type_id int references type(id) /* one-to-many */
);

insert into type(name)
    values ('Сыр'),
           ('Молоко и молочные продукты'),
           ('Сосиски'),
           ('Пельмени'),
           ('Хлеб'),
           ('Туалетная бумага'),
           ('Крупа');

insert into product(name, price, expired_date, type_id)
values ('Сыр плавленный Дружба', 55, '2024-02-05'::DATE, 1),
       ('Сыр моцарелла',650, '2024-10-02'::DATE, 1),
       ('Сыр Российский',450, '2024-08-02'::DATE, 1),
       ('Молоко Домик в деревне',69, '2024-08-02'::DATE, 2),
       ('Молоко Простоквашино',73, '2024-08-02'::DATE, 2),
       ('Сосиски Молочные', 373, '2024-08-04'::DATE, 3),
       ('Сосиски Венские', 453, '2024-08-03'::DATE, 3),
       ('Пельмени богатырские',450, '2024-08-03'::DATE, 4),
       ('Пельмени Мираторг',650, '2024-03-03'::DATE, 4),
       ('Пельмени сибирские',550, '2024-09-03'::DATE, 4),
       ('Пельмени собака с будкой',250, '2025-04-03'::DATE, 4),
       ('Хлеб черный',35, '2024-02-02'::DATE, 5),
       ('Хлеб белый', 32, '2024-02-02'::DATE, 5),
       ('Хлеб круглый', 37, '2024-02-02'::DATE, 5),
       ('Хлеб нарезной', 30, '2024-02-02'::DATE, 5),
       ('Туалетная бумага Свежесть', 125, '2024-06-12'::DATE, 6),
       ('Крупа гречневая', 125, '2024-02-06'::DATE, 7),
       ('Овсяная крупа средняя Геркулес', 125, '2024-02-07'::DATE, 7),
       ('Мороженное Даша', 78, '2024-02-01'::DATE, 2),
       ('Мороженное Митя', 76, '2024-02-01'::DATE, 2),
       ('Мороженное Большой рожок', 89, '2024-04-02'::DATE, 2),
       ('Мороженное Фруктовый лед', 37, '2024-10-02'::DATE, 2);

/* Базовый join */
select product.id, product.name, price, expired_date, type.name as "type_name" from product
    join type on product.type_id = type.id;

/* 1. запрос получение всех продуктов с типом "СЫР" */
select * from (select product.id, product.name, price, expired_date, type.name as "type_name" from product
                   join type on product.type_id = type.id) as "prd"
where prd.type_name ilike 'Сыр';

/* 2. Написать запрос получения всех продуктов, у кого в имени есть слово "мороженое" */
select * from (select product.id, product.name, price, expired_date, type.name as "type_name" from product
                   join type on product.type_id = type.id) as "prd"
    where prd.name ilike '%Мороженное%';

/* 3. Написать запрос, который выводит все продукты, срок годности которых уже истек */
select * from (select product.id, product.name, price, expired_date, type.name as "type_name" from product
                   join type on product.type_id = type.id) as "prd"
     where prd.expired_date < (select current_date);

/* 4. Написать запрос, который выводит самый дорогой продукт. Запрос должен быть универсальный и находить все продукты с максимальной ценой. */
select * from (select product.id, product.name, price, expired_date, type.name as "type_name" from product
                   join type on product.type_id = type.id) as "prd"
     where prd.price = (select max(product.price) from product);

/* 5. Написать запрос, который выводит для каждого типа количество продуктов к нему принадлежащих. */
select "type_name", count(prd.type_name) from (select product.id, product.name, price, expired_date, type.name as "type_name" from product
                                            join type on product.type_id = type.id) as "prd"
group by "type_name", prd.type_name;

/* 6. Написать запрос получение всех продуктов с типом "СЫР" и "МОЛОКО" */
select * from (select product.id, product.name, price, expired_date, type.name as "type_name" from product
                   join type on product.type_id = type.id) as "prd"
where prd.type_name iLike '%Молоко%' or prd.type_name iLike 'Сыр';

/* 7. Написать запрос, который выводит тип продуктов, которых осталось меньше 4 штук. */
select * from (select product.id, product.name, price, expired_date, type.name as "type_name" from product
                   join type on product.type_id = type.id) as prd
where prd.type_name in (select type.name from product
                      join type on product.type_id = type.id
                   group by type.name
                   having count(type.name) < 4)
order by prd.type_name;

/* sub query - result (4 row): Крупа - 2, Сосиски - 2, Сыр - 3, Туалетная бумага - 1 */
select type_name, count(type_name) from (select product.id, product.name, price, expired_date, type.name as "type_name" from product
                                                     join type on product.type_id = type.id) as "prd"
group by type_name
having count(type_name) < 4
order by type_name;

/* 8. Вывести все продукты и их тип. */
select prd.name, type_name from (select product.id, product.name, price, expired_date, type.name as "type_name" from product
                                    join type on product.type_id = type.id) as "prd";

/* собрать продукты по типам */
select type_name as "Product type", string_agg(jp.name, ';' || chr(10)) as "Products", count(jp.name) as "Products count" from
    (select p.id, p.name, price, expired_date, t.name as "type_name" from product p
                                join type t on p.type_id = t.id) as jp
group by (jp.type_name)
order by jp.type_name;
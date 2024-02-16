create table products
(
    id    serial primary key,
    name  varchar(50),
    count integer default 0,
    price integer
);

insert into products (name, count, price)
    values ('product_1', 3, 50);
insert into products (name, count, price)
    values ('product_2', 15, 32);
insert into products (name, count, price)
    values ('product_3', 8, 115);

alter table products AUTO_INCREMENT = 1;

set session transaction isolation level read uncommitted;
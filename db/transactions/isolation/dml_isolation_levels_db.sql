create table if not exists products
(
    id       serial primary key,
    name     varchar(50),
    producer varchar(50),
    count    integer default 0,
    price    integer
);

insert into products (name, producer, count, price)
    values ('product_1', 'producer_1', 3, 50);
insert into products (name, producer, count, price)
    values ('product_2', 'producer_2', 15, 32);
insert into products (name, producer, count, price)
    values ('product_3', 'producer_3', 8, 115);

alter sequence products_id_seq restart with 1;

select * from products;

alter system set default_transaction_isolation = 'serializable';
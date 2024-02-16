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

insert into products (name, producer, count, price)
    values ('product_7', 'producer_7', 15, 23);
insert into products (name, producer, count, price)
    values ('product_8', 'producer_8', 19, 34);
insert into products (name, producer, count, price)
    values ('product_9', 'producer_9', 0, 112);


alter sequence products_id_seq restart with 1;

select * from products;

alter system set default_transaction_isolation = 'serializable';
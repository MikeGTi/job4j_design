start transaction isolation level read committed;
    insert into products (name, producer, count, price)
        values ('product_4', 'producer_4', 11, 64);
    insert into products (name, producer, count, price)
        values ('product_5', 'producer_5', 10, 56);

commit transaction;

select * from products;


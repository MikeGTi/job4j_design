begin transaction isolation level read committed;

    insert into products (name, producer, count, price)
        values ('product_6', 'producer_6', 12, 54);

    select * from products;
    select sum(price) from products;
    savepoint after_insert_1;

    update products set price = price - price * .25;
    select sum(price) from products;
    savepoint after_update_prices;

    rollback to after_insert_1;

    select sum(price) from products;

commit transaction;
rollback transaction;

select * from products;

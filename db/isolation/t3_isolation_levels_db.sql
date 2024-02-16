start transaction isolation level serializable;
rollback;
commit;

select sum(price) from products;
update products set price = price - 25;

insert into products (name, producer, count, price)
    values ('product_4', 'producer_4',11, 64);
delete from products where price = 115;
update products set price = 75 where name = 'product_1';

select * from products;


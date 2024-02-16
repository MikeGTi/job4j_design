set session transaction isolation level read uncommitted;

start transaction;
rollback;
commit;

insert into products (name, count, price)
    values ('product_4', 11, 64);
delete from products where price = 115;
update products set price = 75 where name = 'product_1';

select * from products;

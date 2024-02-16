start transaction isolation level read committed;
    delete  from products;
    drop table products;
rollback transaction;

select * from products;


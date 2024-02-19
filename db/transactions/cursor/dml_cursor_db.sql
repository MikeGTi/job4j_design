create table if not exists products
(
    id    serial primary key,
    name  varchar(50),
    count integer default 0,
    price integer
);

insert into products (name, count, price)
    values ('product_1', 1, 5);
insert into products (name, count, price)
    values ('product_2', 2, 10);
insert into products (name, count, price)
    values ('product_3', 3, 15);
insert into products (name, count, price)
    values ('product_4', 4, 20);
insert into products (name, count, price)
    values ('product_5', 5, 25);
insert into products (name, count, price)
    values ('product_6', 6, 30);
insert into products (name, count, price)
    values ('product_7', 7, 35);
insert into products (name, count, price)
    values ('product_8', 8, 40);
insert into products (name, count, price)
    values ('product_9', 9, 45);
insert into products (name, count, price)
    values ('product_10', 10, 50);
insert into products (name, count, price)
    values ('product_11', 11, 55);
insert into products (name, count, price)
    values ('product_12', 12, 60);
insert into products (name, count, price)
    values ('product_13', 13, 65);
insert into products (name, count, price)
    values ('product_14', 14, 70);
insert into products (name, count, price)
    values ('product_15', 15, 75);
insert into products (name, count, price)
    values ('product_16', 16, 80);
insert into products (name, count, price)
    values ('product_17', 17, 85);
insert into products (name, count, price)
    values ('product_18', 18, 90);
insert into products (name, count, price)
    values ('product_19', 19, 95);
insert into products (name, count, price)
    values ('product_20', 20, 100);

alter sequence products_id_seq restart with 1;
select * from products;

/* transaction to get data from first row (by 5 rows) */
begin;
declare
    cursor_products cursor for (select * from products);
    fetch 5 from cursor_products;
    fetch next from cursor_products;
    fetch next from cursor_products;
    fetch next from cursor_products;
close cursor_products;
commit;

/* transaction to get data from last row (by 5 rows) */
begin;
declare
    cursor_products scroll cursor for (select * from products);
    move last from cursor_products;
    move backward 5 from cursor_products;
    fetch 5 from cursor_products;

    move backward 10 from cursor_products;
    fetch 5 from cursor_products;

    move backward 10 from cursor_products;
    fetch 5 from cursor_products;

    move backward 10 from cursor_products;
    fetch 5 from cursor_products;

    close cursor_products;
commit;


create or replace function fetch_products_name_count_and_price(
    OUT p_name varchar(50),
    OUT p_count integer,
    OUT p_price integer
)
    returns setof record as
$$
declare
    cursor_prod CURSOR FOR
        SELECT name, count, price
        FROM products;
    prod_record RECORD;
begin
    -- Open cursor
    open cursor_prod;

    -- Fetch rows and return
    loop
        fetch next from cursor_prod into prod_record;
        exit when not found;
        p_name := prod_record.name;
        p_count := prod_record.count;
        p_price := prod_record.price;
        return next ;
    end loop;

    -- Close cursor
    close cursor_prod;
end;
$$
    language PLPGSQL;
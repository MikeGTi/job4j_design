create table products
(
    id       serial primary key,
    name     varchar(50),
    producer varchar(50),
    count    integer default 0,
    price    integer
);

/* procedures from task */
create
    or replace procedure insert_product(i_name varchar, prod varchar, i_count integer, i_price integer)
    language 'plpgsql'
as $$
BEGIN
    insert into products (name, producer, count, price)
    values (i_name, prod, i_count, i_price);
END
$$;

call insert_product('product_2', 'producer_2', 15, 32);
call insert_product('product_1', 'producer_1', 3, 50);
call insert_product('product_3', 'producer_3', 8, 115);
select * from products;

create
    or replace procedure update_product_count(u_count integer, u_id integer)
    language 'plpgsql'
as $$
    declare cur_count integer;
BEGIN
    if u_count > 0 then
        cur_count = (select count from products where id = u_id);
        if u_count > cur_count then
            u_count = cur_count;
        end if;

        update products
        set count = count - u_count
        where id = u_id;
    end if;
END;
$$;

call update_product_count(20,  1);

select * from products;

create
    or replace procedure update_product_tax(tax float, u_id integer)
    language 'plpgsql'
as $$
BEGIN
    if  tax > 0 then
        if u_id > 0 then
            update products
            set price = price + price * tax
            where id = u_id;
        else
            update products
            set price = price + price * tax;
        end if;
    end if;
END;
$$;

call update_product_tax( 0.2, 1);
call update_product_tax( 0.2, 0);

/*alter procedure update_product(u_count integer, tax float, u_id integer)(u_count integer, tax float, u_id integer)
    rename to update_product_w_problems;
drop procedure update_product(u_count integer, tax float, u_id integer);*/

alter sequence products_id_seq restart with 1;

create
    or replace function f_update_product_count(u_count integer, u_id integer)
    returns integer
    language 'plpgsql'
as
$$
declare
    result integer;
    cur_count integer;
begin
    result = 1;
    if u_count > 0 then
        cur_count = (select count from products where id = u_id);
        if u_count > cur_count then
            u_count = cur_count;
            result = 0;
        end if;

        update products
            set count = count - u_count
            where id = u_id;
    end if;
    return result;
end;
$$;

create
    or replace function f_update_product_tax(tax float, u_id integer)
    returns integer
    language 'plpgsql'
as
$$
declare
    result integer;
begin
    if tax > 0 then
        update products
        set price = price + price * tax
        where id = u_id;

        select into result sum(price)
        from products;
    end if;
    return result;
end;
$$;

select f_update_product_count(10, 1);
select f_update_product_tax(0.2, 0);

select * from products;

alter sequence products_id_seq restart with 1;

/* DELETE */

create
    or replace function f_delete_products_w_count0()
    returns integer
    language 'plpgsql'
as
$$
declare
    result integer;
    before_delete integer;
begin
    before_delete = (select count(*) from products where count = 0);
    delete from products where count = 0;
    result =  before_delete - (select count(*) from products where count = 0);
    return result;
end;
$$;

create
    or replace procedure delete_products_w_count0()
    language 'plpgsql'
as $$
BEGIN
    delete from products where count = 0;
END;
$$;

alter sequence products_id_seq restart with 1;

call insert_product('product_2', 'producer_2', 15, 32);
call insert_product('product_1', 'producer_1', 3, 50);
call insert_product('product_3', 'producer_3', 8, 115);

select f_update_product_count(20, 1);
select f_update_product_count(20, 2);
select f_update_product_count(20, 3);

select f_delete_products_w_count0();

call delete_products_w_count0();

select * from products;
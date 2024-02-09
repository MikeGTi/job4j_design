create table products
(
    id       serial primary key,
    name     varchar(50),
    producer varchar(50),
    count    integer default 0,
    price    integer
);

/* function for row level trigger */
create
    or replace function discount()
    returns trigger as
$$
BEGIN
    update products
    set price = price - price * 0.2
    where count <= 5
      and id = new.id;
    return new;
END;
$$
    LANGUAGE 'plpgsql';

/* row level trigger */
create trigger discount_trigger
    after insert on products
    for each row execute procedure discount();

/* dml */
insert into products (name, producer, count, price)
values ('product_3', 'producer_3', 8, 115);

insert into products (name, producer, count, price)
values ('product_1', 'producer_1', 3, 50);

select * from products;

alter table products disable trigger discount_trigger;
drop trigger discount_trigger on products;

/* function for statement level trigger */
create
    or replace function tax()
    returns trigger as
$$
BEGIN
    update products
    set price = price - price * 0.2
    where id in (select id from inserted)
      and count <= 5;
    return new;
END;
$$
    LANGUAGE 'plpgsql';

/* statement level trigger */
create trigger tax_trigger
    after insert on products
    referencing new table as inserted
    for each statement execute procedure tax();

insert into products (name, producer, count, price)
VALUES ('product_3', 'producer_3', 8, 115);

select * from products;

insert into products (name, producer, count, price)
VALUES ('product_1', 'producer_1', 3, 50);

alter table products disable trigger tax_trigger;

drop trigger tax_trigger on products;
drop function tax();

/* My triggers */
/* Statement level trigger */
/* 1)  Должен срабатывать после вставки данных, для любого товара и просто насчитывать налог на товар */
create or replace function a_add_tax_rf_price()
    returns trigger as
    $$
    BEGIN
        update products
        set price = price * 1.1
        where id in (select id from inserted);
        return new;
    END;
    $$
LANGUAGE 'plpgsql';

create or replace trigger a_trigger_add_tax
    after insert on products
    referencing new table as inserted
    for each statement execute procedure a_add_tax_rf_price();

drop trigger a_trigger_add_tax on products;
drop function a_add_tax_rf_price();

insert into products (name, producer, count, price)
values ('product_1', 'producer_1', 3, 100),
       ('product_2', 'producer_2', 4, 200),
       ('product_3', 'producer_2', 9, 300),
       ('product_4', 'producer_3', 7, 400),
       ('product_5', 'producer_3', 6, 500);

select * from products;

/* Row level trigger */
/* 2) Должен срабатывать до вставки данных и насчитывать налог на товар (нужно прибавить налог к цене товара). */
create or replace function b_add_tax_rf_price()
    returns trigger as
$$
BEGIN
    new.price = new.price * 1.1;
    return new;
END;
$$
    LANGUAGE 'plpgsql';

create or replace trigger b_trigger_add_tax
    before insert on products
    for each row execute procedure b_add_tax_rf_price();

drop trigger b_trigger_add_tax on products;
drop function b_add_tax_rf_price();

insert into products (name, producer, count, price)
values ('product_1', 'producer_1', 3, 100),
       ('product_2', 'producer_2', 4, 200),
       ('product_3', 'producer_2', 9, 300),
       ('product_4', 'producer_3', 7, 400),
       ('product_5', 'producer_3', 6, 500);

select * from products;

/* Row level trigger */
/* 3) Сразу после вставки продукта в таблицу products,
      будет заносить имя, цену и текущую дату в таблицу history_of_price. */
create table history_of_price
(
    id    serial primary key,
    name  varchar(50),
    price integer,
    date  timestamp
);

create or replace function c_copy_to_history()
    returns trigger as
$$
BEGIN
    insert into history_of_price (name, price, date)
        values (new.name, new.price, current_timestamp);
    return new;
END;
$$
    LANGUAGE 'plpgsql';

create or replace trigger c_trigger_copy_to_history_price
    before insert on products
    for each row execute procedure c_copy_to_history();

drop trigger c_trigger_copy_to_history_price on products;
drop function c_copy_to_history();

insert into products (name, producer, count, price)
values ('product_1', 'producer_1', 3, 100),
       ('product_2', 'producer_2', 4, 200),
       ('product_3', 'producer_2', 9, 300),
       ('product_4', 'producer_3', 7, 400),
       ('product_5', 'producer_3', 6, 500);

select * from products;
select * from history_of_price;

/* non correct db */
/*create table if not exists Customer
(
    full_name varchar(255),
    address   varchar(1024),
    films     varchar(1024),
    gender    varchar(16)
);*/


/* normalized db */
create table if not exists film(
    id    serial primary key,
    name  varchar(1022)
);

create table if not exists address
(
    id      serial primary key,
    region  varchar(255),
    city    varchar(255),
    street  varchar(255),
    house   varchar(255),
    flat    varchar(255)
);

create table if not exists customer
(
    id         serial primary key,
    first_name varchar(50),
    last_name  varchar(50),
    gender varchar(16),
    address_id int references address(id)
);

create table if not exists customer_film(
                                            id        serial primary key,
                                            customer_id int references customer(id),
                                            film_id int references film(id)
);

insert into address (region, city, street, house, flat)
    values ('Region1', 'City1', 'Street1', 1, 1),
           ('Region2', 'City2', 'Street2', 2, 1),
           ('Region3', 'City3', 'Street3', 3, 1),
           ('Region4', 'City4', 'Street4', 4, 1),
           ('Region5', 'City5', 'Street5', 5, 1);

insert into film (name)
    values ('Film1'),
           ('Film2'),
           ('Film3'),
           ('Film4'),
           ('Film5');

insert into customer (first_name, last_name, gender, address_id)
values ('UserFirstName1', 'UserLastName1', 'male', 1),
       ('UserFirstName2', 'UserLastName2', 'female', 2),
       ('UserFirstName3', 'UserLastName3', 'male', 3),
       ('UserFirstName4', 'UserLastName4', 'male', 4),
       ('UserFirstName5', 'UserLastName5', 'female', 5);

insert into customer_film (customer_id, film_id) 
    values (1, 1),
           (2, 2),
           (3, 3),
           (4, 4),
           (5, 5);

alter sequence customer_id_seq restart with 1;
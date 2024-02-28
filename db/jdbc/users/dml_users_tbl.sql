create table if not exists users
(
    id serial primary key,
    name varchar(255),
    e_mail varchar(1024)
);

select * from users;

alter sequence users_id_seq restart with 1;
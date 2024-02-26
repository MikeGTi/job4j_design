create table if not exists users
(
    id       bigint generated always as identity primary key,
    username text not null
);

insert into users (username) select 'person' || n from generate_series(1, 1000) as n;

insert into users (username) select 'person' || n from generate_series(1001, 2000) as n;
analyse users;

explain analyse select * from users order by username;
explain select * from users;
explain analyse select * from users limit 1;
explain select count(*) from users;

select reltuples, relpages from pg_class where relname = 'users';

create index people_username_index on users(username);
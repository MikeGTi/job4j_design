create table owners(
                   id serial primary key,
                   name varchar(255),
                   surname varchar(255),
                   car_id int references cars(id)
);
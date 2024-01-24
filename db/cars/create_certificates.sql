create table certificates(
                          id serial primary key,
                          model varchar(255),
                          car_type varchar(255),
                          release_year date,
                          color varchar(255)
);
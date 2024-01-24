create table engines_cars(
                      id serial primary key,
                      engine_id integer references engines(id),
                      car_id integer references cars(id) unique);
create table cars_certs(
                        id serial primary key,
                        car_id integer references cars(id) unique,
                        cert_id integer references certificates(id) unique);

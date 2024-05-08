create database airports_db;

create table airports
(
    code CHAR(3) PRIMARY KEY ,
    country VARCHAR(256) NOT NULL ,
    city VARCHAR(128) NOT NULL
);

create table aircrafts
(
    id SERIAL PRIMARY KEY ,
    model VARCHAR(128) NOT NULL
);

create table seats
(
    aircraft_id INT REFERENCES aircrafts (id),
    seat_no VARCHAR(4) NOT NULL ,
    PRIMARY KEY (aircraft_id, seat_no)
);

create table flights
(
    id BIGSERIAL PRIMARY KEY ,
    flight_no VARCHAR(16) NOT NULL ,
    departure_date TIMESTAMP NOT NULL ,
    departure_airport_code CHAR(3) REFERENCES airports(code) NOT NULL ,
    arrival_date TIMESTAMP NOT NULL ,
    arrival_airport_code CHAR(3) REFERENCES airports(code) NOT NULL ,
    aircraft_id INT REFERENCES aircrafts (id) NOT NULL ,
    status VARCHAR(32) NOT NULL
);

create table tickets
(
    id BIGSERIAL PRIMARY KEY ,
    passenger_no VARCHAR(32) NOT NULL ,
    passenger_name VARCHAR(128) NOT NULL ,
    flight_id BIGINT REFERENCES flights (id) NOT NULL ,
    seat_no VARCHAR(4) NOT NULL,
    cost NUMERIC(8, 2) NOT NULL
);
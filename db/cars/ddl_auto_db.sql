/* create */
create table cars(
						id serial primary key,
						manufacturer varchar(255),
						model varchar(255),
						country text);
				  
create table certificates(
                        id serial primary key,
                        model varchar(255),
                        car_type varchar(255),
                        release_year date,
                        color varchar(255)
);

create table cars_certs(
                        id serial primary key,
                        car_id integer references cars(id) unique,
                        cert_id integer references certificates(id) unique);

create table engines(
						id serial primary key,
						manufacturer varchar(255),
						model varchar(255),
						volume double precision,
						power integer);
					  
create table engines_cars(
						id serial primary key,
						engine_id integer references engines(id),
						car_id integer references cars(id) unique);

create table owners(
						id serial primary key,
						name varchar(255),
						surname varchar(255),
						car_id int references cars(id));

/* inserts */
insert into cars(manufacturer, model, country) 
			values ('Chevrolet', 'Tahoe', 'USA'),
				   ('Chevrolet', 'Corvette', 'USA'),
				   ('VAZ', '2101', 'Russia'),
				   ('KAMAZ', '4308-81', 'Russia');

insert into certificates(model, car_type, release_year, color)
            values ('Chevrolet', 'Jeep', '01-01-2001', 'black'),
                   ('Chevrolet', 'Sport-car', '01-01-1967', 'green'),
                   ('VAZ', 'Sedan', '01-01-1971', 'white'),
                   ('KAMAZ', 'Van', '01-01-2021', 'gray');

insert into cars_certs(car_id, cert_id)
            values (1, 1),
                   (2, 2),
                   (3, 3),
                   (4, 4);

insert into engines(manufacturer, model, volume, power)
            values ('Chevrolet', 'W12', 5.7, 540),
                   ('Chevrolet', 'V6', 4.5, 360),
                   ('VAZ', '1100', 1.1, 70),
                   ('KAMAZ', '4', 4.9, 180);

insert into engines_cars(engine_id, car_id)
            values (1, 1),
                   (2, 2),
                   (3, 3),
                   (4,4);
				   
insert into owners(name, surname, car_id) 
			values ('Вася', 'Пупкин', 1),
			       ('Петя', 'Кротов', 2),
				   ('Иннокентий', 'Смоктуновский', 3),
				   ('Казимир', 'Козлевич', 4);
/* update */
update cars set model = 'Lumina' where id = 2;

/* select */
select * from cars;
select * from engines;
select * from certificates;

/* delete */
delete from cars where id = 1;
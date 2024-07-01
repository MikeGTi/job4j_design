insert into airports (code, country, city)
values ('MSQ', 'Belarus', 'Minsk'),
       ('LHR', 'England', 'London'),
       ('SVO', 'Russia', 'Moscow'),
       ('BCN', 'Spain', 'Barcelona');

insert into aircrafts (model)
values ('Boeing 777-300'),
       ('Boeing 737-300'),
       ('Airbus A320-200'),
       ('Sukhoi Superjet 100'),
       ('Embraer E-195');

insert into seats (aircraft_id, seat_no)
select id, s.column1
from aircrafts
         cross join (values ('1A'), ('2A'), ('3A'),
                            ('1B'), ('2B'), ('3B'),
                            ('1C'), ('2C'), ('3C'),
                            ('1D'), ('2D'), ('3D') order by 1) s;

insert into flights (flight_no, departure_date, departure_airport_code, arrival_date, arrival_airport_code, aircraft_id,
                     status)
values ('MN3002', '2023-06-14T14:30', 'MSQ', '2023-06-14T18:07', 'LHR', 1, 'ARRIVED'),
       ('MN3003', '2023-06-16T09:15', 'LHR', '2023-06-16T13:00', 'MSQ', 1, 'ARRIVED'),
       ('BC2801', '2023-07-28T23:25', 'MSQ', '2023-07-29T02:43', 'LHR', 2, 'ARRIVED'),
       ('BC2802', '2023-08-01T11:00', 'LHR', '2023-08-01T14:15', 'MSQ', 2, 'DEPARTED'),
       ('TR3103', '2023-09-03T13:10', 'SVO', '2023-09-03T18:38', 'BCN', 3, 'ARRIVED'),
       ('TR3104', '2023-09-10T07:15', 'BCN', '2023-09-10T012:44', 'SVO', 3, 'CANCELLED'),
       ('CV9827', '2024-01-09T18:00', 'MSQ', '2024-01-09T19:15', 'SVO', 4, 'SCHEDULED'),
       ('CV9828', '2024-01-19T08:55', 'SVO', '2024-01-19T10:05', 'MSQ', 4, 'SCHEDULED'),
       ('QS8712', '2024-04-01T03:35', 'MSQ', '2024-04-01T06:46', 'LHR', 2, 'ARRIVED');

insert into tickets (passenger_no, passenger_name, flight_id, seat_no, cost)
values ('YMNOFW', 'John Doe', 1, '1A', 200),
       ('ECGETM', 'Dominic Cobb', 1, '1B', 180),
       ('AJBHKL', 'Nina Sayers', 1, '2B', 175),
       ('A14CIG', 'Robert Fisher', 1, '2C', 175),
       ('D4MDYS', 'David Moreau', 1, '1D', 160),
       ('66ZMLS', 'Peter Parker', 1, '2A', 198),
       ('BCRGVA', 'Allison Cameron', 2, '1A', 250),
       ('ROX3RM', 'Chris Taub', 2, '2B', 225),
       ('LMWMEC', 'David Moreau', 2, '1C', 217),
       ('SFEPQS', 'Lawrence Kutner', 2, '2C', 227),
       ('PWTMXF', 'Nina Sayers', 2, '2D', 277),
       ('JBW7YL', 'Stephen Miles', 3, '1A', 300),
       ('AKJH7M', 'Peter Browning', 3, '2A', 285),
       ('Y7OKTH', 'Jack Sparrow', 3, '1B', 99),
       ('FLTLP6', 'Robert Chase', 3, '2B', 199),
       ('P2ZWHR', 'Eric Foreman', 3, '1C', 299),
       ('IQYUGF', 'James Wilson', 3, '2C', 230),
       ('UAKUPJ', 'Adam Smith', 3, '1D', 180),
       ('ODMFFQ', 'Anna Smith', 3, '2D', 224),
       ('YORAPL', 'Gregory House', 4, '1A', 129),
       ('GFONBN', 'Janet Montgomery', 4, '2A', 152),
       ('IE8K2W', 'Adam Smith', 4, '1B', 140),
       ('FIWOOM', 'Anna Smith', 4, '2B', 140),
       ('CS3HLF', 'Vasiliy Fet', 4, '2D', 109),
       ('QHBDCE', 'John Doe', 5, '2C', 170),
       ('4SOAAT', 'Barbara Hershey', 5, '1C', 185),
       ('PNYYIM', 'Jessica Adams', 5, '1A', 204),
       ('GGWQZ2', 'Gabriel Bolivar', 5, '1B', 189),
       ('GVB2MG', 'Thomas Eichhorst', 6, '1A', 204),
       ('TIISTM', 'Stephen Miles', 6, '2A', 214),
       ('ZXBE4P', 'Peter Browning', 6, '2B', 176),
       ('NSM6VB', 'John Doe', 6, '1B', 135),
       ('EVYLEG', 'Remy Hadley', 6, '1C', 155),
       ('SEBLQS', 'Jim Kent', 6, '1D', 125),
       ('OZC02K', 'Jack Sparrow', 7, '1A', 69),
       ('Y225CW', 'Lisa Cuddy', 7, '2A', 58),
       ('E724T7', 'Eldritch Palmer', 7, '1D', 65),
       ('I99IRF', 'Martha Masters', 7, '2D', 65),
       ('QJUAKC', 'Abraham Setrakian', 7, '2C', 73),
       ('V0HGGM', 'Janet Montgomery', 7, '1B', 66),
       ('ZWYJNY', 'Dominic Cobb', 7, '1C', 80),
       ('R1XCRF', 'Robert Fisher', 8, '1A', 100),
       ('DXVPUR', 'Nora Martinez', 8, '2A', 89),
       ('JBHTYL', 'Carl Jackson', 8, '2B', 79),
       ('V4UKDT', 'Janet Jackson', 8, '2C', 77),
       ('K7W2D4', 'Joss Carter', 8, '2B', 94),
       ('NQVMJK', 'Lionel Fusco', 8, '1D', 81),
       ('XO3SGR', 'Nina Sayers', 9, '2A', 222),
       ('EJ2KFI', 'Harold Finch', 9, '1A', 198),
       ('K7UVS4', 'John Reese', 9, '1B', 243),
       ('FBFSE8', 'Ephraim Goodweather', 9, '1C', 251),
       ('9GNQRD', 'John Doe', 9, '2C', 135),
       ('PHQKCF', 'Barbara Hershey', 9, '2B', 217),
       ('7E5LL9', 'Dominic Cobb', 9, '1D', 189),
       ('9S9XBU', 'Sameen Shaw', 9, '2D', 234);

/* 1. определите среднюю стоимость билета, результат округлите до 2-х чисел */
select round(avg(t1.cost), 2) average_ticket_cost from tickets t1;

/* 2. определите общую стоимость всех билетов */
select sum(t1.cost) total_ticket_cost from tickets t1;

/* 3. определите минимальную стоимость билета */
select min(t1.cost) min_ticket_cost from tickets t1;

/* 4. определите максимальную  стоимость билета */
select max(t1.cost) max_ticket_cost from tickets t1;

/* 5. определите среднее время полёта в секундах */
select avg(f1.arrival_date - f1.departure_date) average_flight_duration_seconds from flights f1;

select avg(EXTRACT(EPOCH FROM (f1.arrival_date - f1.departure_date))) average_flight_duration_seconds from flights f1;

/* 6. определите минимальное время полёта */
select min(f1.arrival_date - f1.departure_date) min_flight_duration_seconds from flights f1;

/* 7. определите максимальное время полёта */
select max(f1.arrival_date - f1.departure_date) max_flight_duration_seconds from flights f1;

/* 8. определите количество билетов на каждый из рейсов */
select t1.flight_id, count(t1.seat_no) num_tickets from tickets t1
group by t1.flight_id;

/* 9. определите общее количество мест на каждом самолете */
select s1.aircraft_id,
       count(s1.seat_no) total_seats
from seats s1
group by s1.aircraft_id;

/* 10. определите количество рейсов из каждого аэропорта */
select f1.departure_airport_code, count(f1.id) num_flights from flights f1
group by f1.departure_airport_code;

/* 11. определите среднюю стоимость билетов на каждый рейс, среднюю стоимость округлите до 2 знаков после точки */
select t1.flight_id, round(avg(t1.cost), 2) average_ticket_cost from tickets t1
group by t1.flight_id;

/* 12. определите минимальную стоимость билета на каждый рейс */
select t1.flight_id, round(min(t1.cost), 2) min_ticket_cost from tickets t1
group by t1.flight_id;

/* 13. определите минимальную стоимость билета на каждый рейс */
select t1.flight_id, round(max(t1.cost), 2) max_ticket_cost from tickets t1
group by t1.flight_id;

/* 14. определите общее количество билетов, купленных каждым пассажиром */
select t1.passenger_name, count(t1.passenger_name) num_tickets_bought from tickets t1
group by t1.passenger_name;

/* 15. определите общую стоимость билетов для каждого пассажира, отсортируйте по убыванию общей стоимости */
select t1.passenger_name, sum(t1.cost) total_ticket_cost from tickets t1
group by t1.passenger_name
order by total_ticket_cost desc;

/* 16. определите самый дорогой билет, купленный каждым пассажиром */
select t1.passenger_name, max(t1.cost) max_ticket_cost from tickets t1
group by t1.passenger_name
order by max_ticket_cost;

/* 17. определите самый популярный маршрут (по количеству билетов) */
select f1.departure_airport_code, f1.arrival_airport_code, count(t1.id) num_tickets from tickets t1
join flights f1 on t1.flight_id = f1.id
group by f1.departure_airport_code, f1.arrival_airport_code
order by num_tickets desc
limit 1;

/* 18. определите среднее количество билетов на рейс, округлите результат до 3-х чисел */
select round(avg(count_tickets_per_flight), 3) average_tickets_per_flight from
   (select count(t1.flight_id) count_tickets_per_flight from tickets t1
    join flights f1 on t1.flight_id = f1.id
    group by t1.flight_id) j1;

/* 19. определите среднее количество мест на самолете */
select avg(sc1.seats_count) average_seats_per_aircraft from
    (select count(s1.seat_no) seats_count from seats s1
     group by s1.aircraft_id) sc1;

/* 20. определите самый дорогой билет */
select * from tickets t1
where t1.cost = (select max(t2.cost) from tickets t2)
limit 1;

/* 21. определите все аэропорты, название которых начинается на "M" */
select * from airports a1
where a1.city like 'M%';

/* 22. определите все рейсы с номером, содержащим "MN" */
select * from flights f1
where f1.flight_no like '%MN%';

/* 23. определите все модели самолетов, оканчивающиеся на "300" */
select a1.id, a1.model from aircrafts a1
where a1.model like '%300';

/* 24. определите все рейсы, вылетающие из аэропорта, содержащего слово "Moscow" */
select * from flights f1
where f1.departure_airport_code = (select a1.code from airports a1 where a1.city like 'Moscow');

/* 25. определите все рейсы, прибывающие в аэропорт, содержащий слово "London" */
select * from flights f1
where f1.arrival_airport_code = (select a1.code from airports a1 where a1.city like 'London');

/* 26. определите все рейсы, статус которых НЕ содержит слово "CANCELLED" */
select * from flights f1
where f1.status not like 'CANCELLED';

/* 27. определите все билеты, номер которых начинается с "A" */
select * from tickets t1
where t1.passenger_no like 'A%';

/* 28. определите все билеты, стоимость которых оканчивается на "0" */
select * from tickets t1
where ceil(t1.cost) % 10 = 0;

/* 29. определите все билеты, пассажиры которых начинаются с "J" */
select * from tickets t1
where t1.passenger_name like 'J%';

/* 30. определите все билеты, номера сидений, которых оканчиваются на "A" */
select * from tickets t1
where t1.seat_no like '%A';

/* 31. определите все билеты, пассажиры которых имеют имя, начинающееся на "A" */
select * from tickets t1
where t1.passenger_name like 'A%';

/* 32. определите все рейсы, вылетающие с 1 июня 2023 года по 30 июня 2023 года */
select * from flights f1
where f1.departure_date between '2023-06-01' and '2023-06-30';

/* 33. определите все билеты, стоимость которых между $100 и $200 */
select * from tickets t1
where t1.cost between 100 and 200;

/* 34. определите все рейсы, вылетающие с 10:00 до 18:00 */
select * from flights f1
where extract(hour from f1.departure_date) between '10' and '18';

/* 35. определите все рейсы, прибывающие в аэропорт с 1 августа 2023 года по 31 августа 2023 года */
select * from flights f1
where f1.arrival_date between '2023-08-01' and '2023-08-31';

/* 36. определите все самолеты с идентификаторами между 2 и 4 */
select * from aircrafts a1
where a1.id between 2 and 4;

/* 37. определите все рейсы, прибывающие после 12:00 и до 18:00 */
select * from flights f1
where extract(hour from f1.arrival_date) between '12' and '18';

/* 38. определите все билеты, стоимость которых не больше $150 и не меньше $250 */
select * from tickets t1
where t1.cost not between 150 and 250;

/* 39. определите все рейсы, номера которых между 'MN3000' и 'MN3500' */
select * from flights f1
where f1.flight_no between 'MN3000' and 'MN3500';

/* 40. определите все билеты, купленные с 1 января 2024 года до текущей даты */
select * from tickets t1 join flights f1 on f1.id = t1.flight_id
where f1.departure_date between '2024-01-01' and now();

/* 41. определите все рейсы, вылетающие с 1 января 2024 года до текущей даты */
select * from flights f1
where f1.departure_date between '2024-01-01' and now();

/* 42. определите все рейсы, вылетающие с 1 января 2023 года до 31 декабря 2023 года включительно */
select * from flights f1
where f1.departure_date between '2023-01-01' and '2024-01-01';

/* 43. определите все билеты, купленные до 1 июля 2023 года */
select * from tickets t1 join flights f1 on f1.id = t1.flight_id
where f1.departure_date not between '2023-07-01' and now();

/* 44. определите все билеты, стоимость которых не входит в диапазон от $100 до $300 */
select * from tickets t1
where t1.cost not between 100 and 300;

/* 45. определите все билеты, купленные с 2023-06-01 по 2023-06-30 и стоимость которых не менее $200 */
select * from tickets t1 join flights f1 on f1.id = t1.flight_id
where t1.cost not between 0 and 199
and f1.departure_date between '2023-06-01' and '2023-06-30';

/* 46. определите все билеты, купленные с 2023-01-01 до текущей даты пассажиром с именем "Nina Sayers" */
select * from tickets t1 join flights f1 on f1.id = t1.flight_id
where f1.departure_date between '2023-01-01' and now()
and t1.passenger_name = 'Nina Sayers';

/* 47. определите все билеты, купленные с отправлением в сентябре 2023 года */
select * from tickets t1 join flights f1 on f1.id = t1.flight_id
where extract(year from f1.departure_date) = 2023
  and extract(month from f1.departure_date) = 9;

/* 48. определите все рейсы, вылетающие в первый квартал 2024 года */
select * from flights f1
where extract(year from f1.departure_date) = 2024
  and extract(month from f1.departure_date) between 1 and 3;

/* 49. определите все рейсы, у которых день вылета и прилета не совпадают */
select * from flights f1
where extract(day from f1.departure_date) != extract(day from f1.arrival_date);

/* 50. определите все рейсы из Минска в Лондон */
select * from flights f1
where f1.departure_airport_code = (select a1.code from airports a1 where a1.city = 'Minsk')
  and f1.arrival_airport_code = (select a1.code from airports a1 where a1.city = 'London');

/* 51. определите все рейсы из Лондона или Барселоны */
select * from flights f1
where f1.departure_airport_code = (select a1.code from airports a1 where a1.city = 'London')
   or f1.departure_airport_code = (select a1.code from airports a1 where a1.city = 'Barcelona');

/* 52. определите все рейсы из Лондона или Барселоны, прибывающие до 2023-07-01 */
select * from flights f1
where (f1.departure_airport_code = (select a1.code from airports a1 where a1.city = 'London')
   or f1.departure_airport_code = (select a1.code from airports a1 where a1.city = 'Barcelona'))
  and f1.arrival_date not between '2023-07-01' and now();

/* 53. определите все рейсы, статус которых "ARRIVED" и прибывающие до текущей даты */
select * from flights f1
where f1.status = 'ARRIVED'
  and f1.arrival_date < now();

/* 54. определите все рейсы, вылетающие из Москвы и прибывающие в Барселону */
select * from flights f1
where f1.departure_airport_code = (select a1.code from airports a1 where a1.city = 'Moscow')
  and f1.arrival_airport_code = (select a1.code from airports a1 where a1.city = 'Barcelona');

/* 55. определите все рейсы, вылетающие до 2023-06-30 и статус которых не "CANCELLED" */
select * from flights f1
where f1.status != 'CANCELLED'
  and f1.arrival_date < '2023-06-30';

/* 56. определите все рейсы, статус которых "ARRIVED" или "DEPARTED" */
/* explain cost 15.55 */
select * from flights f1
where f1.status = 'ARRIVED'
   or f1.status = 'DEPARTED';

/* explain cost 14.63 */
select * from flights f1
where f1.status in ('ARRIVED', 'DEPARTED');

/* 57. определите все рейсы, вылетающие из Лондона и стоимость билета которых больше $200 */
select * from flights f1 join tickets t1 on f1.id = t1.flight_id
where f1.departure_airport_code = (select a1.code from airports a1 where a1.city = 'London')
  and t1.cost > 200;

/* 58. определите все рейсы, вылетающие из Лондона или прибывающие в Лондон */
select * from flights f1
where f1.departure_airport_code = (select a1.code from airports a1 where a1.city = 'London')
   or f1.arrival_airport_code = (select a1.code from airports a1 where a1.city = 'London');

/* 59. определите все рейсы, вылетающие до 2023-07-01 и стоимость билета которых не меньше $150 */
select * from flights f1 join tickets t1 on f1.id = t1.flight_id
where f1.departure_date not between '2023-07-01' and now()
  and t1.cost > 149;

/* 60. определите все билеты, купленные пассажиром с именем "John Doe" и номером билета, заканчивающимся на "B" или номером места, заканчивающимся на C */
select * from tickets t1
where t1.passenger_name = 'John Doe' and (t1.passenger_no like '%B' or t1.seat_no like '%C');

/* 61. определите все рейсы, вылетающие из Минска и статус которых "ARRIVED" или "DEPARTED" */
select * from flights f1
where f1.departure_airport_code = (select a1.code from airports a1 where a1.city = 'Minsk')
  and f1.status in ('ARRIVED', 'DEPARTED');

/* 62. определите все рейсы, вылетающие до 2023-12-31 и стоимость билета которых меньше $150 или больше $250 */
select * from flights f1 join tickets t1 on f1.id = t1.flight_id
where f1.departure_date not between '2023-12-31' and now()
  and t1.cost not between 150 and 250;

/* 63. определите все рейсы, статус которых "SCHEDULED" и вылетающие из Москвы */
select * from flights f1
where f1.departure_airport_code = (select a1.code from airports a1 where a1.city = 'Moscow')
  and f1.status = 'SCHEDULED';

/* 64. определите все билеты, купленные до 2024-01-01 и стоимость которых не меньше $200 или пассажиром с именем "John Doe" */
select * from tickets t1 join flights f1 on f1.id = t1.flight_id
where f1.departure_date not between '2024-01-01' and now()
  and (t1.cost > 199
   or t1.passenger_name = 'John Doe');

/* 65. определите все рейсы, вылетающие до текущей даты и прибывающие в Минск или Лондон */
select * from flights f1
where f1.arrival_airport_code in (select a1.code from airports a1 where a1.city in ('Minsk', 'London')
  and f1.departure_date < now());

/* 66. определите все билеты с информацией о рейсе, при условии, что у билетов в flight_id и рейсы имеют совпадающие идентификаторы */
select * from tickets t1 join flights f1 on f1.id = t1.flight_id;

/* 67. определите все рейсы и соответствующие им билеты, при условии, что билеты и рейсы имеют совпадающие идентификаторы */
select * from flights f1 left join tickets t1 on f1.id = t1.flight_id;

/* 68. определите все билеты с информацией о рейсе, при условии, что билеты и рейсы имеют совпадающие идентификаторы, и стоимость билета больше $200 */
select * from tickets t1 join flights f1 on f1.id = t1.flight_id
where t1.cost > 200;

/* 69. определите все рейсы и соответствующие им билеты, при условии, что билеты и рейсы имеют совпадающие идентификаторы, и стоимость билета больше $200 */
select * from flights f1 left join tickets t1 on f1.id = t1.flight_id
where t1.cost > 200;

/* 70. определите все самолеты и количество проданных на них билетов */
select a1.model, count(t1.id) num_tickets_sold from aircrafts a1
    left join flights f1 on a1.id = f1.aircraft_id
    left join tickets t1 on f1.id = t1.flight_id
group by a1.model
order by num_tickets_sold;

/* 71. определите все аэропорты, в которых есть рейсы, и количество рейсов из каждого аэропорта.
   Результат отсортируйте по убыванию количества рейсов. */
select ap1.code, ap1.city, count(f1.id) num_flights from airports ap1
join flights f1 on ap1.code = f1.departure_airport_code
group by ap1.code, ap1.city
order by num_flights desc;

/* 72. определите все рейсы из Москвы в Барселону и количество проданных на них билетов */
select f1.id, count(t1.id) num_tickets_sold from flights f1 join tickets t1 on f1.id = t1.flight_id
where f1.departure_airport_code = (select a1.code from airports a1 where a1.city = 'Moscow')
   and f1.arrival_airport_code = (select a1.code from airports a1 where a1.city = 'Barcelona')
group by f1.id;

/* 73. определите все рейсы из Москвы и количество проданных на них билетов, даты вылета которых после 2023-01-01 */
select f1.id, count(t1.flight_id) num_tickets_sold from flights f1 join tickets t1 on f1.id = t1.flight_id
where f1.departure_date > '2023-01-01'
  and f1.departure_airport_code = (select a1.code from airports a1 where a1.city = 'Moscow')
group by f1.id;

/* 74. определите все рейсы, для которых продано меньше 5 билетов */
select f1.id, count(t1.flight_id) num_tickets_sold from flights f1 join tickets t1 on f1.id = t1.flight_id
group by f1.id
having count(t1.flight_id) < 5;

/* 75. определите все рейсы, прибывающие до 2023-12-31, и количество проданных на них билетов.
   Отсортируйте по возрастанию. id перелета */
select f1.id, count(t1.flight_id) num_tickets_sold from flights f1 join tickets t1 on f1.id = t1.flight_id
where f1.arrival_date < '2023-12-31'
group by f1.id
order by f1.id;

/* 76. определите все рейсы из Москвы в Барселону и стоимость самого дорогого билета на каждом рейсе */
select f1.id, max(t1.cost) max_ticket_cost from flights f1 join tickets t1 on f1.id = t1.flight_id
where f1.departure_airport_code = (select a1.code from airports a1 where a1.city = 'Moscow')
  and f1.arrival_airport_code = (select a1.code from airports a1 where a1.city = 'Barcelona')
group by f1.id
order by f1.id;

/* 77. определите все рейсы, статус которых не "CANCELLED" и номер места содержит D. Результат отсортируйте по возрастанию id перелета */
select f1.id, count(t1.flight_id) total_seats from flights f1 join tickets t1 on f1.id = t1.flight_id
where f1.status != 'CANCELLED'
  and t1.seat_no like '%D%'
group by f1.id
order by f1.id;

/* 78. определите все рейсы, вылетающие с 2023-06-01 по 2023-06-30, и количество проданных на них билетов.
   Результат отсортируйте по возрастанию id перелета */
select f1.id, count(t1.flight_id) num_tickets_sold from flights f1 join tickets t1 on f1.id = t1.flight_id
where f1.departure_date between '2023-06-01' and '2023-06-30'
group by f1.id
order by f1.id;

/* 79. определите все рейсы, прибывающие до текущей даты, и количество проданных на них билетов.
   Результат отсортируйте по возрастанию id перелета */
select f1.id, count(t1.flight_id) num_tickets_sold from flights f1 join tickets t1 on f1.id = t1.flight_id
where f1.arrival_date < now()
group by f1.id
order by f1.id;

/* 80. определите все рейсы, вылетающие из Минска в Лондон, и количество проданных на них билетов. Результат отсортируйте по возрастанию id перелета */
select f1.id, count(t1.flight_id) num_tickets_sold from flights f1 join tickets t1 on f1.id = t1.flight_id
where f1.departure_airport_code = (select a1.code from airports a1 where a1.city = 'Minsk')
  and f1.arrival_airport_code = (select a1.code from airports a1 where a1.city = 'London')
group by f1.id
order by f1.id;

/* 81. определите все рейсы, прибывающие в Минск или Лондон, и количество проданных на них билетов. Отсортируйте результат по возрастанию количества билетов */
select f1.id, count(t1.flight_id) num_tickets_sold from flights f1 join tickets t1 on f1.id = t1.flight_id
where f1.arrival_airport_code in (select a1.code from airports a1 where a1.city in ('Minsk', 'London'))
group by f1.id
order by num_tickets_sold;

/* 82. определите все рейсы, у которых день вылета и прилета не совпадают, и количество проданных на них билетов */
select f1.id, count(t1.flight_id) num_tickets_sold from flights f1 join tickets t1 on f1.id = t1.flight_id
where extract(day from f1.departure_date) <> extract(day from f1.arrival_date)
group by f1.id;

/* 83. определите все билеты с информацией о рейсе, где номер билета начинается на "A" и код аэропорта вылета равен "MSQ".
   Результат отсортируйте по возрастанию id билета */
select * from tickets t1 join flights f1 on t1.flight_id = f1.id
where t1.passenger_no like 'A%'
  and f1.departure_airport_code = 'MSQ'
order by t1.id;

/* 84. определите все рейсы, статус которых "ARRIVED" и общая стоимость проданных на них билетов больше 1500.
   Результат отсортируйте по возрастанию id перелета */
select f1.id, count(t1.flight_id) num_tickets_sold from flights f1 join tickets t1 on f1.id = t1.flight_id
where f1.status = 'ARRIVED'
group by f1.id
having sum(t1.cost) > 1500
order by f1.id;

/* 85. определите все рейсы, стоимость самого дешевого билета на которых больше $100 и меньше $200.
   Результат отсортируйте по возрастанию id перелета */
select f1.id, min(t1.cost) min_ticket_cost from flights f1 join tickets t1 on f1.id = t1.flight_id
group by f1.id
having min(t1.cost) between 100 and 200
order by f1.id;

/* 86. определите все рейсы, прибывающие до текущей даты, и количество мест на самолете больше 150 или статус рейса "ARRIVED",
   результат отсортируйте по возрастанию id перелета, тест битый ждет 12 мест везде (12::int8) total_seats */
select f1.id, count(t1.id) total_seats, f1.status from flights f1
    join tickets t1 on f1.id = t1.flight_id
where f1.arrival_date < now()
group by f1.id, f1.status
having count(t1.id) > 150 or f1.status = 'ARRIVED'
order by f1.id;

/* 87. определите все рейсы, вылетающие из Лондона или прибывающие в Лондон,
   и количество проданных на них билетов меньше 20 или
   стоимость самого дорогого билета на рейсе больше $250.
   Результат отсортируйте по возрастанию id перелета */
select f1.id, count(t1.id) num_tickets_sold, max(t1.cost) max_ticket_cost from flights f1
    join tickets t1 on f1.id = t1.flight_id
where f1.departure_airport_code = (select a1.code from airports a1 where a1.city = 'London')
   or f1.arrival_airport_code = (select a1.code from airports a1 where a1.city = 'London')
group by f1.id
having count(t1.id) < 20 or max(t1.cost) > 250;

/* 88. определите все рейсы, статус которых "ARRIVED", и количество проданных на них билетов меньше 50
   и стоимость самого дорогого билета на рейсе больше $250.
   Результат отсортируйте по возрастанию id перелета */
select f1.id, count(t1.id) num_tickets_sold, max(t1.cost) max_ticket_cost from flights f1
    join tickets t1 on f1.id = t1.flight_id
where f1.status = 'ARRIVED'
group by f1.id
having count(t1.id) < 50
   and max(t1.cost) > 250
order by f1.id;

/* 89. определите все билеты с информацией о рейсе, где номер билета содержит только прописные символы латиницы и код аэропорта прибытия равен "BCN",
   для проверки номера билета используйте ~ '^[A-Z]+$' - это проверка по regex */
select * from tickets t1
       join flights f1 on f1.id = t1.flight_id
where t1.passenger_no ~'^[A-Z]+$'
  and f1.arrival_airport_code = 'BCN';

/* 90. определите все рейсы, вылетающие до текущей даты, и количество проданных на них билетов меньше 7, или статус рейса "ARRIVED".
   Результат отсортируйте по возрастанию id перелета */
select f1.id, count(t1.id) num_tickets_sold, f1.status from flights f1
   join tickets t1 on f1.id = t1.flight_id
group by f1.id, f1.status
having count(t1.id) < 7 or f1.status = 'ARRIVED'
order by f1.id;

/* 91. определите все аэропорты, в которых есть рейсы, и количество рейсов из каждого аэропорта, но только для страны "Belarus" */
select ap1.code, ap1.city, count(f1.id) num_flights from airports ap1
    join flights f1 on ap1.code = f1.departure_airport_code
where ap1.country = 'Belarus'
group by ap1.code, ap1.city;

/* 92. определите все самолеты и количество проданных на них билетов, где количество проданных билетов больше 15 */
select ar1.model, count(t1.id) num_tickets_sold from aircrafts ar1
    join flights f1 on ar1.id = f1.aircraft_id
    join aircrafts a1 on a1.id = f1.aircraft_id
    join tickets t1 on f1.id = t1.flight_id
group by ar1.model
having count(t1.id) > 15;

/* 93. определите все аэропорты, в которых есть рейсы как вылетающие, так и прибывающие, и количество рейсов из каждого аэропорта. */
select ap1.code, ap1.city, count(f1.id) all_flights from airports ap1
    join flights f1 on ap1.code = f1.arrival_airport_code
                    or ap1.code = f1.departure_airport_code
group by ap1.code, ap1.city
order by ap1.city;

/* 94. определите все рейсы и количество проданных на них билетов где статус рейса "SCHEDULED" и количество проданных билетов меньше 7 */
select f1.id, count(t1.id) num_tickets_sold from flights f1
         join tickets t1 on f1.id = t1.flight_id
where f1.status = 'SCHEDULED'
group by f1.id
having count(t1.id) < 7;

/* 95. определите все аэропорты, в которых есть рейсы как вылетающие, так и прибывающие, и количество рейсов из каждого аэропорта,
   для страны "Russia" или "Belarus" */
select ap1.code, ap1.city, count(f1.id) all_flights from airports ap1
            join flights f1 on ap1.code = f1.arrival_airport_code
                            or ap1.code = f1.departure_airport_code
where ap1.country in ('Russia', 'Belarus')
group by ap1.code, ap1.city
order by ap1.city;

/* 96. определите все рейсы из Лондона в Минск и количество проданных на них билетов, где стоимость билета больше $150 */
select f1.id, count(t1.id) num_tickets_sold from flights f1
    join tickets t1 on f1.id = t1.flight_id
where f1.departure_airport_code = (select a1.code from airports a1 where a1.city = 'London')
  and f1.arrival_airport_code = (select a1.code from airports a1 where a1.city = 'Minsk')
  and t1.cost > 150
group by f1.id;

/* 97. определите все аэропорты и количество рейсов из каждого аэропорта, где количество рейсов больше 3 */
select ap1.code, ap1.city, count(f1.id) num_flights from airports ap1
    join flights f1 on ap1.code = f1.departure_airport_code
group by ap1.code, ap1.city
having count(f1.id) > 3;

/* 98. определите все рейсы и количество проданных на них билетов, где стоимость самого дешевого билета на рейсе меньше $100 */
select f1.id, count(t1.id) num_tickets_sold, min(t1.cost) min_ticket_cost from flights f1
    join tickets t1 on f1.id = t1.flight_id
group by f1.id
having min(t1.cost) < 100
order by min_ticket_cost;

/* 99. определите все рейсы, статус которых "ARRIVED", и количество проданных на них билетов больше 30,
   или стоимость самого дорогого билета на рейсе меньше $500 */
select f1.id, count(t1.id) num_tickets_sold, max(t1.cost) max_ticket_cost from flights f1
    join tickets t1 on f1.id = t1.flight_id
where f1.status = 'ARRIVED'
group by f1.id
having count(t1.id) > 30
    or max(t1.cost) < 500;

/* 100. определите все рейсы и количество проданных на них билетов,
   где количество проданных билетов меньше 5 или стоимость самого дешевого билета на рейсе больше $200 */
select f1.id, count(t1.id) num_tickets_sold, min(t1.cost) min_ticket_cost from flights f1
   join tickets t1 on f1.id = t1.flight_id
where f1.status = 'ARRIVED'
group by f1.id
having count(t1.id) < 5
    or min(t1.cost) > 200
order by f1.id desc;

/* 101. определите количество рейсов для каждого аэропорта с указанием кода аэропорта */
select f1.departure_airport_code,
       count(f1.id) num_flights
from airports ap1
    join flights f1 on ap1.code = f1.departure_airport_code
group by ap1.code;

/* 102. определите количество рейсов для каждой модели самолета */
select ac1.model, count(f1.id) num_flights from aircrafts ac1
    join flights f1 on ac1.id = f1.aircraft_id
group by ac1.model;

/* 103. определите среднюю стоимость билета для каждого пассажира, результат округлите до 2-х чисел */
select t1.passenger_name, round(avg(t1.cost), 2) avg_ticket_cost from tickets t1
group by t1.passenger_name;

/* 104. определите количества рейсов, выполненных каждым самолетом, для самолета достаточно отразить его id */
select f1.aircraft_id, count(f1.id) num_flights from aircrafts ar1
    join flights f1 on ar1.id = f1.aircraft_id
group by f1.aircraft_id;

/* 105. определите количество вылетов из каждого аэропорта */
select f1.departure_airport_code, count(f1.id) num_departures from airports ar1
    join flights f1 on ar1.code = f1.departure_airport_code
group by f1.departure_airport_code;

/* 106. определите количество рейсов для каждого статуса */
select f1.status,
       count(f1.id) num_flights
from flights f1
group by f1.status;

/* 107. определите количество рейсов для каждого аэропорта назначения */
select f1.arrival_airport_code,
       count(f1.id) num_arrivals
from flights f1
    join airports ap1 on ap1.code = f1.arrival_airport_code
group by ap1.code;

/* 108. определите пассажиров, которые летели из Минска в Лондон на месте 1B */
select t1.passenger_name from flights f1
    join tickets t1 on f1.id = t1.flight_id
where f1.departure_airport_code = (select a1.code from airports a1 where a1.city = 'Minsk')
  and f1.arrival_airport_code = (select a1.code from airports a1 where a1.city = 'London')
  and t1.seat_no = '1B';

/* 109. определите количество незанятых мест на рейсе MN3002 на дату 2023-06-14 */
select count(f1.id) remaining_seats from tickets t1
    join flights f1 on f1.id = t1.flight_id
where f1.flight_no = 'MN3002'
  and f1.departure_date::date = '2023-06-14'
group by f1.id;

/* sub-queries model name, max tickets sold, passengers */
select (select ar1.model from aircrafts ar1 where ar1.id = f1.aircraft_id) aircraft_model_name
from tickets t1
     join flights f1 on f1.id = t1.flight_id
where f1.flight_no = 'MN3002';

select max(c1.tickets_count_on_aircraft) max_tickets_sold_on_aircraft
from (select count(t1.id) tickets_count_on_aircraft from tickets t1
          join flights f1 on f1.id = t1.flight_id
      where f1.aircraft_id = 1
      group by f1.id) c1;

select t1.passenger_name from tickets t1
    join flights f1 on f1.id = t1.flight_id
where f1.flight_no = 'MN3002'
  and f1.departure_date::date = '2023-06-14';

/* 110. определите количество рейсов, где продолжительность перелета больше 5 часов */
select count(f1.id) from flights f1
where extract(hour from (f1.arrival_date - f1.departure_date)) > 4;

/* 111. определите количество рейсов, где продолжительность перелета между 2 и 4 часами */
select count(f1.id) from flights f1
where extract(hour from (f1.arrival_date - f1.departure_date)) between 2 and 4;

/* 112. определите общую продолжительность всех рейсов */
select sum(f1.arrival_date - f1.departure_date) total_flight_duration from flights f1;

/* 113. определите самый длительный рейс с указанием номера рейса и длительности перелета */
select f1.flight_no,
       (f1.arrival_date - f1.departure_date) flight_duration_seconds
from flights f1
order by flight_duration_seconds desc
limit 1;

/* 114. определите количество рейсов, где продолжительность перелета меньше 3 часов */
select count(f1.flight_no) from flights f1
where extract(hour from (f1.arrival_date - f1.departure_date)) < 3;

/* 115. определите рейсы в порядке времени, которые заняли больше всего времени для прибытия. Необходимо отразить только час минуты и секунды.
   Результат отсортируйте по убыванию продолжительности перелета */
select f1.flight_no,
       (to_char(f1.arrival_date - f1.departure_date, 'HH24:MI:SS')) flight_duration_seconds
from flights f1
order by flight_duration_seconds desc;

/* 116. определите среднюю продолжительность перелета для каждого города прибытия */
select f1.arrival_airport_code,
       avg(f1.arrival_date - f1.departure_date) avg_flight_duration
from flights f1
group by f1.arrival_airport_code;

/* 117. определите рейсы, между Лондоном и Минском, с временем перелета в порядке возрастания */
select f1.flight_no, (f1.arrival_date - f1.departure_date) flight_duration from flights f1
                                                     join tickets t1 on f1.id = t1.flight_id
where f1.departure_airport_code = (select a1.code from airports a1 where a1.city = 'London')
  and f1.arrival_airport_code = (select a1.code from airports a1 where a1.city = 'Minsk')
group by f1.flight_no, flight_duration
order by flight_duration;

/* 118. определите количество рейсов, где продолжительность перелета меньше 3.5 часов и статус равен 'ARRIVED' */
select count(f1.flight_no) from flights f1
where (extract(hour from (f1.arrival_date - f1.departure_date)) < 3
            and extract(minute from (f1.arrival_date - f1.departure_date)) < 30)
  and f1.status = 'SCHEDULED';

/* 119. определите все рейсы, которые прибывают после 12:00:00 1 янврая 2024 */
select * from flights f1
where f1.arrival_date between '2024-01-01 12:00:00' and now();

/* 120. определите все рейсы, которые прибывают в 2023 году */
select * from flights f1
where extract(year from f1.arrival_date) = 2023;

/* 121. определите количества рейсов, прибывающих в июне */
select count(f1.flight_no) from flights f1
where extract(month from f1.arrival_date) = 6;

/* 122. определите количество рейсов, прибывающих в Понедельник (0 - Воскресенье) */
select count(f1.flight_no) from flights f1
where extract(dow from f1.arrival_date) = 1;

/* sub-query by dow */
select f1.flight_no, f1.arrival_date, extract(dow from f1.arrival_date) flight_arrival_dow from flights f1;

/* 123. определите все рейсы, прибывающие утром (с 6 до 11) */
select * from flights f1
where extract(hour from f1.arrival_date) between 6 and 11;

/* 124. определите количество рейсов для каждого аэропорта, где количество рейсов больше среднего значения количества рейсов */
select f1.departure_airport_code, count(f1.flight_no) num_flights from flights f1
group by f1.departure_airport_code
having count(f1.flight_no) >
       (select avg(c1.count_flights) from
             (select count(f2.departure_airport_code) count_flights from flights f2 group by f2.departure_airport_code) c1);

/* 125. определите количество рейсов для каждого города, где средняя стоимость билета выше средней стоимости билета для всех рейсов */
select distinct ap1.city,
       count(f1.id) num_flights,
       round(avg(t1.cost), 1) avg_cost,
       round((select avg(t2.cost) from tickets t2), 1) all_avg_cost
from flights f1
    join airports ap1 on ap1.code = f1.departure_airport_code
    join tickets t1 on f1.id = t1.flight_id
group by ap1.city
having avg(t1.cost) > (select avg(t2.cost) from tickets t2)
order by num_flights;

select avg(t1.cost) from tickets t1;

/* 126. определите количество рейсов для каждого аэропорта, где количество рейсов больше среднего значения и статус рейса равен 'ARRIVED' */
select f1.departure_airport_code, count(f1.flight_no) num_flights from flights f1
group by f1.departure_airport_code, f1.status
having count(f1.flight_no) > (select avg(c1.count_flights) from
                             (select count(f2.departure_airport_code) count_flights from flights f2 group by f2.departure_airport_code) c1)
       and f1.status = 'ARRIVED';

/* 127. определите количество рейсов для каждого статуса, где максимальная стоимость билета больше средней стоимости билетов для всех рейсов. В результатах выборки отразите статус и количество перелетов. */
select f1.status, count(f1.flight_no) num_flights from flights f1 join tickets t1 on f1.id = t1.flight_id
group by f1.status
having max(t1.cost) > (select avg(t2.cost) from tickets t2);

/* 128. определите количество рейсов для каждого аэропорта, где количество рейсов больше чем количество рейсов вылетающих из Барселоны */
select f1.departure_airport_code, count(f1.flight_no) num_flights from flights f1
group by f1.departure_airport_code
having count(f1.flight_no) > (select count(f2.flight_no) from flights f2
                              where f2.departure_airport_code = (select a1.code from airports a1 where a1.city = 'Barcelona')
                              group by f2.departure_airport_code);

/* 129. определите количество рейсов для каждой модели самолета, где средняя стоимость билета больше средней стоимости билета для всех рейсов */
select a1.model, count(f1.flight_no) num_flights from flights f1
    join aircrafts a1 on a1.id = f1.aircraft_id
    join tickets t1 on f1.id = t1.flight_id
group by a1.model
having avg(t1.cost) > (select avg(t2.cost) from tickets t2);

/* 130. определите модель самолёта, суммарную стоимость всех билетов и количество проданных билетов на каждый рейс
   в результатах выборки отразите номер рейса, модель самолета, суммарную стоимость билетов и количество билетов
   результаты отсортируйте по возрастанию общей стоимости билетов */
select f1.flight_no, a1.model, sum(t1.cost) total_cost, count(f1.flight_no) tickets_sold from flights f1
                      join aircrafts a1 on a1.id = f1.aircraft_id
                      join tickets t1 on f1.id = t1.flight_id
group by f1.flight_no, a1.model
order by sum(t1.cost);

/* 131. определите все рейсы, у которых количество проданных билетов больше 6
   в результатах выборки отразите номер рейса и количество проданных билетов */
select f1.flight_no, count(t1.id) tickets_sold from flights f1
    join tickets t1 on f1.id = t1.flight_id
group by f1.flight_no
having count(t1.id) > 6
order by f1.flight_no;

/* 132. определите все рейсы, у которых суммарная стоимость билетов превышает $1500 */
select f1.flight_no, sum(t1.cost) total_cost from flights f1
                                                        join tickets t1 on f1.id = t1.flight_id
group by f1.flight_no
having sum(t1.cost) > 1500
order by f1.flight_no;

/* 133. определите общее количество мест в каждом самолёте,
   в результатах выборки отразите модель самолета и количество мест */
select a1.model,
       count(s1.seat_no) total_seats
from aircrafts a1
    join seats s1 on a1.id = s1.aircraft_id
group by a1.model, a1.id
order by a1.id;

/* 134. определите общее количество проданных билетов на каждую модель самолёта,
   в результатах выборки отразите модель самолета и количество билетов */
select a2.model,
       coalesce((select count(t1.seat_no) tickets_sold from aircrafts a1
                 join flights f1 on a1.id = f1.aircraft_id
                 join tickets t1 on f1.id = t1.flight_id
        where a2.model = a1.model
        group by a1.model), 0) tickets_sold
from aircrafts a2;

/* 135. определите информацию о самолёте, на котором совершён наибольший процент отменённых рейсов,
   в результатах выборки отразите модель самолета, количество отмененных рейсов, общее число рейсов и процент отмененных */
select *, cast(cancelled_flights as numeric) / cast(total_flights as numeric) * 100 cancellation_percent from (
    select a2.model,
           (select count(f1.status) from aircrafts a1
                join flights f1 on a1.id = f1.aircraft_id
             where a2.model = a1.model and f1.status = 'CANCELLED'
             group by a1.model) cancelled_flights,
           (select count(f1.status) from aircrafts a1
                                             join flights f1 on a1.id = f1.aircraft_id
            where a2.model = a1.model
            group by a1.model) total_flights
    from aircrafts a2
    order by cancelled_flights
    limit 1) a3;

/* 136. определите все рейсы с указанием количества оставшихся мест на самолёте,
   в результатах выборки отразите номер рейса и количество оставшихся мест */
select j10.flight_no, (aircraft_seats - sold_tickets) remaining_tickets from
    (select f10.flight_no,
        (select count(s1.seat_no) aircraft_seats from aircrafts a1
                 join seats s1 on a1.id = s1.aircraft_id
        where a1.id = f10.aircraft_id
        group by a1.model) aircraft_seats,

         (select count(t2.id) from aircrafts a2
               join flights f2 on a2.id = f2.aircraft_id
               join tickets t2 on a2.id = f2.aircraft_id
            where a2.id = f10.aircraft_id
              and f2.id = t2.flight_id
              and f2.flight_no = f10.flight_no
            group by a2.model) sold_tickets

    from flights f10) j10;

/* 137. определите информацию о самом дорогом билете на каждый рейс,
   в результатах выборки отразите номер рейса и максимальную стоимость билета на нем. */
select f1.flight_no,
       (select max(t1.cost) from flights f2
             join tickets t1 on f2.id = t1.flight_id
       where f1.flight_no = f2.flight_no
       group by f2.flight_no) max_ticket_price
from flights f1;

/* 138. определите общее количество билетов на каждого пассажира, отсортированные по убыванию,
   в результатах выборки отразите имена пассажиров и количество билетов */
select t1.passenger_name, count(t1.passenger_name) total_tickets from tickets t1
group by t1.passenger_name
order by total_tickets desc;

/* 139. определите все рейсы, на которых летали пассажиры с фамилией "Doe",
   в результатах выборки отразите только номер рейса */
select f1.flight_no, t1.passenger_name from flights f1
    join tickets t1 on f1.id = t1.flight_id
where t1.passenger_name like '%Doe'
order by f1.flight_no;

/* 140. определите информацию о рейсе, на котором пассажир с фамилией "Sayers" летел с самым дорогим билетом для себя,
        в результатах выборки отразите номер рейса, имя пассажира и стоимость билета */
select f1.flight_no, t1.passenger_name, t1.cost from flights f1
    join tickets t1 on f1.id = t1.flight_id
where t1.passenger_name like '%Sayers'
order by t1.cost desc
limit 1;

/* 141. определите общее количество билетов, купленных на рейсы в Минск,
        в результатах выборки отразите количество билетов */
select count(t1.id) num_tickets from tickets t1
     join flights f1  on f1.id = t1.flight_id
where (select ap1.city from airports ap1 where ap1.code = f1.arrival_airport_code) = 'Minsk';

/* 142. определите количество билетов, купленных каждым пассажиром, на рейсы в Москву, сортировка по имени пассажира,
        в результатах выборки отразите имя пассажира и количество билетов */
select t1.passenger_name, count(t1.id) num_tickets from tickets t1
         join flights f1  on f1.id = t1.flight_id
where (select ap1.city from airports ap1 where ap1.code = f1.arrival_airport_code) = 'Moscow'
group by t1.passenger_name
order by t1.passenger_name;

/* 143. определите среднюю стоимость билетов на каждый рейс, сортировка по убыванию средней стоимости
        в результатах выборки отразите номер рейса и среднюю стоимость */
select f1.flight_no, avg(t1.cost) average_ticket_price from tickets t1
                join flights f1  on f1.id = t1.flight_id
group by f1.flight_no
order by average_ticket_price desc;

/* 144. определите рейсы, на которых сидели пассажиры с фамилией "Smith"
        в результатах выборки отразите только номер рейса */
select f1.flight_no from tickets t1
        join flights f1  on f1.id = t1.flight_id
where t1.passenger_name like '%Smith'
group by f1.flight_no;

/* 145. определите общее количество мест и количество проданных билетов на каждый рейс с указанием номера рейса
        в результатах выборки отразите номер рейса, количество мест и количество проданных билетов */
select f1.flight_no,
       (select count(s1.seat_no)
        from aircrafts a1
             join seats s1 on a1.id = s1.aircraft_id
        where f1.aircraft_id = a1.id
        group by a1.model) total_seats,
       (select count(t1.id) from tickets t1
        where f1.id = t1.flight_id
        group by f1.flight_no) tickets_sold
from flights f1
    join tickets t1 on f1.id = t1.flight_id
group by f1.flight_no, f1.aircraft_id, f1.id
order by f1.id;

/* 146. определите информацию о самолётах, на которых летали пассажиры с фамилией "Montgomery", указав только модель самолета */
select (select ac1.model from aircrafts ac1
        where f1.aircraft_id = ac1.id)
from flights f1
     join tickets t1 on f1.id = t1.flight_id
where t1.passenger_name like '%Montgomery';

/* 147. определите суммарную стоимость билетов, купленных каждым пассажиром, отсортировав данные по возрастанию стоимости,
        в результатах выборки отразите имя пассажира и общую стоимость билетов */
select t1.passenger_name, sum(t1.cost) total_cost from flights f1
    join tickets t1 on f1.id = t1.flight_id
group by t1.passenger_name
order by total_cost;

/* 148. определите все рейсы, на которых сидели пассажиры с фамилией "Browning" и "Miles",
        в результатах выборки отразите только номер рейса */
select f1.flight_no
from flights f1
where exists(select t1.flight_id from tickets t1
             where (t1.passenger_name like '%Browning'
                or t1.passenger_name like '%Miles')
               and f1.id = t1.flight_id)
group by f1.flight_no;

/* 149. определите информацию о самолётах, на которых не летали пассажиры с фамилией "Doe",
        в результатах выборки отразите только модель самолета */
select ac1.model from aircrafts ac1
where ac1.id not in (select f1.aircraft_id from flights f1
                         join aircrafts ac2 on ac2.id = f1.aircraft_id
                     where f1.id in (select t1.flight_id from tickets t1
                     where t1.passenger_name like '%Doe'));

/* 150. определите рейсы, у которых средняя стоимость билета превышает $200 с указанием номера рейса и средней стоимости */
select f1.flight_no,
       avg(t1.cost) average_ticket_price from flights f1
    join tickets t1 on f1.id = t1.flight_id
group by f1.flight_no
having avg(t1.cost) > 200;

/* 151. определите количество рейсов, совершённых на каждой модели самолёта
        в результатах выборки отразите модель самолета и количество перелетов */
select ac1.model,
       (select count(f1.aircraft_id) from flights f1
        where ac1.id = f1.aircraft_id) total_flights
from aircrafts ac1;

/* 152. определите информацию о рейсах, на которых сидели пассажиры с фамилией "Smith" и стоимость билетов была выше средней для этого рейса,
        в результатах выборки отразите номер рейса, имя пассажира и стоимость */
select f1.flight_no, t1.passenger_name, t1.cost from flights f1
join tickets t1 on f1.id = t1.flight_id
where t1.passenger_name like '%Smith'
  and t1.cost > (select avg(t2.cost) from tickets t2
                 where t2.flight_id = t1.flight_id
                 group by t2.flight_id);

/* 153. определите общее количество проданных билетов на рейсы, отправленные из Москвы
   в результатах выборки отразите только количество билетов */
select count(t1.flight_id) tickets_sold from tickets t1
join flights f1 on f1.id = t1.flight_id
where f1.departure_airport_code = (select ap1.code from airports ap1
                                   where ap1.city = 'Moscow');

/* 154. определите информацию о рейсах, на которых сидели пассажиры с фамилией "Doe" и "Sayers" и стоимость их билетов была выше $150,
        в результатах выборки отразите номер рейса, имя пассажира и стоимость билета */
select f1.flight_no, t1.passenger_name, t1.cost from flights f1
                                                         join tickets t1 on f1.id = t1.flight_id
where (t1.passenger_name like '%Doe'
   or t1.passenger_name like '%Sayers')
  and t1.cost > 150
order by t1.passenger_name, t1.cost;

/* 155. определите среднюю стоимость билетов на каждую модель самолёта, сортируйте по возрастанию средней стоимости,
        в результатах выборки отразите модель самолета и среднюю стоимость */
select ac1.model, avg(t1.cost) average_ticket_price from aircrafts ac1
    join flights f1 on ac1.id = f1.aircraft_id
    join tickets t1 on f1.id = t1.flight_id
group by ac1.model
order by average_ticket_price;

/* 156. определите количество рейсов, у которых статус "CANCELLED",
        в результатах выборки отразите только количество рейсов */
select count(f1.flight_no) num_flights
from flights f1
where f1.status = 'CANCELLED';

/* 157. определите модель самолёта и количество проданных билетов на каждый рейс с сортировкой количества по возрастанию
        в результатах выборки отразите модель самолета и количество билетов */
select
    (select ac1.model from aircrafts ac1
     where ac1.id = f1.aircraft_id) model,
    count(t1.flight_id) tickets_sold
from flights f1
    join tickets t1 on f1.id = t1.flight_id
group by f1.aircraft_id, f1.flight_no
order by tickets_sold;

select ac1.model,
       count(t1.flight_id) tickets_sold
from flights f1
         join tickets t1 on f1.id = t1.flight_id
         join aircrafts ac1 on ac1.id = f1.aircraft_id
group by f1.flight_no, f1.flight_no, ac1.model
order by tickets_sold;

select ac1.model,
       count(t1.flight_id) tickets_sold
from aircrafts ac1
    join flights f1 on ac1.id = f1.aircraft_id
    join tickets t1 on f1.id = t1.flight_id
group by ac1.model, f1.flight_no
order by tickets_sold;

select
    (select ac1.model from aircrafts ac1
     where ac1.id = f1.aircraft_id) model,
    count(t1.flight_id) tickets_sold
from flights f1
    join tickets t1 on f1.id = t1.flight_id
group by f1.aircraft_id, f1.flight_no
order by tickets_sold, model;

select
    (select ac1.model from aircrafts ac1
     where ac1.id = f1.aircraft_id),
    count(t1.id) from flights f1
    join tickets t1 on f1.id = t1.flight_id
group by f1.flight_no
order by count(t1.id);

select ac1.model,
       (select count(t2.cost) from flights f2
            join tickets t2 on f2.id = t2.flight_id
       where f2.aircraft_id = ac1.id
       group by f2.flight_no, f2.aircraft_id
       limit 1) tickets_sold
from aircrafts ac1
order by tickets_sold;

/* not done, sort order??? */


/* 158. определите все рейсы, у которых количество проданных билетов меньше 5,
        в результатах выборки отразите номер рейса и количество билетов */
select f1.flight_no,
       count(t1.id) tickets_sold
from flights f1
join tickets t1 on f1.id = t1.flight_id
group by f1.flight_no
having count(t1.id) < 5;

/* 159. определите все рейсы и среднюю стоимость билета на каждый из них, сортируйте по номеру рейса,
        в результатах выборки отразите номер рейса и среднюю стоимость */
select f1.flight_no,
       avg(t1.cost) avg_ticket_cost
from flights f1
join tickets t1 on f1.id = t1.flight_id
group by f1.flight_no
order by f1.flight_no;

/* 160. определите информацию о самолёте и общее количество проданных билетов на рейсы, на которых он летал,
        в результатах выборки отразите модель самолета и количество билетов на ней */
select a2.model,
       coalesce((select count(t1.seat_no) tickets_sold from aircrafts a1
                        join flights f1 on a1.id = f1.aircraft_id
                        join tickets t1 on f1.id = t1.flight_id
                 where a2.model = a1.model
                 group by a1.model), 0) total_tickets_sold
from aircrafts a2;

/* 161. определите рейсы с указанием их номеров, у которых суммарная стоимость билетов меньше $1000, сортируем по номеру рейса,
        в результатах выборки отразите номер рейса и общую стоимость на рейсе */
select f1.flight_no,
       (select sum(t1.cost) from tickets t1
        where f1.id = t1.flight_id) total_cost
from flights f1
where (select sum(t1.cost) from tickets t1
       where f1.id = t1.flight_id) < 1000
order by f1.flight_no;

/* 162. определите модель самолёта и среднюю стоимость билета на рейсы, на которых он летал,
        в результатах выборки отразите модель самолета и среднюю стоимость */
select ac1.model,
       (select avg(t1.cost) from aircrafts ac2
               join flights f1 on ac2.id = f1.aircraft_id
               join tickets t1 on f1.id = t1.flight_id
        where ac1.model = ac2.model
        group by ac2.model) avg_ticket_cost
from aircrafts ac1;

/* 163. определите информацию о рейсах и суммарную стоимость всех билетов на каждый из них,
        в результатах выборки отразите номер рейса и суммарную стоимость билетов */
select f1.flight_no,
       (select sum(t1.cost) from tickets t1
        where f1.id = t1.flight_id) total_cost
from flights f1;

/* 164. определите все рейсы, у которых количество проданных билетов больше, чем половина от общего числа мест на самолёте,
        в результатах выборки отразите номер рейса, общее число проданных билетов на нем и общее число мест в самолете */
select f1.flight_no,
       count(t1.id) tickets_sold,
       (select count(s1.seat_no) from seats s1
        where s1.aircraft_id = f1.aircraft_id
        group by s1.aircraft_id) total_seats
from flights f1
         join tickets t1 on f1.id = t1.flight_id
group by f1.flight_no, f1.aircraft_id
having count(t1.id) > (select count(s1.seat_no) from seats s1
                       where s1.aircraft_id = f1.aircraft_id
                       group by s1.aircraft_id) / 2
order by f1.flight_no;

/* 165. определите среднюю стоимость билетов на рейсы с номером "MN3002",
        в результатах выборки отразите номер рейса и среднюю стоимость билета */
select f1.flight_no,
       avg(t1.cost) avg_ticket_cost
from flights f1
         join tickets t1 on f1.id = t1.flight_id
where f1.flight_no = 'MN3002'
group by f1.flight_no;

/* 166. определите количество билетов, купленных каждым пассажиром, на рейсы с вылетом из Лондона,
        в результатах выборки отразите имя пассажира и количество его билетов */
select t1.passenger_name,
       (select count(t2.id) from tickets t2
        where t2.passenger_name = t1.passenger_name) total_tickets
from flights f1
      join tickets t1 on f1.id = t1.flight_id
where f1.departure_airport_code = (select ap1.code from airports ap1
                                   where ap1.city = 'London')
group by t1.passenger_name;

/* 167. определите среднюю стоимость билетов на каждого пассажира, сортируем по имени пассажира,
        в результатах выборки отразите имя пассажира и среднюю стоимость */
select t1.passenger_name,
       (select avg(t2.cost) from tickets t2
        where t2.passenger_name = t1.passenger_name) avg_ticket_cost
from flights f1
         join tickets t1 on f1.id = t1.flight_id
group by t1.passenger_name
order by t1.passenger_name;

/* 168. определите информацию о самолётах, на которых сидели пассажиры с фамилией "Montgomery" и "Doe",
        в результатах выборки отразите только модели самолетов */
select distinct ac1.model from aircrafts ac1
     join flights f1 on ac1.id = f1.aircraft_id
     join tickets t1 on f1.id = t1.flight_id
where (t1.passenger_name like '%Montgomery'
    or t1.passenger_name like '%Doe');

/* 169. определите общую стоимость всех билетов на рейс с номером "TR3103",
        в результатах выборки номер рейса и общую стоимость билетов. */
select f1.flight_no,
       sum(t1.cost) total_cost
from flights f1
   join tickets t1 on f1.id = t1.flight_id
where f1.flight_no = 'TR3103'
group by f1.flight_no;

/* 170. определите общую стоимость всех билетов на рейс, который отправляется из Минска,
        в результатах выборки отразите номер рейса и общую стоимость билетов */
select f1.flight_no,
       sum(t1.cost) total_cost
from flights f1
         join tickets t1 on f1.id = t1.flight_id
where f1.departure_airport_code = (select ap1.code from airports ap1
                                                   where ap1.city = 'Minsk')
group by f1.flight_no, f1.id
order by f1.id;

/* 171. определите среднюю стоимость билета на рейс с номером "CV9827",
        в результатах выборки отразите номер рейса и среднюю стоимость билета */
select f1.flight_no,
       avg(t1.cost) avg_ticket_cost
from flights f1
  join tickets t1 on f1.id = t1.flight_id
where f1.flight_no = 'CV9827'
group by f1.flight_no;

/* 172. определите общее количество билетов, купленных каждым пассажиром, на рейсы с вылетом из Москвы, сортируйте по имени пассажира,
        в результатах выборки отразите имя пассажира и количество билетов */
select t1.passenger_name,
       (select count(t2.cost) from tickets t2
        where t2.passenger_name = t1.passenger_name) total_tickets
from flights f1
         join tickets t1 on f1.id = t1.flight_id
where f1.departure_airport_code = (select ap1.code from airports ap1
                                   where ap1.city = 'Moscow')
group by t1.passenger_name
order by t1.passenger_name;

/* 173. определите список всех аэропортов и количество рейсов, вылетающих из каждого аэропорта,
        в результатах выборки отразите код страну и город аэропорта и количество рейсов */
select ap1.code, ap1.country, ap1.city, count(f1.flight_no) flight_count from airports ap1
    join flights f1 on ap1.code = f1.departure_airport_code
group by ap1.code;

/* 174. определите список самолетов, модель которых используется на более чем двух рейсах,
        в результатах выборки отразите только модель самолета */
select j1.model from
(select ac1.model, count(ac1.model) aircraft_usage from flights f1
    join aircrafts ac1 on ac1.id = f1.aircraft_id
group by ac1.model) j1
where aircraft_usage > 2;

/* 175. определите список пассажиров, купивших билеты на рейсы из Минска. Выводите имя пассажира и номер билета */
select t1.passenger_name, t1.passenger_no from tickets t1
    join flights f1 on f1.id = t1.flight_id
where f1.departure_airport_code = (select ap1.code from airports ap1
                                where ap1.city = 'Minsk');

/* 176. определите список рейсов, которые уже приземлились, и количество купленных на них билетов
        в результатах выборки отразите номер рейса и количество билетов */
select f1.flight_no,
       count(t1.id) ticket_count
from flights f1
   join tickets t1 on f1.id = t1.flight_id
where f1.status = 'ARRIVED'
group by f1.flight_no, t1.flight_id
order by t1.flight_id desc;

select f1.flight_no,
       (select
            count(t2.id) ticket_count
        from flights f2
             join tickets t2 on f2.id = t2.flight_id
        group by  t2.flight_id, f1.id
        having f1.id = t2.flight_id) ticket_count
from flights f1
         join tickets t1 on f1.id = t1.flight_id
where f1.status = 'ARRIVED'
group by f1.flight_no, f1.id
order by f1.flight_no desc;
/* not done - ordering */

/* 177. определите список аэропортов, из которых вылетали рейсы, приземлившиеся в Минске
        в результатах выборки отразите код страну и город аэропорта */
select distinct ap1.code, ap1.country, ap1.city from airports ap1
    join flights f1 on ap1.code = f1.arrival_airport_code
where f1.departure_airport_code = (select ap2.code from airports ap2
                                 where ap2.city = 'Minsk');

/* 178. определите список самых популярных моделей самолетов (больше всего использованных на рейсах), сортируем по убыванию количества рейсов,
        в результатах выборки отразите модель самолета и количество рейсов */
select ac1.model,
       (select count(f1.flight_no) from aircrafts ac2
               join flights f1 on ac2.id = f1.aircraft_id
        where ac2.model = ac1.model
        group by ac2.model) flight_count
from aircrafts ac1
order by flight_count desc;

/* 179. определите список пассажиров, купивших билеты на рейсы, прибывающие в Барселону,
        в результатах выборки отразите имя пассажира и номер пассажира */
select t1.passenger_name, t1.passenger_no from tickets t1
    join flights f1 on f1.id = t1.flight_id
where f1.arrival_airport_code = (select ap1.code from airports ap1
                                      where ap1.city = 'Barcelona');

/* 180. определите список аэропортов, из которых вылетали рейсы, приземлившиеся в Москве,
        в результатах выборки отразите код страну и город аэропорта */
select distinct ap1.code, ap1.country, ap1.city from airports ap1
                                                         join flights f1 on ap1.code = f1.arrival_airport_code
where f1.departure_airport_code = (select ap2.code from airports ap2
                                   where ap2.city = 'Moscow')
order by ap1.city desc;

/* 181. определите список пассажиров, купивших билеты на рейсы из Москвы в Барселону,
        в результатах выборки отразите имя пассажира и номер билета */
select t1.passenger_name, t1.passenger_no from tickets t1
                                                   join flights f1 on f1.id = t1.flight_id
where
    f1.departure_airport_code = (select ap1.code from airports ap1
                                   where ap1.city = 'Moscow')
and
    f1.arrival_airport_code = (select ap1.code from airports ap1
                                 where ap1.city = 'Barcelona');

/* 182. (176.) определите список рейсов, статус которых "ARRIVED", и количество купленных на них билетов,
        в результатах выборки отразите номер рейса и количество билетов на такой рейс */
select f1.flight_no,
       count(t1.id) ticket_count
from flights f1
         join tickets t1 on f1.id = t1.flight_id
where f1.status = 'ARRIVED'
group by f1.flight_no, t1.flight_id
order by ticket_count desc;
/* not done - ordering */

/* 183. определите список самолетов и количество купленных на рейсы билетов для каждого из них,
        в результатах выборки отразите модель самолета и количество билетов. */
select ac1.model,
       (select count(t2.id) from tickets t2
                 join flights f2 on f2.id = t2.flight_id
         where f1.aircraft_id = f2.aircraft_id
         group by f2.aircraft_id) ticket_count
from aircrafts ac1
    left join flights f1 on ac1.id = f1.aircraft_id
    left join tickets t1 on f1.id = t1.flight_id
group by f1.aircraft_id, ac1.model
order by ac1.model;

/* 184. определите список пассажиров, купивших билеты на самолеты модели "Boeing 777-300" с выводом имени и номера билеты,
   сортировка по имени пользователя по возрастанию. */
select t1.passenger_name,
       t1.passenger_no
from tickets t1
    join flights f1 on f1.id = t1.flight_id
where f1.aircraft_id = (select ac1.id from aircrafts ac1
                        where ac1.model = 'Boeing 777-300')
order by t1.passenger_name;

/* 185. определите список пассажиров, купивших билеты на рейсы, прибывающие в Лондон, сортируем по убыванию имени,
        в результатах выборки отразите имя пассажира и номер билета */
select t1.passenger_name,
       t1.passenger_no
from tickets t1
         join flights f1 on f1.id = t1.flight_id
where f1.arrival_airport_code = (select ap1.code from airports ap1
                        where ap1.city = 'London')
order by t1.passenger_name desc;

/* 186. определите список аэропортов и количество рейсов, прибывающие в каждый аэропорт,
        в результатах выборки отразите код страну и город аэропорта и количество рейсов */
select j1.code,
       j1.country,
       j1.city,
       j1.flights flight_count
from
   (select ap1.code,
           ap1.country,
           ap1.city,
           count(f1.flight_no) flights
    from airports ap1
        join flights f1 on f1.arrival_airport_code = ap1.code
    group by f1.arrival_airport_code, ap1.code) j1;
/* not done - ordering */

/* 187. определите список пассажиров, купивших билеты на рейсы, прибывающие из Лондона,
        в результатах выборки отразите имя пассажира и номер билета */
select t1.passenger_name,
       t1.passenger_no
from tickets t1
    join flights f1 on f1.id = t1.flight_id
where f1.departure_airport_code = (select ap1.code from airports ap1
                                                   where ap1.city = 'London');

/* 188. определите список рейсов, статус которых "DEPARTED", и общая стоимость всех купленных на них билетов
        в результатах выборки отразите номер рейса и общую стоимость */
select f1.flight_no,
       sum(t1.cost) total_cost
from flights f1
    join tickets t1 on f1.id = t1.flight_id
where f1.status = 'DEPARTED'
group by f1.flight_no;

/* 189. определите список самолетов и количество купленных на рейсы билетов для каждого из них, учитывая только рейсы со статусом 'SCHEDULED'
        в результатах выборки отразите модель самолета и количество билетов */
select (select ac2.model from aircrafts ac2
        where ac2.id = f1.aircraft_id) model,
        count(t1.id) ticket_count
from flights f1
         join tickets t1 on f1.id = t1.flight_id
where f1.status = 'SCHEDULED'
group by f1.aircraft_id;

/* 190. определите все рейсы, отправленные из аэропорта в Минске (код 'MSQ') в 2024 году,
        в результатах выборки отразите всю информацию о рейсах */
select *
from flights f1
where f1.departure_airport_code = (select ap1.code from airports ap1
                                   where ap1.city = 'Minsk')
  and extract(year from f1.departure_date) = 2024;

/* 191. определите все рейсы, на которых были куплены билеты только пассажирами с именами, начинающимися на 'D' и аэропорт прибытия в Лондоне,
        в результатах выборки отразите всю информацию о рейсах */
select * from flights f1
where f1.arrival_airport_code = (select ap1.code from airports ap1
                                 where ap1.city = 'London')
  and f1.id in (select t1.flight_id from tickets t1
                where t1.passenger_name like 'D%');

/* 192. определите все рейсы, на которых сидели пассажиры с фамилией 'Sparrow' и статус рейса 'ARRIVED',
        в результатах выборки отразите всю информацию о рейсах */
select * from flights f1
where f1.status = 'ARRIVED'
  and f1.id in (select t1.flight_id from tickets t1
                where t1.passenger_name like '%Sparrow');

/* 193. определите список всех аэропортов, в которые прибыли рейсы из Москвы ('SVO') после даты 2023-06-14,
        в результатах выборки отразите всю информацию об аэропортах */
select * from airports ap1
where ap1.code in (select f1.departure_airport_code from flights f1
                   where f1.arrival_date > '2023-06-14'
                     and f1.arrival_airport_code = (select ap1.code from airports ap1
                                                    where ap1.city = 'Moscow'));

/* 194. определите рейсы с указанием номера рейса и продолжительности полета, совершенных на самолете модели 'Boeing 777-300' */
select f1.flight_no,
       (f1. arrival_date - f1.departure_date) duration_flight
from flights f1
where f1.aircraft_id in (select ac1.id from aircrafts ac1
                         where ac1.model = 'Boeing 777-300');

/* 195. определите рейсы, на которых был занят полностью второй ряд (места начинаются с '2') и самолет вылетел из Москвы
        в результатах выборки отразите всю информацию о рейсах */
select *
from flights f1
where f1.id in (select t1.flight_id from tickets t1
                group by t1.flight_id
                having count(t1.seat_no like '2%') > 3)
  and f1.departure_airport_code = (select ap1.code from airports ap1
                                   where ap1.city = 'Moscow')
order by f1.id desc
limit 1;

/* 196. определите список ТОП-10 пассажиров с самым дорогим билетом, купивших билеты на рейсы, отправленные из аэропортов в Беларуси
        в результатах выборки отразите всю информацию о билетах */
select * from tickets t1
where t1.passenger_no in (select t2.passenger_no from tickets t2
                          where t2.flight_id in (select f2.id from flights f2
                                                 where f2.departure_airport_code = (select ap1.code from airports ap1
                                                                                    where ap1.country = 'Belarus'))
                          order by t2.cost desc
                          limit 10)
order by t1.cost desc;

/* sub-query for top 10 */
select t2.passenger_no, t2.cost from tickets t2
where t2.flight_id in (select f2.id from flights f2
                      where f2.departure_airport_code = (select ap1.code from airports ap1
                                                         where ap1.country = 'Belarus'))
order by t2.cost desc
limit 10;

/* 197. определите все рейсы, отправленные после 2024-01-01 и на которых пассажиры купили места в первом ряду у окна (сидения '1A' и '1D'),
        в результатах выборки отразите всю информацию о рейсах */
select *
from flights f1
where f1.id in (select t1.flight_id from tickets t1
                where t1.seat_no = '1A'
                group by t1.flight_id
                    intersect
                select t1.flight_id from tickets t1
                where t1.seat_no = '1D'
                group by t1.flight_id)
  and f1.departure_date > '2024-01-01';

/* 198. определите все рейсы, на которых были куплены места в самолетах модели 'Boeing' и стоимость билета превышает 200$,
        в результатах выборки отразите всю информацию о рейсах */
select *
from flights f1
where f1.id in (select t1.flight_id from tickets t1
                where t1.cost > 200)
  and f1.aircraft_id in (select ac1.id from aircrafts ac1
                         where ac1.model like 'Boeing%');

/* 199. определите список всех билетов, купленных пассажирами с именами 'Peter Browning' и 'Barbara Hershey', отсортированных по возрастанию цены,
        в результатах выборки отразите всю информацию о билетах */
select * from tickets t1
where t1.id in (select t2.id from tickets t2
                where t2.passenger_name = 'Peter Browning'
                   or t2.passenger_name =  'Barbara Hershey')
order by t1.cost;

/* 200. определите список всех пассажиров, купивших билеты на рейсы, на которых были куплены билеты пассажирами с именами,
        начинающимися на 'A' и 'B', но не были куплены билеты пассажирами с именами, начинающимися на 'C' и 'D',
        в результатах выборки отразите всю информацию о билетах */
select * from tickets t1
where
    t1.flight_id in (select t2.flight_id from tickets t2
                     where (t2.passenger_name like 'A%' or t2.passenger_name like 'B%')
                     group by t2.flight_id)
and
    t1.flight_id not in (select t3.flight_id from tickets t3
                        where (t3.passenger_name like 'C%' or t3.passenger_name like 'D%')
                        group by t3.flight_id);

/* 201. определите список всех пассажиров, купивших билеты на рейсы, отправленные до 2023-09-03, и суммарная стоимость всех их билетов превышает 300$,
        в результатах выборки отразите имя пассажира и сумму его билетов */
select t1.passenger_name,
       sum(t1.cost)
from tickets t1
where t1.flight_id in (select f2.id from flights f2
                       where f2.departure_date < '2023-09-03')
group by t1.passenger_name
having sum(t1.cost) > 300;

/* 202. определите имена пассажиров, которые встречаются более одного раза (если пассажир с одним и тем же именем купил несколько билетов - то такое не считается дублированием, должны совпадать имена но не фамилии)
        в результатах выборки отразите только имена пассажиров, отделенное от их фамилии */
select n1.name
from (select (split_part(t1.passenger_name, ' ', 1)) name,
             (split_part(t1.passenger_name, ' ', 2)) surname
      from tickets t1
      group by name, surname) n1
group by n1.name
having count(n1.name) > 1;

/* sub-queries for substring */
select (split_part(t1.passenger_name, ' ', 1)) name_only from tickets t1;
select (split_part(t1.passenger_name, ' ', 2)) surname_only from tickets t1;
select *, (substring(t1.passenger_name from 1 for position (' ' IN t1.passenger_name ) - 1)) name_only from tickets t1;

/* 203. определите все рейсы, на которых были куплены билеты
        в результатах выборки отразите всю информацию о рейсах */
select *
from flights f1
where exists(select 1 from tickets t1
             where t1.flight_id = f1.id);

/* 204. определите список всех пассажиров, чьи имена начинаются на 'J' и купивших билеты,
        в результатах выборки отразите всю информацию о билетах */
select *
from tickets t1
where t1.passenger_name like 'J%';

select *
from tickets t1
where exists(select 1
             from tickets t2
             where t2.id = t1.id
               and t2.passenger_name like 'J%');

/* 205. определите список всех пассажиров, чьи имена начинаются на 'J' и купивших билеты,
        в результатах выборки отразите всю информацию о билетах */
select *
from flights f1
where exists(select 1 from flights f2
             where f1.id = f2.id
             and f2.departure_airport_code = (select ap1.code from airports ap1
                                              where ap1.city = 'Moscow'));

/* 206. определите список всех аэропортов, из которых были отправлены рейсы,
        в результатах выборки отразите всю информацию об аэропортах */
select *
from airports ap1
where exists(select 1 from flights f2
             where f2.departure_airport_code = ap1.code);

/* 207. определите определите все рейсы, на которых были куплены билеты для пассажира с именем 'John Doe',
        в результатах выборки отразите всю информацию о рейсах */
select *
from flights f1
where exists(select 1 from tickets t1
             where f1.id = t1.flight_id
               and t1.passenger_name = 'John Doe');

/* 208. определите список всех самолетов модели 'Boeing', на которых были совершены рейсы,
        в результатах выборки отразите всю информацию о самолетах */
select *
from aircrafts ac1
where exists(select 1 from flights f1
             where ac1.id = f1.aircraft_id
               and ac1.model like 'Boeing%');

/* 209. определите все рейсы, отправленные после 2023-06-16 и на которых куплены билеты,
        в результатах выборки отразите всю информацию о рейсах */
select *
from flights f1
where exists(select 1 from tickets t1
             where f1.id = t1.flight_id
               and f1.departure_date > '2023-12-31');

/* 210. определите список всех пассажиров, купивших билеты на рейсы, отправленные из Беларуси,
        в результатах выборки отразите всю информацию о билетах */
select *
from tickets t1
where exists(select 1
             from flights f1
             join airports ap1 on ap1.code = f1.departure_airport_code
             where ap1.country = 'Belarus'
               and t1.flight_id = f1.id);

/* 211. определите все рейсы, на которых были проданы билеты дороже 200$,
        в результатах выборки отразите всю информацию о рейсах */
select * from flights f1
where exists(
    select 1 from tickets t1
    where t1.cost > 200
      and f1.id = t1.flight_id);

/* 212. определите всех пассажиров, купивших билеты на рейсы, отправленные из Лондона и приобретенные по стоимости выше средней,
        в результатах выборки отразите всю информацию о билетах */
select * from tickets t1
where exists(
    select 1 from flights f2
         join tickets t2 on f2.id = t2.flight_id
    where t1.cost > (select avg(t3.cost) from tickets t3)
      and f2.id = t1.flight_id
      and f2.departure_airport_code = (select ap1.code from airports ap1
                                       where ap1.city = 'London'));

/* 213. определите список всех аэропортов, из которых были отправлены рейсы с пассажирами, чьи имена начинаются на 'A' и при этом общее количество купленных билетов превышает 2
        в результатах выборки отразите всю информацию об аэропортах */
select * from airports ap1
where exists(
    select 1 from flights f2
              join tickets t2 on f2.id = t2.flight_id
    where t2.passenger_name like 'A%'
    and f2.departure_airport_code = ap1.code
    group by f2.departure_airport_code
    having count(t2.id) > 2);

/* 214. определите список всех самолетов, на которых куплены билеты на рейсы с статусом 'ARRIVED' и общая стоимость билетов на рейс превышает 500$,
        в результатах выборки отразите всю информацию о самолетах */
select * from aircrafts ac1
where exists(
    select 1 from flights f2
        join tickets t2 on f2.id = t2.flight_id
    where f2.status = 'ARRIVED'
      and f2.aircraft_id = ac1.id
    group by f2.id
    having sum(t2.cost) > 500);

/* 215. определите список всех аэропортов, из которых были отправлены рейсы с общим количеством проданных билетов на рейс выше среднего,
        в результатах выборки отразите всю информацию об аэропортах */
select * from airports ap1
where exists(
    select 1 from flights f2
        join tickets t2 on f2.id = t2.flight_id
    where f2.departure_airport_code = ap1.code
    group by f2.departure_airport_code
    having count(t2.id) > (select avg(c4.count_tickets) from
                              (select count(t3.id) count_tickets from tickets t3
                           group by t3.flight_id) c4));

/* sub-query avg + count */
select avg(c4.count_tickets) from
    (select count(t3.id) count_tickets from tickets t3
     group by t3.flight_id) c4;

/* 216. определите все рейсы, на которых куплены билеты для пассажиров с именами 'John Doe' и 'Nina Sayers', и количество купленных билетов больше 1 (это говорит о том, что эти оба пассажира летели на этом рейсе),
        в результатах выборки отразите всю информацию о рейсах */
select *
from flights f1
where f1.id in (select t1.flight_id from tickets t1
                where t1.passenger_name = 'John Doe'
                group by t1.flight_id
                    intersect
                select t2.flight_id from tickets t2
                where t2.passenger_name = 'Nina Sayers'
                group by t2.flight_id)
order by f1.id;

/* sub-queries */
select t2.flight_id from tickets t2
where t2.passenger_name = 'John Doe';

select t2.flight_id from tickets t2
where t2.passenger_name = 'Nina Sayers';

/* 217. определите все рейсы, на которых были куплены билеты для пассажиров с именами 'John Doe',
        и количество этих билетов больше количества билетов для пассажиров с именами 'Nina Sayers'
        (это говорит о том, что на таких рейсах летел 'John Doe', но не летела 'Nina Sayers')
        в результатах выборки отразите всю информацию о рейсах */
select * from flights f2
where (select count(f1a.id)
       from flights f1a
       where f1a.id in (select t1.flight_id from tickets t1
                       where t1.passenger_name = 'John Doe'
                       group by t1.flight_id)
         and f1a.id = f2.id)
       >
       (select count(f1b.id)
        from flights f1b
        where f1b.id in (select t1.flight_id from tickets t1
                        where t1.passenger_name = 'Nina Sayers'
                        group by t1.flight_id)
          and f1b.id = f2.id)
group by f2.id;

/* sub-query */
select f1.id
from flights f1
where f1.id in (select t1.flight_id from tickets t1
                where t1.passenger_name = 'John Doe'
                group by t1.flight_id);

/* 218. определите список всех самолетов, на которых куплены билеты на рейсы, отправленные до 2023-11-16, но не на рейсы с общей стоимостью билетов превышающей 2000$,
        в результатах выборки отразите всю информацию об аэропортах */
select * from aircrafts ac1
where exists(
    select 1 from flights f2
        join tickets t2 on f2.id = t2.flight_id
    where f2.departure_date < '2023-11-16'
      and f2.aircraft_id = ac1.id
    group by f2.id
    having (select sum(t3.cost) from tickets t3
            where t3.flight_id = f2.id
            group by t3.flight_id) < 2000)
order by ac1.model
limit 1;

/* sub-query */
select sum(t3.cost) from tickets t3
where t3.flight_id in (1, 2, 3, 4, 5, 6)
group by t3.flight_id;

/* 219. определите список всех самолетов, на которых не совершались рейсы
        в результатах выборки отразите всю информацию о самолетах */
select * from aircrafts ac1
where not exists(
    select 1 from flights f2
         join tickets t2 on f2.id = t2.flight_id
    where ac1.id = f2.aircraft_id
    group by t2.flight_id);

/* 220. определите все рейсы, на которых куплены билеты только пассажирами с именами,
        встречающимися в списке VIP-пассажиров ('John Doe', 'Barbara Hershey', 'Jessica Adams', 'Gabriel Bolivar'),
        в результатах выборки отразите всю информацию о рейсах */
select * from flights f1
where not exists(
    select 1 from flights f2
         join tickets t2 on f2.id = t2.flight_id
    where f1.id = f2.id
      and t2.passenger_name not in ('John Doe', 'Barbara Hershey', 'Jessica Adams', 'Gabriel Bolivar')
    group by t2.flight_id);

/* 221. определите все рейсы, на которых цена билета выше любой цены билета для рейса с моделью Boeing 777-300,
        в результатах выборки отразите всю информацию о перелетах */
select * from flights f1
where
    (select min(t3.cost) from tickets t3
    where t3.flight_id = any(
                             select f3.id from flights f3
                             where f3.aircraft_id = (select ac3.id from aircrafts ac3
                                                     where ac3.model = 'Boeing 777-300')))
    <
    any (select t4.cost from tickets t4
          where f1.id = t4.flight_id);

/* sub-query */
select * from flights f2
where f2.aircraft_id = (select ac1.id from aircrafts ac1
                        where ac1.model = 'Boeing 777-300');

select min(t3.cost) from tickets t3
where t3.flight_id = any(
    select f2.id from flights f2
    where f2.aircraft_id = (select ac1.id from aircrafts ac1
                            where ac1.model = 'Boeing 777-300'));

select min(t4.cost) from tickets t4
group by t4.flight_id;

/* 222. определите всех пассажиров, которые приобрели более дорогой билет, чем любой из билетов, купленных на рейс с номером MN3002,
        в результатах выборки отразите всю информацию о билетах */
select * from tickets t1
where t1.cost > any (
    select t2.cost from tickets t2
    where t2.flight_id = (select f2.id from flights f2
                          where f2.flight_no = 'MN3002'));

/* 223. определите все рейсы, на которых было продано более дорогих билетов, чем средняя цена билета для всех рейсов,
        в результатах выборки отразите всю информацию о перелетах */
select * from flights f1
where f1.id = any(
    select t2.flight_id from tickets t2
    where t2.cost > (select avg(t3.cost) from tickets t3));

/* 224. определите все рейсы, на которых есть билеты, купленные пассажирами с именем "John Doe",
        в результатах выборки отразите всю информацию о перелетах */
select * from flights f1
where f1.id = any(
    select t2.flight_id from tickets t2
    where t2.passenger_name = 'John Doe');

/* 225. определите всех пассажиров, чьи фамилии начинаются с той же буквы, что и у пассажира с именем "Dominic Cobb", кроме самого "Dominic Cobb",
        в результатах выборки отразите всю информацию о билетах */
select * from tickets t1
where t1.id = any(
    select t2.id from tickets t2
    where left(split_part(t2.passenger_name, ' ', 2), 1) like left(split_part('Dominic Cobb', ' ', 2), 1)
      and t2.passenger_name not like 'Dominic Cobb');

/* 226. определите всех пассажиров, чьи имена есть в списке пассажиров, купивших билеты на рейс с номером "MN3002",
        в результатах выборки отразите всю информацию о билетах (все столбцы из таблицы tickets) */
select distinct * from tickets t1
where t1.passenger_name = any(select t2.passenger_name from tickets t2
                              where t2.flight_id = (select f2.id from flights f2
                                                    where f2.flight_no = 'MN3002'));

/* 227. определите пассажиров, которые купили билеты на более чем один рейс,
        и вывести их имена и количество купленных билетов, отсортируйте имена по фамилии в алфавитном порядке;
        в результатах выборки отразите информацию о билетах - имя пассажира и количество билетов */
select t1.passenger_name, count(t1.flight_id) ticket_count from tickets t1
group by t1.passenger_name
having count(t1.flight_id) > 1
order by t1.passenger_name;

/* 228. определите всех пассажиров, у которых суммарная стоимость билетов превышает среднюю стоимость билета на всех рейсах,
        отсортировать результат по общей стоимости по возрастанию,
        в результатах выборки отразите фамилию пассажира и общую стоимость */
select t1.passenger_name, sum(t1.cost) total_cost from tickets t1
group by t1.passenger_name
having sum(t1.cost) > (select avg(t2.cost) from tickets t2)
order by total_cost;

/* 229. определите всех пассажиров, которые купили билеты, c ценой такой же, как и самая низкая цена билета на каждом рейсе,
        в результатах выборки отразите всю информацию о билетах (информацию из всех столбцов таблицы) */
select * from tickets t1
where t1.cost = any(select min(t2.cost) from tickets t2
                    group by t2.flight_id);

/* !230. определите всех пассажиров, купивших билеты на рейсы, прибывающие в определенный аэропорт,
        и стоимость их билетов выше средней стоимости билетов на этих рейсах.
        в результатах выборки отразите только имя пассажира */
select distinct
    t1.passenger_name
from tickets t1
         join flights f1 on t1.flight_id = f1.id
where t1.cost > (select avg(t2.cost) from tickets t2
                    join flights f2 on f2.id = t2.flight_id
                 where t1.flight_id = t2.flight_id
                 group by f2.id, t1.flight_id, f2.arrival_airport_code)
group by f1.id, t1.passenger_name, f1.arrival_airport_code
order by t1.passenger_name;

select
    t2.passenger_name,
    t2.flight_id,
    t2.cost,
    (select avg(t4.cost) from tickets t4
        join flights f6 on f6.id = t4.flight_id
    where t4.flight_id = t2.flight_id
    group by f6.id, f6.arrival_airport_code)
    avg_cost,
    f1.arrival_airport_code
from tickets t2
    join flights f1 on t2.flight_id = f1.id
where t2.flight_id in (select f5.id from flights f5
                       where f5.status != 'CANCELLED'
                       group by f5.id, f5.arrival_airport_code)
  and t2.cost < any(select avg(t4.cost) from tickets t4
                        join flights f4 on f4.id = t4.flight_id
                    where t4.flight_id = t2.flight_id
                    group by t4.flight_id, f4.arrival_airport_code)
order by t2.passenger_name;

select avg(t2.cost) from tickets t2
     join flights f2 on f2.id = t2.flight_id
/* where f2.status != 'CANCELLED' */
group by f2.id
order by avg(t2.cost);

select f2.id from flights f2
group by f2.id, f2.arrival_airport_code;

/* 231. определите все рейсы, на которых все билеты стоят больше 200,
        в результатах выборки отразите id перелета, номер рейса, пункт отправления и пункт прибытия */
select f1.id, f1.flight_no, f1.departure_airport_code, f1.arrival_airport_code from flights f1
where f1.id in (
                select t2.flight_id from tickets t2
                group by t2.flight_id
                having min(t2.cost) > 200);

/* 232. определите всех пассажиров, купивших билеты на самый ранний рейс (за основу сравнения берите час отправления),
        в результатах выборки отразите всю информацию о билетах (все столбцы из таблицы tickets) */
select * from tickets t1
where t1.flight_id = (select f3.id
                      from flights f3
                      group by f3.id, f3.departure_date
                      order by min(extract('HOUR' from departure_date))
                      limit 1);

select * from tickets t1
where t1.flight_id = (select f3.id
                      from flights f3
                      where extract('HOUR' from f3.departure_date) <= all(select extract('HOUR' from f4.departure_date) from flights f4)
                      group by f3.id, f3.departure_date);

/* 233. определите все билеты, цена которых выше средней цены всех билетов,
        в результатах выборки отразите всю информацию о билетах (все столбцы из таблицы tickets) */
select * from tickets t1
where t1.cost > all(select avg(t2.cost) from tickets t2);

/* 234. определите все билеты, цена которых выше минимальной цены билета на каждом рейсе,
        в результатах выборки отразите всю информацию о билетах (все столбцы из таблицы tickets) */
select * from tickets t1
where t1.cost > all(select min(t2.cost) from tickets t2
                    group by t2.flight_id);

/* 235. определите все билеты, цена которых выше цены самого дорогого билета на рейс MN3002,
        в результатах выборки отразите всю информацию о билетах (все столбцы из таблицы tickets) */
select * from tickets t1
where t1.cost > all(select t2.cost from tickets t2
                         join flights f2 on f2.id = t2.flight_id
                    where f2.flight_no = 'MN3002');

select min(t2.cost) from tickets t2
    join flights f2 on f2.id = t2.flight_id
where f2.flight_no = 'MN3002';

/* 236. определите все билеты, цена которых выше средней цены билета на каждый из рейсов,
        в результатах выборки отразите всю информацию о билетах (все столбцы из таблицы tickets) */
select * from tickets t1
where t1.cost > all(select avg(t2.cost) from tickets t2
                        join flights f2 on f2.id = t2.flight_id
                    group by t2.flight_id);

/* 237. определите все билеты, цена которых ниже средней цены билетов на каждый рейс из Минска
        в результатах выборки отразите всю информацию о билетах (все столбцы из таблицы tickets) */
select * from tickets t1
where t1.cost < all (select avg(t2.cost) from tickets t2
                         join flights f2 on f2.id = t2.flight_id
                     where f2.departure_airport_code = (select ap2.code from airports ap2
                                                        where ap2.city = 'Minsk')
                     group by f2.id, f2.departure_airport_code);

/* 238. определите все билеты, цена которых выше или равна средней цены билетов на каждый из рейсов в Лондон,
        в результатах выборки отразите всю информацию о билетах (все столбцы из таблицы tickets) */
select * from tickets t1
where t1.cost >= all (select avg(t2.cost) from tickets t2
                        join flights f2 on f2.id = t2.flight_id
                     where f2.arrival_airport_code = (select ap2.code from airports ap2
                                                      where ap2.city = 'London')
                     group by f2.id, f2.arrival_airport_code);

/* 239. определите все билеты, цена которых выше цены на каждый из билетов на рейсы из Москвы на Airbus A320-200
        в результатах выборки отразите всю информацию о билетах (все столбцы из таблицы tickets) */
select * from tickets t1
where t1.cost > all (select t2.cost from tickets t2
                               join flights f2 on f2.id = t2.flight_id
                               join aircrafts a2 on a2.id = f2.aircraft_id
                      where f2.departure_airport_code = (select ap2.code from airports ap2
                                                         where ap2.city = 'Moscow')
                        and a2.model = 'Airbus A320-200'
                      group by f2.id, f2.departure_airport_code, t2.cost);

/* 240. определите все билеты, цена которых ниже цены каждого из билетов на рейсы из Барселоны,
        в результатах выборки отразите всю информацию о билетах (все столбцы из таблицы tickets) */
select * from tickets t1
where t1.cost < all (select t2.cost from tickets t2
                                             join flights f2 on f2.id = t2.flight_id
                     where f2.departure_airport_code = (select ap2.code from airports ap2
                                                        where ap2.city = 'Barcelona')
                     group by f2.id, f2.departure_airport_code, t2.cost);

/* 241. определите все билеты, цена которых выше максимальной цены билетов на каждый из рейсов, статус которых не "ARRIVED"
        в результатах выборки отразите всю информацию о билетах (все столбцы из таблицы tickets) */
select * from tickets t1
where t1.cost > all (select t2.cost from tickets t2
                                             join flights f2 on f2.id = t2.flight_id
                     where f2.status != 'ARRIVED'
                     group by f2.id, t2.cost);

/* 242. определите пассажиров, которые летели как минимум на одном рейсе из Минска в Лондон и обратно,
        в результатах выборки отразите имя пассажира */
select t2.passenger_name from tickets t2
                      join flights f2 on f2.id = t2.flight_id
where f2.departure_airport_code = (select ap2.code from airports ap2
                                   where ap2.city = 'Minsk')
  and f2.arrival_airport_code = (select ap3.code from airports ap3
                                 where ap3.city = 'London')
intersect
select t3.passenger_name from tickets t3
      join flights f3 on f3.id = t3.flight_id
where f3.departure_airport_code = (select ap4.code from airports ap4
                                   where ap4.city = 'London')
  and f3.arrival_airport_code = (select ap5.code from airports ap5
                                 where ap5.city = 'Minsk');

/* 243. определите пассажиров, которые летели на рейсах, которые когда либо прибывали в Барселону и когда либо отправлялись из Минска
        (т.е. не обязательно один и тот же рейс, учитываем все рейсы), в результатах выборки отразите имя пассажира */
select t2.passenger_name from tickets t2
                                  join flights f2 on f2.id = t2.flight_id
where f2.arrival_airport_code = (select ap2.code from airports ap2
                                   where ap2.city = 'Barcelona')
intersect
select t3.passenger_name from tickets t3
                                  join flights f3 on f3.id = t3.flight_id
where f3.departure_airport_code = (select ap4.code from airports ap4
                                   where ap4.city = 'Minsk');

/* 244. определите пассажиров, которые когда-либо покупали билеты на рейсы с моделью самолёта Boeing 777-300 и Sukhoi Superjet 100
        в результатах выборки отразите имя пассажира */
select t2.passenger_name from tickets t2
      join flights f2 on f2.id = t2.flight_id
      join aircrafts a2 on a2.id = f2.aircraft_id
where a2.model = 'Boeing 777-300'
intersect
select t3.passenger_name from tickets t3
                                  join flights f3 on f3.id = t3.flight_id
                                  join aircrafts a3 on a3.id = f3.aircraft_id
where a3.model = 'Sukhoi Superjet 100';

/* 245. определите пассажиров, которые купили билеты на рейсы, прибывающие в Лондон и отправляющиеся из Минска,
        в результатах выборки отразите имя пассажира */
select t2.passenger_name from tickets t2
                                  join flights f2 on f2.id = t2.flight_id
                                  join airports ap2 on ap2.code = f2.arrival_airport_code
where ap2.city = 'London'
intersect
select t3.passenger_name from tickets t3
                                  join flights f3 on f3.id = t3.flight_id
                                  join airports ap3 on ap3.code = f3.departure_airport_code
where ap3.city = 'Minsk';

/* 246. определите пассажиров, которые купили билеты на рейсы, отправляющиеся из Москвы или прибывающие в Москву
        в результатах выборки отразите имя пассажира */
select t2.passenger_name from tickets t2
                                  join flights f2 on f2.id = t2.flight_id
                                  join airports ap2 on ap2.code = f2.arrival_airport_code
where ap2.city = 'Moscow'
intersect
select t3.passenger_name from tickets t3
                                  join flights f3 on f3.id = t3.flight_id
                                  join airports ap3 on ap3.code = f3.departure_airport_code
where ap3.city = 'Moscow';

/* 247. определите пассажиров, которые купили билеты на рейсы, отправляющиеся из Барселоны и прибывающие в Москву, имена отсортируйте по алфавиту
        в результатах выборки отразите имя пассажира */
select t3.passenger_name from (
    select t2.passenger_name from tickets t2
                                      join flights f2 on f2.id = t2.flight_id
                                      join airports ap2 on ap2.code = f2.departure_airport_code
    where ap2.city = 'Barcelona'
    intersect
    select t3.passenger_name from tickets t3
                                      join flights f3 on f3.id = t3.flight_id
                                      join airports ap3 on ap3.code = f3.arrival_airport_code
    where ap3.city = 'Moscow') t3
order by t3.passenger_name;

/* 248. определите пассажиров, которые купили билеты на рейсы, отправляющиеся из Москвы и прибывающие в Барселону,
        в результатах выборки отразите имя пассажира */
select t2.passenger_name from tickets t2
                                  join flights f2 on f2.id = t2.flight_id
                                  join airports ap2 on ap2.code = f2.departure_airport_code
where ap2.city = 'Moscow'
intersect
select t3.passenger_name from tickets t3
                                  join flights f3 on f3.id = t3.flight_id
                                  join airports ap3 on ap3.code = f3.arrival_airport_code
where ap3.city = 'Barcelona';

/* 249. определите пассажиров, которые купили билеты на рейсы, отправляющиеся из Минска и учитывая только тех, которые летели на рейсах до '2024-01-01',
        в результатах выборки отразите имя пассажира */
select t2.passenger_name from tickets t2
                                  join flights f2 on f2.id = t2.flight_id
                                  join airports ap2 on ap2.code = f2.departure_airport_code
where ap2.city = 'Minsk'
intersect
select t3.passenger_name from tickets t3
                                  join flights f3 on f3.id = t3.flight_id
where f3.departure_date < '2024-01-01';

/* 250. определите пассажиров, которые когда либо покупали билеты на рейсы со статусом "ARRIVED" и 'SCHEDULED',
        в результатах выборки отразите имя пассажира */
select t2.passenger_name from tickets t2
                                join flights f2 on f2.id = t2.flight_id
where f2.status = 'ARRIVED'
intersect
select t3.passenger_name from tickets t3
                                join flights f3 on f3.id = t3.flight_id
where f3.status = 'SCHEDULED';

/* 251. определите имена пассажиров, которые на разных рейсах могли купить самый дорогой и самый дешевый билет,
        в результатах выборки отразите имя пассажира */
select t1.passenger_name from tickets t1
where t1.cost = (select max(t2.cost) from tickets t2
                 where t1.flight_id = t2.flight_id
                 group by t2.flight_id)
    intersect
select t3.passenger_name from tickets t3
where t3.cost = (select min(t4.cost) from tickets t4
                 where t3.flight_id = t4.flight_id
                 group by t4.flight_id);

/* 252. определите пассажиров, которые есть в первом рейсе (MN3002), но не присутствуют во втором рейсе (MN3003),
        в результатах выборки отразите имя пассажира */
select t1.passenger_name from tickets t1
         join flights f1 on f1.id = t1.flight_id
where f1.flight_no = 'MN3002'
    except
select t3.passenger_name from tickets t3
          join flights f2 on f2.id = t3.flight_id
where f2.flight_no = 'MN3003';

/* 253. определите пассажиров, которые есть на рейсы из Минска в Лондон, но не присутствуют на рейсах из Лондона в Минск,
        в результатах выборки отразите имя пассажира */
select t2.passenger_name from tickets t2
                                  join flights f2 on f2.id = t2.flight_id
where f2.departure_airport_code = (select ap2.code from airports ap2
                                   where ap2.city = 'Minsk')
  and f2.arrival_airport_code = (select ap3.code from airports ap3
                                 where ap3.city = 'London')
except
select t3.passenger_name from tickets t3
                                  join flights f3 on f3.id = t3.flight_id
where f3.departure_airport_code = (select ap4.code from airports ap4
                                   where ap4.city = 'London')
  and f3.arrival_airport_code = (select ap5.code from airports ap5
                                 where ap5.city = 'Minsk');

/* 254. определите пассажиров, которые забронировали билеты на рейс из Москвы в Барселону (TR3103),
        но не присутствуют в списке пассажиров на отменённом рейсе из Барселоны в Москву (TR3104),
        в результатах выборки отразите имя пассажира */
select t2.passenger_name from tickets t2
          join flights f2 on f2.id = t2.flight_id
where f2.flight_no = 'TR3103'
except
select t3.passenger_name from tickets t3
          join flights f3 on f3.id = t3.flight_id
where f3.flight_no = 'TR3104';

/* 255. определите пассажиров, которые бронировали билеты на рейсы из Минска,
        но не присутствуют в списке пассажиров на рейсы со статусами 'CANCELLED', 'SCHEDULED', 'DEPARTED',
        в результатах выборки отразите имя пассажира */
select t2.passenger_name from tickets t2
                                  join flights f2 on f2.id = t2.flight_id
where f2.departure_airport_code = (select ap2.code from airports ap2
                                   where ap2.city = 'Minsk')
except
select t3.passenger_name from tickets t3
                                  join flights f3 on f3.id = t3.flight_id
where f3.status = 'CANCELLED'
   or f3.status = 'SCHEDULED'
   or f3.status = 'DEPARTED';

/* 256. определите список пассажиров, которые бронировали билеты на рейсы из Минска в Лондон,
        но не присутствуют в списке пассажиров на рейсы из Лондона в Минск, и при этом статус рейсов из Лондона в Минск "ARRIVED",
        в результатах выборки отразите имя пассажира */
select t2.passenger_name from tickets t2
                                  join flights f2 on f2.id = t2.flight_id
where f2.departure_airport_code = (select ap2.code from airports ap2
                                   where ap2.city = 'Minsk')
  and f2.arrival_airport_code = (select ap2.code from airports ap2
                                   where ap2.city = 'London')
except
select t3.passenger_name from tickets t3
                                  join flights f3 on f3.id = t3.flight_id
where f3.status = 'ARRIVED'
  and f3.departure_airport_code = (select ap2.code from airports ap2
                                   where ap2.city = 'London')
  and f3.arrival_airport_code = (select ap2.code from airports ap2
                                 where ap2.city = 'Minsk');

/* 257. определите список пассажиров, которые бронировали билеты на рейс QS8712 из Минска в Лондон
        и не присутствуют в списке пассажиров ни на каком другом рейсе из Минска в Лондон,
        в результатах выборки отразите имя пассажира */
select t2.passenger_name from tickets t2
                                  join flights f2 on f2.id = t2.flight_id
where f2.flight_no = 'QS8712'
except
select t3.passenger_name from tickets t3
                                  join flights f3 on f3.id = t3.flight_id
where f3.flight_no != 'QS8712'
    and f3.departure_airport_code = (select ap2.code from airports ap2
                                   where ap2.city = 'Minsk')
  and f3.arrival_airport_code = (select ap2.code from airports ap2
                                 where ap2.city = 'London');

/* 258. определите список пассажиров, которые бронировали билеты на рейсы в Минск,
        но не присутствуют в списке пассажиров ни на каком другом рейсе в Москву и статус отличен от 'ARRIVAL',
        в результатах выборки отразите имя пассажира */
select t2.passenger_name from tickets t2
                                  join flights f2 on f2.id = t2.flight_id
where f2.arrival_airport_code = (select ap2.code from airports ap2
                                   where ap2.city = 'Minsk')
except
select t3.passenger_name from tickets t3
                                  join flights f3 on f3.id = t3.flight_id
where f3.arrival_airport_code = (select ap2.code from airports ap2
                                   where ap2.city = 'Moscow')
  and f3.status != 'ARRIVAL';

/* 259. определите список пассажиров, которые бронировали билеты на рейс из Лондона в Минск (MN3003)
        и не присутствуют в списке пассажиров на рейсы из Минска в Лондон, и при этом статус рейса из Минска в Лондон "ARRIVED",
        в результатах выборки отразите имя пассажира */
select t2.passenger_name from tickets t2
                                  join flights f2 on f2.id = t2.flight_id
where f2.flight_no = 'MN3003'
except
select t3.passenger_name from tickets t3
                                  join flights f3 on f3.id = t3.flight_id
where f3.status = 'ARRIVED'
  and f3.departure_airport_code = (select ap2.code from airports ap2
                                   where ap2.city = 'Minsk')
  and f3.arrival_airport_code = (select ap2.code from airports ap2
                                 where ap2.city = 'London');

/* 260. определите пассажиров которые купили билет на каждый из рейсов по максимальной цене,
        но их нет на других рейсах, где они купили билет по минимальной цене,
        в результатах выборки отразите имя пассажира */
select t1.passenger_name from tickets t1
where t1.cost = (select max(t2.cost) from tickets t2
                 where t1.flight_id = t2.flight_id
                 group by t2.flight_id)
except
select t3.passenger_name from tickets t3
where t3.cost = (select min(t4.cost) from tickets t4
                 where t3.flight_id = t4.flight_id
                 group by t4.flight_id);

/* 261. определите пассажиров, которые купили более одного билета по минимальной цене на разных рейсах,
        в результатах выборки отразите имя пассажира */
select q1.passenger_name from
(select t1.passenger_name from tickets t1
where t1.cost = (select min(t2.cost) min_cost from tickets t2
                 where t1.flight_id = t2.flight_id
                 group by t2.flight_id)) q1
group by q1.passenger_name
having count(q1.passenger_name) > 1;

select t1.passenger_name from tickets t1
where t1.cost = (select min(t2.cost) min_cost from tickets t2
                 where t1.flight_id = t2.flight_id
                 group by t2.flight_id);

select min(t2.cost) min_cost from tickets t2
group by t2.flight_id;

/* 262. определите пассажиров, которые купили более одного билета по максимальной цене на разных рейсах,
        в результатах выборки отразите имя пассажира */
select q1.passenger_name from
    (select t1.passenger_name from tickets t1
     where t1.cost = (select max(t2.cost) min_cost from tickets t2
                      where t1.flight_id = t2.flight_id
                      group by t2.flight_id)) q1
group by q1.passenger_name
having count(q1.passenger_name) > 1;

/* 263. определите место в самолете на всех рейсах, на которое продано больше всего билетов,
        в результатах выборки отразите номер места и количество проданных билетов на него */
select t1.seat_no, count(t1.seat_no) num_passengers from tickets t1
group by t1.seat_no
order by num_passengers desc
limit 1;

/* 264. определите место в самолете на всех рейсах, на которое продано больше всего билетов
        в результатах выборки отразите номер места и количество проданных билетов на него
        (копия предыдущего, но тут используйте другой подход для решения) */
select * from (select t1.seat_no, count(t1.seat_no) num_passengers from tickets t1
               group by t1.seat_no) c1
order by c1.num_passengers desc
limit 1;

/* 265. определите место в самолете на всех рейсах, на которое продано больше всего билетов
        в результатах выборки отразите номер места и количество проданных билетов на него
        (копия предыдущего, но тут используйте другой подход для решения) */
select c1.seat_no, max(c1.count1) num_passengers from (select t1.seat_no, count(t1.seat_no) count1 from tickets t1
                                                       group by t1.seat_no) c1
group by c1.seat_no
having max(c1.count1) = (select count(t1.seat_no) from tickets t1
                         group by t1.seat_no
                         order by count(t1.seat_no) desc
                         limit 1);

/* 266. определите самое дешевое место с учетом всех проданных на него билетов,
        в результатах выборки отразите номер места и и общую стоимость билетов на него */
select t1.seat_no, sum(t1.cost) total_revenue from tickets t1
group by t1.seat_no
order by total_revenue
limit 1;

/* 267. определите самое дешевое место с учетом всех проданных на него билетов,
        в результатах выборки отразите номер места и и общую стоимость билетов на него
        (копия предыдущего, но тут используйте другой подход для решения) */
select c1.seat_no, min(c1.count1) total_revenue from
    (select t1.seat_no, sum(t1.cost) count1 from tickets t1
     group by t1.seat_no) c1
group by c1.seat_no
having min(c1.count1) = (select sum(t1.cost) from tickets t1
                         group by t1.seat_no
                         order by sum(t1.cost)
                         limit 1);

/* 268. определите самое дешевое место с учетом всех проданных на него билетов,
        в результатах выборки отразите номер места и и общую стоимость билетов на него
        (копия предыдущего, но тут используйте другой подход для решения) */
select c1.seat_no, min(c1.count1) total_revenue from
    (select t1.seat_no, sum(t1.cost) count1 from tickets t1
     group by t1.seat_no) c1
group by c1.seat_no
having min(c1.count1) = (select sum(t1.cost) from tickets t1
                         group by t1.seat_no
                         order by sum(t1.cost)
                         limit 1);

/* 269. определите самолет на покупку билетов в который было потрачено больше всего денег,
        в результатах выборки отразите id самолета и общую стоимость всех билетов на него */
select f1.aircraft_id, sum(t1.cost) total_revenue from tickets t1
    join flights f1 on f1.id = t1.flight_id
group by f1.aircraft_id
order by sum(t1.cost) desc
limit 1;

/* 270-271. определите самолет на покупку билетов в который было потрачено больше всего денег,
        в результатах выборки отразите id самолета и общую стоимость всех билетов на него */
select a1.model,
       sum(t1.cost) total_revenue
from tickets t1
      join flights f1 on f1.id = t1.flight_id
      join aircrafts a1 on a1.id = f1.aircraft_id
group by a1.model
having sum(t1.cost) = (select sum(t2.cost) from tickets t2
                            join flights f2 on f2.id = t2.flight_id
                 group by f2.aircraft_id
                 order by sum(t2.cost) desc
                 limit 1);

/* 272. определить пассажира, который летал на всех моделях самолета,
        в результатах отразите только имя пассажира */
select
    t1.passenger_name
from tickets t1
    join flights f1 on f1.id = t1.flight_id
group by t1.passenger_name, f1.aircraft_id
order by count(t1.passenger_name) desc
limit 1;

/* 273-274. определите пассажира, который летал на наибольшем количестве моделей самолета,
        в результатах отразите имя пассажира и количество моделей для перелета */
select
    t1.passenger_name,
    count(a1.model) models_flown
from tickets t1
         join flights f1 on f1.id = t1.flight_id
         join aircrafts a1 on a1.id = f1.aircraft_id
where t1.passenger_name != 'John Doe'
  and t1.passenger_name != 'Nina Sayers'
group by t1.passenger_name
order by models_flown desc
limit 1;

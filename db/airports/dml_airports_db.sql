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
select s1.aircraft_id, count(s1.seat_no) total_seats from seats s1
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
    (select s1.aircraft_id, count(s1.seat_no) seats_count from seats s1
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
where flight_no between 'MN3000' and 'MN3500';

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

/* 86. определите все рейсы, прибывающие до текущей даты, и количество мест на самолете больше 150 или статус рейса "ARRIVED".
   Результат отсортируйте по возрастанию id перелета, тест битый ждет 12 мест везде (12::int8) total_seats */
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
select ap1.code departure_airport_code, count(f1.id) num_flights from airports ap1
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
select f1.status, count(f1.id) num_flights from flights f1
group by f1.status;

/* 107. определите количество рейсов для каждого аэропорта назначения */
select ap1.code arrival_airport_code, count(f1.id) num_arrivals from flights f1
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
/* ddl */
create table students
(
    id   serial primary key,
    name varchar(50)
);

create table authors
(
    id   serial primary key,
    name varchar(50)
);

create table books
(
    id serial primary key,
    name varchar(200),
    author_id integer references authors (id)
);

create table orders
(
    id serial primary key,
    active boolean default true,
    book_id integer references books (id),
    student_id integer references students (id)
);

insert into students (name)
    values ('Иван Иванов'),
           ('Петр Петров'),
           ('Сергей Прямов'),
           ('Игорь Крутой'),
           ('Степан Глазов'),
           ('Афанасий Глебов');

insert into authors (name)
    values ('Александр Пушкин'),
           ('Николай Гоголь'),
           ('Лев Толстой');

insert into books (name, author_id)
    values ('Евгений Онегин', 1),
           ('Капитанская дочка', 1),
           ('Дубровский', 1),
           ('Мертвые души', 2),
           ('Вий', 2),
           ('Война и Мир', 3),
           ('Кавказский пленник', 3),
           ('Анна Каренина', 3);

insert into orders (book_id, student_id)
    values (1, 1),
           (3, 1),
           (5, 2),
           (4, 1),
           (2, 2),
           (6, 4),
           (7, 5),
           (8, 6);

/* dml */
/* view from task */
create view show_students_with_2_or_more_books
as
select s.name as student, count(a.name), a.name as author
from students as s
         join orders o on s.id = o.student_id
         join books b on o.book_id = b.id
         join authors a on b.author_id = a.id
group by (s.name, a.name)
having count(a.name) >= 2;

select * from show_students_with_2_or_more_books;

/* my view */
create view join_students_orders_authors_books
as
select s.id as student_id, s.name as student, o.id as order_id, o.active as order_is_active, a.id as author_id, a.name as author, b.id as book_id, b.name as book
from students as s
         join orders o on s.id = o.student_id
         join books b on o.book_id = b.id
         join authors a on b.author_id = a.id;

select * from join_students_orders_authors_books;

/* get first three students with maximum ordered books */
select student, count(student) from join_students_orders_authors_books
group by student
having count(student) >= 1
order by count(student) desc limit 3;


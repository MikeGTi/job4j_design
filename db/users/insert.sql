insert into role (role_name)
          values ('Admin'),
                 ('User'),
                 ('Guest');

insert into "user" (user_name, surname, role_id)
          values ('AdminNameTest1', 'AdminSurnameTest1', 1),
                 ('UserNameTest2', 'UserSurnameTest2', 2),
                 ('UserNameTest3', 'UserSurnameTest3', 2),
                 ('GuestNameTest4', 'GuestSurnameTest4', 3);

insert into "right" (right_name)
          values ('Read/Write/Delete'),
                 ('Read/Write'),
                 ('Read');

insert into category (category_name)
          values ('Hard'),
                 ('Middle'),
                 ('Easy'),
                 ('None');

insert into state (state_name)
          values ('New'),
                 ('In progress'),
                 ('Done'),
                 ('Postponed');

insert into item (description, user_id,  category_id, state_id)
          values ('TestTask1',  1, 1, 1),
                 ('TestTask2',  2, 3, 2),
                 ('TestTask3',  3, 3, 3),
                 ('TestTask4',  4, 4, 4),
                 ('TestTask5',  3, 1, 2);

insert into "comment" (stem, item_id)
        values ('TestComment1', 1),
               ('TestComment2', 2),
               ('TestComment3', 3),
               ('TestComment4', 3),
               ('TestComment5', 4),
               ('TestComment6', 5);

insert into attachment (filepath, item_id)
        values ('..\TestFolder\testFile1.txt', 1),
               ('..\TestFolder\testFile2.txt', 2),
               ('..\TestFolder\testFile3.txt', 3),
               ('..\TestFolder\testFile4.txt', 4),
               ('..\TestFolder\testFile5.txt', 5),
               ('..\TestFolder\testFile6.txt', 5),
               ('..\TestFolder\testFile7.txt', 1);

insert into role_right (role_id, right_id)
        values (1, 1),
               (2, 2),
               (3, 3),
               (3, 3);
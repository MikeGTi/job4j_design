/* insert */
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

insert into "comment" (stem)
            values ('TestComment1'),
                   ('TestComment2'),
                   ('TestComment3'),
                   ('TestComment4'),
                   ('TestComment5'),
                   ('TestComment6');

insert into attachment (filepath)
          values ('..\TestFolder\testFile1.txt'),
                 ('..\TestFolder\testFile2.txt'),
                 ('..\TestFolder\testFile3.txt'),
                 ('..\TestFolder\testFile4.txt'),
                 ('..\TestFolder\testFile5.txt'),
                 ('..\TestFolder\testFile6.txt'),
                 ('..\TestFolder\testFile7.txt');

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

insert into item (description, user_id, comment_id, attachment_id, category_id, state_id)
          values ('TestTask1', 1, 1, 1, 1, 1),
                 ('TestTask2', 2, 2, 2, 3, 2),
                 ('TestTask3', 2, 3, 3, 3, 3),
                 ('TestTask4', 3, 4, 4, 4, 4),
                 ('TestTask5', 4, 5, 5, 1, 2);

insert into role_right (role_id, right_id)
        values (1, 1),
               (2, 2),
               (3, 3),
               (3, 3);
/* create */
create table role (
                      id serial primary key,
                      role_name varchar(255)
);

create table "user" (
                      id serial primary key,
                      user_name varchar(255),
                      surname varchar(255),
                      role_id int references role(id)   /* many-to-one */
);

create table "comment" (
                           id serial primary key,
                           stem text
);

create table "attachment" (
                          id serial primary key,
                          filepath varchar(1020)
);

create table "category" (
                          id serial primary key,
                          category_name varchar(255)
);

create table "state" (
                         id serial primary key,
                         state_name varchar(255)
);

create table item (
                      id serial primary key,
                      description varchar(255),
                      user_id int references "user"(id),             /* many-to-one */
                      comment_id int references "comment"(id),       /* many-to-one */
                      attachment_id int references "attachment"(id), /* many-to-one */
                      category_id int references category(id),       /* many-to-one */
                      state_id int references state(id)              /* many-to-one */
);

create table "right" (
                        id serial primary key,
                        right_name varchar(255)
);

create table role_right (
                        id serial primary key,
                        role_id int references role(id),            /* many-to- */
                        right_id int references "right"(id)         /* many     */
);

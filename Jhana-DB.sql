drop table if exists users;
create table users (
id int auto_increment primary key,
name varchar(100),
surname varchar(100),
email varchar(100) unique,
password varchar(100));

drop table if exists roles;
create table roles (
id int auto_increment primary key, 
name varchar(20));

insert into roles(name) values ('admin'),( 'user');

drop table if exists user_role;
CREATE TABLE user_role (
id int auto_increment primary key,
usuario int references usuario(id) on delete cascade on update cascade,
rol int references rol(id) on delete cascade on update cascade);


drop table if exists sessions;
create table sessions (
id int auto_increment primary key,
duration int,
date varchar(100),
user int references users(id) on delete cascade on update cascade);

drop table if exists threads;
create table threads (
id int auto_increment primary key,
description text,
date varchar(100),
creator int references users(id)); /*En caso de eliminarse el usuario no se elimina su post*/

drop table if exists responses;
create table responses (
id int auto_increment primary key,
message text,
date varchar(100),
writer int references users(id),
thread int references threads(id) on delete cascade on update cascade);






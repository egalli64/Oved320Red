
drop table if exists users;
create table users (
user_id integer primary key auto_increment,
birth_date date,
user_name varchar(20),
first_name varchar(20),
last_name varchar(20),
e_mail varchar(40),
phone_number integer,
address varchar(50),
med_certificate varchar(3),
subscr_date date,
passw varchar(15));

drop table if exists categories;
create table categories (
category_id varchar(5) primary key,
category_name varchar(20));


drop table if exists courses;
create table courses (
course_id integer primary key auto_increment,
course_name varchar(20),
category_id varchar(5),
price integer,

foreign key(category_id) references categories(category_id));


drop table if exists jobs;
create table jobs (
job_id varchar(10) primary key,
job_title varchar(30),
min_salary decimal(8,2),
max_salary decimal(8,2));


drop table if exists staff;
create table staff (
staff_id integer primary key auto_increment,
birth_date date,
user_name varchar(20),
first_name varchar(20),
last_name varchar(20),
e_mail varchar(40),
phone_number integer,
address varchar(50),
certificate varchar(25),
hire_date date,
passw varchar(15),
IBAN char(27),
salary integer,
job_id varchar(10),

foreign key(job_id) references jobs(job_id));


drop table if exists lessons;
create table lessons (
lesson_id integer primary key auto_increment,
course_id integer,
duration integer,
staff_id integer,
URL varchar(100),

foreign key(course_id) references courses(course_id),
foreign key(staff_id) references staff(staff_id));



-- XXXXXXXXXXXXXXXXXXXXXXXXXXXX    MIDDLE TABS    XXXXXXXXXXXXXXXXXX

drop table if exists users_courses;
create table users_courses (
user_id integer,
course_id integer,

foreign key(course_id) references courses(course_id),
foreign key(user_id) references users(user_id));

alter table users_courses
add constraint primary key(user_id, course_id);

drop table if exists users_lessons;
create table users_lessons (
user_id integer,
lesson_id integer,

foreign key(lesson_id) references lessons(lesson_id),
foreign key(user_id) references users(user_id));

alter table users_lessons
add constraint primary key(user_id, lesson_id);



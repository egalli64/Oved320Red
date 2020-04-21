use red;

drop table if exists users_lessons;
drop table if exists users_courses;
drop table if exists lessons;
drop table if exists staff;
drop table if exists jobs;
drop table if exists courses;
drop table if exists categories;
drop table if exists users;



create table users (
user_id integer primary key auto_increment,
birth_date date,
user_name varchar(20),
first_name varchar(20),
last_name varchar(20),
e_mail varchar(40),
phone_number char(10),
address varchar(50),
med_certificate varchar(3),
subscr_date date,
passw varchar(15));


insert into users (birth_date, user_name, first_name, last_name, e_mail, phone_number, address, med_certificate, subscr_date, passw) 
values("1994/04/21", "Lory", "Lorenzo", "Cefala", "lorenzo.cefala@polimi.mail.it", "3381324433", "Milano, via Corso Como 23", "YES", "2019/04/13", "Sonoscemolol"),
("1994/05/11", "Felice", "Felice", "Initalia", "felice.initalia@gmail.com", "3351344432", "Milano, via Quadrio 23", "YES", "2018/04/13", "Ill99tti"),
("1995/01/26", "Lilia", "Lilia", "Dissi", "lilia.dissi@hotmail.com", "3324624422", "Milano, viale Romagna 3", "YES", "2019/04/13", "provapassw22"),
("1992/04/30", "Fittime", "Lorenzo", "Cefala", "lorenzo.cefala@gmail.com", "333499433", "Milano, via Corso Sempione 14", "YES", "2019/04/13", "ciccio74"),
("1997/03/28", "Rob Bolle", "Roberto", "Bolle", "lorenzo.cefala@hotmail.com", "338135763", "Milano, viale Bligny 11", "YES", "2019/04/13", "illan8894"),
("1999/02/24", "Rick", "Riccardo", "Melli", "Riccardo.melli@polimi.mail.it", "3357224433", "Milano, via Paolo Sarpi 5", "YES", "2019/04/13", "poptut1999");


create table categories (
category_id varchar(5) primary key,
category_name varchar(20));

insert into categories(category_id, category_name)
values ("DNZ", "Danza"),
("PLIFT", "Powerlifting"),
("AER", "Aerobica"),
("MART", "Arti marziali");


create table courses (
course_id integer primary key auto_increment,
course_name varchar(20),
category_id varchar(5),
price integer,

foreign key(category_id) references categories(category_id));

insert into courses(course_name,category_id,price)
values ("fondamenti di danza", "DNZ", 90),
("squat", "PLIFT", 90),
("introduzione a ZUMBA", "AER", 90),
("boxe avanzata", "MART", 5),
("total body", "AER", 390),
("danza classica", "DNZ", 190);


create table jobs (
job_id varchar(10) primary key,
job_title varchar(30),
min_salary decimal(8,2),
max_salary decimal(8,2));

insert into jobs(job_id,job_title,min_salary ,max_salary)
values ("INST", "Instructor", "800", "2000"),
("AD_CL", "Cleaner", "400", "1200"),
("PRES", "President", "2800", "4000"),
("ADV_INS", "Advanced Instructor", "800", "2000"),
("AD_Por", " Porter", "600", "1400");


create table staff (
staff_id integer primary key auto_increment,
birth_date date,
user_name varchar(20),
first_name varchar(20),
last_name varchar(20),
e_mail varchar(40),
phone_number char(10),
address varchar(50),
certificate varchar(25),
hire_date date,
passw varchar(15),
IBAN char(27),
salary integer,
job_id varchar(10),

foreign key(job_id) references jobs(job_id));

insert into staff
(birth_date, user_name, first_name, last_name, e_mail, phone_number, address, certificate, hire_date, passw, IBAN, salary, job_id)
values("1994/04/21", "Sana", "Sara", "Naro", "sara.naro@polimi.mail.it", "3381324433", "Milano, via Corso Como 23", "YES", "2019/04/13", "Sonoscemolol", "IT60X0542811101000000123456", 1800, "INST"),
("1994/05/11", "Titty", "Tatiana", "Svina", "tatiana.svina@gmail.com", "3351344432", "Milano, via Quadrio 23", "YES", "2018/04/13", "Ill99tti", "IT60X0542811101000000123456", 1700, "AD_CL"),
("1995/01/26", "Bilo", "Lorenzo", "Bitta", "lorenzo.bitta@hotmail.com", "3324624422", "Milano, viale Romagna 3", "YES", "2019/04/13", "provapassw22", "IT60X0542811101000000123456", 2500, "INST"),
("1992/04/30", "Lana", "Loredana", "Nita", "loredana.nita@gmail.com", "333499433", "Milano, via Corso Sempione 14", "YES", "2019/04/13", "ciccio74", "IT60X0542811101000000123456", 2200, "PRES"),
("1997/03/28", "Miriam", "Miriam", "Mulli", "miriam.mulli@hotmail.com", "338135763", "Milano, viale Bligny 11", "YES", "2019/04/13", "illan8894", "IT60X0542811101000000123456", 1900, "INST"),
("1999/02/24", "Emma", "Emma", "Bondavalli", "emma.bondavalli@polimi.mail.it", "3357224433", "Milano, via Paolo Sarpi 5", "YES", "2019/04/13", "poptut1999", "IT60X0542811101000000123456", 3100, "ADV_INS");



create table lessons (
lesson_id integer primary key auto_increment,
course_id integer,
duration integer,
staff_id integer,
URL varchar(100),

foreign key(course_id) references courses(course_id),
foreign key(staff_id) references staff(staff_id));

insert into lessons (course_id,duration,staff_id,URL)
values (1,80,3,"https://www.youtube.com/watch?v=OJoExsA7884&list=PLJcOFqZkViHOGnIzPAYsfLM9-WuS0pbee&index=2"),
(1,50,3,"https://www.youtube.com/watch?v=8LWcZlU3AH0&list=PLJcOFqZkViHPkZJEUouirWgp09SGufUHN&index=4"),
(1,60,3,"https://www.youtube.com/watch?v=noCrzvAxmew&list=PLJcOFqZkViHMYoUt_zNJn42_GvFWPTP69&index=2"),
(3,80,2,"https://www.youtube.com/watch?v=k5HJASj97nA"),
(4,40,3,"https://www.youtube.com/watch?v=Q1Piq_vMh5g"),
(5,50,6,"https://www.youtube.com/watch?v=AuIdv9Q7MTc"),
(5,25,5,"https://www.youtube.com/watch?v=BcXZ49__fKc"),
(6,60,1,"https://www.youtube.com/watch?v=noCrzvAxmew&list=PLJcOFqZkViHMYoUt_zNJn42_GvFWPTP69&index=2");


-- XXXXXXXXXXXXXXXXXXXXXXXXXXXX    MIDDLE TABS    XXXXXXXXXXXXXXXXXX


create table users_courses (
user_id integer,
course_id integer,

foreign key(course_id) references courses(course_id),
foreign key(user_id) references users(user_id));

alter table users_courses
add constraint primary key(user_id, course_id);

insert into users_courses (user_id, course_id)
values (1, 1), 
(1, 3),
(1, 4),
(2, 2),
(2, 5),
(3, 4),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5);


create table users_lessons (
user_id integer,
lesson_id integer,

foreign key(lesson_id) references lessons(lesson_id),
foreign key(user_id) references users(user_id));

alter table users_lessons
add constraint primary key(user_id, lesson_id);

commit;
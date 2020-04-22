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
values("1994/04/21", "Lory", "Lorenzo", "Cefala", "lorenzo.cefala@polimi.mail.it", "3381324433", "Milano, via Corso Como 23", "YES", "2019/04/13", "Lorylory"),
("1994/05/11", "Felice", "Felice", "Initalia", "felice.initalia@gmail.com", "3351344432", "Milano, via Quadrio 23", "YES", "2018/04/13", "Ill99tti"),
("1995/01/26", "Lilia", "Lilia", "Dissi", "lilia.dissi@hotmail.com", "3324624422", "Milano, viale Romagna 3", "YES", "2019/04/13", "provapassw22"),
("1992/04/30", "Fittime", "Lorenzo", "Cefala", "lorenzo.cefala@gmail.com", "333499433", "Milano, via Corso Sempione 14", "YES", "2019/04/13", "ciccio74"),
("1987/03/28", "Rob Bolle", "Roberto", "Bolle", "lorenzo.cefala@hotmail.com", "338135763", "Milano, viale Bligny 11", "YES", "2019/04/13", "illan8894"),
("1999/02/24", "Rick", "Riccardo", "Melli", "riccardo.melli@polimi.mail.it", "3357224433", "Milano, via Paolo Sarpi 5", "YES", "2019/04/13", "poptut1999"),
("1972/04/30", "Fito", "Alessandro", "Cela", "alessandro.cela@gmail.com", "333444633", "Milano, via Corso Sempione 14", "YES", "2019/04/13", "passw1234"),
("1957/03/28", "Bobby", "Roberto", "Bolde", "roby.cefala@hotmail.com", "337765763", "Milano, viale Bligny 11", "YES", "2019/04/13", "qett9"),
("1999/02/24", "Rica", "Rica", "Mirri", "rica.mirri@polimi.mail.it", "3145224433", "Milano, via Paolo Sarpi 5", "YES", "2019/04/13", "pio1999");

create table categories (
category_id varchar(5) primary key,
category_name varchar(20));

insert into categories(category_id, category_name)
values ("DNZ", "Dance"),
("PLIFT", "Powerlifting"),
("AER", "Aerobic"),
("MART", "Martial Arts"),
("BXE", "Boxe"),
("YOG", "Yoga"),
("PIL", "Pilates"),
("ZUM", "Zumba");


create table courses (
course_id integer primary key auto_increment,
course_name varchar(30),
category_id varchar(10),
price integer,

foreign key(category_id) references categories(category_id));

insert into courses(course_name,category_id,price)
values ("Dance fundamentals", "DNZ", 90),
("Squat", "PLIFT", 90),
("Introduction to Zumba", "AER", 90),
("Advanced Boxe", "MART", 150),
("GAG", "AER", 390),
("Ballet for dummies", "DNZ", 190),
("Modern Dance", "DNZ", 210),
("Powerlifting fundamentals", "PLIFT", 170),
("Aerobic for beginners", "DNZ", 140),
("Martial Arts: 1", "DNZ", 190),
("Boxe for beginners", "DNZ", 220),
("Functional Training", "DNZ", 230),
("Pilates for dummies", "DNZ", 120),
("Basic Yoga", "DNZ", 220);


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
values("1994/04/21", "Sana", "Sara", "Naro", "sara.naro@polimi.mail.it", "3381324433", "Milano, via Corso Como 23", "YES", "2019/04/13", "Lorylory", "IT60X0542811101000000123456", 1800, "INST"),
("1994/05/11", "Titty", "Tatiana", "Svina", "tatiana.svina@gmail.com", "3351344432", "Milano, via Quadrio 23", "YES", "2018/04/13", "Ill99tti", "IT60X0542811101000000123456", 1700, "AD_CL"),
("1995/01/26", "Bilo", "Lorenzo", "Bitta", "lorenzo.bitta@hotmail.com", "3324624422", "Milano, viale Romagna 3", "YES", "2019/04/13", "provapassw22", "IT60X0542811101000000123456", 2500, "INST"),
("1992/04/30", "Lana", "Loredana", "Nita", "loredana.nita@gmail.com", "333499433", "Milano, via Corso Sempione 14", "YES", "2019/04/13", "ciccio74", "IT60X0542811101000000123456", 2200, "PRES"),
("1997/03/28", "Miriam", "Miriam", "Mulli", "miriam.mulli@hotmail.com", "338135763", "Milano, viale Bligny 11", "YES", "2019/04/13", "illan8894", "IT60X0542811101000000123456", 1900, "INST"),
("1999/02/24", "Emma", "Emma", "Bondavalli", "emma.bondavalli@polimi.mail.it", "3357224433", "Milano, via Paolo Sarpi 5", "YES", "2019/04/13", "poptut1999", "IT60X0542811101000000123456", 3100, "ADV_INS"),
("1995/01/26", "Vito", "Vito", "Sanna", "vito.sanna@hotmail.com", "3524623322", "Milano, viale Romagna 3", "YES", "2019/04/13", "provapassw22", "IT60X0542811101000000123456", 2500, "INST"),
("1992/04/30", "Lara", "Lara", "Sorani", "lara.sorani@gmail.com", "333499953", "Milano, via Corso Sempione 14", "YES", "2019/04/13", "ciccio74", "IT60X0542811101000000123456", 2200, "PRES"),
("1997/03/28", "Mara", "Marta", "Milani", "marta.milani@hotmail.com", "338136648", "Milano, viale Bligny 11", "YES", "2019/04/13", "illan8894", "IT60X0542811101000000123456", 1900, "INST"),
("1999/02/24", "Enny", "Ennio", "Mazzarella", "ennio.mazzarella@polimi.mail.it", "3313574433", "Milano, via Paolo Sarpi 5", "YES", "2019/04/13", "poptut1999", "IT60X0542811101000000123456", 3100, "ADV_INS");


create table lessons (
lesson_id integer primary key auto_increment,
course_id integer,
duration integer,
staff_id integer,
URL varchar(100),

foreign key(course_id) references courses(course_id),
foreign key(staff_id) references staff(staff_id));

insert into lessons (course_id,duration,staff_id,URL)
values (6,90,3,"https://www.youtube.com/embed/OJoExsA7884"),
(6,50,3,"https://www.youtube.com/embed/8LWcZlU3AH0"),
(6,70,10,"https://www.youtube.com/embed/noCrzvAxmew"),
(7,70,10,"https://www.youtube.com/watch?v=8igkEIBxI7s&list=PLJcOFqZkViHPdMmwPacivoc64P3_BKceI&index=4"),
(7,70,10,"https://www.youtube.com/watch?v=hYBUidwfKbk&list=PLJcOFqZkViHOHYwfxG80zrM01K31lGaO3&index=3"),
(7,70,10,"https://www.youtube.com/watch?v=WYPgmtFG0AI&list=PLJcOFqZkViHPdMmwPacivoc64P3_BKceI&index=3"),
(4,70,10,"https://www.youtube.com/watch?v=Q1Piq_vMh5g"),
(4,70,10,"https://www.youtube.com/watch?v=jCTEVKRTuS8"),
(4,70,10,"https://www.youtube.com/watch?v=Q1Piq_vMh5g"),
(13,70,10,"https://www.youtube.com/watch?v=AuIdv9Q7MTc"),
(13,70,10,"https://www.youtube.com/watch?v=8uqjPvL019c"),
(13,70,10,"https://www.youtube.com/watch?v=BcXZ49__fKc"),
(5,70,10,"https://www.youtube.com/watch?v=k5HJASj97nA"),
(5,70,10,"https://www.youtube.com/watch?v=Vr86C_Qn7Ro"),
(5,70,10,"https://www.youtube.com/watch?v=E8npzFAbJe4");



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
(1, 6),
(1, 7),
(2, 4),
(2, 13),
(3, 5),
(4, 6),
(4, 7),
(4, 13),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 4);

create table users_lessons (
user_id integer,
lesson_id integer,

foreign key(lesson_id) references lessons(lesson_id),
foreign key(user_id) references users(user_id));

alter table users_lessons
add constraint primary key(user_id, lesson_id);

commit;
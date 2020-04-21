-- run this as root

drop user if exists 'red'@'localhost';
drop database if exists red;

create database red;

CREATE USER 'red'@'localhost' IDENTIFIED BY 'provaprova';
GRANT ALL PRIVILEGES ON red.* TO 'red'@'localhost';

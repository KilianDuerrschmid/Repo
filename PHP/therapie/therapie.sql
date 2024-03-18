drop database if exists therapie;
create database therapie;
use therapie;

create table patient(
id int auto_increment primary key,
titel varchar(50) not null,
vorname varchar(50) not null,
nachname varchar(100) not null,
geschlecht char(1) not null,
versicherungsnummer varchar(50) not null,
gebdat date not null,
versicherungstraeger varchar(100) not null,
strasse varchar(50) not null,
plz int not null,
ort varchar(50) not null
);

create table therapieArt(
id int auto_increment primary key,
name varchar (50) not null,
stundensatz double not null
);

create table behandlung(
id int auto_increment primary key,
patientId int not null,
foreign key (patientId) references patient(id)
);

create table termin(
id int auto_increment primary key,
behandlungId int not null,
artId int not null,
dauer int not null,
foreign key (behandlungId) references behandlung(id),
foreign key (artId) references therapieArt(id)
);


create database if not exists skitage;

use skitage;

create table if not exists tblUser(
id int not null auto_increment,
email varchar (50) null,
vorname varchar (50) null,
nachname varchar (100) null,
primary key (id) 
);

create table if not exists tblSkitag(
id int not null auto_increment,
fkUserId int not null,
skigebiet varchar (50) null,
datum date null,
startzeit time null,
endezeit time null,
kommentar varchar (255),
primary key (id),
foreign key (fkUserId) references tblUser(id) on delete cascade on update cascade
);

insert into tblUser (email, vorname, nachname)
values ('test@test.test', 'Tester', 'Testinger'),
('muster@muster.muster', 'Max', 'Mustermann');

insert into tblSkitag (fkUserId, skigebiet, datum, startzeit, endezeit, kommentar)
values (1, 'Testberg', curdate(), now(), now(), 'Cool'),
(2, 'Musterberg', curdate(), now(), now(), 'Nicht Cool');

select * from tbluser;

select * from tblskitag;


create database dbDuerrschmid;

use dbDuerrschmid;

create table patienten(
id int auto_increment,
svnr int not null,
gebDat varchar(6),
vorname varchar(100) null,
nachname varchar(100) not null,
primary key (id)
);

create table diagnosen(
id int auto_increment,
name varchar(100) not null,
datum date not null,
patientId int not null,
primary key(id),
foreign key (patientId) references patienten(id)
);



insert into patienten (svnr, gebDat, vorname, nachname)
values
(1234, '010124', 'Max', 'Mustermann'),
(4321, '240101', 'Marie', 'Musterfrau'),
(5678, '010203', 'Markus', 'Mustermensch');

insert into diagnosen (name, datum, patientId) 
values 
('Husten', now(), 1),
('Schnupfen', now(), 1),
('Grippe', now(), 2),
('Fleischwunde', now(), 2),
('Knochenbruch', now(), 3),
('Ohrenentzündung', now(), 3);

select * from patienten p
join diagnosen d on p.id = d.patientId order by svnr;
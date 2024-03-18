/* Sportverein

Mitgliedertabelle
ID
Vorname
Nachname
Strasse
PLZ
Ort

Sportstätte
Id
Name
Straße
PLZ
Ort

Mannschafttabelle
ID
Leiter FK Mitglied not null
Name
Sportstätte FK Sportstätte

Manschaftmitglieder
ID
Mitglied FK Mitglied
Mannschaft FK Mannschaft

Trainingstermin
ID
Trainingzeit
Sportstätte FK Sportstätte
Mannschaft FK Mannschaft

*/ 

drop database if exists sportverleih;
create database if not exists sportverleih;
use sportverleih;

create table sektion(
id int auto_increment primary key,
sportart int not null
);

create table mitglied(
id int auto_increment primary key,
sektionId int not null,
vorname varchar (50) not null,
nachname varchar (100) not null,
strasse varchar(50) not null,
plz int not null,
ort varchar(50) not null
);

create table sektionMitglied(
mitgliedId int auto_increment primary key,
sektionId int not null,
foreign key (sektionId) references sektion(id),
foreign key (mitgliedId) references mitglied(id)
);

create table sportstaette(
id int auto_increment primary key,
name varchar (50) not null,
strasse varchar(50) not null,
plz int not null,
ort varchar(50) not null
);

create table mannschaft(
id int auto_increment primary key,
leiterId int not null,
sportstaetteId int not null,
name varchar (50) not null,
foreign key (leiterId) references mitglied(id),
foreign key (sportstaetteId) references sportstaette(id)
);

create table mannschaftMitglieder(
mitgliedId int not null,
mannschaftId int not null,
foreign key (mitgliedId) references mitglied(id),
foreign key (mannschaftId) references mannschaft(id)
);

create table training(
id int auto_increment primary key,
sportstaetteId int not null,
mannschaftId int not null,
trainingTag date not null,
trainingZeit varchar(10) not null,
foreign key (sportstaetteId) references sportstaette(id),
foreign key (mannschaftId) references mannschaft(id)
);
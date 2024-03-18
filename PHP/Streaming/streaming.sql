drop database if exists streaming;
create database if not exists streaming;
use streaming;

create table streaming_services(
id int auto_increment primary key,
name varchar(50) not null,
preis double not null
);

create table kunde(
id int auto_increment primary key,
vorname varchar(50) not null,
nachname varchar(50) not null,
email varchar(50) not null,
username varchar(50) not null,
passwort varchar(255) not null
);

create table servicesKunde(
serviceId int,
kundeId int,
foreign key (serviceId) references streaming_services(id),
foreign key (kundeId) references kunde(id)
);

create table kategorie(
id int auto_increment primary key,
name varchar(50) not null
);

create table genre(
id int auto_increment primary key,
name varchar(50) not null
);

create table medien(
id int auto_increment primary key,
name varchar(100) not null,
erscheinungsdatum date not null,
laenge varchar(10) not null,
kategorieId int,
genreId int,
foreign key (kategorieId) references kategorie(id),
foreign key (genreId) references genre(id)
);

create table medienListe(
kundeId int,
medienId int,
gesehen_Am date not null,
foreign key (kundeId) references kunde(id),
foreign key (medienId) references medien(id)
);


INSERT INTO streaming_services (name, preis) VALUES 
('Netflix', 12.99),
('Amazon Prime Video', 9.99),
('Disney+', 7.99);

INSERT INTO kunde (vorname, nachname, email, username, passwort) VALUES 
('Max', 'Mustermann', 'max.mustermann@example.com', 'maxi93', MD5('sicheresPasswort123')),
('Maria', 'Musterfrau', 'maria.musterfrau@example.com', 'maria27', MD5('geheimesPasswort456')),
('Peter', 'Schmidt', 'peter.schmidt@example.com', 'peter_s', MD5('verstecktesPasswort789'));

INSERT INTO servicesKunde (serviceId, kundeId) VALUES 
(1, 1),
(2, 2),
(3, 3),
(1, 3),
(2, 1),
(3, 2);

INSERT INTO kategorie (name) VALUES 
('Film'),
('Serie'),
('Dokumentation');

-- Insert-Anweisungen für die Tabelle genre
INSERT INTO genre (name) VALUES 
('Action'),
('Komödie'),
('Drama');

INSERT INTO medien (name, erscheinungsdatum, laenge, kategorieId, genreId) VALUES 
('Inception', '2010-07-16', '148 Minuten', 1, 1),
('Friends', '1994-09-22', '22 Minuten', 2, 2),
('Planet Earth II', '2016-11-06', '57 Minuten', 3, 3),
('The Shawshank Redemption', '1994-10-14', '142 Minuten', 1, 3),
('Breaking Bad', '2008-01-20', '47 Minuten', 2, 1),
('The Godfather', '1972-03-24', '175 Minuten', 1, 3),
('Stranger Things', '2016-07-15', '50 Minuten', 2, 2),
('Blue Planet II', '2017-10-29', '60 Minuten', 3, 3);

INSERT INTO medienListe (kundeId, medienId, gesehen_Am) VALUES 
(1, 1, '2023-05-10'),
(2, 2, '2023-08-22'),
(3, 3, '2023-11-15'),
(1, 3, '2024-01-03'),
(3, 1, '2024-01-20'),
(3, 2, '2024-01-25'),
(3, 5, '2024-02-05');

-- 5 Abfragen

-- Wieviel Zahlt ein Kunde im Monat?
select kundeId, sum(preis) from servicesKunde sk
join streaming_services s on sk.serviceId = s.id
 where kundeId = 3;
 
 -- welche Filme hat ein Kunde bereits gesehen
 select m.* from medienListe ml
 join medien m on ml.medienId = m.id
 where kundeId = 1;
 
 -- lieblings Genre eines Kunden
 select g.name from medienListe ml
 join medien m on ml.medienId = m.id
 join genre g on m.genreId = g.id
 where kundeId = 3 group by g.id order by count(g.id) desc LIMIT 1;
 
 -- medien, die vor 2000 erschienen sind
 select * from medien where erscheinungsdatum < '2000-01-01';
 
 -- Medien, die ein kunde noch nicht gesehen hat
 select * from medien 
 where id not in (
 select medienId from medienListe
 where kundeId = 1);
 
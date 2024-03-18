drop database if exists spielverleih;
create database spielverleih;
use spielverleih;

create table kunde(
id int auto_increment primary key,
anrede varchar(20) null,
vorname varchar(50) null,
nachname varchar(100) null,
geschlecht char(1) null,
strasse varchar(50) null,
plz int null,
ort varchar(50) null,
registrierungsdatum date not null,
telefon varchar (50) null,
email varchar(50) null
);

create table kategorie(
id int auto_increment primary key,
name varchar(50) not null
);

create table zustand(
id int auto_increment primary key,
zustand varchar(50) not null
);

create table spiel(
id int auto_increment primary key,
name varchar(50) not null,
kategorieId int,
foreign key (kategorieId) references kategorie(id)
);

create table verleih(
id int auto_increment primary key,
kunde int,
start date null,
ende date null,
foreign key (kunde) references kunde(id)
);

create table verleihDetails(
id int auto_increment primary key,
verleihId int,
spielId int,
zustandId int,
foreign key (verleihId) references verleih(id),
foreign key (spielId) references spiel(id),
foreign key (zustandId) references zustand(id)
);

-- Kunde
INSERT INTO kunde (anrede, vorname, nachname, geschlecht, strasse, plz, ort, registrierungsdatum, telefon, email) VALUES
('Herr', 'Max', 'Mustermann', 'm', 'Musterstraße 1', 12345, 'Musterstadt', '2023-01-15', '123456789', 'max.mustermann@example.com'),
('Frau', 'Maria', 'Schmidt', 'w', 'Schmidtallee 2', 54321, 'Schmidtort', '2023-02-20', '987654321', 'maria.schmidt@example.com'),
('Herr', 'Klaus', 'Fischer', 'm', 'Fischerweg 3', 67890, 'Fischerstadt', '2023-03-25', '111222333', 'klaus.fischer@example.com'),
('Frau', 'Anna', 'Meier', 'w', 'Meiergasse 4', 45678, 'Meierstadt', '2023-04-30', '444555666', 'anna.meier@example.com'),
('Herr', 'Peter', 'Müller', 'm', 'Müllerallee 5', 98765, 'Müllerort', '2023-05-10', '777888999', 'peter.mueller@example.com'),
('Herr', 'Kilian', 'D', 'm', 'Müllerallee 5', 98765, 'Müllerort', '2023-05-10', '777888999', 'peter.mueller@example.com'),
('Herr', 'Test', 'Testinger', 'm', 'Müllerallee 5', 98765, 'Müllerort', '2023-05-10', '777888999', 'peter.mueller@example.com');

-- Kategorie
INSERT INTO kategorie (name) VALUES
('Action'),
('Adventure'),
('Puzzle'),
('Simulation');

-- Zustand
INSERT INTO zustand (zustand) VALUES
('Neu'),
('Gebraucht'),
('Beschädigt');

-- Spiel
INSERT INTO spiel (name, kategorieId) VALUES
('GTA V', 1),
('Call of Duty: Modern Warfare', 1),
('The Legend of Zelda: Breath of the Wild', 2),
('Uncharted 4: A Thief''s End', 2),
('Portal 2', 3),
('Tetris', 3),
('The Sims 4', 4),
('Euro Truck Simulator 2', 4);

-- Verleih
INSERT INTO verleih (kunde, start, ende) VALUES
(1, '2023-06-01', '2023-06-10'),
(2, '2023-06-05', '2023-06-15'),
(3, '2023-06-10', null),
(4, '2023-06-15', null),
(5, '2023-06-20', null),
(2, '2023-06-05', '2023-06-15');

-- VerleihDetails
INSERT INTO verleihDetails (verleihId, spielId, zustandId) VALUES
(1, 1, 1),
(1, 3, 3),
(2, 2, 1),
(2, 4, 2),
(3, 5, 1),
(3, 7, 2),
(4, 6, 3),
(6, 6, 3);

select count(vd.id) from kunde k
join verleih v on k.id = v.kunde
join verleihDetails vd on v.id = vd.verleihId where k.id = 3 and v.ende is null;

select count(vd.id) from kunde k
join verleih v on k.id = v.kunde
join verleihDetails vd on v.id = vd.verleihId where k.id = 3;

select * from spiel s
join verleihDetails vd on s.id = vd.spielId group by s.id order by count(s.id) desc;

select * from spiel where id not in (select spielId from verleihDetails);

select * from kunde where id not in (select kunde from verleih);

select * from spiel s
join verleihDetails vd on s.id = vd.spielId where vd.zustandId = 3;



drop database if exists werkzeug;
create database werkzeug;
use werkzeug;

create table kunde(
id int auto_increment primary key,
anrede varchar(20) null,
titel varchar(20) null,
vorname varchar(50) null,
nachname varchar(100) null,
geschlecht char(1) null,
strasse varchar(50) null,
plz int null,
ort varchar(50) null
);

create table werkzeug(
id int auto_increment primary key,
bezeichnung varchar(50)
);

create table markt(
id int auto_increment primary key,
strasse varchar(50) null,
plz int null,
ort varchar(50) null
);

create table verleih(
id int auto_increment primary key,
kunde int,
start date null,
ende date null,
startMarktId int,
endeMarktId int,
foreign key (kunde) references kunde(id),
foreign key (startMarktId) references markt(id),
foreign key (endeMarktId) references markt(id)
);

create table verleihDetails(
id int auto_increment primary key,
verleihId int,
werkzeugId int,
foreign key (verleihId) references verleih(id),
foreign key (werkzeugId) references werkzeug(id)
);

INSERT INTO kunde (anrede, titel, vorname, nachname, geschlecht, strasse, plz, ort) VALUES
('Herr', 'Dr.', 'Max', 'Mustermann', 'm', 'Musterstraße 1', 12345, 'Musterstadt'),
('Frau', 'Prof.', 'Maria', 'Schmidt', 'w', 'Schmidtallee 2', 54321, 'Schmidtort'),
('Herr', 'Dipl.-Ing.', 'Klaus', 'Fischer', 'm', 'Fischerweg 3', 67890, 'Fischerstadt');

-- INSERT-Anweisungen für die Tabelle 'werkzeug'
INSERT INTO werkzeug (bezeichnung) VALUES
('Hammer'),
('Schraubendreher'),
('Säge');

-- INSERT-Anweisungen für die Tabelle 'markt'
INSERT INTO markt (strasse, plz, ort) VALUES
('Marktstraße 1', 11111, 'Marktstadt'),
('Platzweg 2', 22222, 'Platzort'),
('Gasse 3', 33333, 'Gassenstadt');

-- INSERT-Anweisungen für die Tabelle 'verleih'
INSERT INTO verleih (kunde, start, ende, startMarktId, endeMarktId) VALUES
(1, '2024-02-09', '2024-02-12', 1, 2),
(2, '2024-02-10', '2024-02-14', 2, 3),
(3, '2024-02-11', '2024-02-15', 3, 1);

-- INSERT-Anweisungen für die Tabelle 'verleihDetails'
INSERT INTO verleihDetails (verleihId, werkzeugId) VALUES
(1, 1),
(2, 2),
(3, 3);
drop database if exists schueler;
create database schueler;
use schueler;

create table schueler(
id int auto_increment primary key,
anrede varchar(50) not null,
vorname varchar(50) not null,
nachname varchar(50) not null,
gebdat date not null
);

select FLOOR((DATEDIFF(DATE(now()), gebDat)) / 365.25) from schueler;

SELECT * FROM schueler where MONTH(gebdat) = 2;

INSERT INTO schueler (anrede, vorname, nachname, gebdat) VALUES
('Herr', 'Max', 'Mustermann', '2006-01-01'),
('Frau', 'Anna', 'Schmidt', '2005-02-02'),
('Herr', 'Peter', 'Müller', '2001-03-03'),
('Frau', 'Sarah', 'Schneider', '2009-04-04'),
('Herr', 'Markus', 'Fischer', '2005-05-05'),
('Frau', 'Julia', 'Weber', '2005-06-06'),
('Herr', 'Michael', 'Wagner', '2003-07-07'),
('Frau', 'Laura', 'Becker', '1997-08-08'),
('Herr', 'Thomas', 'Schulz', '2011-09-09'),
('Frau', 'Sandra', 'Hoffmann', '1990-10-10'),
('Herr', 'Daniel', 'Schäfer', '1978-11-11'),
('Frau', 'Nicole', 'Koch', '2019-12-12');
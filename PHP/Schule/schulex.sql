-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Nov 2022 um 22:29
-- Server-Version: 10.4.14-MariaDB
-- PHP-Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `schule`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `abteilungen`
--

CREATE TABLE `abteilungen` (
  `Abt_ID` int(10) NOT NULL,
  `Abt_Nr` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Abt_Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Abt_Leiter` varchar(50) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `abteilungen`
--

INSERT INTO `abteilungen` (`Abt_ID`, `Abt_Nr`, `Abt_Name`, `Abt_Leiter`) VALUES
(1, 'HWIT', 'Wirtschaftsingenieurwesen', 'ZLA'),
(2, 'BINF', 'Informatik Abend', 'BF'),
(3, 'FID/KIF', 'Inf.Fachschule/ Kolleg', 'BC'),
(4, 'HINF', 'Informatik Tag', 'SKO'),
(5, 'KD', 'Kunst und Design', 'PRW');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `geschlechter`
--

CREATE TABLE `geschlechter` (
  `Ges_ID` int(10) NOT NULL,
  `Ges_Mw` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `Ges_Maennlichweiblich` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Ges_Schuelerschuelerin` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Ges_Lehrerlehrerin` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `geschlechter`
--

INSERT INTO `geschlechter` (`Ges_ID`, `Ges_Mw`, `Ges_Maennlichweiblich`, `Ges_Schuelerschuelerin`, `Ges_Lehrerlehrerin`) VALUES
(1, 'm', 'männlich', 'Schüler', 'Lehrer'),
(2, 'w', 'weiblich', 'Schülerin', 'Lehrerin');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `klassen`
--

CREATE TABLE `klassen` (
  `K_Nr` varchar(50) CHARACTER SET utf8 NOT NULL,
  `K_Jahrsem` smallint(5) DEFAULT NULL,
  `K_Nrextern` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `K_Vorstand` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `K_Abteilung` int(10) DEFAULT NULL,
  `K_Datumvon` datetime DEFAULT NULL,
  `K_Datumbis` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `klassen`
--

INSERT INTO `klassen` (`K_Nr`, `K_Jahrsem`, `K_Nrextern`, `K_Vorstand`, `K_Abteilung`, `K_Datumvon`, `K_Datumbis`) VALUES
('1AAIF', 20161, NULL, 'BF', 3, NULL, NULL),
('1ABIF', 20161, NULL, 'GT', 2, NULL, NULL),
('1AHBGM', 20160, NULL, 'JEL', 3, NULL, NULL),
('1AHIF', 20160, NULL, 'TSI', 4, NULL, NULL),
('1AKIF', 20161, NULL, 'GT', 3, NULL, NULL),
('1BAIF', 20161, NULL, 'AT', 3, NULL, NULL),
('1BBIF', 20161, NULL, 'SW', 2, NULL, NULL),
('1BHBGM', 20160, NULL, 'BIG', 3, NULL, NULL),
('1BHIF', 20160, NULL, 'ROG', 4, NULL, NULL),
('1CBIF', 20161, NULL, 'SW', 2, NULL, NULL),
('1CHIF', 20160, NULL, 'TT', 4, NULL, NULL),
('1DHIF', 20160, NULL, 'SIL', 4, NULL, NULL),
('1EHIF', 20160, NULL, 'PK', 4, NULL, NULL),
('2AFID', 20160, NULL, 'NWV', 3, NULL, NULL),
('2AHBGM', 20160, NULL, 'PIR', 3, NULL, NULL),
('2AHIF', 20160, NULL, 'SO', 4, NULL, NULL),
('2BHBGM', 20160, NULL, 'CAM', 3, NULL, NULL),
('2BHIF', 20160, NULL, 'ROG', 4, NULL, NULL),
('2CHIF', 20160, NULL, 'BOM', 4, NULL, NULL),
('2DHIF', 20160, NULL, 'LAD', 4, NULL, NULL),
('2EHIF', 20160, NULL, 'KRB', 4, NULL, NULL),
('3ABIF', 20161, NULL, 'GT', 2, NULL, NULL),
('3AFID', 20160, NULL, 'NAI', 3, NULL, NULL),
('3AHBGM', 20160, NULL, 'PUA', 3, NULL, NULL),
('3AHIF', 20160, NULL, 'KY', 4, NULL, NULL),
('3BBIF', 20161, NULL, 'AT', 2, NULL, NULL),
('3BHBGM', 20160, NULL, 'HEB', 3, NULL, NULL),
('3BHIF', 20160, NULL, 'PC', 4, NULL, NULL),
('3CHIF', 20160, NULL, 'LC', 4, NULL, NULL),
('3EHIF', 20160, NULL, 'ZUM', 4, NULL, NULL),
('4AFID', 20160, NULL, 'KRB', 3, NULL, '2017-02-19 00:00:00'),
('4AHBGM', 20160, NULL, 'ZEP', 3, NULL, NULL),
('4AHIF', 20160, NULL, 'GC', 4, NULL, NULL),
('4BHBGM', 20160, NULL, 'PRS', 3, NULL, NULL),
('4BHIF', 20160, NULL, 'PC', 4, NULL, NULL),
('4CHIF', 20160, NULL, 'NAI', 4, NULL, NULL),
('4EHIF', 20160, NULL, 'HAE', 4, NULL, NULL),
('5AHBGM', 20160, NULL, 'CAM', 3, NULL, '2017-05-07 00:00:00'),
('5AHIF', 20160, NULL, 'FZ', 4, NULL, '2017-05-07 00:00:00'),
('5BHIF', 20160, NULL, 'SK', 4, NULL, '2017-05-07 00:00:00'),
('5CHIF', 20160, NULL, 'PE', 4, NULL, '2017-05-07 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lehrer`
--

CREATE TABLE `lehrer` (
  `L_Nr` varchar(50) CHARACTER SET utf8 NOT NULL,
  `L_Zuname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `L_Vorname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `L_Titel` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `L_Titelnach` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `L_Geschlecht` int(10) DEFAULT NULL,
  `L_Sprechstunde_tag` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `L_Gehalt` decimal(30,11) DEFAULT NULL,
  `L_Stundengewuenscht` decimal(18,4) DEFAULT NULL,
  `L_Stundengehalten` decimal(18,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `lehrer`
--

INSERT INTO `lehrer` (`L_Nr`, `L_Zuname`, `L_Vorname`, `L_Titel`, `L_Titelnach`, `L_Geschlecht`, `L_Sprechstunde_tag`, `L_Gehalt`, `L_Stundengewuenscht`, `L_Stundengehalten`) VALUES
('AF', 'Akyildiz', 'Fatma', 'Dipl.-Päd.', NULL, 2, 'Mittwoch', '740.00000000000', '20.0000', '22.1000'),
('AT', 'Antonescu', 'Margareth', 'Mag. Dr.', NULL, 2, 'Mittwoch', '500.00000000000', '16.0000', '14.0000'),
('BAN', 'Bánkuti', 'Judit Eszter', NULL, 'M.Sc.', 2, NULL, '500.00000000000', '16.0000', '14.0000'),
('BC', 'Bruckner', 'Georg', 'DI Dr.', NULL, 1, 'Mittwoch', '560.00000000000', '15.0000', '16.1000'),
('BF', 'Berger', 'Franz', 'DI', NULL, 1, 'Montag', '620.00000000000', '20.0000', '18.0000'),
('BI', 'Binder', 'Florian', 'Mag.', NULL, 1, 'Montag', NULL, NULL, NULL),
('BIG', 'Binder', 'Georg', 'Mag.', NULL, 1, NULL, NULL, NULL, NULL),
('BOB', 'Bogensperger', 'Brigitte', 'Mag.', NULL, 2, NULL, NULL, NULL, NULL),
('BOM', 'Boltz', 'Michael', 'DI', NULL, 1, NULL, '620.00000000000', '21.0000', '18.2000'),
('BR', 'Brandtner', 'Thomas', 'Mag.', NULL, 1, 'Donnerstag', '380.00000000000', '15.0000', '11.7000'),
('BV', 'Bregar', 'Volker', 'Mag.', NULL, 1, 'Mittwoch', '500.00000000000', '14.0000', '14.6000'),
('BW', 'Bergmann', 'Wolfgang', 'DI', NULL, 1, NULL, '620.00000000000', '19.0000', '18.3000'),
('CAM', 'Camrda', 'Christian', 'DI', NULL, 1, 'Montag', '500.00000000000', '17.0000', '14.2000'),
('CHA', 'Chwatal', 'Andreas', 'DI Dr.', 'Bakk.', 1, NULL, NULL, NULL, NULL),
('CO', 'Coufal', 'Klaus', 'Mag. Dr.', NULL, 1, NULL, '560.00000000000', '21.0000', '17.5000'),
('DP', 'Divjak', 'Peter', 'Mag.', NULL, 1, 'Donnerstag', '620.00000000000', '19.0000', '18.3000'),
('DX', 'Draxl', 'Helmut', 'DI', 'Bsc', 1, 'Freitag', NULL, NULL, NULL),
('FIN', 'Fink-Steinwender', 'Heidi Marie', 'Mag.', NULL, 2, NULL, '560.00000000000', '21.0000', '17.9000'),
('FM', 'Furtlehner', 'Margit', 'DI', NULL, 2, 'Montag', '380.00000000000', '13.0000', '11.7000'),
('FZ', 'Fanzott', 'Leo', 'DI', NULL, 1, 'Dienstag', '620.00000000000', '18.0000', '18.0000'),
('GC', 'Gründl', 'Claudia', 'Mag.', NULL, 2, NULL, NULL, NULL, NULL),
('GR', 'Griesberger', 'Jörg-Peter', 'Mag.', NULL, 1, 'MI', NULL, NULL, NULL),
('GRM', 'Griesmayer', 'Andrea', 'MMag.', NULL, 2, NULL, '440.00000000000', '16.0000', '13.1000'),
('GS', 'Gasser', 'Helmut', 'Mag.', NULL, 1, 'Mittwoch', '500.00000000000', NULL, NULL),
('GT', 'Griesmayer', 'Thomas', 'Mag.', NULL, 1, 'Montag', NULL, NULL, NULL),
('HAE', 'Häring', 'Susanna', 'Mag.', NULL, 2, 'Mittwoch', NULL, NULL, NULL),
('HAR', 'Harand', 'Erich', 'Mag.', NULL, 1, NULL, '440.00000000000', NULL, NULL),
('HAU', 'Haudek', 'Christoph', 'Mag.', NULL, 1, 'Montag', '380.00000000000', '13.0000', '11.1000'),
('HD', 'Haidegger', 'Ingrid', 'Mag.', NULL, 2, 'Dienstag', '680.00000000000', '23.0000', '20.5000'),
('HEB', 'Hesina', 'Bernd', 'Mag.', 'BEd', 1, NULL, '320.00000000000', '7.0000', '8.3000'),
('HH', 'Hallwirth', 'Silvia', 'Mag.', NULL, 2, NULL, '500.00000000000', '16.0000', '14.1000'),
('HI', 'Hickel', 'Wolfgang', 'Mag.', NULL, 1, NULL, '680.00000000000', '3.0000', '13.0000'),
('HIK', 'Hilbe', 'Klaus', 'DI', 'MBA', 1, NULL, '770.00000000000', '0.0000', '8.0000'),
('HL', 'Hiesel', 'Robert', 'Mag.', NULL, 1, 'Freitag', '380.00000000000', '13.0000', '10.0000'),
('HOE', 'Höfer', 'Daniel', NULL, NULL, 1, 'Montag', '380.00000000000', NULL, NULL),
('HT', 'Hofbauer', 'Anton', 'Mag.', NULL, 1, 'Do', '440.00000000000', '16.0000', '13.2000'),
('HW', 'Hammerl', 'Walter', 'DI', NULL, 1, 'Mittwoch', '500.00000000000', '17.0000', '15.2000'),
('IR', 'Ilkhani', 'Roya', 'DI', NULL, 2, NULL, '620.00000000000', '20.0000', '18.1000'),
('JEL', 'Jelinek', 'Robert', 'DI', NULL, 1, 'Montag', '440.00000000000', '14.0000', '13.6000'),
('KOM', 'Komnacky', 'Sabine', 'Mag.', NULL, 2, 'Montag', '440.00000000000', '15.0000', '13.3000'),
('KRB', 'Krajina', 'Brigitta', 'Mag.', NULL, 2, 'Freitag', NULL, NULL, NULL),
('KRM', 'Krammer', 'Martin', NULL, NULL, 1, NULL, '440.00000000000', NULL, NULL),
('KS', 'Kalliany', 'Susanne', 'DI', NULL, 2, NULL, '500.00000000000', '16.0000', '14.8000'),
('KU', 'Kugler', 'Christine', 'Mag.', NULL, 2, 'Freitag', '500.00000000000', '14.0000', '15.2000'),
('KUM', 'Kuba', 'Markus', 'Dr. DI', NULL, 1, 'Mittwoch', NULL, NULL, NULL),
('KY', 'Kerry', 'Florian', 'Mag.', NULL, 1, NULL, '500.00000000000', '15.0000', '15.4000'),
('LAD', 'Latsch', 'Daniela', 'Mag.', NULL, 2, NULL, '680.00000000000', '21.0000', '21.0000'),
('LC', 'Lackinger', 'Doris', 'DI', NULL, 2, 'Montag', '620.00000000000', '13.0000', '19.9000'),
('LO', 'Lorenz', 'Peter', 'DI', NULL, 1, 'Donnerstag', '500.00000000000', NULL, NULL),
('MAY', 'Mayer', 'Sonja', 'Mag.', NULL, 2, NULL, NULL, NULL, NULL),
('MC', 'Marek', 'Clemens', 'Mag.', NULL, 1, NULL, '620.00000000000', '22.0000', '19.6000'),
('MI', 'Mitmannsgruber', 'Leopold', 'DI', NULL, 1, 'Dienstag', '0.00000000000', NULL, '0.0000'),
('MOH', 'Moritsch', 'Hans', 'DI Dr.', NULL, 1, NULL, NULL, NULL, NULL),
('MOS', 'Moser', 'Gabriele', 'Mag.', NULL, 2, 'Montag', '440.00000000000', '12.0000', '12.0000'),
('MU', 'Makrandreou', 'Margit', 'Mag.', NULL, 2, 'Freitag', NULL, NULL, '0.0000'),
('NAI', 'Naimer', 'Eva-Maria', 'Mag.', NULL, 2, 'Mittwoch', '680.00000000000', '25.0000', '21.5000'),
('NWV', 'Neuwirth', 'Veronika', 'Dipl.Päd.', NULL, 2, 'Donnerstag', '560.00000000000', '17.0000', '16.2000'),
('OEZT', 'Öztürk', 'Levent', 'DI (FH)', NULL, 1, NULL, NULL, NULL, NULL),
('OM', 'Ollrom', 'Martin', NULL, 'BSc', 1, 'Freitag', '440.00000000000', '17.0000', '13.1000'),
('PC', 'Pemmer', 'Christian', 'Mag.', NULL, 1, 'Mittwoch', '680.00000000000', '20.0000', '20.0000'),
('PE', 'Petschenig', 'Brigitte', 'Mag.', NULL, 2, 'Montag', NULL, NULL, NULL),
('PF', 'Pfeiffer', 'Andreas', 'Mag.', NULL, 1, NULL, '440.00000000000', '15.0000', '13.1000'),
('PH', 'Paul', 'Helga', 'Mag.', NULL, 2, 'Dienstag', '500.00000000000', NULL, NULL),
('PIR', 'Pirker', 'Simon', 'Mag. DI', NULL, 1, NULL, '320.00000000000', '8.0000', '8.3000'),
('PK', 'Pollack-Drs', 'Susanne', 'Mag.', 'Bakk.', 2, 'Montag', '440.00000000000', '11.0000', '13.3000'),
('POP', 'Pötscher-Prem', 'Karin', 'Mag.', NULL, 2, 'Donnerstag', NULL, NULL, NULL),
('PRM', 'Prem', 'Evelyne', 'Mag.', NULL, 2, 'Montag', '680.00000000000', NULL, NULL),
('PRS', 'Pratscher', 'Susanne', 'Mag. Dr.', NULL, 2, NULL, '620.00000000000', '21.0000', '18.5000'),
('PRW', 'Pramel', 'Werner', NULL, 'MA', 1, 'Montag', '620.00000000000', '20.0000', '18.9000'),
('PS', 'Preißl', 'Johann', 'Mag.', NULL, 1, 'Dienstag', '500.00000000000', '17.0000', '14.0000'),
('PUA', 'Puchhammer', 'Alexander', NULL, NULL, 1, NULL, '560.00000000000', '19.0000', '17.1000'),
('PUH', 'Puhm', 'Ursula', 'Mag.', NULL, 2, 'Freitag', NULL, NULL, NULL),
('RA', 'Resch', 'Andreas', 'DI', NULL, 1, NULL, '800.00000000000', '14.0000', '12.1000'),
('REI', 'Reichmann', 'Eduard', 'Mag.', NULL, 1, 'Donnerstag', NULL, NULL, NULL),
('ROG', 'Rogner', 'Philipp', NULL, 'RL MEd. BEd ', 1, NULL, '560.00000000000', '21.0000', '17.8000'),
('RT', 'Riedl', 'Thomas', 'Dipl.-Päd', NULL, 1, NULL, NULL, NULL, NULL),
('RX', 'Renkin', 'Maximilian', 'DI', NULL, 1, 'Dienstag', '500.00000000000', '13.0000', '15.5000'),
('SAB', 'Sabin', 'Andrea', 'DI', NULL, 2, 'Dienstag', NULL, NULL, NULL),
('SCA', 'Schubert', 'Anna', 'Mag.', NULL, 2, NULL, '880.00000000000', '11.0000', '12.2000'),
('SCG', 'Schildberger', 'Gerald', 'DI', NULL, 1, 'Mittwoch', '560.00000000000', '16.0000', '17.0000'),
('SE', 'Schmid', 'Erhard', 'Mag.', NULL, 1, NULL, '500.00000000000', '13.0000', '15.3000'),
('SEM', 'Semmler', 'Eva', 'Mag.', NULL, 2, 'Dienstag', NULL, NULL, NULL),
('SF', 'Schopf', 'Günter', 'Mag. Dr.', NULL, 1, 'Dienstag', NULL, NULL, NULL),
('SIL', 'Siller', 'Waltraud', 'Mag.', NULL, 2, NULL, NULL, NULL, NULL),
('SK', 'Schenk', 'Andreas', 'DI Mag.', NULL, 1, NULL, NULL, NULL, NULL),
('SKO', 'Skolud', 'Theo', 'Bakk.Mag.', NULL, 1, 'Mittwoch', '620.00000000000', '22.0000', '18.6000'),
('SLF', 'Slavik', 'Franz', 'Dipl.-Päd.', NULL, 1, 'Montag', '560.00000000000', '21.0000', '17.6000'),
('SO', 'Schmoll', 'Birgit', 'Mag.', NULL, 2, 'Montag', '620.00000000000', '18.0000', '19.1000'),
('SP', 'Stappler', 'Sonja', 'Mag.', NULL, 2, NULL, '320.00000000000', '10.0000', '9.6000'),
('STE', 'Stefan', 'Robert', NULL, 'BSc.', 1, NULL, NULL, NULL, NULL),
('STJ', 'Stanek', 'Julia', 'Mag.', NULL, 2, 'Freitag', '380.00000000000', '11.0000', '11.3000'),
('SW', 'Schwaiger', 'Ursula', 'Mag.', NULL, 2, NULL, NULL, NULL, NULL),
('SWH', 'Swoboda', 'Harald', 'DI', 'MBA', 1, 'Freitag', '440.00000000000', '12.0000', '13.1000'),
('SZ', 'Schletz', 'Michael', NULL, NULL, 1, NULL, NULL, NULL, NULL),
('TF', 'Teufel', 'Otto', 'Mag.', NULL, 1, NULL, NULL, NULL, NULL),
('TK', 'Trappl', 'Katharina', 'Mag.', NULL, 2, NULL, '380.00000000000', '9.0000', '10.7000'),
('TSI', 'Tolic-Sapina', 'Ivana', NULL, NULL, 2, NULL, '560.00000000000', '15.0000', '12.3000'),
('TT', 'Tschernko', 'Thomas', 'DI', NULL, 1, 'Freitag', '500.00000000000', '14.0000', '15.6000'),
('UR', 'Urschitz', 'Elfriede', 'Mag.', NULL, 2, NULL, '560.00000000000', '19.0000', '17.9000'),
('VC', 'Vavra', 'Christine', 'Mag.', NULL, 2, 'Montag', '620.00000000000', '19.0000', '18.1000'),
('WK', 'Wodnar', 'Karl', 'Mag. Dr.', NULL, 1, 'Dienstag', '740.00000000000', '25.0000', '22.1000'),
('WW', 'Wögerer', 'Wolfgang', 'DI', NULL, 1, 'Dienstag', '320.00000000000', '7.0000', '8.8000'),
('WWE', 'Wagner-Walser', 'Erich', 'Mag.', NULL, 1, 'Montag', '500.00000000000', NULL, '0.0000'),
('ZEP', 'Zeppelzauer', 'Wolfgang', 'Mag. DI', NULL, 1, NULL, '320.00000000000', '8.0000', '9.1000'),
('ZIM', 'Zidek', 'Miriam', 'DI', NULL, 2, NULL, '440.00000000000', '14.0000', '13.0000'),
('ZLA', 'Zlabinger', 'Walter', 'DI', NULL, 1, 'Montag', '620.00000000000', '19.0000', '18.9000'),
('ZOE', 'Zöttl', 'Andreas', 'Ing.', 'Bakk.', 1, NULL, '560.00000000000', '17.0000', '17.3000'),
('ZUM', 'Zumpf', 'Harald', 'Mag.', 'Bakk.rer.soc.oec.', 1, NULL, '620.00000000000', '21.0000', '18.7000');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `religionen`
--

CREATE TABLE `religionen` (
  `Rel_ID` int(10) NOT NULL,
  `Rel_Nr` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Rel_Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Rel_Gesetzlichanerkannt` tinyint(1) DEFAULT NULL,
  `Rel_Staatlicheingetragen` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `religionen`
--

INSERT INTO `religionen` (`Rel_ID`, `Rel_Nr`, `Rel_Name`, `Rel_Gesetzlichanerkannt`, `Rel_Staatlicheingetragen`) VALUES
(1, 'adv', 'Kirche der Siebenten-Tags-Adventisten', 0, 1),
(2, 'ak', 'armenisch-katholisch', 1, 0),
(3, 'altk', 'altkatholisch', 1, 0),
(4, 'ang', 'anglikanisch', 0, 0),
(5, 'arap', 'armenisch-apostolisch', 1, 0),
(6, 'argr', 'Armenisch - griechisch', 0, 0),
(7, 'bab', 'Bund der Baptistengemeinden in Österreich', 0, 1),
(8, 'bo', 'bulgarisch-orthodox', 1, 0),
(9, 'bud', 'buddhistisch', 1, 0),
(10, 'evab', 'evangelisch A.B.', 1, 0),
(11, 'evf', 'evang.-freikirchlich', 0, 0),
(12, 'evhb', 'evangelisch H.B.', 1, 0),
(13, 'gch', 'Grace Church', 0, 0),
(14, 'gk', 'griechisch-katholisch', 1, 0),
(15, 'go', 'griechisch-orthodox', 1, 0),
(16, 'hindu', 'Hinduistische Religionsgesellschaft in Österreich', 0, 1),
(17, 'hlt', 'Kirche Jesu Christi der Heiligen der Letzten Tage ', 1, 0),
(18, 'io', 'Indisch orth.', 0, 0),
(19, 'islam', 'islamisch', 1, 0),
(20, 'isr', 'israelitisch', 1, 0),
(21, 'ko', 'koptisch-orthodox', 1, 0),
(22, 'meth', 'evangelisch-methodistisch', 1, 0),
(23, 'mor', 'Mormonen', 0, 0),
(24, 'mos', 'Mosaisch', 0, 0),
(25, 'mzo', 'mazedonisch orth.', 0, 0),
(26, 'neuap', 'neuapostolisch', 1, 0),
(27, 'ob', 'Ohne Bekenntnis', 0, 0),
(28, 'rk', 'römisch-katholisch', 1, 0),
(29, 'rmk', 'Rumänisch kath.', 0, 0),
(30, 'rmo', 'rumänisch-orthodox', 1, 0),
(31, 'ro', 'russisch-orthodox', 1, 0),
(32, 's', '----Sonstige----', 0, 0),
(33, 'sik', 'sikh', 0, 0),
(34, 'so', 'serbisch-orthodox', 1, 0),
(35, 'syo', 'syrisch-orthodox', 1, 0),
(36, 'zje', 'Jehovas Zeugen', 1, 0),
(37, 'Bahai', 'Bahá’í-Religionsgemeinschaft Österreich ', 0, 1),
(38, 'evang', 'Bund evangelikaler Gemeinden in Österreich', 0, 1),
(39, 'chgem', 'Die Christengemeinschaft – Bewegung für religiöse Erneuerung – in Österreich', 0, 1),
(40, 'fchgem', 'Freie Christengemeinde/Pfingstgemeinde', 0, 1),
(41, 'MFÖ', 'Mennonitische Freikirche Österreich', 0, 1),
(42, 'pfingst', 'Pfingstkirche Gemeinde Gottes in Österreich', 0, 1),
(43, 'ECG', 'Elaia Christengemeinden', 0, 1),
(44, 'alevi', 'Islamitische Alevitische Glaubensgemeinschaft in Österreich', 0, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schueler`
--

CREATE TABLE `schueler` (
  `S_Nr` int(10) NOT NULL,
  `S_Zuname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `S_Vorname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `S_Geschlecht` int(10) DEFAULT NULL,
  `S_Gebdatum` datetime DEFAULT NULL,
  `S_Strasse` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `S_Hausnummer` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `S_Postleitzahl` smallint(5) DEFAULT NULL,
  `S_Postort` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `S_Religion` int(10) DEFAULT NULL,
  `S_Staatsbuergerschaft` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `S_Klasse` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `schueler`
--

INSERT INTO `schueler` (`S_Nr`, `S_Zuname`, `S_Vorname`, `S_Geschlecht`, `S_Gebdatum`, `S_Strasse`, `S_Hausnummer`, `S_Postleitzahl`, `S_Postort`, `S_Religion`, `S_Staatsbuergerschaft`, `S_Klasse`) VALUES
(1, 'Ali', 'Claudia', 2, '1968-04-05 00:00:00', 'Pülslg.', '8-9/15', 1020, 'Wien', NULL, NULL, '1AAIF'),
(2, 'Amon', 'Thomas', 1, '1994-01-06 00:00:00', 'Enzersfelderstraße', '3/13', 1030, 'Wien', NULL, NULL, '1AAIF'),
(3, 'Fejzulović', 'Amra', 2, '1978-09-29 00:00:00', 'Ortschlag', '169', 9232, 'Rosegg', NULL, NULL, '1AAIF'),
(4, 'Hartmann', 'Mathias', 1, '1998-08-01 00:00:00', 'Landstrasserhauptstr.', '1', 1110, 'Wien', NULL, NULL, '1AAIF'),
(5, 'Horvath', 'Magdalena', 2, '1997-01-11 00:00:00', 'Hasnerstraße', '3/3', 1150, 'Wien', NULL, NULL, '1AAIF'),
(6, 'Kaufmann', 'Martin', 1, '1991-01-28 00:00:00', 'Jedlersdorferstr.', '44/19', 1030, 'Wien', NULL, NULL, '1AAIF'),
(7, 'Kessler', 'Julia', 2, '1993-12-11 00:00:00', 'Brückengasse', '1', 4600, 'Wels', NULL, NULL, '1AAIF'),
(8, 'Knezevic', 'Dragan', 1, '1997-01-23 00:00:00', 'Akkonplatz', '3', 9020, 'Klagenfurt', NULL, NULL, '1AAIF'),
(9, 'Knöpfle', 'Matthias', 1, '1997-09-03 00:00:00', 'Siccardsburggasse', '4 8', 7464, 'Althodis', NULL, NULL, '1AAIF'),
(10, 'Li', 'Anjie', 1, '1995-04-26 00:00:00', 'Columbusgasse', '1/13', 1220, 'Wien', NULL, NULL, '1AAIF'),
(11, 'Mosallem', 'Ahmed', 1, '1998-08-13 00:00:00', 'Prof. Robert Kramreiter Ring', '5', 1040, 'Wien', NULL, NULL, '1AAIF'),
(12, 'Müller', 'Marco', 1, '1996-11-01 00:00:00', 'Rosenhügelstr.', '27/10', 3012, 'Wolfsgraben', NULL, NULL, '1AAIF'),
(13, 'Pflegerl', 'Dominik', 1, '1996-12-07 00:00:00', 'Tivolig.', '97/3/11', 1220, 'Wien', NULL, NULL, '1AAIF'),
(14, 'Ranisavljevic', 'Jovan', 1, '1995-11-03 00:00:00', 'Simmeringer Hauptstraße', '17', 1040, 'Wien', NULL, NULL, '1AAIF'),
(15, 'Riegler', 'Michael', 1, '1994-03-10 00:00:00', 'Flurschützstr.', '4/4/12', 3400, 'Weidling', NULL, NULL, '1AAIF'),
(16, 'Roldan', 'Rafael', 1, '1998-07-11 00:00:00', 'Stiftgasse', '6/38', 2620, 'Neunkirchen', NULL, NULL, '1AAIF'),
(17, 'Samonte', 'Bernard', 1, '1997-06-09 00:00:00', 'Hardegg.', '2', 1150, 'Wien', NULL, NULL, '1AAIF'),
(18, 'Schuh', 'Daniel', 1, '1996-02-14 00:00:00', 'Am Schöpfwerk', '21', 1070, 'Wien', NULL, NULL, '1AAIF'),
(19, 'Surlan', 'Dejan', 1, '1997-09-26 00:00:00', 'Oldenburggasse', '40', 1040, 'Wien', NULL, NULL, '1AAIF'),
(20, 'Tafart', 'Christopher', 1, '1996-07-21 00:00:00', 'Wulzendorferstraße', '378', 2542, 'Kottingbrunn', NULL, NULL, '1AAIF'),
(21, 'Tillmann', 'Marion', 2, '1988-05-21 00:00:00', 'Hungerbergstraße', '190', 2513, 'Möllersdorf', NULL, NULL, '1AAIF'),
(22, 'Tillmann', 'Martina', 2, '1960-07-15 00:00:00', 'Hauffgasse', '10', 1020, 'Wien', NULL, NULL, '1AAIF'),
(23, 'Togootsch', 'Sara', 2, '1993-04-07 00:00:00', 'Rembrandtstraße', '73/4', 1150, 'Wien', NULL, NULL, '1AAIF'),
(24, 'Zaczkowski', 'Lukasz', 1, '1992-03-01 00:00:00', 'Berglerg.', '20/2', 1160, 'Wien', NULL, NULL, '1AAIF'),
(25, 'Ajanic', 'Elly', 2, '1993-12-23 00:00:00', 'Guneschg.', '2/3/1/3', 1150, 'Wien', NULL, NULL, '1ABIF'),
(26, 'Benc', 'Ulrich', 1, '1991-04-27 00:00:00', 'Kreisgasse', '16/14', 4870, 'Vöcklamarkt', NULL, NULL, '1ABIF'),
(27, 'Bocaj', 'Norges', 1, '1985-12-14 00:00:00', 'Wienerstr.', '36', 1130, 'Wien', NULL, NULL, '1ABIF'),
(28, 'Cubela', 'Ivan', 1, '1990-02-10 00:00:00', 'Kaiser-Ebersdorferstr.', '37', 1110, 'Wien', NULL, NULL, '1ABIF'),
(29, 'Georgiev', 'Petar Veselinov', 1, '1988-12-23 00:00:00', 'Hauptstr.', '23/8', 1100, 'Wien', NULL, NULL, '1ABIF'),
(30, 'Gruber', 'Matthias', 1, '1978-07-20 00:00:00', 'Neubergenstrasse', '18/19', 1020, 'Wien', NULL, NULL, '1ABIF'),
(31, 'Hosseini', 'Seyedamir', 1, '1987-03-17 00:00:00', 'Enenkelstraße', '169', 1150, 'Wien', NULL, NULL, '1ABIF'),
(32, 'Iderbat', 'Bilguundalai', 1, '1994-01-07 00:00:00', 'Radezkystr.', '22/17', 1150, 'Wien', NULL, NULL, '1ABIF'),
(33, 'Keighobadi', 'Ebrahim', 1, '1987-03-01 00:00:00', 'Untere Hauptstrasse', '7/2/9', 2460, 'Bruck/Leitha', NULL, NULL, '1ABIF'),
(34, 'Ladinig', 'Andrea', 2, '1989-08-09 00:00:00', 'Rundstuckstr.', '75', 2344, 'Ma. Enzersdorf', NULL, NULL, '1ABIF'),
(35, 'Macic', 'Almir', 1, '1981-01-14 00:00:00', 'Wattgasse', '26', 2351, 'Wr. Neudorf', NULL, NULL, '1ABIF'),
(36, 'Mohammadi', 'Nassim', 1, '1992-01-08 00:00:00', 'Kreindlg.', '7/1/4', 8510, 'Stainz', NULL, NULL, '1ABIF'),
(37, 'Moser', 'Boris', 1, '1984-03-29 00:00:00', 'Enzersfelderstraße', '22/34', 1150, 'Wien', NULL, NULL, '1ABIF'),
(38, 'Nasanbayar', 'Lkhagvatseren', 2, '1992-09-08 00:00:00', 'Hauptstraße', '8/18', 1140, 'Wien', NULL, NULL, '1ABIF'),
(39, 'Orcasitas', 'Stefan', 1, '1992-10-12 00:00:00', 'Hauptstr.', '6/9', 1110, 'Wien', NULL, NULL, '1ABIF'),
(40, 'Ott', 'Matthias', 1, '1991-11-10 00:00:00', 'Schloßsee II/', '4/6', 1170, 'Wien', NULL, NULL, '1ABIF'),
(41, 'Pittner', 'Fabio', 1, '1974-06-24 00:00:00', 'Burggasse', '2-4/4/51', 1050, 'Wien', NULL, NULL, '1ABIF'),
(42, 'Rahborfarkhooy', 'Mohammadreza', 1, '1989-08-10 00:00:00', 'Paracelsusgasse', '6/20', 1100, 'Wien', NULL, NULL, '1ABIF'),
(43, 'Rieder', 'Manuel', 1, '1985-10-04 00:00:00', 'Rotenhofgasse', '88/2/20', 1050, 'Wien', NULL, NULL, '1ABIF'),
(44, 'Roth', 'Bernd', 1, '1980-03-23 00:00:00', 'Rechenfeldstr.', '62/5', 1030, 'Wien', NULL, NULL, '1ABIF'),
(45, 'Salmaniasl', 'Mehran', 1, '1987-11-19 00:00:00', 'Laxenburgerstr.', '88/34', 2345, 'Brunn/Gebirge', NULL, NULL, '1ABIF'),
(46, 'Sekula', 'Natalija', 2, '1989-03-04 00:00:00', 'Keilg.', '24', 1234, 'Wien', NULL, NULL, '1ABIF'),
(47, 'Sila', 'Angelina', 2, '1991-06-19 00:00:00', 'Reklewskigasse', '69/12', 1120, 'Wien', NULL, NULL, '1ABIF'),
(48, 'Stuhlik', 'Marko', 1, '1971-03-03 00:00:00', 'Halirschgasse', '22/4', 6971, 'Hard', NULL, NULL, '1ABIF'),
(49, 'Albert', 'Patricia', 2, '2002-08-31 00:00:00', 'Akaziengasse', '36/4/14', 1170, 'Wien', NULL, NULL, '1AHBGM'),
(50, 'Almajanu', 'Ana-Maria', 2, '2001-09-30 00:00:00', 'Wiethestraße', '9/9/5/4', 1170, 'Wien', NULL, NULL, '1AHBGM'),
(51, 'Arapoglu', 'Fatima', 2, '2002-10-01 00:00:00', 'Haslingerg.', '4/1/7', 1110, 'Wien', NULL, NULL, '1AHBGM'),
(52, 'Djakovic', 'Martina', 2, '2002-01-18 00:00:00', 'Speckbachergasse', '3/9', 1210, 'Wien', NULL, NULL, '1AHBGM'),
(53, 'Dorner', 'Alexandra', 2, '2000-11-01 00:00:00', 'Anzengrubergasse', '9/19', 3464, 'Goldgeben', NULL, NULL, '1AHBGM'),
(54, 'Durmaz', 'Melih', 1, '2001-10-07 00:00:00', 'Reinprechtsdorferstr.', '19/34', 1230, 'Wien', NULL, NULL, '1AHBGM'),
(55, 'Durmaz', 'Süheyla', 2, '2002-01-26 00:00:00', 'Stenografeng.', '9/9/5/4', 2332, 'Hennersdorf', NULL, NULL, '1AHBGM'),
(56, 'Gruber', 'Michelle', 2, '2001-04-02 00:00:00', 'Smolag.', '4/4/2', 1230, 'Wien', NULL, NULL, '1AHBGM'),
(57, 'Haberler', 'Florian', 1, '2002-04-22 00:00:00', 'Preysingg.', '30/6/26', 1090, 'Wien', NULL, NULL, '1AHBGM'),
(58, 'Hejda', 'David', 1, '2001-11-08 00:00:00', 'Hofstattg.', '18/9-10', 1120, 'Wien', NULL, NULL, '1AHBGM'),
(59, 'Klocker', 'Linus', 1, '2001-10-09 00:00:00', 'trogergasse', '24/4/1', 8990, 'Bad Aussee', NULL, NULL, '1AHBGM'),
(60, 'Lai', 'Julia', 2, '2001-11-05 00:00:00', 'Parkgasse', '6/1/4', 7100, 'Neusiedl/See', NULL, NULL, '1AHBGM'),
(61, 'Lödl', 'Christoph', 1, '2001-08-14 00:00:00', 'Othmargasse', '13', 2560, 'Berndorf', NULL, NULL, '1AHBGM'),
(62, 'Memis', 'Melih', 1, '2002-09-07 00:00:00', 'Fasangarteng.', '39/43', 1170, 'Wien', NULL, NULL, '1AHBGM'),
(63, 'Mohamed', 'Omar', 1, '2001-04-26 00:00:00', 'Friedhofg.', '35-37/3/9', 1140, 'Wien', NULL, NULL, '1AHBGM'),
(64, 'Oberressl', 'Felix', 1, '2002-12-18 00:00:00', 'Brigittenauer Lände', '10', 1230, 'Wien', NULL, NULL, '1AHBGM'),
(65, 'Pakchehr', 'Melanie', 2, '2001-12-30 00:00:00', 'Stolberggasse', '4', 1140, 'Wien', NULL, NULL, '1AHBGM'),
(66, 'Raica', 'Hanna', 2, '2002-09-19 00:00:00', 'Landstr. Hauptstr.', '2/5/60', 1100, 'Wien', NULL, NULL, '1AHBGM'),
(67, 'Schachner', 'Sabrina', 2, '2002-11-23 00:00:00', 'Lindengasse', '35-37/3/9', 1210, 'Wien', NULL, NULL, '1AHBGM'),
(68, 'Schartmüller', 'Elias Noah', 1, '2001-10-16 00:00:00', 'Landesgerichtsstraße', '12/17', 3434, 'Katzelsdorf', NULL, NULL, '1AHBGM'),
(69, 'Schneiter', 'Rinchen', 2, '2001-11-06 00:00:00', 'Kreisgasse', '8/3', 3021, 'Preßbaum', NULL, NULL, '1AHBGM'),
(70, 'Schneiter', 'Sonam', 1, '2001-10-17 00:00:00', 'Putzingerstraße', '13-19/2/10', 1170, 'Wien', NULL, NULL, '1AHBGM'),
(71, 'Schulz', 'Jonas', 1, '2002-10-23 00:00:00', 'Reinprechtsdorferstr.', '125', 1230, 'Wien', NULL, NULL, '1AHBGM'),
(72, 'Skumantz', 'Marcel', 1, '2002-01-10 00:00:00', 'Burggasse', '36/2/14', 1220, 'Wien', NULL, NULL, '1AHBGM'),
(73, 'Stöger', 'Marliese', 2, '2003-04-21 00:00:00', 'Senfg.', '6', 1130, 'Wien', NULL, NULL, '1AHBGM'),
(74, 'Tulepbergenow', 'Daniel', 1, '2000-07-11 00:00:00', 'Vitiserstraße', '21/1/20', 1230, 'Wien', NULL, NULL, '1AHBGM'),
(75, 'Vidovic', 'Ilija', 1, '2002-07-08 00:00:00', 'Greiseneckergasse', '1/3/3', 1230, 'Wien', NULL, NULL, '1AHBGM'),
(76, 'Winter', 'Martin', 1, '2001-07-02 00:00:00', 'Alserstraße', '21-23/12/9', 3002, 'Purkersdorf', NULL, NULL, '1AHBGM'),
(77, 'Wurz', 'Daniela', 2, '2002-09-30 00:00:00', 'Wiethestraße', '6', 1180, 'Wien', NULL, NULL, '1AHBGM'),
(78, 'Wurzberger', 'Marco', 1, '2000-08-18 00:00:00', 'Strohgasse', '48/3', 1020, 'Wien', NULL, NULL, '1AHBGM'),
(79, 'Yilmaz', 'Zehra', 2, '2003-02-18 00:00:00', 'Wendstattg.', '22/7/4', 1150, 'Wien', NULL, NULL, '1AHBGM'),
(80, 'Zanko', 'Stefan', 1, '2001-05-30 00:00:00', 'Loudonstr.', '33/2/6', 7111, 'Parndorf', NULL, NULL, '1AHBGM'),
(81, 'Burner', 'José', 1, '1992-01-04 00:00:00', 'Schmalzhofg.', '30', 2295, 'Oberweiden', NULL, NULL, '1AKIF'),
(82, 'Deldar', 'Mitra', 2, '1977-03-05 00:00:00', 'Friedrich Kaisergasse', '2/7/5', 1100, 'Wien', NULL, NULL, '1AKIF'),
(83, 'Eckert', 'Peter', 1, '1964-05-30 00:00:00', 'Vorgartenstr.', '5/17/6', 1100, 'Wien', NULL, NULL, '1AKIF'),
(84, 'Eldarsi', 'Bellkeis', 2, '1994-02-23 00:00:00', 'Währingerstr.', '28', 1050, 'Wien', NULL, NULL, '1AKIF'),
(85, 'Hussain', 'Farzooq', 1, '1979-06-13 00:00:00', 'Landstr. Hauptstr.', '16', 1230, 'Wien', NULL, NULL, '1AKIF'),
(86, 'Ilic', 'Antonio', 1, '1994-04-17 00:00:00', 'Am Kanal', '41', 2752, 'Wöllersdorf', NULL, NULL, '1AKIF'),
(87, 'Jagodic', 'Irina-Simona', 2, '1985-11-21 00:00:00', 'Hasnerstr.', '151', 1140, 'Wien', NULL, NULL, '1AKIF'),
(88, 'Jernei', 'Violetta', 2, '1973-01-18 00:00:00', 'Hungerbergstraße', '76-78/30', 1050, 'Wien', NULL, NULL, '1AKIF'),
(89, 'Kahler', 'Christopher', 1, '1992-07-24 00:00:00', 'Burggasse', '51', 1100, 'Wien', NULL, NULL, '1AKIF'),
(90, 'Kappl', 'Alexandra', 2, '1992-01-07 00:00:00', 'Kirschenallee', '30', 1050, 'Wien', NULL, NULL, '1AKIF'),
(91, 'Keller', 'Diane', 2, '1966-04-04 00:00:00', 'Heinestr.', '50', 1160, 'Wien', NULL, NULL, '1AKIF'),
(92, 'Kerschbaum', 'Norbert', 1, '1975-07-02 00:00:00', 'Anton Baumgartnerstr.', '4', 1050, 'Wien', NULL, NULL, '1AKIF'),
(93, 'Nagata', 'Miki', 2, '1977-07-06 00:00:00', 'Breitenseerstraße', '4', 1100, 'Wien', NULL, NULL, '1AKIF'),
(94, 'Obradovic', 'Mojca', 2, '1979-06-01 00:00:00', 'Mayergasse', '15-19/1/5', 1030, 'Wien', NULL, NULL, '1AKIF'),
(95, 'Pouladi', 'Babak', 1, '1994-11-12 00:00:00', 'Jara Benes Gasse', '9/22', 1030, 'Wien', NULL, NULL, '1AKIF'),
(96, 'Prohaska', 'Ruth', 2, '1995-02-24 00:00:00', 'Glasauergasse', '3/23', 1020, 'Wien', NULL, NULL, '1AKIF'),
(97, 'Redjepi', 'Afrdita', 2, '1981-02-24 00:00:00', 'Bundesstr.', '13', 1100, 'Wien', NULL, NULL, '1AKIF'),
(98, 'Schlagholz', 'Lukas', 1, '1985-08-12 00:00:00', 'Peter Jordanstr.', '26/12', 2500, 'Baden', NULL, NULL, '1AKIF'),
(99, 'Sild', 'Clemens', 1, '1968-12-17 00:00:00', 'Leibnitzg.', '58', 1140, 'Wien', NULL, NULL, '1AKIF'),
(100, 'Ströbinger', 'Christian', 1, '1986-02-20 00:00:00', 'Hütteldorferstr.', '2', 1100, 'Wien', NULL, NULL, '1AKIF'),
(101, 'Wachter', 'Roy', 1, '1994-04-29 00:00:00', 'Hägelingasse', '63/1/5', 2000, 'Stockerau', NULL, NULL, '1AKIF'),
(102, 'Widmer', 'Martin', 1, '1990-12-31 00:00:00', 'Troststraße', '1A', 2301, 'Groß Enzersdorf', NULL, NULL, '1AKIF'),
(103, 'Aksu', 'Eren', 1, '1998-02-06 00:00:00', 'Seibahng.', '56/7', 1050, 'Wien', NULL, NULL, '1BAIF'),
(104, 'Dobler', 'Michael', 1, '1997-05-09 00:00:00', 'Mitterweg', '53', 1070, 'Wien', NULL, NULL, '1BAIF'),
(105, 'Dulic', 'Salih', 1, '1998-07-13 00:00:00', 'Stollgasse', '32/6/16', 9125, 'Kühnsdorf', NULL, NULL, '1BAIF'),
(106, 'Fiedler', 'Benjamin', 1, '1995-02-19 00:00:00', 'Gerstnerstraße', '41', 1050, 'Wien', NULL, NULL, '1BAIF'),
(107, 'Güler', 'Serhat', 1, '1998-03-13 00:00:00', 'Unter d. Kirche', '105', 1020, 'Wien', NULL, NULL, '1BAIF'),
(108, 'Güren', 'Seyid', 1, '1998-03-30 00:00:00', 'Burggasse', '5/17/6', 1120, 'Wien', NULL, NULL, '1BAIF'),
(109, 'Hampejs', 'Benedikt', 1, '1998-04-14 00:00:00', 'Westbahnstraße', '11/9', 1070, 'Wien', NULL, NULL, '1BAIF'),
(110, 'Hofschneider', 'Tobias', 1, '1998-01-28 00:00:00', 'Römerweg', '13/14/2', 2534, 'Alland', NULL, NULL, '1BAIF'),
(111, 'Innfeld', 'Bastian', 1, '1998-11-02 00:00:00', 'Kempelengasse', '3/4/6', 1070, 'Wien', NULL, NULL, '1BAIF'),
(112, 'Karakus', 'Mahmut', 1, '1997-02-22 00:00:00', 'Hauptstr.', '166/5A', 1220, 'Wien', NULL, NULL, '1BAIF'),
(113, 'Mehmedovic', 'Mersid', 1, '1998-10-26 00:00:00', 'Vorgartenstraße', '54/14', 1160, 'Wien', NULL, NULL, '1BAIF'),
(114, 'Nagi', 'Mohamed', 1, '1998-11-08 00:00:00', 'Meiselstraße', '6/9', 3003, 'Gablitz', NULL, NULL, '1BAIF'),
(115, 'Pilz', 'Florian', 1, '1997-03-30 00:00:00', 'Lindenstraße', '2', 3270, 'Scheibbs', NULL, NULL, '1BAIF'),
(116, 'Priesch', 'Maximilian', 1, '1997-09-30 00:00:00', 'Senfg.', '29/41', 1235, 'Wien', NULL, NULL, '1BAIF'),
(117, 'Selimovic', 'Aldin', 1, '1995-06-19 00:00:00', 'Wilhelminenstraße', '36/1A/57', 1150, 'Wien', NULL, NULL, '1BAIF'),
(118, 'Shafique', 'Mehran', 1, '1996-03-14 00:00:00', 'Possingergasse', '166/5A', 1130, 'Wien', NULL, NULL, '1BAIF'),
(119, 'Stojanovic', 'Daniel', 1, '1999-01-19 00:00:00', 'Langeg.', '15', 3441, 'Freundorf', NULL, NULL, '1BAIF'),
(120, 'Strasser', 'Thomas', 1, '1997-05-01 00:00:00', 'Albertgasse', '40', 3464, 'Goldgeben', NULL, NULL, '1BAIF'),
(121, 'Stuck', 'Fabian', 1, '1995-06-08 00:00:00', 'Otto Probst Platz', '32/1/2', 1120, 'Wien', NULL, NULL, '1BAIF'),
(122, 'Topcu', 'Emre', 1, '1997-04-18 00:00:00', 'Hauffg.', '18', 1110, 'Wien', NULL, NULL, '1BAIF'),
(123, 'Zeinzinger', 'Sebastian', 1, '1997-03-21 00:00:00', 'Favoritenstraße', '21', 2351, 'Wiener Neudorf', NULL, NULL, '1BAIF'),
(124, 'Brahmi', 'Junus', 1, '1994-06-26 00:00:00', 'Preßb. Reichsstr.', '1/10', 1160, 'Wien', NULL, NULL, '1BBIF'),
(125, 'Brunnthaler', 'Herwig', 1, '1990-10-02 00:00:00', 'Moosgasse', '101/1/30', 1150, 'Wien', NULL, NULL, '1BBIF'),
(126, 'Demirovic', 'David', 1, '1999-02-22 00:00:00', 'Schönbrunner Straße', '30/6/24', 1230, 'Wien', NULL, NULL, '1BBIF'),
(127, 'Fellner', 'Anita', 2, '1996-03-09 00:00:00', 'Hellwagstraße', '68/57/14', 3160, 'Traisen', NULL, NULL, '1BBIF'),
(128, 'Gradkowski', 'David', 1, '1996-06-26 00:00:00', 'Custozzag.', '2/6', 1050, 'Wien', NULL, NULL, '1BBIF'),
(129, 'Gülcehre', 'Cihan', 1, '1987-03-06 00:00:00', 'Th. Körnerstr.', '6/3/12', 3021, 'Pressbaum', NULL, NULL, '1BBIF'),
(130, 'Gülcehre', 'Dominik', 1, '1990-11-25 00:00:00', 'Lindengasse', '13/13', 1200, 'Wien', NULL, NULL, '1BBIF'),
(131, 'Hackl', 'David', 1, '1987-12-31 00:00:00', 'Unt. Weissgerberstr.', '31E', 1190, 'Wien', NULL, NULL, '1BBIF'),
(132, 'Haschka', 'Gerhard', 1, '1992-02-17 00:00:00', 'Bindergasse', '30', 1100, 'Wien', NULL, NULL, '1BBIF'),
(133, 'Hawa', 'Fadi', 1, '1993-09-30 00:00:00', 'Schwenkgasse', '378', 1100, 'Wien', NULL, NULL, '1BBIF'),
(134, 'Illmayer', 'David', 1, '1991-06-13 00:00:00', 'Halirschgasse', '160-162/2/13', 2274, 'Rabensburg', NULL, NULL, '1BBIF'),
(135, 'Kocher', 'Mario', 1, '1987-03-31 00:00:00', 'Vogtgasse', '19/15', 1190, 'Wien', NULL, NULL, '1BBIF'),
(136, 'Loshaj', 'Jetmir', 1, '1995-03-25 00:00:00', 'Laxenburgerstr.', '42', 7203, 'Wiesen', NULL, NULL, '1BBIF'),
(137, 'Mailaram', 'Rahul', 1, '1997-04-22 00:00:00', 'Kaserenenstr.', '30', 1170, 'Wien', NULL, NULL, '1BBIF'),
(138, 'Nar', 'Taylan Berk', 1, '1995-05-15 00:00:00', 'Einfahrtstr.', '7', 1140, 'Wien', NULL, NULL, '1BBIF'),
(139, 'Scheibenpflug', 'Thomas', 1, '1989-12-20 00:00:00', 'Lindenstraße', '78/26', 1200, 'Wien', NULL, NULL, '1BBIF'),
(140, 'Sperlic', 'Denis', 1, '1997-03-20 00:00:00', 'Schwaigerg.', '44', 1080, 'Wien', NULL, NULL, '1BBIF'),
(141, 'Sreckovic', 'Tamara', 2, '1992-05-06 00:00:00', 'Mitterbergg.', '5/1/21', 1030, 'Wien', NULL, NULL, '1BBIF'),
(142, 'Stich', 'Florian', 1, '1984-09-15 00:00:00', 'Görtschach', '135/5/2', 1090, 'Wien', NULL, NULL, '1BBIF'),
(143, 'Stuck', 'Fabian', 1, '1995-08-19 00:00:00', 'Felberstr.', '3/9', 1060, 'Wien', NULL, NULL, '1BBIF'),
(144, 'Trinkl', 'Gerald', 1, '1981-10-30 00:00:00', 'Lerchenfelderstr.', '16/11', 2832, 'Thernberg', NULL, NULL, '1BBIF'),
(145, 'Ayvaz', 'Havva', 2, '2002-06-26 00:00:00', 'Scholzg.', '8/27', 1220, 'Wien', NULL, NULL, '1BHBGM'),
(146, 'Bakii', 'Suhejla', 2, '2002-02-25 00:00:00', 'trogergasse', '256/2/6', 8662, 'Mitterdorf', NULL, NULL, '1BHBGM'),
(147, 'Balas', 'Florian', 1, '2001-10-10 00:00:00', 'Ruprechtshofen', '34', 6691, 'Jungholz', NULL, NULL, '1BHBGM'),
(148, 'Bonard', 'Florian', 1, '2001-04-17 00:00:00', 'Fenzlgasse', '6/2', 1040, 'Wien', NULL, NULL, '1BHBGM'),
(149, 'Cadek', 'Kevin', 1, '2001-03-25 00:00:00', 'Koschakergasse', '178/6', 1120, 'Wien', NULL, NULL, '1BHBGM'),
(150, 'Czerny', 'Amina', 2, '2000-10-21 00:00:00', 'Königsbühelstr.', '4/1/7', 3003, 'Gablitz', NULL, NULL, '1BHBGM'),
(151, 'Dadaschova', 'Gönce', 2, '2002-04-17 00:00:00', 'Ruefenfeldweg', '26/15', 1140, 'Wien', NULL, NULL, '1BHBGM'),
(152, 'Echsel', 'Kando', 2, '2002-12-29 00:00:00', 'Krötzlergasse', '1-3/3/T9', 1210, 'Wien', NULL, NULL, '1BHBGM'),
(153, 'Elshazly', 'Salma', 2, '2003-02-15 00:00:00', 'Am Schöpfwerk', '22', 2700, 'Wr. Neustadt', NULL, NULL, '1BHBGM'),
(154, 'Fuhrer', 'Elias', 1, '2000-10-12 00:00:00', 'Reisenbauer-Ring', '68-70/4/25', 1100, 'Wien', NULL, NULL, '1BHBGM'),
(155, 'Hassan', 'Nabil', 1, '2001-12-16 00:00:00', 'Loquaiplatz', '15', 1210, 'Wien', NULL, NULL, '1BHBGM'),
(156, 'Kenan', 'Melisa', 2, '2001-05-16 00:00:00', 'Hütteldorferstr.', '18/19', 2351, 'Wiener Neudorf', NULL, NULL, '1BHBGM'),
(157, 'Kovar', 'Madeleine', 2, '2001-09-30 00:00:00', 'Hetzendorferstr.', '35-37/33/3', 2353, 'Guntramsdorf', NULL, NULL, '1BHBGM'),
(158, 'Krejci', 'Daniela', 2, '2002-09-03 00:00:00', 'A. Baumgartnerstr.', '87 A', 2285, 'Leopoldsdorf', NULL, NULL, '1BHBGM'),
(159, 'Mengen', 'Berat', 1, '2002-08-10 00:00:00', 'Stachegasse', '30/7/11', 1150, 'Wien', NULL, NULL, '1BHBGM'),
(160, 'Milovanovic', 'Marko', 1, '2001-04-01 00:00:00', 'Am Hundsturm', '36/2a/46', 1070, 'Wien', NULL, NULL, '1BHBGM'),
(161, 'Nelson', 'Celina', 2, '2001-05-20 00:00:00', 'Pazmanitengasse', '4-12/3/3', 1160, 'Wien', NULL, NULL, '1BHBGM'),
(162, 'Nemeth', 'Laszlo', 1, '1999-07-24 00:00:00', 'Mitisg.', '68', 8343, 'Trautmannsdorf', NULL, NULL, '1BHBGM'),
(163, 'Passauer', 'Paul', 1, '2003-01-20 00:00:00', 'Gentzgasse', '19/3/6', 1030, 'Wien', NULL, NULL, '1BHBGM'),
(164, 'Pilar', 'Alexander', 1, '1999-09-26 00:00:00', 'Hauslabgasse', '26', 1150, 'Wien', NULL, NULL, '1BHBGM'),
(165, 'Rössler', 'Patrick', 1, '2002-05-02 00:00:00', 'Schillerstraße', '24/15', 1040, 'Wien', NULL, NULL, '1BHBGM'),
(166, 'Sedlacek', 'Andreas', 1, '2001-07-24 00:00:00', 'Hormayrgasse', '14/7', 1230, 'Wien', NULL, NULL, '1BHBGM'),
(167, 'Springer', 'Felix', 1, '2001-09-07 00:00:00', 'Hohenbergstraße', '6', 1190, 'Wien', NULL, NULL, '1BHBGM'),
(168, 'Tokic', 'Lara', 2, '2002-03-05 00:00:00', 'Effingerg.', '33/3', 2542, 'Kottingbrunn', NULL, NULL, '1BHBGM'),
(169, 'Urtz', 'Paul', 1, '2002-06-23 00:00:00', 'Eduard-Klingerstrasse', '4/1/7', 1050, 'Wien', NULL, NULL, '1BHBGM'),
(170, 'Wallner', 'Tristan', 1, '2001-08-23 00:00:00', 'Ziegelhofstrasse', '22', 1010, 'Wien', NULL, NULL, '1BHBGM'),
(171, 'Walz', 'Lenard', 1, '2001-09-22 00:00:00', 'Baumgartenstraße', '5/1', 1140, 'Wien', NULL, NULL, '1BHBGM'),
(172, 'Zaghbib', 'Meriem', 2, '2002-11-05 00:00:00', 'Panikeng.', '4/2/16', 1060, 'Wien', NULL, NULL, '1BHBGM'),
(173, 'Zawislak', 'Konrad', 1, '2002-01-07 00:00:00', 'Langsulzgasse', '41/2/7', 1090, 'Wien', NULL, NULL, '1BHBGM'),
(174, 'Zilic', 'Amar', 1, '2001-03-08 00:00:00', 'Degengasse', '3/4', 1140, 'Wien', NULL, NULL, '1BHBGM'),
(175, 'Zivanovic', 'Katarina', 2, '2002-02-01 00:00:00', 'Ameisg.', '18', 1200, 'Wien', NULL, NULL, '1BHBGM'),
(176, 'Zmeck', 'Jasmin', 2, '2002-01-03 00:00:00', 'Weissgerberlände', '29', 1210, 'Wien', NULL, NULL, '1BHBGM'),
(177, 'Anic', 'Tomislav', 1, '1995-04-18 00:00:00', 'Smolag.', '8/53', 1130, 'Wien', NULL, NULL, '1CBIF'),
(178, 'Ataee', 'Hossein', 1, '1993-08-26 00:00:00', 'Engerthstr.', '64', 1100, 'Wien', NULL, NULL, '1CBIF'),
(179, 'Chaziew', 'Amirchan', 1, '1988-05-25 00:00:00', 'Pötzleinsdorfer Höhe', '32/3/69', 1120, 'Wien', NULL, NULL, '1CBIF'),
(180, 'Dibl', 'Nikolaus', 1, '1978-05-30 00:00:00', 'Inzersdorfer Straße', '1/2/7', 1020, 'Wien', NULL, NULL, '1CBIF'),
(181, 'Eder', 'Ralph', 1, '1996-05-16 00:00:00', 'Krötzlergasse', '67/16', 3580, 'Horn', NULL, NULL, '1CBIF'),
(182, 'Gschwandtner', 'Michael', 1, '1981-02-23 00:00:00', 'Heinrich-Lefler-Gasse', '9/5/6', 1120, 'Wien', NULL, NULL, '1CBIF'),
(183, 'Hammer', 'Michael', 1, '1990-03-14 00:00:00', 'Schönbrunnerstr.', '10/2/3', 1030, 'Wien', NULL, NULL, '1CBIF'),
(184, 'Hölbling', 'Andreas', 1, '1997-01-16 00:00:00', 'Krötzlergasse', '35/5/4', 1120, 'Wien', NULL, NULL, '1CBIF'),
(185, 'Kattinger', 'Catrin', 2, '1991-09-21 00:00:00', 'Schallergasse', '4/1/14', 1020, 'Wien', NULL, NULL, '1CBIF'),
(186, 'Kikic', 'Kristijan', 1, '1987-05-17 00:00:00', 'Großmürbisch', '39', 1030, 'Wien', NULL, NULL, '1CBIF'),
(187, 'Mahler', 'Dominik', 1, '1988-06-13 00:00:00', 'Simoningplatz', '360/1/10', 1110, 'Wien', NULL, NULL, '1CBIF'),
(188, 'Mekh', 'Dmytro', 1, '1987-08-11 00:00:00', 'Fl. Hedorferstr.', '18', 1180, 'Wien', NULL, NULL, '1CBIF'),
(189, 'Moser', 'Maximilian', 1, '1997-04-06 00:00:00', 'Lindengasse', '15', 1140, 'Wien', NULL, NULL, '1CBIF'),
(190, 'Neidhart', 'Christian', 1, '1991-08-07 00:00:00', 'Ospelgasse', '7/2/9', 1120, 'Wien', NULL, NULL, '1CBIF'),
(191, 'Oberenzer', 'Roman', 1, '1982-06-17 00:00:00', 'Otto Probststr.', '3/60', 1200, 'Wien', NULL, NULL, '1CBIF'),
(192, 'Pelz', 'Denis', 1, '1997-07-11 00:00:00', 'Wiethestraße', '29/41', 1200, 'Wien', NULL, NULL, '1CBIF'),
(193, 'Raberger', 'Fabian', 1, '1998-05-30 00:00:00', 'Paulusgasse', '4-18/10/9', 1130, 'Wien', NULL, NULL, '1CBIF'),
(194, 'Ramenda', 'Kamil', 1, '1997-05-18 00:00:00', 'Anton Baumgartnerstr.', '18/9-10', 1140, 'Wien', NULL, NULL, '1CBIF'),
(195, 'Rasic', 'Jovana', 2, '1997-10-28 00:00:00', 'Am Fuchsenfeld', '110', 1190, 'Wien', NULL, NULL, '1CBIF'),
(196, 'Sedra', 'Abraham', 1, '1996-07-31 00:00:00', 'Salzbergstr.', '231', 1190, 'Wien', NULL, NULL, '1CBIF'),
(197, 'Stancov', 'Deonisie', 1, '1993-06-11 00:00:00', 'Alseggerstr.', '22', 1200, 'Wien', NULL, NULL, '1CBIF'),
(198, 'Tangwena', 'Leeroy Mike', 1, '1998-03-08 00:00:00', 'Hornmayerg.', '82/4', 1210, 'Wien', NULL, NULL, '1CBIF'),
(199, 'Tousios', 'Thomas', 1, '1997-06-03 00:00:00', 'Schwenderg.', '10/3/12', 1040, 'Wien', NULL, NULL, '1CBIF'),
(200, 'Acimovac', 'Dejan', 1, '2000-02-25 00:00:00', 'Gumpendorferstraße', '35-37/33/3', 2454, 'Trautmannsdorf', NULL, NULL, '2AFID'),
(201, 'Arapoglu', 'Ali', 1, '1999-02-05 00:00:00', 'Pyhra', '10', 1130, 'Wien', NULL, NULL, '2AFID'),
(202, 'Bader', 'Alexander', 1, '1998-11-25 00:00:00', 'Großmürbisch', '40/1/6', 1160, 'Wien', NULL, NULL, '2AFID'),
(203, 'Balazi', 'Gentian', 1, '1999-12-22 00:00:00', 'Semperstr.', '102/RH2', 1060, 'Wien', NULL, NULL, '2AFID'),
(204, 'Bilalic', 'Aldin', 1, '2001-03-22 00:00:00', 'Wiethestraße', '291/1/1', 1150, 'Wien', NULL, NULL, '2AFID'),
(205, 'Cervenka', 'Johann', 1, '2000-06-29 00:00:00', 'Bahnstraße', '128', 4407, 'Dietach', NULL, NULL, '2AFID'),
(206, 'Czopak', 'Stefan', 1, '2001-10-20 00:00:00', 'Hardtmuthg.', '1/13', 3422, 'Greifenstein a.d. Donau', NULL, NULL, '2AFID'),
(207, 'Dragomirov', 'Kevin', 1, '2000-07-12 00:00:00', 'Stauraczg.', '13/19', 1050, 'Wien', NULL, NULL, '2AFID'),
(208, 'Dulagan', 'Reynandy', 1, '1999-12-15 00:00:00', 'Strausseng.', '71/1/1', 1130, 'Wien', NULL, NULL, '2AFID'),
(209, 'Grumeth', 'Kevin', 1, '1999-08-01 00:00:00', 'Am Fuchsenfeld', '267/3/16', 1120, 'Wien', NULL, NULL, '2AFID'),
(210, 'Imamovic', 'Edin', 1, '2002-04-12 00:00:00', 'Grinzinger Straße', '4', 1110, 'Wien', NULL, NULL, '2AFID'),
(211, 'Karaca', 'Kaan', 1, '1999-06-16 00:00:00', 'Hudlergasse', '57/2', 3002, 'Purkersdorf', NULL, NULL, '2AFID'),
(212, 'Knezevic', 'Patrick', 1, '1999-12-23 00:00:00', 'Weldengasse', '20', 1020, 'Wien', NULL, NULL, '2AFID'),
(213, 'Kolar', 'Sven', 1, '1998-06-30 00:00:00', 'Schickg.', '15', 1010, 'Wien', NULL, NULL, '2AFID'),
(214, 'Kufner', 'Philipp', 1, '2000-11-06 00:00:00', 'Werkbachg.', '140/1/10', 1100, 'Wien', NULL, NULL, '2AFID'),
(215, 'Loshaj', 'Shqipdon', 1, '1998-01-10 00:00:00', 'Humboldtpl.', '4/17', 1100, 'Wien', NULL, NULL, '2AFID'),
(216, 'Magomadov', 'Chamsat', 1, '1998-03-13 00:00:00', 'Handelskai', '2/2/2/3', 7121, 'Weiden am See', NULL, NULL, '2AFID'),
(217, 'Mansour', 'Ashraf', 1, '1998-10-31 00:00:00', 'Senfg.', '37', 1130, 'Wien', NULL, NULL, '2AFID'),
(218, 'Percsy', 'Pascal', 1, '1997-09-11 00:00:00', 'Enenkelstraße', '12/17', 1230, 'Wien', NULL, NULL, '2AFID'),
(219, 'Petrovic', 'Alexander', 1, '2001-02-02 00:00:00', 'Landstr. Hauptstr.', '10', 1230, 'wien', NULL, NULL, '2AFID'),
(220, 'Radisic', 'Stefan', 1, '2000-01-31 00:00:00', 'Tullnerstr.', '13/13', 1100, 'Wien', NULL, NULL, '2AFID'),
(221, 'Rischawy', 'Thomas', 1, '1999-09-10 00:00:00', 'Bobiesg.', '67/5/1/4', 1070, 'Wien', NULL, NULL, '2AFID'),
(222, 'Roth', 'Felix', 1, '1999-03-06 00:00:00', 'Halirschgasse', '14', 1130, 'Wien', NULL, NULL, '2AFID'),
(223, 'Röttig', 'Matthias', 1, '2001-08-28 00:00:00', 'Egon-Schiele-Gasse', '42/3/17', 1020, 'Wien', NULL, NULL, '2AFID'),
(224, 'Schmidt', 'Lorenz', 1, '1998-01-09 00:00:00', 'Breitenseerstraße', '3/3', 4061, 'Pasching', NULL, NULL, '2AFID'),
(225, 'Schönbauer', 'Julian', 1, '1999-04-14 00:00:00', 'Karl v. Böhmerleg.', '10/2/3', 1150, 'Wien', NULL, NULL, '2AFID'),
(226, 'Sharma', 'Anant', 1, '2001-09-02 00:00:00', '1090 Wien,Bachgasse 1-7/7/2/9', '9/9/5/4', 1100, 'Wien', NULL, NULL, '2AFID'),
(227, 'Sieberer', 'Dominik', 1, '2000-09-06 00:00:00', 'Marschallplatz', '10', 3160, 'Traisen', NULL, NULL, '2AFID'),
(228, 'Singh', 'Arvinder', 1, '2000-03-31 00:00:00', 'Ziegelhofstrasse', '353', 1140, 'Wien', NULL, NULL, '2AFID'),
(229, 'Taskiran', 'Enes', 1, '1999-09-23 00:00:00', 'Hauptstr.', '75', 2462, 'Wilfleinsdorf', NULL, NULL, '2AFID'),
(230, 'Wally', 'Florian', 1, '2001-11-26 00:00:00', 'Günserstraße', '41/5', 1220, 'Wien', NULL, NULL, '2AFID'),
(231, 'Wieselthaler', 'Paul', 1, '1999-10-30 00:00:00', 'Zeinlhoferg.', '23/4/45', 1150, 'Wien', NULL, NULL, '2AFID'),
(232, 'Wimmer', 'Christian', 1, '2000-07-29 00:00:00', 'Salzachstraße', '21', 1110, 'Wien', NULL, NULL, '2AFID'),
(233, 'Amari', 'Seif', 1, '2000-07-25 00:00:00', 'Engerthstraße', '174/22', 1210, 'Wien', NULL, NULL, '2AHBGM'),
(234, 'Andjelkovic', 'Ivan', 1, '2001-11-25 00:00:00', 'Seitenbergerg.', '384/2/16', 1110, 'Wien', NULL, NULL, '2AHBGM'),
(235, 'Basha', 'Nesrin', 2, '2001-12-28 00:00:00', 'Seitweg', '14', 1170, 'Wien', NULL, NULL, '2AHBGM'),
(236, 'Capek', 'Noah', 1, '2000-10-12 00:00:00', 'Apfelrosenweg', '3/60', 1200, 'Wien', NULL, NULL, '2AHBGM'),
(237, 'Dostal', 'Marcus', 1, '2000-10-14 00:00:00', 'Graumanng', '19/34', 1235, 'Wien', NULL, NULL, '2AHBGM'),
(238, 'Fittel', 'Florian', 1, '2000-04-16 00:00:00', 'Felbigergasse', '5/2/13', 7121, 'Weiden am See', NULL, NULL, '2AHBGM'),
(239, 'Grabner', 'Lukas', 1, '2000-08-25 00:00:00', 'Herzmansky Orlandog.', '3', 3945, 'Nondorf', NULL, NULL, '2AHBGM'),
(240, 'Habiger', 'Silvan', 1, '2001-01-11 00:00:00', 'Hallensteingasse', '19-21/4/8', 1100, 'Wien', NULL, NULL, '2AHBGM'),
(241, 'Hajdarbegovic', 'Eldar', 1, '2000-11-03 00:00:00', 'Arnezhoferstraße', '7/3/18', 2514, 'Traiskirchen', NULL, NULL, '2AHBGM'),
(242, 'Jin', 'Bo-Ou', 1, '1996-09-24 00:00:00', 'Krötzlergasse', '178/6', 3671, 'Marbach', NULL, NULL, '2AHBGM'),
(243, 'Jirout', 'Cheyenne', 2, '2001-04-07 00:00:00', 'Oberhautzental', '10/3/12', 1060, 'Wien', NULL, NULL, '2AHBGM'),
(244, 'Kraut', 'Arno', 1, '2000-07-17 00:00:00', 'Schickg.', '129/4/17', 1100, 'Wien', NULL, NULL, '2AHBGM'),
(245, 'Laube', 'Katharina', 2, '2000-09-06 00:00:00', 'Wilhelm-Kressplatz', '29/14', 3500, 'Krems', NULL, NULL, '2AHBGM'),
(246, 'Müller', 'Alfons', 1, '2000-08-14 00:00:00', 'Breitenseerstraße', '9/14', 1150, 'Wien', NULL, NULL, '2AHBGM'),
(247, 'Nikolic', 'Tamara', 2, '2000-09-21 00:00:00', 'Vitiserstraße', '50/RH 10', 1050, 'Wien', NULL, NULL, '2AHBGM'),
(248, 'Özmen', 'Aynur', 2, '2001-02-09 00:00:00', 'Felbigergasse', '51', 2361, 'Laxenburg', NULL, NULL, '2AHBGM'),
(249, 'Saric', 'Sara', 2, '2000-08-19 00:00:00', 'Oeverseestr.', '33/3', 1190, 'Wien', NULL, NULL, '2AHBGM'),
(250, 'Singh', 'Harmanvir', 2, '2001-03-12 00:00:00', 'Hauffg.', '34', 1170, 'Wien', NULL, NULL, '2AHBGM'),
(251, 'Sühs', 'Bastian', 1, '2001-03-28 00:00:00', 'Burggasse', '36/1A/57', 1210, 'Wien', NULL, NULL, '2AHBGM'),
(252, 'Trauner', 'Mathew', 1, '2002-03-14 00:00:00', 'Salzachstraße', '25', 1150, 'Wien', NULL, NULL, '2AHBGM'),
(253, 'Wenty', 'Elia', 1, '2000-10-21 00:00:00', 'Linzer Straße', '97/3/11', 1080, 'Wien', NULL, NULL, '2AHBGM'),
(254, 'Akcay', 'Batuhan', 1, '2001-04-01 00:00:00', 'Obere Amtshausgasse', '4/7', 1050, 'Wien', NULL, NULL, '2AHIF'),
(255, 'Batinic', 'Kristian', 1, '2000-11-11 00:00:00', 'Troststraße', '56A', 1100, 'Wien', NULL, NULL, '2AHIF'),
(256, 'Bauer', 'Johannes', 1, '2001-07-17 00:00:00', 'Schöngraberngasse', '2/23/6', 7032, 'Sigless', NULL, NULL, '2AHIF'),
(257, 'Demski', 'Jonas', 1, '2001-04-07 00:00:00', 'Ferdinand Käs-Gasse', '82/4', 1210, 'Wien', NULL, NULL, '2AHIF'),
(258, 'Gager', 'Michael', 1, '2000-05-14 00:00:00', 'Cumberlandstr.', '43', 1230, 'Wien', NULL, NULL, '2AHIF'),
(259, 'Gegic', 'Ensar', 1, '2000-08-11 00:00:00', 'Schönbrunner Allee', '3/10/11', 1170, 'Wien', NULL, NULL, '2AHIF'),
(260, 'Horn', 'Andreas', 1, '2000-12-11 00:00:00', 'Schuppengasse', '56/3', 8184, 'Anger', NULL, NULL, '2AHIF'),
(261, 'Jäger', 'Leopold', 1, '1999-08-16 00:00:00', 'Keferg.', '8/2/3/25', 2564, 'Furth', NULL, NULL, '2AHIF'),
(262, 'Kumar', 'Arjun', 1, '1999-12-01 00:00:00', 'Steindorf', '61/1/17', 2454, 'Trautmannsdorf', NULL, NULL, '2AHIF'),
(263, 'Lehn', 'Gilbert', 1, '1999-10-29 00:00:00', 'Eslarngasse', '140/4', 1130, 'Wien', NULL, NULL, '2AHIF'),
(264, 'Milkovits', 'Constantin', 1, '2000-11-09 00:00:00', 'Adalbert Stifter Straße', '4', 1230, 'Wien', NULL, NULL, '2AHIF'),
(265, 'Müllauer', 'Leonhard', 1, '2000-08-23 00:00:00', 'Kempelengasse', '3', 1020, 'Wien', NULL, NULL, '2AHIF'),
(266, 'Mystek', 'Jakub', 1, '2001-04-18 00:00:00', 'Engerthstr.', '32/3/69', 1030, 'Wien', NULL, NULL, '2AHIF'),
(267, 'Pellkvist', 'Tobias', 1, '2001-04-03 00:00:00', 'Hardegg.', '5/1', 2346, 'Südstadt', NULL, NULL, '2AHIF'),
(268, 'Pistor', 'Nadine', 2, '2000-11-20 00:00:00', 'Triftg.', '25/16/30', 1050, 'Wien', NULL, NULL, '2AHIF'),
(269, 'Pöchleitner', 'Thomas', 1, '2000-09-17 00:00:00', 'Jedlersdorferstr.', '51/1/14', 1150, 'Wien', NULL, NULL, '2AHIF'),
(270, 'Pucher', 'Fabian', 1, '2001-04-03 00:00:00', 'Hustergasse', '36/1A/57', 1120, 'Wien', NULL, NULL, '2AHIF'),
(271, 'Pufler', 'Julian', 1, '2001-10-31 00:00:00', 'Meranerstr.', '16/3/24', 1220, 'Wien', NULL, NULL, '2AHIF'),
(272, 'Sallmann', 'Alexander', 1, '2000-05-25 00:00:00', 'Breitenseerstraße', '30/6/24', 1140, 'Wien', NULL, NULL, '2AHIF'),
(273, 'Schöbel', 'Marc', 1, '2000-10-28 00:00:00', 'Schöpfergasse', '72A/3/1', 1040, 'Wien', NULL, NULL, '2AHIF'),
(274, 'Schulze', 'Daniel', 1, '1999-10-04 00:00:00', 'Rechte Wienzeile', '3/1/24', 3425, 'Langenlebarn', NULL, NULL, '2AHIF'),
(275, 'Schwarz', 'Mathias', 1, '1999-10-24 00:00:00', 'Lerchenfelderstr.', '87 A', 3580, 'Horn', NULL, NULL, '2AHIF'),
(276, 'Tinhofer', 'David', 1, '2002-04-22 00:00:00', 'Breitenfurterstraße', '9/5/6', 1050, 'Wien', NULL, NULL, '2AHIF'),
(277, 'Unfried', 'Stefan', 1, '1999-04-27 00:00:00', 'Otto Probststr.', '97/3/11', 1140, 'Wien', NULL, NULL, '2AHIF'),
(278, 'Vercimak', 'Daniel', 1, '2001-03-14 00:00:00', 'Ant. BaumG.-Straße', '6/9', 3100, 'St. Pölten', NULL, NULL, '2AHIF'),
(279, 'Wagenleitner', 'Thutthep', 1, '1997-10-18 00:00:00', 'Meiszauerg.', '18 A/1/28', 2380, 'Perchtoldsdorf', NULL, NULL, '2AHIF'),
(280, 'Yilmaz', 'Thomas', 1, '2000-07-25 00:00:00', 'Goldschlagstr.', '36/2a/46', 1230, 'Wien', NULL, NULL, '2AHIF'),
(281, 'Ziegler', 'Fiona', 2, '2000-05-19 00:00:00', 'Talgasse', '31/27', 2320, 'Schwechat-Mannswörth', NULL, NULL, '2AHIF'),
(282, 'Apostol', 'Nico', 1, '2001-05-07 00:00:00', 'Zentagasse', '19/15', 1150, 'Wien', NULL, NULL, '2BHBGM'),
(283, 'Balint', 'Mihai-Gabriel', 1, '2000-12-08 00:00:00', 'Hietzinger Hauptstr.', '53', 1130, 'Wien', NULL, NULL, '2BHBGM'),
(284, 'Belzar', 'Jakub', 1, '2001-03-30 00:00:00', 'Schöpfergasse', '4', 1040, 'Wien', NULL, NULL, '2BHBGM'),
(285, 'Ben Mohamed', 'Yassin', 1, '2000-07-08 00:00:00', 'Sportplatzgasse', '32/15', 1220, 'Wien', NULL, NULL, '2BHBGM'),
(286, 'Bogunic', 'Aida', 2, '2000-03-21 00:00:00', 'Malfattig.', '24/22', 1120, 'Wien', NULL, NULL, '2BHBGM'),
(287, 'Burger', 'Leon', 1, '2001-06-03 00:00:00', 'Reinprechtsdorferstr.', '31E', 1060, 'Wien', NULL, NULL, '2BHBGM'),
(288, 'Ecker', 'Katja', 2, '2001-09-30 00:00:00', 'Obere Bahngasse', '439-443/15', 1210, 'Wien', NULL, NULL, '2BHBGM'),
(289, 'Jicha', 'Bernhard', 1, '2000-12-11 00:00:00', 'Wilhelminenstraße', '51/10/1', 1160, 'Wien', NULL, NULL, '2BHBGM'),
(290, 'Kvapil', 'Roman', 1, '2000-03-15 00:00:00', 'Greiseneckergasse', '174-180/12/6', 7100, 'Neusiedl/See', NULL, NULL, '2BHBGM'),
(291, 'Lauppert', 'Moritz', 1, '2001-04-12 00:00:00', 'Fischer v. Erlachg.', '25', 9470, 'St. Paul', NULL, NULL, '2BHBGM'),
(292, 'Lendwai', 'Julian', 1, '2001-05-14 00:00:00', 'Gellertg.', '4/1/7', 1070, 'Wien', NULL, NULL, '2BHBGM'),
(293, 'Müller', 'Vinzenz', 1, '2001-06-04 00:00:00', 'Laaer-Berg-Str.', '24', 1100, 'Wien', NULL, NULL, '2BHBGM'),
(294, 'Peric', 'Patricia', 2, '2001-10-29 00:00:00', 'Winzerstr.', '32/3/69', 1190, 'Wien', NULL, NULL, '2BHBGM'),
(295, 'Petrovic', 'Kristina', 2, '1999-06-19 00:00:00', 'Brunnengasse', '30/1/14', 1050, 'Wien', NULL, NULL, '2BHBGM'),
(296, 'Pöchl', 'Laura', 2, '2000-12-19 00:00:00', 'Schwaigerg.', '1', 1200, 'Wien', NULL, NULL, '2BHBGM'),
(297, 'Rathnayake', 'Randunage Niki', 1, '2001-10-03 00:00:00', 'Karl Adlitzerstr.', '6/20', 3100, 'St. Pölten', NULL, NULL, '2BHBGM'),
(298, 'Sadiki', 'Josephe', 1, '1999-12-19 00:00:00', 'Muhrhoferweg', '69', 1050, 'Wien', NULL, NULL, '2BHBGM'),
(299, 'Schmidt', 'Felicity', 2, '2001-04-26 00:00:00', 'Neubaugasse', '120-122/2/17', 1070, 'Wien', NULL, NULL, '2BHBGM'),
(300, 'Sener', 'Sema Nur', 2, '2000-07-26 00:00:00', 'Maxwaldstraße', '102-112/4/35', 1090, 'Wien', NULL, NULL, '2BHBGM'),
(301, 'Steinböck', 'Daniel', 1, '2001-07-09 00:00:00', 'Breitenseerstraße', '33', 2454, 'Trautmannsdorf', NULL, NULL, '2BHBGM'),
(302, 'Berger', 'Patrick', 1, '2000-09-30 00:00:00', 'Trandorf', '40', 1100, 'Wien', NULL, NULL, '2BHIF'),
(303, 'Brunner', 'Maximilian', 1, '2001-07-08 00:00:00', 'Mitisg.', '358/1/28', 1070, 'Wien', NULL, NULL, '2BHIF'),
(304, 'Bürger', 'Sebastian', 1, '2001-07-15 00:00:00', 'Spielmanng.', '1/1/17', 2242, 'Prottes', NULL, NULL, '2BHIF'),
(305, 'Busch', 'Stefan', 1, '2000-11-22 00:00:00', 'Schanzstr.', '8/14', 1050, 'Wien', NULL, NULL, '2BHIF'),
(306, 'Döppes', 'Benjamin', 1, '2001-05-07 00:00:00', 'Auhofstr.', '13', 1200, 'Wien', NULL, NULL, '2BHIF'),
(307, 'Farmer', 'Stefan', 1, '1998-09-24 00:00:00', 'Anton Baumgartnerstr.', '82/4', 1170, 'Wien', NULL, NULL, '2BHIF'),
(308, 'Furtlehner', 'Tobias', 1, '2002-03-30 00:00:00', 'Quadenstr.', '22', 1150, 'Wien', NULL, NULL, '2BHIF'),
(309, 'Gaber', 'Maximilian', 1, '2001-03-30 00:00:00', 'Ferdinand Käs-Gasse', '4', 1100, 'Wien', NULL, NULL, '2BHIF'),
(310, 'Hintermayer', 'Lucas', 1, '2000-11-01 00:00:00', 'Schlachthausg.', '30', 1130, 'Wien', NULL, NULL, '2BHIF'),
(311, 'Ihl', 'Alexander', 1, '2001-09-03 00:00:00', 'Buchengasse', '125', 1160, 'Wien', NULL, NULL, '2BHIF'),
(312, 'Ivancsics', 'Philipp', 1, '2001-08-27 00:00:00', 'Gellertg.', '17/19/8', 1060, 'Wien', NULL, NULL, '2BHIF'),
(313, 'Kohlbacher', 'Johannes', 1, '2001-05-21 00:00:00', 'Bacherplatz', '24', 1160, 'Wien', NULL, NULL, '2BHIF'),
(314, 'Landauer', 'Nico', 1, '1999-12-18 00:00:00', 'Unterdorf', '40', 2201, 'Gerasdorf', NULL, NULL, '2BHIF'),
(315, 'Lasic', 'Martin', 1, '2001-01-12 00:00:00', 'Apostelgasse', '9/2', 1100, 'Wien', NULL, NULL, '2BHIF'),
(316, 'Lenz', 'David', 1, '2001-07-11 00:00:00', 'Weissgerberlände', '2/6', 1200, 'Wien', NULL, NULL, '2BHIF'),
(317, 'Meltsch', 'Florian', 1, '2000-07-15 00:00:00', 'Alszeile', '4/5', 1120, 'Wien', NULL, NULL, '2BHIF'),
(318, 'Nader', 'Tobias', 1, '2000-09-16 00:00:00', 'Egon-Schiele-Gasse', '13', 1210, 'Wien', NULL, NULL, '2BHIF'),
(319, 'Pejic', 'Marko', 1, '2001-03-29 00:00:00', 'Hietzinger Hauptstraße', '71/1/1', 1120, 'Wien', NULL, NULL, '2BHIF'),
(320, 'Reisenhofer', 'Lukas', 1, '2000-02-15 00:00:00', 'Hohenbergstraße', '397/8', 1200, 'Wien', NULL, NULL, '2BHIF'),
(321, 'Rodler', 'David', 1, '2001-05-08 00:00:00', 'Versorgungsheimstr.', '103/11', 1170, 'Wien', NULL, NULL, '2BHIF'),
(322, 'Schaller', 'Stefan', 1, '2001-04-23 00:00:00', 'Franz Schubertg.', '20', 1210, 'Wien', NULL, NULL, '2BHIF'),
(323, 'Schnepf', 'Bernhard', 1, '2000-03-06 00:00:00', 'In Freybergen', '219/9/2', 1150, 'Wien', NULL, NULL, '2BHIF'),
(324, 'Schreitl', 'Elisha', 1, '2001-04-28 00:00:00', 'Meytensg.', '4/23', 1210, 'Wien', NULL, NULL, '2BHIF'),
(325, 'Solomun', 'Patrick', 1, '1999-12-07 00:00:00', 'Lascyg.', '8/1', 1110, 'Wien', NULL, NULL, '2BHIF'),
(326, 'Weigand', 'Raphael', 1, '2000-12-02 00:00:00', 'Josefineng.', '1/10', 1090, 'Wien', NULL, NULL, '2BHIF'),
(327, 'Wersonig', 'Philip', 1, '2001-03-16 00:00:00', 'Halirschgasse', '17', 1180, 'Wien', NULL, NULL, '2BHIF'),
(328, 'Aune', 'Jan', 1, '2001-04-12 00:00:00', 'Stenografeng.', '13', 2331, 'Vösendorf', NULL, NULL, '2CHIF'),
(329, 'Boranijasevic', 'Ivan', 1, '2000-08-04 00:00:00', 'Rosa Jochmannring', '8', 2500, 'Baden', NULL, NULL, '2CHIF'),
(330, 'Danilovic', 'Daniel', 1, '2000-05-28 00:00:00', 'Amselgasse', '13/14/2', 1150, 'Wien', NULL, NULL, '2CHIF'),
(331, 'Dichtl', 'Lukas', 1, '2001-03-21 00:00:00', 'Hardtmuthg.', '219/9/2', 1210, 'Wien', NULL, NULL, '2CHIF'),
(332, 'Eichhorn', 'Oskar', 1, '2000-06-06 00:00:00', 'Pergerstr.', '2b/14/4', 1100, 'Wien', NULL, NULL, '2CHIF'),
(333, 'Gergelyi', 'Matthias', 1, '1999-04-25 00:00:00', 'Franz-Koci-Straße', '31/1/5', 3002, 'Purkersdorf', NULL, NULL, '2CHIF'),
(334, 'Hofer', 'Florian', 1, '2000-09-19 00:00:00', 'Nußdorferstraße', '1', 1220, 'Wien', NULL, NULL, '2CHIF'),
(335, 'Horinek', 'Florian', 1, '1999-10-26 00:00:00', 'Südhang', '68/57/14', 1110, 'Wien', NULL, NULL, '2CHIF'),
(336, 'Hradil', 'Raphael', 1, '2000-04-17 00:00:00', 'Pramergasse', '34', 7464, 'Althodis', NULL, NULL, '2CHIF'),
(337, 'Kerb', 'Daniel', 1, '1999-05-15 00:00:00', 'Bachstrasse', '26', 1140, 'Wien', NULL, NULL, '2CHIF'),
(338, 'Koozehchian', 'Armin', 1, '2000-04-07 00:00:00', 'Felberstr.', '59/2/2', 2000, 'Stockerau', NULL, NULL, '2CHIF'),
(339, 'Kraft', 'Marius', 1, '2001-10-18 00:00:00', 'Margaretengürtel', '32b', 2620, 'Neunkirchen', NULL, NULL, '2CHIF'),
(340, 'Kuklovszky', 'Benjamin', 1, '2000-01-09 00:00:00', 'Jagdschlossgasse', '6/1/2', 1090, 'Wien', NULL, NULL, '2CHIF'),
(341, 'Lang', 'Kevin', 1, '2001-08-11 00:00:00', 'Neustift', '48/1/12', 1220, 'Wien', NULL, NULL, '2CHIF'),
(342, 'Lucic', 'David', 1, '2000-06-03 00:00:00', 'Schumanngasse', '97/3/11', 1030, 'Wien', NULL, NULL, '2CHIF'),
(343, 'Mladenovic', 'Martin', 1, '2001-07-24 00:00:00', 'Steinbauergasse', '10-12/18', 1020, 'Wien', NULL, NULL, '2CHIF'),
(344, 'Onay', 'Ahmet', 1, '1999-10-07 00:00:00', 'Franz Schubertg.', '25', 7511, 'Kleinbachselten', NULL, NULL, '2CHIF'),
(345, 'Ratzenböck', 'Jakob', 1, '1999-07-26 00:00:00', 'Schleidengasse', '33/9', 1140, 'Wien', NULL, NULL, '2CHIF'),
(346, 'Salifoski', 'Nermin', 1, '2000-12-10 00:00:00', 'Meytensg.', '63', 1050, 'Wien', NULL, NULL, '2CHIF'),
(347, 'Schirrer', 'Sebastian', 1, '2000-10-15 00:00:00', 'Am Schöpfwerk', '2/4/34', 3270, 'Scheibbs', NULL, NULL, '2CHIF'),
(348, 'Spahija', 'Blin', 1, '1999-12-11 00:00:00', 'Habichergasse', '35', 1190, 'Wien', NULL, NULL, '2CHIF'),
(349, 'Stockinger', 'Manuel', 1, '2000-12-31 00:00:00', 'Korbg.', '56', 1040, 'Wien', NULL, NULL, '2CHIF'),
(350, 'Strobl', 'Johannes', 1, '2000-05-15 00:00:00', 'Grinzinger Straße', '26', 1120, 'Wien', NULL, NULL, '2CHIF'),
(351, 'Svoboda', 'Frantisek', 1, '1999-05-25 00:00:00', 'Lawieserstraße', '35', 2361, 'Laxenburg', NULL, NULL, '2CHIF'),
(352, 'Tolan', 'Christopher', 1, '2000-10-06 00:00:00', 'J. Ferschnerstraße', '66/3', 1210, 'Wien', NULL, NULL, '2CHIF'),
(353, 'Uhlenhut', 'Elliott', 1, '2000-11-05 00:00:00', 'In der Haide', '28', 1130, 'Wien', NULL, NULL, '2CHIF'),
(354, 'Winkler', 'Miles', 1, '1999-09-19 00:00:00', 'Zinckgasse', '7/6/1', 2823, 'Pitten', NULL, NULL, '2CHIF'),
(355, 'Znaymer', 'Kevin', 1, '2000-04-24 00:00:00', 'Hippgasse', '8/27', 7464, 'Althodis', NULL, NULL, '2CHIF'),
(356, 'Arslan', 'Boris', 1, '2000-06-19 00:00:00', 'Penzingerstraße', '8/2/2/6', 7152, 'Pamhagen', NULL, NULL, '2DHIF'),
(357, 'Balukcic', 'Josip', 1, '2000-01-17 00:00:00', 'Hauptstr.', '75/3/15', 1030, 'Wien', NULL, NULL, '2DHIF'),
(358, 'Breunig', 'Felix', 1, '2000-01-19 00:00:00', 'Penzingerstraße', '5/3', 1020, 'Wien', NULL, NULL, '2DHIF'),
(359, 'Cavic', 'Marko', 1, '2001-03-17 00:00:00', 'Hütteldorferstr.', '40/1/13', 1150, 'Wien', NULL, NULL, '2DHIF'),
(360, 'Cobo', 'Benjamin', 1, '2000-10-13 00:00:00', 'Arnezhoferstraße', '46/5/5', 1150, 'Wien', NULL, NULL, '2DHIF'),
(361, 'Cosic', 'Benjamin', 1, '2000-03-09 00:00:00', 'Simmeringer Hauptstr.', '83-97/11/19', 1030, 'Wien', NULL, NULL, '2DHIF'),
(362, 'Größ', 'Michael', 1, '2001-07-14 00:00:00', 'Mitterweg', '27/4/67', 1070, 'Wien', NULL, NULL, '2DHIF'),
(363, 'Haas', 'Sebastian', 1, '2000-05-07 00:00:00', 'Girardigasse', '4/5', 1210, 'Wien', NULL, NULL, '2DHIF'),
(364, 'Hieden', 'Laurids', 1, '2000-11-25 00:00:00', 'Stauraczg.', '1/21', 7441, 'Pilgersdorf', NULL, NULL, '2DHIF'),
(365, 'Jansel', 'Franz', 1, '2000-03-18 00:00:00', 'Bacherplatz', '4b', 3741, 'Pulkau', NULL, NULL, '2DHIF'),
(366, 'Kaiser', 'Samuel', 1, '2001-03-19 00:00:00', 'Fernkorng.', '20', 2103, 'Langenzersdorf', NULL, NULL, '2DHIF'),
(367, 'Kormann', 'Stefan', 1, '2001-04-07 00:00:00', 'Wendstattg.', '43', 1020, 'Wien', NULL, NULL, '2DHIF'),
(368, 'Kos', 'Stefan', 1, '2001-05-16 00:00:00', 'Dr.Shariatistraße Simorg', '16/3/24', 1020, 'Wien', NULL, NULL, '2DHIF'),
(369, 'Kraj', 'Sebastian', 1, '2001-03-15 00:00:00', 'Herndlg.', '72A/3/1', 1100, 'Wien', NULL, NULL, '2DHIF'),
(370, 'Kurz', 'Lorin', 1, '2001-05-10 00:00:00', 'Fleischmanng.', '2', 8230, 'Hartberg', NULL, NULL, '2DHIF'),
(371, 'Luick', 'Timo', 1, '2001-10-07 00:00:00', 'Rotenhofg.', '60', 3400, 'Klosterneuburg', NULL, NULL, '2DHIF'),
(372, 'Mader', 'Daniel', 1, '2000-04-25 00:00:00', 'Marktgasse', '74', 2380, 'Perchtoldsdorf', NULL, NULL, '2DHIF'),
(373, 'Mavraj', 'Granit', 1, '2001-01-05 00:00:00', 'Kierlingerstraße', '44/A4/33', 1200, 'Wien', NULL, NULL, '2DHIF'),
(374, 'Nossal', 'Dominik', 1, '2001-04-12 00:00:00', 'Keinergasse', '34/14/20', 1160, 'Wien', NULL, NULL, '2DHIF'),
(375, 'Polakowski', 'Kamil', 1, '2000-09-18 00:00:00', 'Vorgartenstraße', '119/2/2', 1200, 'Wien', NULL, NULL, '2DHIF'),
(376, 'Salaam', 'Marvin', 1, '2001-02-06 00:00:00', 'Breitenfurterstr.', '240/1/3', 1050, 'Wien', NULL, NULL, '2DHIF'),
(377, 'Schneider', 'Alexander', 1, '2001-05-03 00:00:00', 'Herzmansky Orlandog.', '63', 2301, 'Großenzersdorf', NULL, NULL, '2DHIF'),
(378, 'Stiegler', 'Leon', 1, '2001-08-26 00:00:00', 'Halbgasse', '100', 1234, 'Wien', NULL, NULL, '2DHIF'),
(379, 'Strimitzer', 'Daniel', 1, '2000-06-18 00:00:00', 'Günserstraße', '35-37/33/3', 1150, 'Wien', NULL, NULL, '2DHIF'),
(380, 'Tran', 'Phuc', 1, '2001-11-23 00:00:00', 'Hietzinger Hauptstraße', '25/5/2', 2380, 'Perchtoldsdorf', NULL, NULL, '2DHIF'),
(381, 'Vilimek', 'Stefan', 1, '2001-02-13 00:00:00', 'Steudelg.', '7/2/9', 2361, 'Laxenburg', NULL, NULL, '2DHIF'),
(382, 'Wagner', 'Stefan', 1, '2001-03-19 00:00:00', 'Lindengasse', '53', 1050, 'Wien', NULL, NULL, '2DHIF'),
(383, 'Zeisz', 'Gabriel', 1, '2000-12-03 00:00:00', 'Dornbacherstraße', '392', 1160, 'Wien', NULL, NULL, '2DHIF'),
(384, 'Belegic', 'Asija', 2, '2001-08-09 00:00:00', 'Kenyongasse', '21', 1100, 'Wien', NULL, NULL, '2EHIF'),
(385, 'Buleetwa', 'Kevin', 1, '2001-08-14 00:00:00', 'Eipeldauerstr.', '28/17', 1180, 'Wien', NULL, NULL, '2EHIF'),
(386, 'Deutner', 'Gabriel', 1, '2002-03-04 00:00:00', 'Engerthstraße', '6/3/7', 3701, 'Großweikersdorf', NULL, NULL, '2EHIF'),
(387, 'Dobias', 'Benjamin', 1, '2000-04-22 00:00:00', 'Margaretengürtel', '219/9/2', 1020, 'Wien', NULL, NULL, '2EHIF'),
(388, 'Faltl', 'Philipp', 1, '1998-04-20 00:00:00', 'Einfahrtstr.', '7/9', 3281, 'Oberndorf', NULL, NULL, '2EHIF'),
(389, 'Gadermaier', 'Sophie', 2, '2000-12-17 00:00:00', 'Nikolsdorfergasse', '24A/3/10', 1190, 'Wien', NULL, NULL, '2EHIF'),
(390, 'Galler', 'Thomas', 1, '2000-11-12 00:00:00', 'Sandleiteng.', '98', 2483, 'Ebreichsdorf', NULL, NULL, '2EHIF'),
(391, 'Gangl', 'Daniel', 1, '2000-08-21 00:00:00', 'Knöllgasse', '28/32', 1225, 'Wien', NULL, NULL, '2EHIF'),
(392, 'Hässler', 'Andreas', 1, '2000-12-17 00:00:00', 'Kierlingerstraße', '6', 1150, 'Wien', NULL, NULL, '2EHIF'),
(393, 'Herdlicka', 'Raphael', 1, '1999-04-14 00:00:00', 'Theodor-Storm-Weg', '30', 1230, 'Wien', NULL, NULL, '2EHIF'),
(394, 'Jonas', 'Raffael', 1, '2000-06-14 00:00:00', 'Weststr.', '67-73/1/2', 1040, 'Wien', NULL, NULL, '2EHIF'),
(395, 'Kern', 'Clemens', 1, '2002-01-11 00:00:00', 'Dr. Winterweg', '18/3/9', 1110, 'Wien', NULL, NULL, '2EHIF'),
(396, 'Kokorovic', 'Lukas', 1, '2000-09-02 00:00:00', 'Am Weissen Kreuz', '53', 1050, 'Wien', NULL, NULL, '2EHIF'),
(397, 'Mages', 'Thomas', 1, '2001-02-16 00:00:00', 'Schillerstraße', '31/27', 1200, 'Wien', NULL, NULL, '2EHIF'),
(398, 'Mayer', 'Valentin', 1, '2000-12-22 00:00:00', 'Abt Hauswirth Str.', '4/6', 2454, 'Trautmannsdorf', NULL, NULL, '2EHIF'),
(399, 'Ploder', 'Philipp', 1, '1999-12-21 00:00:00', 'Penzingerstraße', '174-180/12/6', 1150, 'Wien', NULL, NULL, '2EHIF'),
(400, 'Saric', 'Laura', 2, '2001-04-25 00:00:00', 'Gebirgsg.', '2-14/7/50', 2443, 'Stotzing', NULL, NULL, '2EHIF'),
(401, 'Scheiblauer', 'David Lu', 1, '1999-11-30 00:00:00', 'Welzergasse', '4/5', 1030, 'Wien', NULL, NULL, '2EHIF'),
(402, 'Schleis', 'Diego', 1, '2000-09-28 00:00:00', 'Penzingerstraße', '68-70/4/25', 2560, 'Berndorf', NULL, NULL, '2EHIF'),
(403, 'Schmidt', 'Aaron', 1, '2001-05-28 00:00:00', 'Am Kanal', '6/38/6', 1040, 'Wien', NULL, NULL, '2EHIF'),
(404, 'Schöfmann', 'Maximilian', 1, '2001-02-13 00:00:00', 'Schlossgasse', '28/10', 1020, 'Wien', NULL, NULL, '2EHIF'),
(405, 'Schuecker', 'Matthias', 1, '1999-07-05 00:00:00', 'Baumgasse', '94', 1120, 'Wien', NULL, NULL, '2EHIF'),
(406, 'Shahjahan', 'Sujit', 1, '2001-09-21 00:00:00', 'Frankenberggasse', '3/10/11', 1170, 'Wien', NULL, NULL, '2EHIF'),
(407, 'Starzer', 'Fiona', 2, '2000-07-10 00:00:00', 'Görtschach', '13/13', 1210, 'Wien', NULL, NULL, '2EHIF'),
(408, 'Stephan', 'Marco', 1, '1999-05-15 00:00:00', 'Pohlgasse', '62/6', 2483, 'Ebreichsdorf', NULL, NULL, '2EHIF'),
(409, 'Stuhlmeier', 'Daniell Kao', 1, '2003-01-27 00:00:00', 'Hippgasse', '1A', 1230, 'Wien', NULL, NULL, '2EHIF'),
(410, 'Toth', 'Samuel', 1, '2000-01-29 00:00:00', 'Rauchfangkehrerg.', '15/6', 2544, 'Leopoldsdorf', NULL, NULL, '2EHIF'),
(411, 'Waidmann', 'Aaron', 1, '2000-06-10 00:00:00', 'Steinerg.', '2', 1160, 'Wien', NULL, NULL, '2EHIF'),
(412, 'Wendlinger', 'Peter', 1, '2001-08-31 00:00:00', 'Blindengasse', '25/16/30', 1100, 'Wien', NULL, NULL, '2EHIF'),
(413, 'Zuba', 'Felix', 1, '2001-02-03 00:00:00', 'Wienerflurg.', '14/19/4', 1130, 'Wien', NULL, NULL, '2EHIF'),
(414, 'Berger', 'Dominik', 1, '1994-06-27 00:00:00', 'Grafendorf', '3-5/64/7', 1110, 'Wien', NULL, NULL, '3ABIF'),
(415, 'Eisenhut', 'Wolfgang', 1, '1968-02-14 00:00:00', 'Vivaldig.', '55', 1030, 'Wien', NULL, NULL, '3ABIF'),
(416, 'Heissenberger', 'Bernadette', 2, '1981-04-10 00:00:00', 'Südhang', '36/7/38', 1050, 'Wien', NULL, NULL, '3ABIF'),
(417, 'Hepperger', 'Helmut', 1, '1976-06-15 00:00:00', 'Schöpfergasse', '94', 1020, 'Wien', NULL, NULL, '3ABIF'),
(418, 'Hofbauer', 'Martin', 1, '1962-04-01 00:00:00', 'Handelskai', '2', 3021, 'Preßbaum', NULL, NULL, '3ABIF'),
(419, 'Lemanski', 'Viktor', 1, '1989-02-26 00:00:00', 'Gablenzg.', '10', 6020, 'Innsbruck', NULL, NULL, '3ABIF'),
(420, 'Liu', 'Julia', 2, '1994-05-04 00:00:00', 'Guglgasse', '1/9', 2514, 'Möllersdorf', NULL, NULL, '3ABIF'),
(421, 'Ranits', 'Christian', 1, '1991-05-16 00:00:00', 'Mitterweg', '155/5', 2542, 'Kottingbrunn', NULL, NULL, '3ABIF'),
(422, 'Acar', 'Celine', 2, '1999-01-12 00:00:00', 'Talgasse', '12A', 1210, 'Wien', NULL, NULL, '3AHBGM'),
(423, 'Bak', 'Nikolaus', 1, '1995-05-18 00:00:00', 'Felix-Slavikstraße', '41/25', 1140, 'Wien', NULL, NULL, '3AHBGM'),
(424, 'Beda', 'Adam', 1, '1998-04-04 00:00:00', 'Mariazellergasse', '27/4/67', 1110, 'Wien', NULL, NULL, '3AHBGM'),
(425, 'Bogicevic', 'Stefan', 1, '1997-02-13 00:00:00', 'Rothneusiedlerstraße', '35-37/3/9', 1100, 'Wien', NULL, NULL, '3AHBGM'),
(426, 'Brainovic', 'Hannes', 1, '1999-01-29 00:00:00', 'Welzergasse', '27/36/12', 1210, 'Wien', NULL, NULL, '3AHBGM'),
(427, 'Dawid', 'Tobias', 1, '1997-01-16 00:00:00', 'Josefweg', '60/3/19', 1030, 'Wien', NULL, NULL, '3AHBGM'),
(428, 'Dawoud', 'Salma', 2, '2000-03-28 00:00:00', 'Fritz Preglg', '33', 1120, 'Wien', NULL, NULL, '3AHBGM'),
(429, 'Duric', 'Ivana', 2, '2000-09-18 00:00:00', 'Waldgasse', '1', 1160, 'Wien', NULL, NULL, '3AHBGM'),
(430, 'Evstratov', 'Mikhail', 1, '1997-05-02 00:00:00', 'Laxenburgerstr.', '67/21', 1160, 'Wien', NULL, NULL, '3AHBGM'),
(431, 'Gugler', 'Lucas', 1, '2000-10-26 00:00:00', 'Plenergasse', '260', 2333, 'Leopoldsdorf', NULL, NULL, '3AHBGM'),
(432, 'Nickel-Kovacsics', 'Luana', 2, '1999-02-18 00:00:00', 'Schumanngasse', '32/10', 2443, 'Leithaprodersdorf', NULL, NULL, '3AHBGM'),
(433, 'Ahmad', 'Khalid', 1, '1988-07-22 00:00:00', 'Volksheimg.', '13/2', 1100, 'Wien', NULL, NULL, '3BBIF'),
(434, 'Dilek', 'Murtaza', 1, '1995-01-03 00:00:00', 'Amalienstr.', '231', 1230, 'Wien', NULL, NULL, '3BBIF'),
(435, 'El-Beidak', 'Raied', 1, '1994-05-15 00:00:00', 'In der Haide', '19/17', 1190, 'Wien', NULL, NULL, '3BBIF');
INSERT INTO `schueler` (`S_Nr`, `S_Zuname`, `S_Vorname`, `S_Geschlecht`, `S_Gebdatum`, `S_Strasse`, `S_Hausnummer`, `S_Postleitzahl`, `S_Postort`, `S_Religion`, `S_Staatsbuergerschaft`, `S_Klasse`) VALUES
(436, 'Esen', 'Muhammet', 1, '1997-04-09 00:00:00', 'Alserstraße', '88/34', 2540, 'Bad Vöslau', NULL, NULL, '3BBIF'),
(437, 'Gültekin', 'Deniz', 1, '1985-04-03 00:00:00', 'Engerthstr.', '62/2/1', 2500, 'Baden', NULL, NULL, '3BBIF'),
(438, 'Hommel', 'Patrick', 1, '1992-11-08 00:00:00', 'Gumpendorferstr.', '22/10', 1020, 'Wien', NULL, NULL, '3BBIF'),
(439, 'Hosseini', 'Reza', 1, '1994-07-24 00:00:00', 'Hudlergasse', '63', 3913, 'Groß Göttfritz', NULL, NULL, '3BBIF'),
(440, 'Ivanov', 'Veaceslav', 1, '1996-10-06 00:00:00', 'Tullnerstr.', '60', 1210, 'Wien', NULL, NULL, '3BBIF'),
(441, 'Janka', 'Johannes', 1, '1997-08-21 00:00:00', 'Rechte Bahnstr.', '9/25', 1200, 'Wien', NULL, NULL, '3BBIF'),
(442, 'Kadnar', 'Manuel', 1, '1989-03-13 00:00:00', 'Redtenbacherg.', '8/2/2/6', 1120, 'Wien', NULL, NULL, '3BBIF'),
(443, 'Kazemi', 'Hadi', 1, '1992-02-21 00:00:00', 'M. Hainischstraße', '85', 1210, 'Wien', NULL, NULL, '3BBIF'),
(444, 'Matzenauer', 'Lisa', 2, '1993-01-03 00:00:00', 'Zollergasse', '12/14', 3011, 'Untertullnerbach', NULL, NULL, '3BBIF'),
(445, 'Mrazek', 'Markus', 1, '1983-09-11 00:00:00', 'Mandlgasse', '17', 1200, 'Wien', NULL, NULL, '3BBIF'),
(446, 'Nikolic', 'Denis', 1, '1993-11-19 00:00:00', 'Dreherstraße', '8/6', 1050, 'Wien', NULL, NULL, '3BBIF'),
(447, 'Nürnberger', 'Patrik', 1, '1996-10-06 00:00:00', 'Winzerschulgasse', '78/26', 1220, 'Wien', NULL, NULL, '3BBIF'),
(448, 'Özbal', 'Selahattin', 1, '1993-02-14 00:00:00', 'Linke Wienzeile', '3/10/11', 1090, 'Wien', NULL, NULL, '3BBIF'),
(449, 'Rahimi', 'Alireza', 1, '1995-10-08 00:00:00', 'Kummergasse', '3', 1228, 'Wien', NULL, NULL, '3BBIF'),
(450, 'Reschützegger', 'Patrick', 1, '1991-11-16 00:00:00', 'Greiseneckergasse', '169', 3002, 'Purkersdorf', NULL, NULL, '3BBIF'),
(451, 'Sarwari', 'Fahrid', 1, '1992-06-06 00:00:00', 'Leopoldauerstr.', '22', 1100, 'Wien', NULL, NULL, '3BBIF'),
(452, 'Schulmeister', 'Markus', 1, '1994-01-18 00:00:00', 'Hauffgasse', '3', 1180, 'Wien', NULL, NULL, '3BBIF'),
(453, 'Sözeri', 'Mazlum', 1, '1996-07-16 00:00:00', 'Reinprechtsdorferstr.', '60/5', 1030, 'Wien', NULL, NULL, '3BBIF'),
(454, 'Stany', 'Ralph', 1, '1987-10-22 00:00:00', 'Kaunitzg.', '15', 1100, 'Wien', NULL, NULL, '3BBIF'),
(455, 'Steffel', 'Nikolai', 1, '1991-03-26 00:00:00', 'Hietzinger Hauptstr.', '60/13/1', 1210, 'Wien', NULL, NULL, '3BBIF'),
(456, 'Takacevic', 'Bruno', 1, '1985-09-18 00:00:00', 'Am Kanal', '2/12', 1150, 'Wien', NULL, NULL, '3BBIF'),
(457, 'Tscheliesnig', 'Friedrich', 1, '1988-10-18 00:00:00', 'Armin Diemgasse', '34/1b/69', 1050, 'Wien', NULL, NULL, '3BBIF'),
(458, 'Vasylkiv', 'Ihor', 1, '1993-11-25 00:00:00', 'Loudonstr.', '12/1/29', 1100, 'Wien', NULL, NULL, '3BBIF'),
(459, 'Voglsam', 'Felix', 1, '1990-06-06 00:00:00', 'Pernersdorferg.', '14', 2514, 'Traiskirchen', NULL, NULL, '3BBIF'),
(460, 'Vojta', 'Patrick', 1, '1982-02-28 00:00:00', 'Ant. Baumgartnerstr.', '112', 2232, 'Deutsch-Wagram', NULL, NULL, '3BBIF'),
(461, 'Zdravkovic', 'Milos', 1, '1989-08-23 00:00:00', 'Mühlhäufelweg', '44/A4/33', 1230, 'Wien', NULL, NULL, '3BBIF'),
(462, 'Agno', 'Mark-Angelo', 1, '2000-02-10 00:00:00', 'Enzersfelderstraße', '174/22', 7035, 'Steinbrunn', NULL, NULL, '3BHBGM'),
(463, 'Alber', 'Maximilian', 1, '2000-12-23 00:00:00', 'Lichtensteinstr.', '6/3/7', 1190, 'Wien', NULL, NULL, '3BHBGM'),
(464, 'Bindhammer', 'Patrick', 1, '1999-03-04 00:00:00', 'Hütteldorferstr.', '61/1/17', 1110, 'Wien', NULL, NULL, '3BHBGM'),
(465, 'El Kafrawy', 'Mahmoud', 1, '1998-12-13 00:00:00', 'Eipeldauerstr.', '13/2', 3425, 'Langenlebarn', NULL, NULL, '3BHBGM'),
(466, 'Hirber', 'Christoph', 1, '2000-01-25 00:00:00', 'Eduard-Sueß-G.', '28', 9470, 'St. Paul', NULL, NULL, '3BHBGM'),
(467, 'Junuzovic', 'Samra', 2, '1999-10-13 00:00:00', 'Egon Schiele Gasse', '6', 8045, 'Graz', NULL, NULL, '3BHBGM'),
(468, 'Knezovic', 'Manuela', 2, '1999-07-26 00:00:00', 'Weidelstr.', '24/22', 1050, 'Wien', NULL, NULL, '3BHBGM'),
(469, 'Kospach', 'Jasmin', 2, '2000-02-11 00:00:00', 'Rauchfangkehrergasse', '9/13', 2340, 'Mödling', NULL, NULL, '3BHBGM'),
(470, 'Makkar', 'Merna', 2, '1998-09-22 00:00:00', 'Rosenbergen', '2b/14/4', 3100, 'St. Pölten', NULL, NULL, '3BHBGM'),
(471, 'Mandic', 'Viktor', 1, '2000-05-10 00:00:00', 'Frankenberggasse', '30', 1190, 'Wien', NULL, NULL, '3BHBGM'),
(472, 'Martic', 'Clarissa', 2, '1999-10-20 00:00:00', 'Sautergasse', '1/10', 1150, 'Wien', NULL, NULL, '3BHBGM'),
(473, 'Martinek', 'Elias', 1, '2000-07-22 00:00:00', 'Margaretengürtel', '7/2/9', 1210, 'Wien', NULL, NULL, '3BHBGM'),
(474, 'Muschka', 'Nico', 1, '1999-12-04 00:00:00', 'Margarentstr.', '51/1/14', 1100, 'Wien', NULL, NULL, '3BHBGM'),
(475, 'Nevenkic', 'Juliana', 2, '2001-01-03 00:00:00', 'Felbigergasse', '105', 1030, 'Wien', NULL, NULL, '3BHBGM'),
(476, 'Peszt', 'Lisa-Marie', 2, '2000-02-22 00:00:00', 'Heinestr.', '17', 1040, 'Wien', NULL, NULL, '3BHBGM'),
(477, 'Redl', 'Anna', 2, '2000-04-23 00:00:00', 'Schweglerstraße', '291/1/1', 1210, 'Wien', NULL, NULL, '3BHBGM'),
(478, 'Rodila', 'Aurelia', 2, '2000-04-27 00:00:00', 'Haydng.', '8/2B/7', 1050, 'Wien', NULL, NULL, '3BHBGM'),
(479, 'Saliji', 'Merita', 2, '2000-03-12 00:00:00', 'Obere Amtshausgasse', '10', 2345, 'Brunn am Gebirge', NULL, NULL, '3BHBGM'),
(480, 'Stiastny', 'Florian', 1, '2000-07-23 00:00:00', 'Wehlistraße', '7/5', 1020, 'Wien', NULL, NULL, '3BHBGM'),
(481, 'Wlodek', 'Konrad', 1, '1999-10-14 00:00:00', 'Obere Augartenstraße', '24-32/30', 1030, 'Wien', NULL, NULL, '3BHBGM'),
(482, 'Zecevic', 'Jelena', 2, '2000-03-04 00:00:00', 'Paulusgasse', '4/1/11', 1150, 'Wien', NULL, NULL, '3BHBGM');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schuljahre`
--

CREATE TABLE `schuljahre` (
  `Sja_Nr` smallint(5) NOT NULL,
  `Sja_Bezeichnung` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Sja_Bezeichnungkurz` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Sja_Bezeichnunglang` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Sja_Datumvon` datetime DEFAULT NULL,
  `Sja_Datumbis` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `schuljahre`
--

INSERT INTO `schuljahre` (`Sja_Nr`, `Sja_Bezeichnung`, `Sja_Bezeichnungkurz`, `Sja_Bezeichnunglang`, `Sja_Datumvon`, `Sja_Datumbis`) VALUES
(20090, 'Sjahr 2009/10', '09/10', 'Schuljahr 2009/2010', '2009-09-07 00:00:00', '2010-07-02 00:00:00'),
(20091, 'WS 2009/10', 'WS09/10', 'Wintersemester 2009/2010', '2009-09-07 00:00:00', '2010-01-29 00:00:00'),
(20092, 'SS 2009/10', 'SS10', 'Sommersemester 2009/2010', '2010-02-08 00:00:00', '2010-07-02 00:00:00'),
(20100, 'Sjahr 2010/11', '10/11', 'Schuljahr 2010/2011', '2010-09-06 00:00:00', '2011-07-01 00:00:00'),
(20101, 'WS 2010/11', 'WS10/11', 'Wintersemester 2010/2011', '2010-09-06 00:00:00', '2011-02-04 00:00:00'),
(20102, 'SS 2010/11', 'SS11', 'Sommersemester 2010/2011', '2011-02-14 00:00:00', '2011-07-01 00:00:00'),
(20110, 'Sjahr 2011/12', '11/12', 'Schuljahr 2011/2012', '2011-09-05 00:00:00', '2012-06-29 00:00:00'),
(20111, 'WS 2011/12', 'WS11/12', 'Wintersemester 2011/2012', '2011-09-05 00:00:00', '2012-02-03 00:00:00'),
(20112, 'SS 2011/12', 'SS12', 'Sommersemester 2011/2012', '2012-02-13 00:00:00', '2012-06-29 00:00:00'),
(20120, 'Sjahr 2012/13', '12/13', 'Schuljahr 2012/2013', '2012-09-03 00:00:00', '2013-06-28 00:00:00'),
(20121, 'WS 2012/13', 'WS12/13', 'Wintersemester 2012/2013', '2012-09-03 00:00:00', '2013-02-01 00:00:00'),
(20122, 'SS 2012/13', 'SS13', 'Sommersemester 2012/2013', '2013-02-11 00:00:00', '2013-06-28 00:00:00'),
(20130, 'Sjahr 2013/14', '13/14', 'Schuljahr 2013/2014', '2013-09-02 00:00:00', '2014-06-27 00:00:00'),
(20131, 'WS 2013/14', 'WS13/14', 'Wintersemester 2013/2014', '2013-09-02 00:00:00', '2014-01-31 00:00:00'),
(20132, 'SS 2013/14', 'SS14', 'Sommersemester 2013/2014', '2014-02-10 00:00:00', '2014-06-27 00:00:00'),
(20140, 'Sjahr 2014/15', '14/15', 'Schuljahr 2014/2015', '2014-09-01 00:00:00', '2015-07-03 00:00:00'),
(20141, 'WS 2014/15', 'WS14/15', 'Wintersemester 2014/2015', '2014-09-01 00:00:00', '2015-01-30 00:00:00'),
(20150, 'Sjahr 2015/16', '15/16', 'Schuljahr 2015/2016', '2015-09-07 00:00:00', '2016-07-01 00:00:00'),
(20151, 'WS 2015/16', 'WS15/16', 'Wintersemester 2015/2016', '2015-09-07 00:00:00', '2016-01-29 00:00:00'),
(20152, 'SS 2015/16', 'SS16', 'Sommersemester 2015/2016', '2016-02-08 00:00:00', '2016-07-01 00:00:00'),
(20160, 'Sjahr 2016/17', '16/17', 'Schuljahr 2016/2017', '2016-09-05 00:00:00', '2017-06-28 00:00:00'),
(20161, 'WS 2016/17', 'WS16/17', 'Wintersemester 2016/2017', '2016-09-05 00:00:00', '2017-02-03 00:00:00'),
(20162, 'SS 2016/17', 'SS17', 'Sommersemester 2015/2017', '2017-02-13 00:00:00', '2017-06-28 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `staaten`
--

CREATE TABLE `staaten` (
  `Sta_Nr` varchar(6) NOT NULL,
  `Sta_Name` varchar(28) DEFAULT NULL,
  `Sta_Staatsb` varchar(28) DEFAULT NULL,
  `Sta_Euland` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `staaten`
--

INSERT INTO `staaten` (`Sta_Nr`, `Sta_Name`, `Sta_Staatsb`, `Sta_Euland`) VALUES
('A', 'Österreich', 'österreichisch', 'EU'),
('AFG', 'Afghanistan', 'Afghanistan', ''),
('AGL', 'Angola', 'Angola', ''),
('AGN', 'Äquatorial-Guinea', 'Guinea (Äquatorial-G.)', ''),
('AL', 'Albanien', 'Albanien', ''),
('AND', 'Andorra', 'Andorra', ''),
('ARM', 'Armenien', 'armenisch', ''),
('ASB', 'Aserbaidshan', 'Aserbaidshan', ''),
('ATB', 'Antigua und Barbuda', 'Antigua und Barbuda', ''),
('AUS', 'Australien', 'Australien', ''),
('B', 'Belgien', 'Belgien', 'EU'),
('BAN', 'Bangladesch', 'Bangladesch', ''),
('BDS', 'Barbados', 'Barbados', ''),
('BG', 'Bulgarien', 'Bulgarien', 'EU'),
('BH', 'Honduras', 'Honduras', ''),
('BHU', 'Bhutan', 'Bhutan', ''),
('BLR', 'Weißrussland', 'weißrussisch', ''),
('BLZ', 'Belize', 'Belize', ''),
('BOL', 'Bolivien', 'Bolivien', ''),
('BR', 'Brasilien', 'Brasilien', ''),
('BRG', 'Guyana', 'Guyana', ''),
('BRN', 'Bahrein', 'Bahrein', ''),
('BRU', 'Brunei', 'Brunei', ''),
('BS', 'Bahamas', 'Bahamas', ''),
('BSH', 'Bosnien u. Herzegowina', 'bosnisch', ''),
('BUR', 'Myanmar', 'Birma', ''),
('C', 'Kuba', 'Kuba', ''),
('CAM', 'Kamerun', 'Kamerun', ''),
('CDN', 'Kanada', 'Kanada', ''),
('CG', 'Montenegro', 'montenegrinisch', ''),
('CH', 'Schweiz', 'Schweiz', ''),
('CHF', 'China', 'chinesisch', ''),
('CI', 'Êlfenbeinküste', 'Êlfenbeinküste', ''),
('CL', 'Sri Lanka', 'Sri Lanka', ''),
('CO', 'Kolumbien', 'Kolumbien', ''),
('CR', 'Costa Rica', 'Kosta Rica', ''),
('CRO', 'Kroatien', 'kroatisch', ''),
('CY', 'Zypern', 'Cypern', 'EU'),
('D', 'Deutschland', 'Deutschland', 'EU'),
('DCH', 'Dominikanische Rep.', 'Dominikanische Rep.', ''),
('DJI', 'Dschibuti', 'Dschibuti', ''),
('DK', 'Dänemark', 'Dänemark', 'EU'),
('DVK', 'Nordkorea', 'Korea (demokrat. VR/Nord)', ''),
('DY', 'Benin', 'Benin', ''),
('DZ', 'Algerien', 'Algerien', ''),
('E', 'Spanien', 'Spanien', 'EU'),
('EAK', 'Kenia', 'Kenia', ''),
('EAT', 'Tansania', 'Tansania', ''),
('EAU', 'Uganda', 'Uganda', ''),
('EC', 'Ecuador', 'Ecuador', ''),
('ELD', 'Estland', 'Estland', 'EU'),
('ERI', 'Eritrea', 'Eritrea', ''),
('ES', 'El Salvador', 'El Salvador', ''),
('ET', 'Ägypten', 'Ägypten', ''),
('ETH', 'Äthiopien', 'Äthiopien', ''),
('F', 'Frankreich', 'Frankreich', 'EU'),
('FJI', 'Fidschi', 'Fidschi', ''),
('FL', 'Lichtenstein', 'Lichtenstein', ''),
('FO', 'Färöer', '', ''),
('GAB', 'Gabun', 'Gabun', ''),
('GB', 'Großbritannien', 'Großbritannien', 'EU'),
('GCA', 'Guatemala', 'Guatemala', ''),
('GG', 'Georgien', 'Georgien', ''),
('GH', 'Ghana', 'Ghana', ''),
('GN', 'Guinea', 'Guinea', ''),
('GNB', 'Guinea-Bissau', 'Guinea-Bissau', ''),
('GR', 'Griechenland', 'Griechenland', 'EU'),
('H', 'Ungarn', 'ungarisch', 'EU'),
('HV', 'Burkina Faso', 'Burkina Faso', ''),
('I', 'Italien', 'Italien', 'EU'),
('IL', 'Israel', 'Israel', ''),
('IND', 'Indien', 'Indien', ''),
('IR', 'Iran', 'iranisch', ''),
('IRL', 'Irland', 'irisch', 'EU'),
('IRQ', 'Irak', 'irakisch', ''),
('IS', 'Island', 'Island', ''),
('J', 'Japan', 'Japan', ''),
('JA', 'Jamaica', 'Jamaica', ''),
('JEM', 'Jemen', 'Jemen', ''),
('JOR', 'Jordanien', 'Jordanien', ''),
('K', 'Kambodscha', 'Kambodscha', ''),
('KAS', 'Kasachstan', 'Kasachstan', ''),
('KIR', 'Kiribati', 'Kiribati', ''),
('KM', 'Komoren', 'Komoren', ''),
('KRG', 'Kirgistan', 'Kirgisien', ''),
('KT', 'Kuwait', 'Kuweit', ''),
('KV', 'Kap Verde', 'Kap Verde', ''),
('L', 'Luxemburg', 'Luxemburg', 'EU'),
('LAO', 'Laos', 'Laos', ''),
('LB', 'Liberia', 'Liberia', ''),
('LIT', 'Litauen', 'Litauen', 'EU'),
('LLD', 'Lettland', 'Lettland', 'EU'),
('LS', 'Lesotho', 'Lesotho', ''),
('LT', 'Libyen', 'Lybien', ''),
('M', 'Malta', 'Malta', 'EU'),
('MA', 'Marokko', 'Marokko', ''),
('MAL', 'Malaysia', 'Malaysia', ''),
('MAZ', 'Mazedonien', 'mazedonisch', ''),
('MBK', 'Mosambik', '', ''),
('MC', 'Monaco', 'Monaco', ''),
('MDV', 'Malediven', 'Malediven', ''),
('MEX', 'Mexiko', 'Mexiko', ''),
('MGL', 'Mongolei', 'Mongolei', ''),
('MIK', 'Mikronesien', 'Mikronesien', ''),
('MLD', 'Moldawien', 'Moldova', ''),
('MS', 'Mauritius', 'Mauritius', ''),
('MSH', 'Marshallinseln', 'Marshallinseln', ''),
('MW', 'Malawi', 'Malawi', ''),
('N', 'Norwegen', 'Norwegen', ''),
('NAM', 'Namibia', 'Namibia', ''),
('NEP', 'Nepal', 'Nepal', ''),
('NIC', 'Nicaragua', 'Nicaragua', ''),
('NIG', 'Niger', 'Niger', ''),
('NL', 'Niederlande', 'Niederlande', 'EU'),
('NR', 'Nauru', 'Nauru', ''),
('NU', 'Niue', 'Niue', ''),
('NZ', 'Neuseeland', 'Neuseeland', ''),
('OMN', 'Oman', 'Oman', ''),
('OTM', 'Osttimor', 'Osttimor', ''),
('P', 'Portugal', 'Portugal', 'EU'),
('PA', 'Panama', 'Panama', ''),
('PAK', 'Pakistan', 'Pakistan', ''),
('PAL', 'Palau', 'Palau Inseln', ''),
('PE', 'Peru', 'Peru', ''),
('PI', 'Philippinen', 'Philippinen', ''),
('PL', 'Polen', 'polnisch', 'EU'),
('PNG', 'Papua-Neuguinea', 'Papua-Neuguinea', ''),
('PST', 'Palästina', 'Palästina', ''),
('PY', 'Paraguay', 'Paraguay', ''),
('QTR', 'Katar', 'Katar', ''),
('R', 'Rumänien', 'Rumänien', 'EU'),
('RA', 'Argentinien', 'Argentinien', ''),
('RB', 'Botsuana', 'Botswana', ''),
('RC', 'Taiwan', 'Taiwan', ''),
('RCA', 'Zentralafrika', 'Zentralafrika', ''),
('RCB', 'Kongo', 'Kongo', ''),
('RCH', 'Chile', 'Chile', ''),
('RH', 'Haiti', 'Haiti', ''),
('RI', 'Indonesien', 'Indonesien', ''),
('RIM', 'Mauretanien', 'Mauretanien', ''),
('RL', 'Libanon', 'Libanon', ''),
('RM', 'Madagaskar', 'Madagaskar', ''),
('RMM', 'Mali', 'Mali', ''),
('ROK', 'Südkorea', 'Korea', ''),
('RSF', 'Russland', 'russisch', ''),
('RSM', 'San Marino', 'San Marino', ''),
('RSR', 'Simbabwe', 'Rhodesien', ''),
('RU', 'Burundi', 'Burundi', ''),
('RWA', 'Ruanda', 'Ruanda', ''),
('S', 'Schweden', 'Schweden', 'EU'),
('SA', 'Saudi Arabien', 'saudisch', ''),
('SBM', 'Serbien', 'serbisch', ''),
('SCN', 'St. Kitts und Nevis', 'Sankt Kitts und Nevis', ''),
('SD', 'Swasiland', 'Swasiland', ''),
('SF', 'Finnland', 'Finnland', 'EU'),
('SGP', 'Singapur', 'Singapur', ''),
('SHR', 'Westsahara', 'Sahara', ''),
('SLM', 'Salomonen', 'Salomonen', ''),
('SLO', 'Slowenien', 'slowenisch', 'EU'),
('SME', 'Suriname', 'Surinam', ''),
('SN', 'Senegal', 'Senegal', ''),
('SP', 'Somalia', 'Somalia', ''),
('SQ', 'Slowakei', 'slowakisch', 'EU'),
('Sta_Nr', 'Sta_Name', 'Sta_Staatsb', 'Sta_Euland'),
('STP', 'Sao Tome und Principe', 'Sao Tome und Principe', ''),
('SU', 'Sowjetunion !ALT!', 'Sowjetunion', ''),
('SUD', 'Sudan', 'Sudan', ''),
('SY', 'Seychellen', 'Seychellen', ''),
('SYR', 'Syrien', 'syrisch', ''),
('T', 'Thailand', 'Thailand', ''),
('TA', 'Tonga', 'Tonga', ''),
('TCH', 'Tschechien', 'tschechisch', 'EU'),
('TD', 'Tschad', 'Tschad', ''),
('TDS', 'Tadschikistan', 'Tadschikistan', ''),
('TG', 'Togo', 'Togo', ''),
('TKM', 'Turkmenistan', 'Turkmenistan', ''),
('TN', 'Tunesien', 'tunesisch', ''),
('TR', 'Türkei', 'türkisch', ''),
('TT', 'Trinidad-Tobago', 'Trinidad-Tobago', ''),
('TVL', 'Tuvalu', 'Tuvalu', ''),
('U', 'Uruguay', 'Uruguay', ''),
('UBK', 'Usbekistan', 'usbekisch', ''),
('UKR', 'Ukraine', 'Ukraine', ''),
('USA', 'Vereinigte Staaten', 'Vereinigte Staaten', ''),
('V', 'Vatikan', 'Vatikan', ''),
('VE', 'Vereinigte arab. Emirate', 'Vereinigte arab. Emirate', ''),
('VN', 'Vietnam', 'Vietnam', ''),
('VTU', 'Vanuatu', 'Vanuatu', ''),
('WAG', 'Gambia', 'Gambia', ''),
('WAL', 'Sierra Leone', 'Sierra Leone', ''),
('WAN', 'Nigeria', 'nigerianisch', ''),
('WD', 'Dominica', 'Dominica', ''),
('WG', 'Grenada', 'Grenada', ''),
('WL', 'St. Lucia', 'SantaLucia', ''),
('WS', 'Samoa', 'Samoa', ''),
('WV', 'St. Vincent', 'St Vincent', ''),
('XXX', 'Staatsbürgerschaft ungeklärt', 'Staatsbürgerschaft ungeklärt', ''),
('YU', 'Jugoslawien !ALT!', 'jugoslawisch', ''),
('YV', 'Venezuela', 'Venezuela', ''),
('YYY', 'Unbekannt', 'Unbekannt', ''),
('Z', 'Sambia', 'Sambia', ''),
('ZA', 'Südafrika', 'Südafrika', ''),
('ZR', 'Demokratische Republik Kongo', 'Zaire', ''),
('ZZZ', 'staatenlos', 'staatenlos', '');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `abteilungen`
--
ALTER TABLE `abteilungen`
  ADD PRIMARY KEY (`Abt_ID`),
  ADD KEY `Abt_Leiter` (`Abt_Leiter`);

--
-- Indizes für die Tabelle `geschlechter`
--
ALTER TABLE `geschlechter`
  ADD PRIMARY KEY (`Ges_ID`);

--
-- Indizes für die Tabelle `klassen`
--
ALTER TABLE `klassen`
  ADD PRIMARY KEY (`K_Nr`),
  ADD KEY `K_Vorstand` (`K_Vorstand`,`K_Abteilung`),
  ADD KEY `K_Abteilung` (`K_Abteilung`),
  ADD KEY `K_Jahrsem` (`K_Jahrsem`);

--
-- Indizes für die Tabelle `lehrer`
--
ALTER TABLE `lehrer`
  ADD PRIMARY KEY (`L_Nr`),
  ADD KEY `L_Geschlecht` (`L_Geschlecht`);

--
-- Indizes für die Tabelle `religionen`
--
ALTER TABLE `religionen`
  ADD PRIMARY KEY (`Rel_ID`);

--
-- Indizes für die Tabelle `schueler`
--
ALTER TABLE `schueler`
  ADD PRIMARY KEY (`S_Nr`),
  ADD KEY `S_Religion` (`S_Religion`,`S_Staatsbuergerschaft`,`S_Klasse`),
  ADD KEY `S_Geschlecht` (`S_Geschlecht`),
  ADD KEY `S_Staatsbuergerschaft` (`S_Staatsbuergerschaft`),
  ADD KEY `S_Klasse` (`S_Klasse`);

--
-- Indizes für die Tabelle `schuljahre`
--
ALTER TABLE `schuljahre`
  ADD PRIMARY KEY (`Sja_Nr`);

--
-- Indizes für die Tabelle `staaten`
--
ALTER TABLE `staaten`
  ADD PRIMARY KEY (`Sta_Nr`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `abteilungen`
--
ALTER TABLE `abteilungen`
  ADD CONSTRAINT `abteilungen_ibfk_1` FOREIGN KEY (`Abt_Leiter`) REFERENCES `lehrer` (`L_Nr`);

--
-- Constraints der Tabelle `klassen`
--
ALTER TABLE `klassen`
  ADD CONSTRAINT `klassen_ibfk_1` FOREIGN KEY (`K_Abteilung`) REFERENCES `abteilungen` (`Abt_ID`),
  ADD CONSTRAINT `klassen_ibfk_2` FOREIGN KEY (`K_Vorstand`) REFERENCES `lehrer` (`L_Nr`),
  ADD CONSTRAINT `klassen_ibfk_3` FOREIGN KEY (`K_Jahrsem`) REFERENCES `schuljahre` (`Sja_Nr`);

--
-- Constraints der Tabelle `lehrer`
--
ALTER TABLE `lehrer`
  ADD CONSTRAINT `lehrer_ibfk_1` FOREIGN KEY (`L_Geschlecht`) REFERENCES `geschlechter` (`Ges_ID`);

--
-- Constraints der Tabelle `schueler`
--
ALTER TABLE `schueler`
  ADD CONSTRAINT `schueler_ibfk_1` FOREIGN KEY (`S_Geschlecht`) REFERENCES `geschlechter` (`Ges_ID`),
  ADD CONSTRAINT `schueler_ibfk_2` FOREIGN KEY (`S_Religion`) REFERENCES `religionen` (`Rel_ID`),
  ADD CONSTRAINT `schueler_ibfk_3` FOREIGN KEY (`S_Staatsbuergerschaft`) REFERENCES `staaten` (`Sta_Nr`),
  ADD CONSTRAINT `schueler_ibfk_4` FOREIGN KEY (`S_Klasse`) REFERENCES `klassen` (`K_Nr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

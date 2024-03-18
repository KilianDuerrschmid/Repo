-- Kunden
INSERT INTO kunde (anrede, titel, vorname, nachname, email, tel, geschlecht, strasse, plz, ort) 
VALUES 
('Herr', 'Dr.', 'Max', 'Mustermann', 'max.mustermann@example.com', '+49123456789', 'm', 'Musterstraße 1', 12345, 'Musterstadt'),
('Frau', 'Prof.', 'Anna', 'Schmidt', 'anna.schmidt@example.com', '+4987654321', 'w', 'Beispielweg 2', 54321, 'Beispielstadt');

-- Fahrzeuge
INSERT INTO fahrzeug (fin, kennzeichen, marke, modell, typ, baujahr, erstzulassung, kundeId) 
VALUES 
('W1234567890123456', 'ABC123', 'Volkswagen', 'Golf', 'Limousine', '2018-01-01', '2018-01-01', 1),
('X9876543210987654', 'DEF456', 'BMW', '3er', 'Limousine', '2019-01-01', '2019-01-01', 2);

-- Datensätze für die Tabelle "lieferant"
INSERT INTO lieferant (firmenname, email, tel, strasse, plz, ort) 
VALUES 
('ABC Autoteile GmbH', 'info@abc-autoteile.de', '+49123456789', 'Musterstraße 123', 12345, 'Musterstadt'),
('XYZ Ersatzteile AG', 'info@xyz-ersatzteile.com', '+4987654321', 'Beispielweg 456', 54321, 'Beispielstadt'),
('Autozubehör GmbH', 'info@autozubehoer-gmbh.de', '+447711223344', 'Teststraße 789', 67890, 'Teststadt');

-- Datensätze für die Tabelle "ersatzteil_leistung"
INSERT INTO ersatzteil_leistung (preis, bezeichnung, lieferantId) 
VALUES 
(29.99, 'Ölfilter', 1),
(49.99, 'Bremsbeläge', 1),
(99.99, 'Zündkerzen', 2),
(79.99, 'Luftfilter', 2),
(39.99, 'Scheinwerferlampe', 3),
(149.99, 'Batterie', 3);

insert into status (bezeichnung) values ('Abgeschlossen'), ('Offen');

-- Rechnungen für Fahrzeug 1
INSERT INTO rechnung (rechnungsnummer, rechnungsdatum, kilometerstand, fahrzeugId, statusId) 
VALUES 
('R123', '2024-03-01', 50000, 1, 1),
('R124', '2024-03-02', 52000, 1, 2);

-- Rechnungen für Fahrzeug 2
INSERT INTO rechnung (rechnungsnummer, rechnungsdatum, kilometerstand, fahrzeugId, statusId) 
VALUES 
('R456', '2024-03-03', 30000, 2, 1),
('R457', '2024-03-04', 32000, 2, 1);

insert into steuersatz (steuersatz, bezeichnung) values (20, 'Test');

-- Positionen für Rechnung 1 von Fahrzeug 1
INSERT INTO rechnungsPositionen (menge, ersatzteil_leistungId, rechnungId, steuersatzId) 
VALUES 
(2, 1, 1, 1),
(1, 2, 1, 1),
(3, 3, 1, 1);

-- Positionen für Rechnung 2 von Fahrzeug 1
INSERT INTO rechnungsPositionen (menge, ersatzteil_leistungId, rechnungId, steuersatzId) 
VALUES 
(1, 1, 2, 1),
(2, 2, 2, 1),
(2, 3, 2, 1);

-- Positionen für Rechnung 1 von Fahrzeug 2
INSERT INTO rechnungsPositionen (menge, ersatzteil_leistungId, rechnungId, steuersatzId) 
VALUES 
(3, 1, 3, 1),
(1, 2, 3, 1),
(2, 3, 3, 1);

-- Positionen für Rechnung 2 von Fahrzeug 2
INSERT INTO rechnungsPositionen (menge, ersatzteil_leistungId, rechnungId, steuersatzId) 
VALUES 
(1, 1, 4, 1),
(2, 2, 4, 1),
(3, 3, 4, 1);
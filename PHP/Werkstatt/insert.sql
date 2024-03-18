use werkstatt;

-- Kunden
INSERT INTO kunde (anrede, titel, vorname, nachname, email, tel, geschlecht, strasse, plz, ort) 
VALUES 
('Herr', 'Dr.', 'Max', 'Mustermann', 'max.mustermann@example.com', '+49123456789', 'm', 'Musterstraße 1', 12345, 'Musterstadt'),
('Frau', 'Prof.', 'Anna', 'Schmidt', 'anna.schmidt@example.com', '+4987654321', 'w', 'Beispielweg 2', 54321, 'Beispielstadt'),
('Frau', '', 'Maria', 'Meier', 'maria.meier@example.com', '+497654321', 'w', 'Testweg 3', 67890, 'Teststadt');

-- Lieferanten
INSERT INTO lieferant (firmenname, email, tel, strasse, plz, ort) 
VALUES 
('Autoteile GmbH', 'info@autoteile-gmbh.com', '+49987654321', 'Ersatzteilstraße 5', 54321, 'Teilestadt'),
('Kfz-Zubehör AG', 'info@kfz-zubehoer-ag.com', '+49123456789', 'Zubehörweg 10', 12345, 'Autostadt'),
('Autozubehör GmbH', 'info@autozubehoer-gmbh.com', '+49654321876', 'Teilestraße 15', 98765, 'Zubehörstadt');

-- Ersatzteile
INSERT INTO ersatzteile (einkaufspreis, verkaufspreis, ersatzteilnummer, bezeichnung, lieferantId) 
VALUES 
(50.00, 100.00, 'ET123', 'Bremsbeläge vorne', 1),
(30.00, 60.00, 'ET456', 'Ölfilter', 2),
(20.00, 40.00, 'ET789', 'Luftfilter', 3);

-- Fahrzeuge
INSERT INTO fahrzeug (fin, marke, modell, typ, baujahr, kilometerstand, erstzulassung, kundeId) 
VALUES 
('W1234567890123456', 'Volkswagen', 'Golf', 'Limousine', '2018-01-01', 50000, '2018-01-01', 1),
('X9876543210987654', 'BMW', '3er', 'Limousine', '2019-01-01', 30000, '2019-01-01', 2),
('Y246813579246810', 'Audi', 'A4', 'Limousine', '2020-01-01', 20000, '2020-01-01', 3);

-- Steuersätze
INSERT INTO steuersatz (steuersatz, bezeichnung) 
VALUES 
(19.00, 'Standard'),
(7.00, 'Reduziert'),
(0.00, 'Keine');

-- Rechnungen
INSERT INTO rechnung (rechnungsnummer, rechnungsdatum, fahrzeugId) 
VALUES 
('R123', '2024-03-01', 1),
('R456', '2024-03-02', 2),
('R789', '2024-03-03', 3);

-- Rechnungspositionen (Ersatzteile)
INSERT INTO rechnungsPositionen (ersatzteilMenge, ersatzteileId, rechnungId, steuersatzId) 
VALUES 
(2, 1, 1, 1),
(1, 2, 2, 1),
(3, 3, 3, 1);

-- Leistungen
INSERT INTO leistung (id, beschreibung, stundensatz) 
VALUES 
(1, 'Ölwechsel', 50.00),
(2, 'Bremsenwechsel', 70.00),
(3, 'Inspektion', 100.00);

-- LeistungPositionen
INSERT INTO leistungPosition (arbeitszeit, leistung_id, rechnung_id, steuersatzId) 
VALUES 
(1.5, 1, 1, 1),
(2.0, 2, 2, 1),
(3.0, 3, 3, 1);
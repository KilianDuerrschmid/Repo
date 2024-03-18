use werkstatt;
-- Kunde Test: Geschlecht mehr als ein Zeichen, automatisches Truncate auf richtige Länge
INSERT INTO kunde (anrede, titel, vorname, nachname, email, tel, geschlecht, strasse, plz, ort) 
VALUES 
('Frau', 'Prof.', 'Anna', 'Schmidt', 'anna.schmidt@example.com', '+4987654321', 'www', 'Beispielweg 2', 54321, 'Beispielstadt');

-- Fahrzeug Test: FIN darf nur 17 Zeichen sein
INSERT INTO fahrzeug (fin, kennzeichen, marke, modell, typ, baujahr, erstzulassung, kundeId) 
VALUES 
('W1234567890123456grgrggrrg', 'ABC123', 'Volkswagen', 'Golf', 'Limousine', '2018-01-01', '2018-01-01', 1);

-- Rechnung Test: Kilometerstand darf nur int sein
INSERT INTO rechnung (rechnungsnummer, rechnungsdatum, kilometerstand, fahrzeugId, statusId) 
VALUES 
('R123', '2024-03-01', 'Drei', 1, 1);

-- Position Test: Out of range
INSERT INTO rechnungsPositionen (menge, ersatzteil_leistungId, rechnungId, steuersatzId) 
VALUES 
(2666666666666666666666666666666666666666666666666666666, 1, 1, 1);
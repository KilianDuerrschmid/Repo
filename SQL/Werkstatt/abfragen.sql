use werkstatt;

-- 1.
select k.* from kunde k
left join fahrzeug f on f.kundeId = k.id where f.marke = 'Volkswagen';
-- 2.
select k.* from kunde k
inner join fahrzeug f on f.kundeId = k.id where f.baujahr > 2018-01-01;
-- 3.
select k.plz from kunde k
join fahrzeug f on f.kundeId = k.id
join rechnung r on r.fahrzeugId = f.id where r.kilometerstand > 51000;
-- 4.
select l.* from lieferant l
join ersatzteil_leistung e on e.lieferantId = l.id where e.preis < 100;
-- 5.
select k.* from kunde k
join fahrzeug f on f.kundeId = k.id
join rechnung r on r.fahrzeugId = f.id
join status s on r.statusId = s.id where s.bezeichnung = 'Offen';
-- 6.
select sum(e.preis) from kunde k
join fahrzeug f on f.kundeId = k.id
join rechnung r on r.fahrzeugId = f.id
join rechnungsPositionen rp on rp.rechnungId = r.id
join ersatzteil_leistung e on rp.ersatzteil_leistungId = e.id where k.vorname = 'Max'
 
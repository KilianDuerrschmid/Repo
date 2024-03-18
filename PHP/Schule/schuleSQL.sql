use schule;

select * from klassen;
-- 1
select * from klassen where K_Nr like "%FID";
-- 2
select * from klassen where K_Nr like "1%";
-- 3
select * from klassen where K_Vorstand like "GT";
-- 4
select * from schuljahre where year(Sja_Datumvon) = "2009";
-- 5
select *, datediff(Sja_Datumbis,Sja_Datumvon) AnzTage from schuljahre;
-- 6
select * from staaten where Sta_Euland like "";
-- 7
select * from lehrer where L_Geschlecht = 1 and L_Gehalt > 700;
-- 8
select * from schueler where S_klasse like "%HBG%" order by S_Zuname, S_Vorname;
-- 9
select * from schueler where S_klasse like "%HIF%" and s_vorname in ("Michael", "Alexander");
-- 10
select *, (L_stundengewuenscht - L_stundengehalten) as Stundendifferenz from lehrer where L_stundengewuenscht is not null and (L_stundengewuenscht - L_stundengehalten) < 0;
-- 11
select a.* from abteilungen a
join lehrer l on a.abt_leiter = l.l_nr where a.abt_leiter = "ZLA";
-- 12
select k.k_nr, k.k_jahrsem from klassen k
join schueler s on k.k_nr = s.s_klasse where s.s_postleitzahl in (1210, 1220);
-- 13
select k.k_nr, a.abt_name from klassen k
join abteilungen a on k.k_abteilung = a.abt_id;
-- 14
select l.l_zuname, l.l_vorname from lehrer l
left join abteilungen a on l.l_nr = a.abt_id;
-- 15
select s.* from schueler s
join religionen r on r.rel_nr = s.s_religion;

-- Kein Schüler hat eine Religion in der Tabelle
select count(*) from schueler where s_religion is not null;
-- 16
select k.k_nr, l.l_zuname, l.l_vorname from klassen k
join abteilungen a on k.k_abteilung = a.abt_id
join lehrer l on a.abt_leiter = l.l_nr;
-- 17
select s.s_vorname, s.s_zuname, l.l_vorname, l.l_zuname from klassen k
join schueler s on k.k_nr = s.s_klasse
join lehrer l on k.k_vorstand = l.l_nr where s.s_geschlecht = 2 and l.l_geschlecht = 2;
-- 18
select k.K_Nr, kl.L_Zuname, kl.L_vorname, al.L_Zuname, al.L_vorname from klassen k
join abteilungen a on a.abt_id = k.k_abteilung
join lehrer kl on k.k_vorstand = kl.l_nr
join lehrer al on a.abt_leiter = al.l_nr;
-- 19
select abt_name from abteilungen a
join klassen on abt_id = k_abteilung
join schuljahre on k_jahrsem = sja_nr;
-- weil Joins bereits vorhandene Werte verbinden, also muss nich geprüft werden ob der richtige Wert existiert
-- 20
select s_vorname, s_zuname, (s_gebdatum - k_datumbis) as Tage from schueler
join klassen on s_klasse = k_nr;
-- keine Klasse mit datumbis in der Schueler Tabelle vorhanden
-- 21
select s_vorname, l_vorname from schueler
join lehrer on s_vorname = l_vorname;
-- 22
select k_nr, coalesce(k_datumvon, sja_datumvon), coalesce(k_datumbis, sja_datumbis) from klassen
join schuljahre on k_jahrsem = sja_nr;
-- 23
-- 24
select k_nr, k_jahrsem from klassen where k_nr not in(select s_klasse from schueler);
-- 25
select l.l_nr, l.l_vorname, l.l_zuname, al.l_vorname, al.l_zuname  from lehrer l
left join klassen k on l.l_nr = k.k_vorstand
left join abteilungen a on k.k_abteilung = a.abt_id
left join lehrer al on a.abt_leiter = al.l_nr;
-- 26
select * from lehrer 
where l_nr in (select k_vorstand from klassen) 
and l_nr not in (select abt_leiter from abteilungen); 
-- 27
-- 28
-- Nein, da K_Vorstand mit einem FK auf L_Nr verweist sollte es keine KV geben, die nicht in der Lehrer Tabelle vorhanden sind.
select k_vorstand from klassen where k_vorstand not in (select l_nr from lehrer);
-- 29
select k_jahrsem, count(k_nr) from klassen group by k_jahrsem;
-- 30
select sja_nr, count(k_nr) from schuljahre
left join klassen on k_jahrsem = sja_nr group by sja_nr;
-- 31
select k_nr, count(s_zuname) from klassen
left join schueler on k_nr = s_klasse group by k_nr;
-- 32
select s_postleitzahl, count(s_nr) from schueler 
where s_geschlecht = 1 group by s_postleitzahl;
-- 33
select max(Anzahl) as max from (select s_postleitzahl, count(s_nr) as Anzahl from schueler 
where s_geschlecht = 1 group by s_postleitzahl) as statement;
-- 34
select min(s_zuname), max(s_zuname), min(s_gebdatum), max(s_gebdatum) from schueler;
-- 35
select Datum, Anzahl from (select date(s_gebdatum) Datum, count(s_nr) Anzahl from schueler group by s_gebdatum) as queryAnzahl where Anzahl > 1;
-- 36
select Klasse, AnzahlKlasse, Geschlecht, AnzahlGeschlecht from (select s_klasse Klasse, count(s_nr) AnzahlKlasse from schueler group by s_klasse) as queryKlasse,
(select s_geschlecht Geschlecht, count(s_nr) AnzahlGeschlecht from schueler group by s_geschlecht) as queryGeschlecht;
-- 37
select l_nr, l_vorname, l_zuname, count(k.k_nr) AnzahlKlassen from lehrer l
join klassen k on l.l_nr = k.k_vorstand group by l_nr, l_vorname, l_zuname;




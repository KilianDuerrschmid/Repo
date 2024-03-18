select * from players;

alter table players add column vorname varchar (50) null after playerno;

update players set vorname = 'Max' where sex = 'M';
update players set vorname = 'Maria' where sex = 'F';

select vorname, name, concat(left(vorname, 2), left(name, 2)) Kurz from players;

create view NameKurz as select vorname, name, concat(left(vorname, 2), left(name, 2)) Kurz from players;

select * from NameKurz;

select count(*) from players;

select count(*) from players where year_of_birth not like '196%';

select vorname, name, (year(curdate()) - year_of_birth) as Age from players;

create view dauer as select vorname, name, (year(curdate()) - year_joined) as Dauer from players;

select * from dauer where Dauer > 50;

 


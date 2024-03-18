

SET character_set_client=latin1;
SET character_set_connection=latin1;
SET character_set_database=latin1;  
SET character_set_results=latin1;
SET character_set_server=latin1;  
SET collation_connection=latin1_german1_ci;
SET collation_database=latin1_german1_ci;
SET collation_server=latin1_german1_ci;

DROP DATABASE IF EXISTS tennis; 

CREATE DATABASE tennis;
SET sql_mode = '';
USE tennis;

/* drop table players;
drop table teams;
drop table matches;
drop table penalties; */

create table players
 (playerno integer not null,
  name varchar(15) CHARACTER SET latin1 COLLATE latin1_german1_ci,
  initials varchar(3) CHARACTER SET latin1 COLLATE latin1_german1_ci,
  year_of_birth integer,
  sex varchar(1) CHARACTER SET latin1 COLLATE latin1_german1_ci,
  year_joined integer,
  street varchar(15) CHARACTER SET latin1 COLLATE latin1_german1_ci,
  houseno varchar(4) CHARACTER SET latin1 COLLATE latin1_german1_ci,
  postcode varchar(6) CHARACTER SET latin1 COLLATE latin1_german1_ci,
  town varchar(10) CHARACTER SET latin1 COLLATE latin1_german1_ci,
  phoneno varchar(10) CHARACTER SET latin1 COLLATE latin1_german1_ci,
  leagueno varchar(4) CHARACTER SET latin1 COLLATE latin1_german1_ci);

create table teams
 (teamno integer not null,
  playerno integer,
  division varchar(6) CHARACTER SET latin1 COLLATE latin1_german1_ci);

create table matches
 (matchno integer not null,
  teamno integer,
  playerno integer,
  won integer,
  lost integer);

create table penalties
 (paymentno integer not null,
  playerno integer,
  pen_date date,
  amount decimal(7,2));

insert into players values (6,'Parmenter','R',1964,'M',1977,'Haseltine Lane',  '80','1234KK','Stratford','070-476537','8467');
insert into players values (44,'Baker','E',1963,'M',1980,'Lewis Street',  '23','4444LJ','Inglewood','070-368753','1124');
insert into players values (83,'Hope','PK',1956,'M',1982,'Magdalena Road',  '16A','1812UP','Stratford','070-353548','1608');
insert into players values (2,'Everett','R',1948,'M',1975,'Stoney Road',  '43','3575NH','Stratford','070-237893','2411');
insert into players values (27,'Collins','DD',1964,'F',1983,'Long Drive',  '804','8457DK','Eltham','079-234857','2513');
insert into players values (104,'Moorman','D',1970,'F',1984,'Stout Street',  '65','9437AO','Eltham','079-987571','7060');
insert into players values (7,'Wise','GWS',1963,'M',1981,'Edgecombe Way',  '39','9758VB','Stratford','070-347689',NULL);
insert into players values (57,'Brown','M',1971,'M',1985,'Edgecombe Way',  '16','4377CB','Stratford','070-473458','6409');
insert into players values (39,'Bishop','D',1956,'M',1980,'Eaton Square',  '78','9629CD','Stratford','070-393435',NULL);
insert into players values (112,'Bailey','IP',1963,'F',1984,'Vixen Road',  '8','6392LK','Plymouth','010-548745','1319');
insert into players values (8,'Newcastle','B',1962,'F',1980,'Station Road',  '4','6584RQ','Inglewood','070-458458','2983');
insert into players values (100,'Parmenter','P',1963,'M',1979,'Haseltine Lane',  '80','1234KK','Stratford','070-494593','6524');
insert into players values (28,'Collins','C',1963,'F',1979,'Old Main Road',  '10','1294QK','Midhurst','071-659599',NULL);
insert into players values (95,'Miller','P',1963,'M',1972,'High Street',  '33A','5746OP','Douglas','070-867564',NULL);

insert into teams values (1,6,'first');
insert into teams values (2,27,'second');

insert into matches values (1,1,6,3,1);
insert into matches values (2,1,6,2,3);
insert into matches values (3,1,6,3,0);
insert into matches values (4,1,44,3,2);
insert into matches values (5,1,83,0,3);
insert into matches values (6,1,2,1,3);
insert into matches values (7,1,57,3,0);
insert into matches values (8,1,8,0,3);
insert into matches values (9,2,27,3,2);
insert into matches values (10,2,104,3,2);
insert into matches values (11,2,112,2,3);
insert into matches values (12,2,112,1,3);
insert into matches values (13,2,8,0,3);

insert into penalties values (1,6,'1980-12-08',100.0);
insert into penalties values (2,44,'1981-05-05',75.0);
insert into penalties values (3,27,'1983-09-10',100.0);
insert into penalties values (4,104,'1984-12-08',50.0);
insert into penalties values (5,44,'1980-12-08',25.0);
insert into penalties values (6,8,'1980-12-08',25.0);
insert into penalties values (7,44,'1982-12-30',30.0);
insert into penalties values (8,27,'1984-11-12',75.0);

SELECT * FROM players;


 



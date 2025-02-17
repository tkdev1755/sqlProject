.read commands.sql

select "Starting amaury's commands"; 

/* Partie AMAURY */

/*Exercice 4
.output q4.txt */
select marque, type
from vehicule v
where annee = 2018;
.output

/*Exercice 5
.output q5.txt */
drop view vehicule_loue;
create view vehicule_loue as 
select c.nom, v.marque, v.annee, v.type, l.debut, ifnull(l.fin, "NULL") as fin
from vehicule v join location l on v.vid = l.vid join client c on c.cid = l.cid;

select *
from vehicule_loue;
.output

/*Exercice 6
.output q6.txt */
select *
from vehicule_loue
where marque = "Renault";
.output

/*Exercice 7
.output q7.txt */
select *
from vehicule_loue
where marque = "Renault" and fin < "NULL";
.output 

/*Exercice 8
.output q8.txt */ 
select nom, count(cid) as nb_locations 
from client join location using(cid)
group by nom
order by nb_locations desc;
.output

/*Exercice 9
.output q9.txt*/ 
select c.nom 
from client c
where not exists (select v.vid from vehicule v where not exists(select * from location l where c.cid = l.cid and l.vid = v.vid));
.output
 /*2eme version*/
select c.nom 
from client c join location l on c.cid = l.cid, vehicule v
group by c.nom
having count(distinct l.vid) = (select count(*) from vehicule);
.output

/*Exercice 12
.output q12.txt 
a. */
drop table malade;
create table malade
(
    patient varchar(20),
    dateDiagnostic date,
    primary key(patient)
);
insert into malade values("Paul Ochon", "2020-02-28");
insert into malade values("Sarah Longe", "2021-04-15");
insert into malade values("Jean Serrien", "2022-01-17");

/* b*/
drop view idMalade;
create view idMalade as 
select c.cid, m.dateDiagnostic
from client c join malade m on c.nom = m.patient;

/*c*/
select c1.cid, c1.nom, l1.debut, l1.fin
from client c1 join location l1 on c1.cid = l1.cid, client c2 join location l2 on c2.cid = l2.cid join idMalade i on i.cid = c2.cid
where c1.cid <> c2.cid and l1.vid = l2.vid and l1.debut > i.dateDiagnostic;



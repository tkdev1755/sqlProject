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
select c.nom, v.marque, v.annee, v.type, l.debut, l.fin
from vehicule v join location l on v.vid = l.vid join client c on c.cid = l.cid;

select *
from vehicule_loue;
.output

/*Exercice 6*/
.output q6.txt 
select *
from vehicule_loue
where marque = "Renault";
.output

/*Exercice 7
.output q7.txt */
select*
from vehicule_loue
where marque = "Renault" and fin is not NULL;
.output 

/*Exercice 8
.output q8.txt */ 
select nom, count(cid) as nb_locations 
from client join location using(cid)
order by nb_locations desc
group by nom;
.output

/*Exercice 9
.output q9.txt*/ 
select nom 
from client c
where exists(select l.vid from location l where c.cid = l.cid and l.vid = 88) and exists(select l.vid from location l where c.cid = l.cid and l.vid = 89) and exists(select l.vid from location l where c.cid = l.cid and l.vid = 90) 
;
.output
 /*2eme version*/

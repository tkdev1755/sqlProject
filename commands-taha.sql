.read commands.sql



/* Question 10 */
.output q10.txt
select count(*)
from client left outer join location using (cid);

select count(*)
from location left outer join location using (cid);
.output

/* 
    Ici les résultat seront toujours différent à cause du left outer join, Lorsque nous mettons locations à la place de 
    client, on va ajouter les colonnes de la table gauche (location) et étant qu'une location n'est pas défini que par son CID (ID de client)
    Il va y avoir plusieurs tuples dans lesquelles on a le même CID, alors que dans la première requête, nous aurions qu'une seule fois le numéro du client
    car dans la table client, il existe qu'un seul tuple avec un CID donné

    La situation dans laquelle nous aurions le même résultat serait celle où les clients n'aurait loué un véhicule qu'une seule fois chez l'agence
*/

/* Question 11*/

.output q11.txt
    drop table fidelite;
    create table fidelite
    (
        cid integer,
        score float,
        primary key (cid)
    );
    insert into fidelite(cid,score)
    select 
        c.cid,
        coalesce(sum(case when v.type = "T" then 0.5 else 0 end), 0) * count(case when v.type = "T" then 1 else null end) + 
        coalesce(sum(case when v.type = "U" then 0.75 else 0 end), 0) * count(case when v.type = "U" then 1 else null end)
        as score
    from client c inner join location l on c.cid = l.cid inner join vehicule v on l.vid = v.vid
    group by c.cid;
    select * from fidelite;

    delete from fidelite where score <= 1;
    
.output

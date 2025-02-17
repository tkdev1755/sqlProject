.mode box
PRAGMA foreign_keys = on;


drop table location;
drop table client;
drop table vehicule;

/* Partie TAHA*/
create table client
(
    cid integer  not null ,
    nom varchar(20),
    primary key (cid)
); 

create table vehicule
(
    vid integer not null,
    marque varchar(20),
    annee integer,
    type char(1),
    primary key (vid)
    check(type= 'U' or type='T')
    check(annee > 2000)
);


create table location(
    cid integer,
    vid integer,
    debut date,
    fin date,
    primary key (cid,vid,debut),
    foreign key (cid) references client,
    foreign key (vid) references vehicule
    check(debut<fin)
);



insert into client values(NULL,"Jean Serrien");
insert into client values(NULL, "Paul Ochon");
insert into vehicule values(88, "Renault", 2016, "U");
insert into vehicule values(89, "Peugeot", 2018, "T");
insert into vehicule values(90, "Renault", 2020, "U");
insert into location values(1, 88, "2020-02-15", "2020-02-20");
insert into location values(1,88, "2020-03-10",NULL);
insert into location values(2,88, "2020-01-20", "2020-01-24");
insert into location values(2,89, "2020-01-20", "2020-03-08");
insert into location values(1, 90, "2023-02-01", "2023-03-01");
/* Tests to see if everything was correctly initialized*/
/*select * from vehicule;
select * from client;
select* from location;*/


select 'Finished intializing database'; 








































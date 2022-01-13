create table
agenda(
id number(3),
nume varchar2(20),
prenume varchar2(20),
nr_tel char(14));

alter table agenda
add constraint id primary key (id);

SELECT * FROM agenda;

create table
agenda(
id number(3) PRIMARY KEY,
nume varchar2(20) NOT NULL,
prenume varchar2(20),
nr_tel number(10) NOT NULL)
create sequence
PK_agenda START WITH 5 INCREMENT BY 1
create sequence
PK_agenda;

create sequence PK_agenda;

insert into agenda values (PK_agenda.NEXTVAL, 'PopeAAAsacu','Ion',0217011010)

SELECT DBMS_ROWID.ROWID_BLOCK_NUMBER(rowid),rowid FROM agenda;

insert into agenda values (
(
SELECT id
FROM agenda
WHERE rowid = (
    select
       max(rowid)
    from
       agenda))+1
, 'PopeAAAsacu','Ioaan',0217011010);

SELECT *
FROM agenda
WHERE rowid = (
    select
       max(rowid)
    from
       agenda);
       
       
insert into
agenda
values
(PK_agenda.NEXTVAL, 'Poaaaaaaapescu','Ion',0217011010);

create table angajati(
    id number(3) PRIMARY KEY,
    nume varchar2(128) NOT NULL,
    prenume varchar2(128) NOT NULL,
    cnp varchar2(13) NOT NULL,
    salariu NUMBER(3)
);

ALTER TABLE angajati ADD DataNast DATE;

create sequence PK_angajati;

insert into angajati values (PK_angajati.NEXTVAL, 'PopeAAAsacu','Ion','0217011010', 420, '01-Aug-2000');
insert into angajati values (PK_angajati.NEXTVAL, 'PopeasdasdAAAsacu','Ion','0217011010', 420, '01-Aug-2000');
insert into angajati values (PK_angajati.NEXTVAL, 'PopaaaeAAAsacu','Ion','0217011010', 420, '01-Aug-2000');
insert into angajati values (PK_angajati.NEXTVAL, 'PopeasdasdadsAAAsacu','Ion','0217011010', 420, '01-Aug-2000');

SELECT * FROM Angajati;

UPDATE angajati
SET salariu = salariu + 100
WHERE ID = 1;

UPDATE angajati
SET salariu = salariu + 200 
WHERE ID = 2;

UPDATE angajati
SET salariu = (salariu* 1.1) 
WHERE ID != 1 OR ID != 2;

ALTER TABLE Angajati MODIFY Salariu DEFAULT 999;

UPDATE angajati
SET nume = UPPER(nume);

DELETE FROM angajati WHERE mod(salariu, 5) = 0;
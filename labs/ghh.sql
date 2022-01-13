CREATE TABLE Carti (
Cod NUMBER(4) PRIMARY KEY,
Titlu VARCHAR(20),
Autor VARCHAR(20),
Data_ap DATE CHECK (Data_ap > DATE'2000-01-01'),
UNIQUE (Titlu, Autor, Data_ap)
);
create sequence PK_agenda;
INSERT INTO Carti(Cod, Titlu, Autor, Data_ap)
VALUES (PK_agenda.NEXTVAL ,'asdasd', 'asd', '01-Jun-2000');
INSERT INTO Carti(Cod, Titlu, Autor, Data_ap)
VALUES (PK_agenda.NEXTVAL ,'asdasd', 'asd', '01-Jun-2000');

CREATE TABLE Clienti (
Cod_client NUMBER(4)
PRIMARY KEY,
Nume VARCHAR2(20) NOT NULL,
Adresa VARCHAR2(20),
Telefon VARCHAR2(15));

CREATE TABLE Facturi (
Nr_fact NUMBER(4) PRIMARY KEY,
Data_fact DATE,
Cod_client NUMBER(4),
Valoare NUMBER(5),
FOREIGN KEY (Cod_client) REFERENCES Clienti (Cod_client));


INSERT INTO Clienti(Cod_client, Nume, Adresa, Telefon)
VALUES (PK_agenda.NEXTVAL ,'asdasd', 'asd', '0');

INSERT INTO Clienti(Cod_client, Nume, Adresa, Telefon)
VALUES (PK_agenda.NEXTVAL ,'asdasaaad', 'asd', '0');

INSERT INTO Clienti(Cod_client, Nume, Adresa, Telefon)
VALUES (PK_agenda.NEXTVAL ,'asdzzzzzzzasd', 'asd', '0');

INSERT INTO Clienti(Cod_client, Nume, Adresa, Telefon)
VALUES (PK_agenda.NEXTVAL ,'asddddddddddasd', 'asd', '0');

INSERT INTO Clienti(Cod_client, Nume, Adresa, Telefon)
VALUES (PK_agenda.NEXTVAL ,'asddddddddddasd', 'asd', '0');

INSERT INTO Facturi(Nr_fact, Data_fact, Cod_client, Valoare)
VALUES (PK_agenda.NEXTVAL ,'01-Jun-2000', 25, 0);
INSERT INTO Facturi(Nr_fact, Data_fact, Cod_client, Valoare)
VALUES (PK_agenda.NEXTVAL ,'01-Jun-2000', 25, 0);
INSERT INTO Facturi(Nr_fact, Data_fact, Cod_client, Valoare)
VALUES (PK_agenda.NEXTVAL ,'01-Jun-2000', 26, 0);
INSERT INTO Facturi(Nr_fact, Data_fact, Cod_client, Valoare)
VALUES (PK_agenda.NEXTVAL ,'01-Jun-2010', 300, 0);

INSERT INTO Facturi(Nr_fact, Data_fact, Cod_client, Valoare)
VALUES (PK_agenda.NEXTVAL ,'01-Jun-2040', 25, 0);
DELETE FROM Clienti WHERE Cod_client = 1;
DELETE FROM Clienti WHERE Cod_client = 25;
DELETE FROM Facturi WHERE Data_fact = '01-Jun-2040';

SELECT *
FROM Clienti;

SELECT *
FROM Facturi;

ALTER TABLE Facturi ADD CONSTRAINT FK_Facturi
FOREIGN KEY (Cod_client) REFERENCES Clienti (Cod_client) ON DELETE CASCADE;

CREATE TABLE Medic(
Cod_medic NUMBER(2) PRIMARY KEY,
Nume VARCHAR2(20),
Prenume VARCHAR2(20),
Specializare VARCHAR2(20),
Cod_Cabinet NUMBER(2),
FOREIGN KEY (Cod_Cabinet) REFERENCES Cabinet (Cod_cabinet) ON DELETE CASCADE
);

CREATE TABLE Cabinet(
Cod_cabinet NUMBER(2) PRIMARY KEY,
Nume VARCHAR2(20),
Dotari VARCHAR2(30)
);

CREATE TABLE Programare(
cod_pacient NUMBER(2),
Cod_medic NUMBER(2),
data_programarii DATE,
FOREIGN KEY (cod_pacient) REFERENCES Pacient(cod_pacient) ON DELETE CASCADE,
FOREIGN KEY (cod_medic) REFERENCES Pacient(cod_pacient) ON DELETE CASCADE
);

CREATE TABLE Pacient(
Cod_pacient NUMBER(2) PRIMARY KEY,
CNP NUMBER(13),
Nume VARCHAR(20),
Prenume VARCHAR(20),
tel VARCHAR(15),
Cod_Cabinet NUMBER(2)
);


CREATE TABLE Consusltatie(
cod_consultatie NUMBER(2) PRIMARY KEY,
Cod_pacient NUMBER(2),
Cod_medic NUMBER(2),
data_consult DATE,
mentiuni VARCHAR2(20),
FOREIGN KEY (cod_pacient) REFERENCES Pacient(cod_pacient) ON DELETE CASCADE,
FOREIGN KEY (cod_medic) REFERENCES Medic(cod_medic) ON DELETE CASCADE
);

INSERT INTO Medic(Cod_medic, Nume, Prenume, Specializare, Cod_Cabinet)
VALUES (1 ,'asdasd', 'asdasdads', 'asd', 1);
INSERT INTO Pacient(Cod_pacient, CNP, Nume, Prenume,tel, Cod_Cabinet)
VALUES (1 ,1, 'asdasdads', 'asd', 0, 1);
INSERT INTO Consusltatie(cod_consultatie, Cod_pacient, Cod_medic, data_consult,mentiuni)
VALUES (1 ,1, 1, '01-Jun-2020', 'asd');
INSERT INTO Programare(cod_pacient, Cod_medic, data_programarii)
VALUES (1 ,1, '01-Jun-2020');


SET SERVEROUTPUT ON;
DECLARE
 TYPE V_ORASE IS VARRAY(7) OF VARCHAR2(30); -- tipul varray

 -- inițializarea unei variabile de tip v_orase:
 orase V_ORASE := V_ORASE('Cluj', 'Arad', 'Iasi', 'Bacau');

 PROCEDURE afiseaza IS
 BEGIN
 DBMS_OUTPUT.PUT_LINE('Orasele sunt:');

 FOR i IN 1..orase.COUNT LOOP
 DBMS_OUTPUT.PUT_LINE(i || '.' || orase(i));
 END LOOP;
 
 DBMS_OUTPUT.PUT_LINE('-----');
 END;

BEGIN
 afiseaza;
 -- schimb un oras
 orase(2) := 'Oradea'; -- Schimb valoarea elementului nr. 2
 afiseaza;
 -- extindem vectorul daca dorim adaugarea de elemente:
 orase.EXTEND;
 -- apoi putem adauga un element
 orase(5) := 'Buzau';
 afiseaza;
 -- daca dorim stergerea ultimului element
 orase.TRIM;
 afiseaza;
END;
/

SET SERVEROUTPUT ON;
DECLARE
 TYPE tip_v_nume IS VARRAY(107) OF VARCHAR2(30);
 TYPE tip_v_prenume IS VARRAY(107) OF VARCHAR2(30);
 v_nume tip_v_nume;
 v_prenume tip_v_prenume;

BEGIN
 SELECT first_name, last_name BULK COLLECT INTO v_prenume, v_nume
 FROM Employees
 WHERE Employee_ID > 200;
 FOR i in 1 .. v_nume.COUNT LOOP
 DBMS_OUTPUT.PUT_LINE('Nume si prenume: ' || v_nume(i) || ' ' ||
 v_prenume(i));
 END LOOP;
END;
/

SET SERVEROUTPUT ON;
DECLARE
 TYPE tip_zile IS TABLE OF Varchar2(15);
 var_zile tip_zile := tip_zile(); --initializare cu metoda constructor
 i Number;

BEGIN
 var_zile.EXTEND(7); -- aloc 7 elemente
 var_zile(1) := 'Luni';
 var_zile(2) := 'Marti';
 var_zile(3) := 'Miercuri';
 var_zile(4) := 'Joi';
 var_zile(5) := 'Vineri';
 var_zile(6) := 'Sambata'; 
  var_zile(7) := 'Duminica';

 FOR i IN 1 .. var_zile.COUNT LOOP
 DBMS_OUTPUT.PUT_LINE(var_zile(i));
 END LOOP;
END;
/ 
DECLARE
 TYPE tip_numere IS TABLE OF NUMBER;
 v_numere tip_numere := tip_numere(1,2,3,4,5);
 i NUMBER;
BEGIN
 v_numere.DELETE(2); -- sterg elementul al doilea
 i := v_numere.FIRST;

 WHILE i IS NOT NULL LOOP
 DBMS_OUTPUT.PUT_LINE('v_numere(' || i || ') = ' || v_numere(i));
 i := v_numere.NEXT(i);
 END LOOP;
END;
/ 
CREATE OR REPLACE TYPE tip_imbricat AS TABLE OF VARCHAR2(30);
/
CREATE TABLE tabela_n (id NUMBER, col1 tip_imbricat)
 NESTED TABLE col1 STORE AS denumire1;

INSERT INTO tabela_n VALUES (1, tip_imbricat('A'));
INSERT INTO tabela_n VALUES (2, tip_imbricat('B', 'C'));
INSERT INTO tabela_n VALUES (3, tip_imbricat('D', 'E', 'F'));
COMMIT;

SELECT * FROM tabela_n; 

CREATE TYPE tip_persoana AS OBJECT (
 id NUMBER,
 nume VARCHAR2(30),
 telefon VARCHAR2(20),
 MAP MEMBER FUNCTION get_id RETURN NUMBER,
 MEMBER PROCEDURE afiseaza (
 SELF IN OUT NOCOPY tip_persoana)
 );
/
CREATE TYPE BODY tip_persoana AS
 MAP MEMBER FUNCTION get_id RETURN NUMBER IS
 BEGIN
 RETURN id;
 END;
 MEMBER PROCEDURE afiseaza (
 SELF IN OUT NOCOPY tip_persoana ) IS
 BEGIN
 DBMS_OUTPUT.PUT_LINE('Numele e' || ' ' || nume);
 DBMS_OUTPUT.PUT_LINE('Telefonul e' || ', ' || telefon);
 END;
END;
/ 

CREATE OR REPLACE TYPE Vehicul AS OBJECT (
 nr VARCHAR(10),
 marca VARCHAR2(30),
 pret NUMBER(5),
 MAP MEMBER FUNCTION get_nr RETURN NUMBER,
 MEMBER FUNCTION afiseaza RETURN VARCHAR2)
 NOT FINAL;
/
CREATE TYPE Automobil UNDER Vehicul (
 nr_pasageri NUMBER,
 viteza_max NUMBER,
 OVERRIDING MEMBER FUNCTION afiseaza RETURN VARCHAR2)
 NOT FINAL;
/ 


CREATE TYPE Automobil UNDER Vehicul (
 nr_pasageri NUMBER,
 viteza_max NUMBER,
 OVERRIDING MEMBER FUNCTION afiseaza RETURN VARCHAR2)
 NOT FINAL;
/ 
CREATE TYPE BODY Automobil AS
 OVERRIDING MEMBER FUNCTION afiseaza RETURN VARCHAR2 IS
 BEGIN
 RETURN (self AS Vehicul).afiseaza || ' - Nr pasageri: ' || nr_pasageri ;
 END;
END;
/ 
CREATE TABLE autoturisme OF Automobil;
INSERT INTO autoturisme VALUES ('B-01-ABC', 'Dacia', 10000,5,180);
SELECT * FROM autoturisme;
SELECT a.afiseaza() FROM autoturisme a where a.marca='Dacia';


CREATE TYPE dreptunghi_a AS OBJECT (
 id NUMBER,
 lungime NUMBER(30),
 latime NUMBER(20),
 MAP MEMBER FUNCTION get_id RETURN NUMBER,
 MEMBER PROCEDURE get_area (
 SELF IN OUT NOCOPY dreptunghi_a)
 ); 
/ 

CREATE TYPE BODY dreptunghi_a AS
 MAP MEMBER FUNCTION get_id RETURN NUMBER IS
 BEGIN
 RETURN id;
 END;
 MEMBER PROCEDURE get_area (
 SELF IN OUT NOCOPY dreptunghi_a ) IS
 BEGIN
 DBMS_OUTPUT.PUT_LINE(lungime*latime);
 END;
END;
/

set serveroutput on;
DECLARE
 p dreptunghi_a;
BEGIN
 p := dreptunghi_a(1, 10, 2);
 p.get_area;

END;
/ 

SET SERVEROUTPUT ON -- seteaza afisarea rezultatului pe ecran
BEGIN
/* functia de afisare a textului ‘Hello world !’ */
DBMS_OUTPUT.PUT_LINE('Hello world !');
END;
/

SET SERVEROUTPUT ON
DECLARE
salariu_lunar NUMBER(4);
zile_lucrate NUMBER(2);
plata_zilnica NUMBER(6,2);
BEGIN
salariu_lunar := 2000;
zile_lucrate := 0;
plata_zilnica := salariu_lunar / zile_lucrate;
DBMS_OUTPUT.PUT_LINE('Salariul pe zi este ' || TO_CHAR(plata_zilnica) || ' lei.');
EXCEPTION
WHEN ZERO_DIVIDE THEN
plata_zilnica := 0;
END;
/

SET SERVEROUTPUT ON
DECLARE
a NUMBER(5,2);
b NUMBER(5,2);
c NUMBER(5,2);
media NUMBER(5,2);
BEGIN
a := 5;
b := 1;
c := 7;
media := (a+b+c)/3;
DBMS_OUTPUT.PUT_LINE('Medie: ' || TO_CHAR(media));
EXCEPTION
WHEN ZERO_DIVIDE THEN
media := 0;
END;
/

SET SERVEROUTPUT ON
DECLARE
Prenume VARCHAR2(20);
Nume VARCHAR2(10);
BEGIN
SELECT first_name, last_name INTO Prenume, Nume
FROM Employees
WHERE Employee_ID = 200;
DBMS_OUTPUT.PUT_LINE('Nume si prenume: ' || Nume || ' ' || Prenume);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Nu exista date');
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE('Mai multe linii');
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Alta exceptie');
END;
/

SET SERVEROUTPUT ON;
DECLARE
a NUMBER := 5; b NUMBER := 7; x NUMBER; -- Schimbati aici valorile pentru a si b
BEGIN
IF (a<>0) THEN
x := -b/a;
DBMS_OUTPUT.PUT_LINE(' x = ' || TO_CHAR(x));
ELSE
IF (b<>0) THEN
DBMS_OUTPUT.PUT_LINE('Fara solutie');
ELSE
DBMS_OUTPUT.PUT_LINE('Nedeterminare');
END IF;
END IF;
END;
/

SET SERVEROUTPUT ON;
DECLARE
Nota NUMBER(2);
BEGIN
Nota := 8;
CASE Nota
WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('Excelent');
WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('Foarte bine');
WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('Bine');
WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('Satisfacator');
WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('Slab');
WHEN 5 THEN DBMS_OUTPUT.PUT_LINE('De trecere');
ELSE DBMS_OUTPUT.PUT_LINE('Nota prea mica (<5) sau Inexistenta (>10)');
END CASE;
END;
/

DECLARE
i NUMBER(2) :=1;
BEGIN
LOOP
DBMS_OUTPUT.PUT_LINE('i=' || TO_CHAR(i*i));
EXIT WHEN i = 10;
i := i+1;
END LOOP;
END;
/

SELECT * FROM employees;

SET SERVEROUTPUT ON
DECLARE
Salariu_Mediu Number(8,2);
Salariu_angajat Number(8,2);
Nume VARCHAR2(512);
BEGIN
SELECT First_name, Salary INTO Nume, Salariu_angajat
FROM Employees
WHERE Employee_ID = 105;
DBMS_OUTPUT.PUT_LINE('Salariu angajat random: ' || TO_CHAR(Salariu_angajat));

SELECT AVG(salary) INTO Salariu_mediu 
FROM employees
WHERE JOB_ID='IT_PROG';
DBMS_OUTPUT.PUT_LINE('Salariu mediu: ' || TO_CHAR(Salariu_mediu));

IF (Salariu_Mediu<Salariu_angajat) THEN
DBMS_OUTPUT.PUT_LINE(TO_CHAR(NUME) || 'are salariul alariu mai mare');
ELSE
DBMS_OUTPUT.PUT_LINE(TO_CHAR(NUME) || 'are salariul alariu mai mic');
END IF;

END;
/

CREATE TABLE SeasonHashMap (
    id NUMBER(4) PRIMARY KEY,
    season VARCHAR2(20)
);

create sequence PK_SEASON;
INSERT INTO SeasonHashMap(id, season)
VALUES (PK_SEASON.NEXTVAL ,'WINTER');
INSERT INTO SeasonHashMap(id, season)
VALUES (PK_SEASON.NEXTVAL ,'WINTER');
INSERT INTO SeasonHashMap(id, season)
VALUES (PK_SEASON.NEXTVAL ,'SPRING');
INSERT INTO SeasonHashMap(id, season)
VALUES (PK_SEASON.NEXTVAL ,'SPRING');
INSERT INTO SeasonHashMap(id, season)
VALUES (PK_SEASON.NEXTVAL ,'SPRING');
INSERT INTO SeasonHashMap(id, season)
VALUES (PK_SEASON.NEXTVAL ,'SUMMER');
INSERT INTO SeasonHashMap(id, season)
VALUES (PK_SEASON.NEXTVAL ,'SUMMER');
INSERT INTO SeasonHashMap(id, season)
VALUES (PK_SEASON.NEXTVAL ,'SUMMER');
INSERT INTO SeasonHashMap(id, season)
VALUES (PK_SEASON.NEXTVAL ,'AUTOMN');
INSERT INTO SeasonHashMap(id, season)
VALUES (PK_SEASON.NEXTVAL ,'AUTOMN');
INSERT INTO SeasonHashMap(id, season)
VALUES (PK_SEASON.NEXTVAL ,'AUTOMN');
INSERT INTO SeasonHashMap(id, season)
VALUES (PK_SEASON.NEXTVAL ,'WINTER');

SELECT * FROM SeasonHashMap;

SET SERVEROUTPUT ON
DECLARE
season varchar2(20);
BEGIN
SELECT season INTO season
FROM SeasonHashMap
WHERE id = 3;
;
DBMS_OUTPUT.PUT_LINE('SEASON: ' || season);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Nu exista date');
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE('Mai multe linii');
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Alta exceptie');
END;
/

create sequence PK_BONUS;

DROP TABLE BONUS;

CREATE TABLE BONUS (
    v_id NUMBER(4) PRIMARY KEY,
    v_salariu NUMBER(8,2)
);

SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 101;
SELECT * FROM BONUS;


SET SERVEROUTPUT ON
DECLARE
salary  NUMBER(8,2);
id NUMBER(4);
BEGIN

FOR i IN 102..110
LOOP
   SELECT EMPLOYEE_ID, SALARY INTO id, salary 
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = i;
    
    salary := salary * 1.1;
    
    INSERT INTO BONUS(v_id, v_salariu)
    VALUES (id ,salary);
END LOOP;

EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Nu exista date');
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE('Mai multe linii');
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Alta exceptie');
END;
/

DECLARE
BEGIN

UPDATE BONUS
SET v_salariu = v_salariu * 0.75 
WHERE v_salariu > 9000;

UPDATE BONUS
SET v_salariu = v_salariu * 1.1
WHERE v_salariu < 6000;

EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Nu exista date');
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE('Mai multe linii');
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Alta exceptie');
END;
/

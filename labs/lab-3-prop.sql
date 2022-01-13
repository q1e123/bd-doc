CREATE TABLE Echipa (
    id NUMBER(4) PRIMARY KEY,
    Nume VARCHAR2(20) NOT NULL
);

CREATE TABLE Jucator (
    id NUMBER(4) PRIMARY KEY,
    Nume VARCHAR2(20) NOT NULL,
    echipa_id NUMBER(4),
    FOREIGN KEY (echipa_id) REFERENCES Echipa(id)
);

create sequence PK_echipa;
create sequence PK_jucator;

INSERT INTO Echipa(id, nume)
VALUES (PK_echipa.NEXTVAL ,'asdasd');
INSERT INTO Echipa(id, nume)
VALUES (PK_echipa.NEXTVAL ,'aaa');
INSERT INTO Jucator(id, nume, echipa_id)
VALUES (PK_agenda.NEXTVAL ,'qqqq', 1);
INSERT INTO Jucator(id, nume, echipa_id)
VALUES (PK_agenda.NEXTVAL ,'www', 1);
INSERT INTO Jucator(id, nume, echipa_id)
VALUES (PK_agenda.NEXTVAL ,'eee', 1);

CREATE TABLE Carti (
    id NUMBER(4) PRIMARY KEY,
    title VARCHAR(20),
    author VARCHAR(20)
);


CREATE TABLE books (
    id NUMBER(4) PRIMARY KEY,
    title VARCHAR(20),
    author VARCHAR(20)
);

CREATE TABLE reader (
    id NUMBER(4) PRIMARY KEY,
    name VARCHAR(20)
);


CREATE TABLE Carti_Cititor_Junction (
    id NUMBER(4) PRIMARY KEY,
    carti_id Number(4),
    cititor_id Number(4),
    FOREIGN KEY (carti_id) REFERENCES books(id) ON DELETE CASCADE,
    FOREIGN KEY (cititor_id) REFERENCES reader(id) ON DELETE CASCADE
);


create sequence PK_books;
create sequence PK_reader;
create sequence PK_carrti_cititor_junction;


INSERT INTO books(id, title, author)
VALUES (PK_books.NEXTVAL ,'eee', 'aaa');
INSERT INTO Jucator(id, title, author)
VALUES (PK_books.NEXTVAL ,'rrrr', 'aaa');
INSERT INTO Jucator(id, title, author)
VALUES (PK_books.NEXTVAL ,'etttee', 'aaa');


INSERT INTO reader(id, name)
VALUES (PK_reader.NEXTVAL ,'eee', 'aaa');


SELECT * 
FROM Employees 
WHERE Salary >= 7000 AND Salary <= 10000;

SELECT *
FROM Employees 
WHERE First_name = 'John';

SELECT *
FROM Employees
WHERE hire_date >= '01-DEC-2000';

SELECT *
FROM Employees
WHERE job_id >= 'IT_PROG' and salary >= 5000;


SELECT *
FROM Employees
WHERE job_id = 'ST_CLERK' OR job_id = 'MK_MAN';


SELECT *
FROM Employees
WHERE first_name LIKE '__a%';


SELECT *
FROM Employees
WHERE job_id LIKE '%CLERK%';

SELECT DISTINCT first_name,
last_name FROM Employees;

SELECT DISTINCT first_name
as
Prenume, last_name
as
Nume FROM Employees ;

SELECT First_name, Last_name, Salary
FROM Employees ORDER BY Salary;

SELECT First_name, Last_name, Salary
FROM Employees ORDER BY Last_name, First_name;

CREATE TABLE Programatori AS
SELECT First_name Prenume, Last_Name Nume FROM Employees
WHERE Job_id = 'IT_PROG';

SELECT *
FROM Programatori;

SELECT First_name, Last_name, Salary as "Salariu brut",1.2*Salary as "Propunere marire salariu"
FROM Employees
WHERE JOB_ID LIKE '%MAN%';


SELECT ROUND(Salary/21, 2) as "salariul pe zi"
FROM Employees
WHERE JOB_ID LIKE '%MAN%';

SELECT MIN(Salary) Salariul_min, MAX(Salary) Salariul_max, ROUND(AVG(Salary),2)
Salariul_mediu FROM Employees
WHERE JOB_ID = 'IT_PROG';

SELECT Job_ID, MIN(Salary) Salariul_minim FROM Employees
GROUP BY Job_ID HAVING MIN(Salary) > 7000;

SELECT First_name, Last_name, Salary, Department_ID
FROM Employees
WHERE (Department_ID, Salary
) IN (SELECT Department_ID,
MIN(Salary) FROM Employees
GROUP BY Department_ID);

SELECT First_name, Last_name, Department_name FROM Employees, Departments
WHERE Employees.Department_ID = Departments.Department_ID;
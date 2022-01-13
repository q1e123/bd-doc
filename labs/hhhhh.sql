SELECT * FROM Employees;
SELECT * FROM Departments;

SELECT *
FROM Employees
WHERE department_id = (
    SELECT department_id
    FROM departments
    WHERE departments.department_name = 'Sales'
) AND salary BETWEEN 5000 AND 8000;

SELECT Departments.department_name, COUNT(*) as numar
from Employees 
inner join Departments on Employees.department_id = Departments.department_id 
GROUP BY Departments.department_name
ORDER BY numar;

SET SERVEROUTPUT ON
DECLARE
 total NUMBER(4);
 department_name_ VARCHAR2(32);
BEGIN
    department_name_ := 'Sales';
    SELECT COUNT(*) INTO total
    FROM Employees
    WHERE department_id = (
        SELECT department_id
        FROM departments
        WHERE departments.department_name = department_name_
    );
    DBMS_OUTPUT.PUT_LINE('Total: ' || to_char(total));
END;
/ 
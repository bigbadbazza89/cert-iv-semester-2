-- --------------------------------------------------------------------
-- Filename:   XXX-ICTPRG402-Portfolio-SQL-1.txt
-- Author:     GIVEN & FAMILY NAMES
-- Email:      ID@tafe.wa.edu.au
-- --------------------------------------------------------------------
-- Purpose:   
--    This file contains the SQL used to create and execute 
--    the solutions for the assessment ICTPRG402 Portfolio
-- --------------------------------------------------------------------
-- Declaration:
--    By completing and submitting this assessment 
--    via the Blackboard LMS or other methods, to my 
--    lecturer, I am stating that: 
--      * The attached submission is completely own work 
--      * I have correctly indicated all sources of information
--        used in this work (if required) 
--      * I have kept a copy of this assessment (where practicable)
--      * I understand a copy of my assessment will be kept by
--        NMTAFE for their records 
--      * I understand my assessment may be selected for use in
--        NMTAFE’s validation and audit process to ensure student 
--        assessment is valid and meets requirements of the unit 
--        of competency
-- --------------------------------------------------------------------
--
-- Add your SQL between each heading comment as required.
--
-- --------------------------------------------------------------------


-- --------------------------------------------------------------------
-- Query 01: Write & run a SQL query to find the names of 
--           all the employees 
-- --------------------------------------------------------------------

SELECT given_name, family_name from employees;

-- --------------------------------------------------------------------
-- Query 02: Write & run a SQL query to find all clients 
-- --------------------------------------------------------------------

SELECT client_name FROM clients;

-- --------------------------------------------------------------------
-- Query 03: Write & run a SQL query to find all employees ordered
--           by salary. 
-- --------------------------------------------------------------------

SELECT given_name, family_name, gross_salary FROM employees
ORDER BY gross_salary DESC;

-- --------------------------------------------------------------------
-- Query 04: Write & run a SQL query to find all employees 
--           ordered by gender 
-- --------------------------------------------------------------------

SELECT given_name, family_name, gender_identity FROM employees
ORDER BY gender_identity ASC;

-- --------------------------------------------------------------------
-- Query 05: Write & run a SQL query to find all employees
--           ordered by family name 
-- --------------------------------------------------------------------

SELECT given_name, family_name, gender_identity FROM employees
ORDER BY family_name ASC;

-- --------------------------------------------------------------------
-- Query 06: Write & run a SQL query to find first 5 employees 
--           in the table 
-- --------------------------------------------------------------------

SELECT given_name, family_name FROM employees
LIMIT 5;

-- --------------------------------------------------------------------
-- Query 07: Write & run a SQL query to find employees whose name 
--           starts with a letter ‘A’.
-- --------------------------------------------------------------------

SELECT given_name, family_name FROM employees
WHERE given_name LIKE 'A%';

-- --------------------------------------------------------------------
-- Query 08: Write & run a SQL query to sort all the 
--           employee records in a descending order based on salary.
-- --------------------------------------------------------------------

SELECT * FROM employees
ORDER BY gross_salary DESC;

-- --------------------------------------------------------------------
-- Query 09: Write & run a SQL query to find all male employees 
-- --------------------------------------------------------------------

SELECT given_name, family_name FROM employees
WHERE gender_identity = 'M';

-- --------------------------------------------------------------------
-- Query 10: Write & run a SQL query to find all employees at the
--           Scranton Branch (branch 2) 
-- --------------------------------------------------------------------

SELECT given_name, family_name, branch_id FROM employees
WHERE branch_id = 2;

-- --------------------------------------------------------------------
-- Query 11: Write & run a SQL query to find all employee's IDs 
--           and names who were born after 1969 
-- --------------------------------------------------------------------

SELECT employee_id, given_name, family_name FROM employees
WHERE date_of_birth > '1969-12-31';

-- --------------------------------------------------------------------
-- Query 12: Write & run a SQL query to find all female employees 
--           at Scranton Branch (Branch 2)
-- --------------------------------------------------------------------

SELECT given_name, family_name FROM employees
WHERE gender_identity = 'F' AND branch_id = 2;

-- --------------------------------------------------------------------
-- Query 13: Write & run a SQL query to find all female employees 
--           born after 1969 or who has salary greater than 80000.
-- --------------------------------------------------------------------

SELECT given_name, family_name FROM employees
WHERE gender_identity = 'F'
AND (date_of_birth > '1969-12-31' OR gross_salary > 80000);

-- --------------------------------------------------------------------
-- Query 14: Write & run a SQL query to find all employees born 
--           between 1970 and 1975.
-- --------------------------------------------------------------------

SELECT given_name, family_name FROM employees
WHERE date_of_birth BETWEEN '1970-01-01' AND '1975-12-31';

-- --------------------------------------------------------------------
-- Query 15: Write & run a SQL query to find all the employees 
--           named Jim, Michael, Johnny or David.
-- --------------------------------------------------------------------

SELECT given_name, family_name FROM employees
WHERE given_name IN ('JIM', 'MICHAEL', 'JOHNNY', 'DAVID');

-- --------------------------------------------------------------------
-- Query 16: Write & run a SQL query to find the name of a client who 
--           has got the word ‘LLC’ in his name.
-- --------------------------------------------------------------------

SELECT client_name FROM clients
WHERE client_name LIKE '%LLC%';

-- --------------------------------------------------------------------
-- Query 17: Write & run a SQL query to find any branch suppliers with
-- label in their name.
-- --------------------------------------------------------------------

SELECT supplier_name FROM branch_suppliers
WHERE supplier_name LIKE '%label%';

-- --------------------------------------------------------------------
-- Query 18: Write & run a SQL query to find any employee born on the 
--           5th day of the month.
-- --------------------------------------------------------------------

SELECT given_name, family_name FROM employees
WHERE DAY(date_of_birth) = 5;

-- --------------------------------------------------------------------
-- Query 19: Write & run a SQL query to find any clients who 
--           has got the word ‘Law’ in their name
-- --------------------------------------------------------------------

SELECT client_name FROM clients
WHERE client_name LIKE '%Law%';


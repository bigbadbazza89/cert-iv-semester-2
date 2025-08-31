-- --------------------------------------------------------------------
-- Filename:   XXX-ICTPRG402-Portfolio-SQL-1.txt
-- Author:     BARRIE ANTHONY SELDON
-- Email:      20146589@tafe.wa.edu.au
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
-- Q01 CREATE DATABASE AND USER
-- --------------------------------------------------------------------
CREATE DATABASE bas_ictprg431; 
USE bas_ictprg431; 
CREATE USER 'bas_ictprg431_user1'@'localhost' IDENTIFIED BY 'Cinnamon1000!';
GRANT ALL ON bas_ictprg431.* TO 'bas_ictprg431_user1'@'localhost' WITH GRANT OPTION; 
FLUSH PRIVILEGES;

-- --------------------------------------------------------------------
-- Q02 EMPLOYEES TABLE
-- --------------------------------------------------------------------
CREATE TABLE `employees` (
    `id`              bigint        UNSIGNED NOT NULL AUTO_INCREMENT,
    `employee_id`     bigint        DEFAULT '0',
    `given_name`      varchar(64),
    `family_name`     varchar(64)   NOT NULL,
    `date_of_birth`   date          DEFAULT '1900-01-01',
    `gender_identity` char(1),
    `gross_salary`    bigint        DEFAULT '0',
    `supervisor_id`   bigint        DEFAULT '0',
    `branch_id`       bigint        DEFAULT '0', 
    `created_at`      timestamp     DEFAULT CURRENT_TIMESTAMP,
    `updated_at`      timestamp     ON UPDATE CURRENT_TIMESTAMP, 
    PRIMARY KEY (id)
);


INSERT INTO `employees` 
    (`date_of_birth`, `employee_id`, `family_name`, `branch_id`, `supervisor_id`, `given_name`, `gross_salary`, `gender_identity`) 
VALUES
	('1967-11-17', 100, 'Wallace', 1, Null, 'David', 25000, 'M'),
    ('1967-05-11', 101, 'Levinson', 1, 100, 'Jan', 110000, 'F'),
    ('1964-03-15', 102, 'Scott', 2, 100, 'Michael', 75000, 'O'),
    ('1971-06-25', 103, 'Martin', 2, 102, 'Angela', 63000, 'F'),
    ('1980-02-05', 104, 'Kapoor', 2, 102, 'Kelly', 55000, 'O'),
    ('1958-02-19', 105, 'Hudson', 2, 102, 'Stanley', 69000, 'M'),
    ('1969-09-05', 106, 'Porter', 3, 100, 'Josh', 78000, 'M'),
    ('1973-07-22', 107, 'Bernard', 3, 106, 'Andy', 65000, 'M'),
    ('1978-10-01', 108, 'Halpert', 3, 106, 'Jen', 71000, 'F');

-- --------------------------------------------------------------------
-- Q03 BRANCHES TABLE
-- --------------------------------------------------------------------
CREATE TABLE `branches` (
    `id`                  BIGINT        UNSIGNED NOT NULL AUTO_INCREMENT,
    `branch_id`           BIGINT        DEFAULT '0',
    `branch_name`         VARCHAR(64)	DEFAULT 'ERROR', 
    `manager_id`          BIGINT        DEFAULT '0',
    `manager_started_at`  DATE          DEFAULT '1970-01-01',
    `created_at`          TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    `updated_at`          TIMESTAMP     ON UPDATE CURRENT_TIMESTAMP, 
    PRIMARY KEY (id)
);

INSERT INTO branches(branch_id,branch_name,manager_id,manager_started_at)
VALUES
    (1, 'Corporate',  100, "2006-02-09"),
    (2, 'Scranton',   102, "1992-04-06"),
    (3, 'Stamford',   106, "1998-02-13");

-- --------------------------------------------------------------------
-- Q04 CLIENTS TABLE
-- --------------------------------------------------------------------

CREATE TABLE `clients` (
    `client_id`           BIGINT        UNSIGNED NOT NULL AUTO_INCREMENT,
    `client_name`         VARCHAR(64)	DEFAULT 'ERROR',
    `branch_id`           BIGINT        UNSIGNED DEFAULT '0',
    `created_at`          TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    `updated_at`          TIMESTAMP     ON UPDATE CURRENT_TIMESTAMP, 
    PRIMARY KEY (client_id)
);

INSERT INTO `clients`
	(`client_id`, `client_name`, `branch_id`)
VALUES
	(400, 'Dunmore Highschool', 2),
    (401, 'Lackawana Country', 2),
	(402, 'FedEx', 3),
	(403, 'John Daly Law, LLC', 3),
	(404, 'Scranton Whitepages', 2),
	(405, 'Times Newspaper', 3),
	(406, 'FedEx', 2);

-- --------------------------------------------------------------------
-- Q05 WORKING WITH TABLE
-- --------------------------------------------------------------------



-- --------------------------------------------------------------------
-- Q06 BRANCH SUPPLIER TABLE 
-- --------------------------------------------------------------------



-- --------------------------------------------------------------------
-- Q07 DUMMY TABLE
-- --------------------------------------------------------------------



-- --------------------------------------------------------------------
-- Q08 ALTERING WORKS WITH TABLE STRUCTURE
-- --------------------------------------------------------------------



-- --------------------------------------------------------------------
-- Q09 RENAME THE DUMMY TABLE
-- --------------------------------------------------------------------



-- --------------------------------------------------------------------
-- Q10 REMOVING A FIELD FROM A TABLE
-- --------------------------------------------------------------------



-- --------------------------------------------------------------------
-- Q11 DESCRIBING TABLE STRUCTURES
-- --------------------------------------------------------------------



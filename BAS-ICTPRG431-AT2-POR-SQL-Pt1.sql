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
    `employee_id`     bigint        NOT NULL DEFAULT '0',
    `given_name`      varchar(64),
    `family_name`     varchar(64)   NOT NULL,
    `date_of_birth`   date          DEFAULT '1900-01-01',
    `gender_identity` char(1),
    `gross_salary`    bigint        DEFAULT '0',
    `supervisor_id`   bigint        DEFAULT '0',
    `branch_id`       bigint        NOT NULL DEFAULT '0', 
    `created_at`      timestamp     DEFAULT CURRENT_TIMESTAMP,
    `updated_at`      timestamp     ON UPDATE CURRENT_TIMESTAMP, 
    PRIMARY KEY (id),
    UNIQUE KEY (employee_id)
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
    `branch_id`           BIGINT        NOT NULL DEFAULT '0',
    `branch_name`         VARCHAR(64)	DEFAULT 'ERROR', 
    `manager_id`          BIGINT        NOT NULL DEFAULT '0',
    `manager_started_at`  DATE          DEFAULT '1970-01-01',
    `created_at`          TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    `updated_at`          TIMESTAMP     ON UPDATE CURRENT_TIMESTAMP, 
    PRIMARY KEY (id),
    UNIQUE KEY (branch_id)
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
    `id`                  BIGINT        UNSIGNED NOT NULL AUTO_INCREMENT,
    `client_id`           BIGINT        NOT NULL DEFAULT '0',
    `client_name`         VARCHAR(64)	DEFAULT 'ERROR',
    `branch_id`           BIGINT        NOT NULL DEFAULT '0',
    `created_at`          TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    `updated_at`          TIMESTAMP     ON UPDATE CURRENT_TIMESTAMP, 
    PRIMARY KEY (id),
    UNIQUE KEY (client_id),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
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

CREATE TABLE `working_with` (
    `id`            BIGINT     UNSIGNED NOT NULL AUTO_INCREMENT,
    `employee_id`   BIGINT     NOT NULL DEFAULT '0',
    `client_id`     BIGINT     NOT NULL DEFAULT '0',
    `total_sales`   BIGINT     DEFAULT '0',
    `created_at`    TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
    `updated_at`    TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP, 
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

INSERT INTO working_with(employee_id,client_id,total_sales)
VALUES
    (105, 400, 55000),
    (102, 401, 267000),
    (108, 402, 22500),
    (107, 403, 5000),
    (108, 403, 12000),
    (105, 404, 33000),
    (107, 405, 26000),
    (102, 406, 15000),
    (105, 406, 130000);


-- --------------------------------------------------------------------
-- Q06 BRANCH SUPPLIER TABLE 
-- --------------------------------------------------------------------

CREATE TABLE `branch_suppliers` (
    `id`               BIGINT         UNSIGNED NOT NULL AUTO_INCREMENT,
    `branch_id`        BIGINT         NOT NULL DEFAULT '0',
    `supplier_name`    VARCHAR(255)   NOT NULL,
    `product_supplied` VARCHAR(255)   NOT NULL,
    `created_at`       TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
    `updated_at`       TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP, 
    PRIMARY KEY (id),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

INSERT INTO branch_suppliers(branch_id,supplier_name,product_supplied)
VALUES
    (2, 'Hammer Mill', 'Paper'),
    (2, 'Uni-Ball', 'Writing Instruments'),
    (3, 'Patriot Paper', 'Paper'),
    (2, 'J.T. Forms & Labels', 'Custom Forms'),
    (3, 'Uni-Ball', 'Writing Instruments'),
    (3, 'Hammer Mill', 'Paper'),
    (3, 'Stamford Labels', 'Custom Forms');

-- --------------------------------------------------------------------
-- Q07 DUMMY TABLE
-- --------------------------------------------------------------------

CREATE TABLE `dummy` (
    `employee_id` int, 
    `employee_name` varchar(20)
);

-- --------------------------------------------------------------------
-- Q08 ALTERING WORKS WITH TABLE STRUCTURE
-- --------------------------------------------------------------------

ALTER TABLE `working_with`
ADD COLUMN `profit`;


-- --------------------------------------------------------------------
-- Q09 RENAME THE DUMMY TABLE
-- --------------------------------------------------------------------

RENAME TABLE `dummy` TO `almost_dummy`;

-- --------------------------------------------------------------------
-- Q10 REMOVING A FIELD FROM A TABLE
-- --------------------------------------------------------------------

ALTER TABLE `working_with`
DROP COLUMN `profit`;


-- --------------------------------------------------------------------
-- Q11 DESCRIBING TABLE STRUCTURES
-- --------------------------------------------------------------------

DESCRIBE branch_suppliers;

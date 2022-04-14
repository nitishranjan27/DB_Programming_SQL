create database Database_Program;

exec sp_databases;   --Show all existing databases in shorts

use Database_Program; 

CREATE TABLE employee_info 
(
   EmployeeID int identity primary key,
   FirstName varchar(255) Not null,
   LastName varchar(255) Not null,
   Address varchar(255),
   City varchar(255),
   PhoneNumber varchar(50),
   Salary money default 1000,
   StartDate DateTime default GetDate()
);

select * from employee_info;

--drop table employee_info;  --- used to drop a table

INSERT INTO employee_info (FirstName,LastName,Address,City,PhoneNumber,Salary,StartDate) VALUES
('Nitish', 'Kumar', 'Ramghar Ranchi Road', 'Ramghar', '8173070619', 400000.00, '2020-01-03'),
('Ravi', 'Singh', 'Ramghar Ranchi Road', 'Ramghar', '7860650519', 400000.00, '2020-01-03'),
('Ajay', 'Kumar', 'Bokaro Steel Plant', 'Ranchi', '9598650519', 500000.00, '2020-01-03'),
('Shani', 'kumar', 'Kopa Patrahi Jaunpur', 'Jaunpur', '7898650519', 500000.00, '2020-01-03'),
('Pawan', 'Verma', 'DLW', 'Varanasi', '9598650519', 400000.00, GETDATE()),
('Suraj', 'Verma', 'Balrampur', 'Jaunpur', '8798650519', 400000.00, GETDATE()),
('Ashok', 'Singh', 'Durgakund', 'Varanasi', '8798650519', 400000.00, '2020-01-03'),
('Akash', 'Patel', 'Lanka', 'Varanasi', '8898650519', 400000.00, GETDATE()),
('Praveen', 'Patil', 'Azamgarh', 'Azamgarh', '7898650525', 400000.00, GETDATE()),
('Anjali', 'Singh', 'Durgakund', 'Varanasi', '8798650519', 400000.00, GETDATE());

Alter Table employee_info add Gender varchar(1);
Alter Table employee_info add State varchar(255);
select * from employee_info;

UPDATE employee_info set Gender = 'M' where FirstName = 'Nitish';   --updating Gender of employees
UPDATE employee_info set Gender = 'M' where LastName = 'Kumar' or FirstName = 'Suraj' or FirstName = 'Pawan' or FirstName = 'Ashok';
UPDATE employee_info set Gender = 'F' where FirstName = 'Anjali';   --updating Gender of employees
UPDATE employee_info set Gender = 'M' where LastName = 'Patil' or FirstName = 'Akash' or FirstName = 'Ravi'
UPDATE employee_info set State = 'UP' Where City = 'Varanasi'
UPDATE employee_info set State = 'MP' Where City = 'Jaunpur'

Delete from employee_info where FirstName='Akash';    
Delete from employee_info where EmployeeID=10;        
select *  from employee_info                          


SELECT * FROM employee_info;
SELECT * FROM employee_info WHERE City='Varanasi';
SELECT * FROM employee_info WHERE City='Varanasi' Order By FirstName;
SELECT City, COUNT (*) FROM employee_info WHERE State = 'UP' Group By City Order By City;
SELECT City, COUNT (*) FROM employee_info WHERE State = 'MP' Group By City Order By City;

SELECT FirstName,LastName FROM employee_info ORDER BY FirstName;

-------------Joins-------------
--First, create a new schema named hr:
CREATE SCHEMA hr;
GO

--Second, create two new tables named candidates and employees in the hr schema:
CREATE TABLE hr.candidates(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);

CREATE TABLE hr.employees(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);

--Third, insert some rows into the candidates and employees tables:
INSERT INTO 
    hr.candidates(fullname)
VALUES
    ('John Doe'),
    ('Lily Singh'),
    ('Peter Parker'),
    ('Jane Doe');

INSERT INTO 
    hr.employees(fullname)
VALUES
    ('John Doe'),
    ('Jane Doe'),
    ('Michael Scott'),
    ('Jack Sparrow');
select * from hr.employees;
select * from hr.candidates;
-------------------SQL Server Inner Join----------------------
--Inner join produces a data set that includes rows from the left table, matching rows from the right table.

SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    hr.candidates c
    INNER JOIN hr.employees e 
        ON e.fullname = c.fullname;

--------------------SQL Server Left Join-------------------
--Left join selects data starting from the left table and matching rows in the right table.

SELECT  
	c.id candidate_id,
	c.fullname candidate_name,
	e.id employee_id,
	e.fullname employee_name
FROM 
	hr.candidates c
	LEFT JOIN hr.employees e 
		ON e.fullname = c.fullname;

--To get the rows that are available only in the left table but not in the right table, 
--you add a WHERE clause to the above query:

SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    hr.candidates c
    LEFT JOIN hr.employees e 
        ON e.fullname = c.fullname
WHERE 
    e.id IS NULL;

--------------------------SQL Server Right Join----------------------------
--The right join or right outer join selects data starting from the right table. It is a reversed version of the left join.

SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    hr.candidates c
    RIGHT JOIN hr.employees e 
        ON e.fullname = c.fullname;

--Notice that all rows from the right table (employees) are included in the result set.

SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    hr.candidates c
    RIGHT JOIN hr.employees e 
        ON e.fullname = c.fullname
WHERE
    c.id IS NULL;

--------------------------------SQL Server full join----------------------------------------
--The full outer join or full join returns a result set that contains all rows from both left and right tables, 
--with the matching rows from both sides where available. In case there is no match, the missing side will have NULL values.

SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    hr.candidates c
    FULL JOIN hr.employees e 
        ON e.fullname = c.fullname;
--To select rows that exist either left or right table, you exclude rows that are common to both tables 
--by adding a WHERE clause as shown in the following query:
SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    hr.candidates c
    FULL JOIN hr.employees e 
        ON e.fullname = c.fullname
WHERE
    c.id IS NULL OR
    e.id IS NULL;
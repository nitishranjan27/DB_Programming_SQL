
---------------------------SQL Server table alias--------------------------------

----Alias-: Alias is used to give a temporary name of table or column.

Create table Employee_s
(
	Emp_ID int identity primary key,
	Name varchar(100) Not null,
	Age int not null,
	Address varchar(255) not null,
	Salary money default 1000,
	Dept_ID int
)

INSERT INTO Employee_s(Name,Age,Address,Salary,Dept_ID) Values
('Nitish',21,'Delhi',600000,3);

INSERT INTO Employee_s(Name,Age,Address,Salary) Values
('Rahul',22,'Mumbai',600000);

INSERT INTO Employee_s(Name,Age,Address,Salary,Dept_ID) Values
('Kamal',23,'Lucknow',500000,3),
('Kiran',24,'Varanasi',400000,1),
('Chirag',28,'Jaunpur',300000,1);

INSERT INTO Employee_s(Name,Age,Address,Salary) Values
('Harsh',19,'Patna',300000),
('Kajal',20,'Pune',600000);

INSERT INTO Employee_s(Name,Age,Address,Salary,Dept_ID) Values
('Mahi',26,'Pune',600000,2),
('Pavan',25,'Jaunpur',600000,2)


select * from Employee_s;

Create table Dept(
	Dept_ID int identity primary key,
	D_Name varchar(100) not null
)

INSERT INTO Dept(D_Name) Values
('Sales'),
('HR'),
('Finance'),
('Marketing')

select * from Dept;

-----------Table Alias Example--------------------------
SELECT 
	E.Emp_ID, E.Name, D.Dept_ID, D.D_Name
FROM 
	Employee_s AS E, Dept AS D
WHERE
	E.Dept_ID=D.Dept_ID;
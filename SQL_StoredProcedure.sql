------------------------------SQL Stored Procedures--------------------------------------------

--A stored procedure is used to retrieve data, modify data, and delete data in database table.


------How to create stored procedure-------

Create Procedure spEmployeeDetails
AS
BEGIN
SELECT * from employee_info where City='Jaunpur';
END

-------------How to execute/call stored procedure---------------------

spEmployeeDetails
Execute spEmployeeDetails
EXEC spEmployeeDetails

Create Procedure spEmployeeDetails2
AS
BEGIN
SELECT * from Employee where EmployeeID=1;
END

EXEC spEmployeeDetails2

------Modified Stored Procedure-------
ALTER Proc spEmployeeDetails2
AS
BEGIN
SELECT * from Employee where EmployeeID=1;
SELECT * from Employee where EmployeeID=2;
END

EXEC spEmployeeDetails2

DROP Proc spEmployeeDetails2  ------- to delete a Stored Procedure

-----------------Parameters in STORED PROCEDURE------------------
------ Two Types:- (1) Input Parameter & (2) Output Parameter
use Database_Program;

Create Procedure spEmployeeDetails2
AS
BEGIN
SELECT * from Employee_s where Dept_ID=1;
SELECT * from Employee_s where Name='Nitish';
END

EXEC spEmployeeDetails2

--------------------------------------------------------
ALTER Proc spEmployeeDetails2
@dept_ID	int,
@name	    Varchar(100)
AS
BEGIN
SELECT * from Employee_s where Dept_ID=@dept_ID;
SELECT * from Employee_s where Name=@name;
END

spEmployeeDetails2 1, 'Nitish'      ---- Order of parameters and value is very important in SP.

----Named Parameter value
spEmployeeDetails2  @name = 'Nitish', @dept_ID = 2         ----In this case order of parameter is not important

-----------------------------------------------------------------------
--Default Parameters (Parameters with Default Values)
ALTER Proc spEmployeeDetails2
@dept_ID	int=1,
@name	    Varchar(100)='Nitish'
AS
BEGIN
SELECT * from Employee_s where Dept_ID=@dept_ID;
SELECT * from Employee_s where Name=@name;
END

spEmployeeDetails2 3, 'Mahi'   


---------------------------------------------------------------------------

--OUTPUT PARAMETER
Create Proc spAddDigits
@num1 INT,
@num2 INT,
@result INT OUTPUT
AS
BEGIN
	SET @result = @num1 + @num2;
END

Declare @var money
EXEC spAddDigits 27, 23, @Var OUTPUT;
SELECT @var



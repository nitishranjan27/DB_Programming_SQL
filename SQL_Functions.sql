    
------------------------------------------------------------FUNCTIONS IN SQL SERVER------------------------------------------------------
	
	--SQL Server Functions are useful objects in SQL Server databases.
	--A function is a set of SQL statements that perform a specific task.
	--Functions faster code reusability.

	                                   --SQL SERVER FUNCTIONS TYPES
	--SQL Server supports two types of functions - user defined and system.
	
	--* USER DEFINED FUNCTION: User defined functions are created by a user.
	--* SYSTEM DEFINED FUNCTION: System functions are built in database functions.

	/* Create a function without Parameter */
CREATE Function ShowMessage()
Returns varchar(100)
AS
BEGIN
	return 'Welcome To My Function'
END

Select dbo.ShowMessage();

/* Create a function with a single Parameter */
CREATE Function TakeANumber(@num as int)
Returns int
AS
BEGIN
	return (@num * @num)
END

Select dbo.TakeANumber(5);

/* Create a function with multiple Parameters */
CREATE Function Addition(@num1 as int, @num2 as int)
Returns int
AS
BEGIN
	return (@num1 + @num2)
END

SELECT dbo.Addition(6,5);
SELECT dbo.Addition(4,5);

/* Alter a function */
Alter Function TakeANumber(@num as int)
Returns int
AS
BEGIN
	return (@num * @num * @num)
END

Select dbo.TakeANumber(5);


/* Drop a function */
Drop Function TakeANumber;

-------------------------------------------------------------- SCALER FUNCTIONS-------------------------------------

             --SQL Server scalar function takes one or more parameters and returns a single(scalar) value.
	         --The returned value can be of any data type, except text, ntext, image, cursor and timestamp.

------- Scalar functions can use logic such as IF blocks or WHILE loops ----------
Create function CheckVotersAge(@age as int)
returns varchar(100)
AS
BEGIN
	Declare @str varchar(100)
	if @age >= 18
	BEGIN
		set @str = 'You are eligible to Vote'
	END
	else
	BEGIN
		set @str = 'You are not eligible to Vote'
	END
	return @str
END

Select dbo.CheckVotersAge(26)

--------- Scalar function can call other functions ---------------
Create function GetMyDate()
returns DateTime
AS
BEGIN
	return GetDate();
END

Select dbo.GetMyDate();
----------------------------------------------------Trigger----------------------
--A SQL trigger is a database object which fires when an event occurs in a database.
--Three types of Trigger Insert,Update,Delete
CREATE TABLE Employee 
(
   EmployeeID int identity,
   Emp_Name varchar(100) Not null,
   Emp_Sal Decimal (10,2)
)
   
   INSERT INTO Employee VALUES ('Nitish',15000)
   INSERT INTO Employee VALUES ('Rahul',12400)
   INSERT INTO Employee VALUES ('Anand',11500)
   INSERT INTO Employee VALUES ('Neha',15500)
   INSERT INTO Employee VALUES ('Puja',14000)

 SELECT * FROM Employee;
  SELECT * FROM Employee_Log;

 CREATE TABLE Employee_Log 
(
   EmployeeID int,
   Emp_Name varchar(100) Not null,
   Emp_Sal Decimal (10,2),
   Log_Action varchar(100),
   log_Timestamp datetime  
)

Alter Table Employee_Log add log_Timestamp datetime 
 -----------------------------------------------------After Insert Trigger---------------------------------  
CREATE TRIGGER trgAfterInsert ON Employee
After INSERT
AS
    declare @EmployeeID int;
	declare @empname varchar(100);
	declare @empsal decimal(10,2);
	declare @log_action varchar(100);

	select @EmployeeID=i.EmployeeID,@empname=i.Emp_Name,@empsal=i.Emp_Sal from inserted i;
	set @log_action='Record Inserted --- After Inert';

	insert into Employee_Log
	(EmployeeID,Emp_Name,Emp_Sal,Log_Action,log_Timestamp)
	values(@EmployeeID,@empname,@empsal,@log_action,GETDATE());
	PRINT 'AFTER INSERT TriggerFired'
GO

 SELECT * FROM Employee;
 SELECT * FROM Employee_Log;

 INSERT INTO Employee VALUES ('Mohan',24063)
 ---------------------------------------------------After Update Trigger----------------------
 CREATE TRIGGER trgAfter_Update ON Employee
After UPDATE
AS
    declare @EmployeeID int;
	declare @empname varchar(100);
	declare @empsal decimal(10,2);
	declare @log_action varchar(100);

	select @EmployeeID=i.EmployeeID,@empname=i.Emp_Name,@empsal=i.Emp_Sal from inserted i;
	if UPDATE(Emp_Name)
	     set @log_action='Record Updated --- After Update Trigger';
    if UPDATE(Emp_Sal)
	     set @log_action='Record Updated --- After Update Trigger';

	insert into Employee_Log (EmployeeID,Emp_Name,Emp_Sal,Log_Action,log_Timestamp)
	values(@EmployeeID,@empname,@empsal,@log_action,GETDATE());
	
	PRINT 'AFTER UPDATE Trigger Fired'
GO

update Employee set Emp_Sal=18497 where EmployeeID= 6;

 SELECT * FROM Employee;
 SELECT * FROM Employee_Log;

  ---------------------------------------------------After DELETE Trigger----------------------
 CREATE TRIGGER trgAfterDelete ON Employee
After DELETE
AS
    declare @EmployeeID int;
	declare @empname varchar(100);
	declare @empsal decimal(10,2);
	declare @log_action varchar(100);

	select @EmployeeID=d.EmployeeID,@empname=d.Emp_Name,@empsal=d.Emp_Sal from deleted d;
	     set @log_action='Record Deleted --- After Delete Trigger';

	insert into Employee_Log (EmployeeID,Emp_Name,Emp_Sal,Log_Action,log_Timestamp)
	values(@EmployeeID,@empname,@empsal,@log_action,GETDATE());
	
	PRINT 'AFTER DELETE Trigger Fired'
GO

delete from Employee where EmployeeID= 6;

 SELECT * FROM Employee;
 SELECT * FROM Employee_Log;
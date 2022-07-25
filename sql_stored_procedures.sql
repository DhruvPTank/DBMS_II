delete from Department
delete from Designation
select * from  Person
drop database Worker_info


--1. All tables Insert, Update & Delete
-------------------------------------insert--------------------------------------------------------------
--1
CREATE PROCEDURE PR_Department_Insert
	@DepartmentID int,
	@DepartmentName varchar(100)
AS
BEGIN
Insert Into Department
	(
		DepartmentID,
		DepartmentName
	)
Values
	(
		@DepartmentID,
		@DepartmentName
	)
End
exec PR_Department_Insert 1,Admin
exec PR_Department_Insert 2,IT
exec PR_Department_Insert 3,HR
exec PR_Department_Insert 4,Account

-----2 
CREATE PROCEDURE PR_Designation_Insert
	@DesignationID int,
	@DesignationName varchar(100)
AS
BEGIN
Insert Into Designation
	(
		DesignationID,
		DesignationName
	)
Values
	(
		@DesignationID,
		@DesignationName
	)
End
exec PR_Designation_Insert 11, Jobber
exec PR_Designation_Insert 12,Welder
exec PR_Designation_Insert 13,Clerk
exec PR_Designation_Insert 14,Manager
exec PR_Designation_Insert 15,CEO

---3 
create procedure PR_PERSON_Insert

	@FirstName varchar(50),
	@LastName varchar(50),
	@Salary decimal(8,2),
	@JoiningDate datetime,
	@DepartmentID int,
	@DesignationID int
AS
BEGIN
Insert Into person
	(
		
		FirstName,
		LastName,
		Salary ,
		JoiningDate ,
		DepatmentID ,
		DesignationID 
	)
Values
	(
		
		@FirstName,
		@LastName,
		@Salary ,
		@JoiningDate ,
		@DepartmentID ,
		@DesignationID 
	)
End

Exec PR_PERSON_Insert  'Rahul', 'Anshu', 56000.00, '1990-01-01', 1, 12
Exec PR_PERSON_Insert 'Hardik','Hinsu',	18000.00,'1990-09-25',	2,	11
Exec PR_PERSON_Insert 'Bhavin','Kamani',25000,'1991-5-14',NULL,11
Exec PR_PERSON_Insert 'Bhoomi','Patel',39000,'2014-2-20',1,13
Exec PR_PERSON_Insert 'Rohit','Rajgor',17000,'1990-7-23',2,15
Exec PR_PERSON_Insert 'Priya','Mehta',25000,'1990-10-18',2,NULL
Exec PR_PERSON_Insert 'Neha','Trivedi',18000,'2014-2-20',3,15

-------------------------------------------------------UPDATE-----------------------------------------------------
--1
CREATE PROCEDURE PR_Department_Update

			@DepartmentID		int,
			@DepartmentName		varchar(100)
AS 

UPDATE Department
SET
		DepartmentID = @DepartmentID,
		DepartmentName = @DepartmentName

WHERE	DepartmentID = @DepartmentID

exec PR_Department_Update 1,admin1

--2
CREATE PROCEDURE PR_Designation_Update

			@DesignationID		int,
			@DesignationName	varchar(100)
AS 

UPDATE Designation

SET
		DesignationID = @DesignationID,
		DesignationName = @DesignationName

WHERE	DesignationID = @DesignationID

exec PR_Designation_Update 11,jobber1

--3
CREATE PROCEDURE PR_Person_Update

			@WorkerID			int,
			@FirstName			varchar(100),
			@LastName			varchar(100),
			@Salary				decimal(8,2),
			@JoiningDate		datetime,
			@DepartmentID		int,
			@DesignationID		int
AS 
begin
UPDATE Person
SET
		
		FirstName = @FirstName
		,LastName = @LastName
		,Salary = @Salary
		,JoiningDate = @JoiningDate
		,depatmentid = @DepartmentID
		,DesignationID = @DesignationID
WHERE	WorkerID = @WorkerID
end

exec PR_Person_Update 101,Rahul_1,Anshu_1,57000,'1990-1-1',1,12

select * from person

----------------------------------------------------------delete-------------------------------------------------------------------
--1
CREATE PROCEDURE PR_Department_Delete
			@DepartmentID	int
AS 
begin
	DELETE FROM Department
	WHERE	
	DepartmentID = @DepartmentID
end

exec PR_Department_Delete 4

--2
CREATE PROCEDURE PR_Designation_Delete

			@DesignationID		int
AS 
begin
	DELETE FROM Designation

WHERE	
DesignationID = @DesignationID
end

exec PR_Designation_Delete 14

--3 -
CREATE PROCEDURE PR_Person_Delete

			@WorkerID	int
AS 
begin
	DELETE FROM Person
	WHERE	WorkerID = @WorkerID
end

exec PR_Person_Delete 101

--------------------------------------------------------
--2. All tables SelectAll (If foreign key is available than do write join and take columns on select list)
--select 1


CREATE PROCEDURE PR_Designation_SelectAll
AS
begin
	SELECT DesignationID,DesignationName FROM Designation
end

exec PR_Designation_SelectAll

--select 2
CREATE PROCEDURE PR_Department_SelectAll
AS
begin
	SELECT DepartmentID,DepartmentName FROM Department
end

exec PR_Department_SelectAll

--select 3
alter PROCEDURE PR_Person_SelectAll
AS
BEGIN
SELECT 
	Person.WorkerID,
	Person.FirstName,
	Person.LastName,
	Person.Salary,
	Person.JoiningDate ,
	Department.departmentname,
	Designation.designationname
	from person inner join Department 
	on
	Person.DepatmentID=Department.DepartmentID 
	inner join Designation
	on
	Person.Designationid=Designation.Designationid
end 

exec PR_Person_SelectAll
------------------------------------
--3. All tables SelectPK
--1
CREATE PROCEDURE PR_Designation_SelectPK

			@DesignationID	int
AS 
BEGIN
	SELECT
		DesignationID,
		DesignationName
	FROM	Designation
	WHERE	DesignationID = @DesignationID
END

exec PR_Designation_SelectPK 11

--2
CREATE PROCEDURE PR_Department_SelectPK

			@DepartmentID	int
AS 
begin
SELECT

		DepartmentID,
		DepartmentName
FROM	Department
WHERE	DepartmentID = @DepartmentID
end

exec PR_Department_SelectPK 1

--3

CREATE PROCEDURE PR_Person_SelectPK
			@WorkerID	int
AS 
BEGIN
SELECT
		WorkerID,
		FirstName,
		LastName,
		Salary,
		JoiningDate,
		DepatmentID,
		DesignationID
FROM	Person
WHERE	WorkerID = @WorkerID
END

exec PR_Person_SelectPK 102

--------
--4
--Create Procedure that takes Department Name & Designation Name as Input and 
--Returns a table with Worker’s First Name, Salary, Joining Date & Department Name.

CREATE PROCEDURE PR_Person_SelectByDesignationDepartmentName
	@DepartmentName varchar(200),
	@DesignationName varchar(250)
AS
BEGIN
SELECT 
	 Person.WorkerID,
	 Person.FirstName,
	 Person.LastName,
	 Person.Salary,
	 Person.JoiningDate,
	 Department.DepartmentName,
	 Designation.DesignationName
FROM Person LEFT OUTER JOIN Department
ON Department.DepartmentID = Person.DepatmentID
LEFT OUTER JOIN Designation
ON Designation.DesignationID = Person.DesignationID
WHERE	DesignationName = @DesignationName
AND		DepartmentName = @DepartmentName
END

EXEC PR_Person_SelectByDesignationDepartmentName it,jobber1

---------------------------------------------------
-- Create Procedure that takes FirstName as an input parameter and displays’ 
--all the details of the worker with their department & designation name.

CREATE PROCEDURE PR_Person_SelectByFirstName
	@FirstName varchar(200)
	
AS
BEGIN
SELECT 
	 Person.WorkerID,
	 Person.FirstName,
	 Person.LastName,
	 Person.Salary,
	 Person.JoiningDate,
	 Department.DepartmentName,
	 Designation.DesignationName
FROM Person LEFT OUTER JOIN Department
ON Department.DepartmentID = Person.DepatmentID
LEFT OUTER JOIN Designation
ON Designation.DesignationID = Person.DesignationID
WHERE	FirstName = @FirstName
END

exec PR_Person_SelectByFirstName hardik

--6 Create Procedure which displays department wise 
--maximum, minimum & total salaries.


alter PROCEDURE PR_Person_MAXMINTOTALSALARY_DEPARTMENTWISE
AS
BEGIN
SELECT 
	
	 Department.DepartmentName,
	 max(person.salary) as maxsalary,
	 min(person.salary) as minsalary,
	 sum(person.salary) as totalsalary
	 
FROM Person inner JOIN Department
ON Department.DepartmentID = Person.DepatmentID
group by Department.DepartmentName
end

exec PR_Person_MAXMINTOTALSALARY_DEPARTMENTWISE

select * from person

--------------
--view
-------

--1. Create a view that display first 100 workers details.
create view First100_worker_detail
as
SELECT TOP 100
	WorkerID,
	FirstName,
	LastName,
	Salary,
	JoiningDate,
	DepatmentID,
	DesignationID
 FROM Person

 select * from First100_worker_detail

--2. Create a view that displays designation wise maximum, minimum & total salaries.


CREATE VIEW DesignationWiseMinMaxTotalSalary
AS	
SELECT 
	 Designation.DesignationName,
	MAX(Person.Salary) AS MaxSal,
	MIN(Person.Salary) AS MinSal,
	SUM(Person.Salary) AS TotalSal
 FROM Person
INNER JOIN Designation
ON Designation.DesignationID = Person.designationid
GROUP BY Designation.DesignationName

select * from DesignationWiseMinMaxTotalSalary

--3 Create a view that displays Worker’s first name 
--with their salaries & joining date, 
--it also displays duration column 
--which is difference of joining date with respect to current date.

create view personDATA
as
	select firstname,salary,joiningdate,
	DATEDIFF(year,joiningdate,getdate()) as Duration
	from person
select * from personDATA
--4. Create a view which shows department & designation wise 
--total number of workers.

CREATE VIEW DeptWiseTotalCOUNT
AS
SELECT 
	Department.DepartmentName,
	COUNT(Person.WorkerID) AS TotalPerson
 FROM Person INNER JOIN Department
ON Department.DepartmentID = Person.DepatmentID
GROUP BY Department.DepartmentName

select * from DeptWiseTotalCOUNT

CREATE VIEW DesignationWiseTotal
AS
SELECT 
	
	Designation.DesignationName
	,COUNT(Person.WorkerID) AS TotalPerson
 FROM Person INNER JOIN  Designation
ON Designation.DesignationID =Person.DesignationID
GROUP BY Designation.DesignationName

select * from DesignationWiseTotal

--5. Create a view that displays worker names who don’t 
--have either in any department or designation.

CREATE VIEW DonthaveDeptDesignation
AS
SELECT 
	FirstName,lastname
FROM Person
WHERE DepatmentID IS NULL
OR    DesignationID IS NULL

select * from DonthaveDeptDesignation

---------------------------------------------
function
---------------------------------
--1. Create a table valued function which accepts DepartmentID as 
--a parameter & returns a worker table based on DepartmentID.
create FUNCTION fnWorkerIDbyDepartmentID(@DepartmentID int)
	returns table
	AS 
	
	Return (Select WorkerID from Person Where DepatmentID = @DepartmentID)
	
Select * From fnWorkerIDbyDepartmentID (1)

--2. Create a table valued function which returns a table with 
--unique city names from person table.
CREATE FUNCTION fnUniqueDepartment()
returns table
AS 
Return 
(Select Distinct DepartmentName from Department)


Select * From dbo.fnUniqueDepartment()

--3. Create a scalar valued function which accepts two parameters 
--start date & end date, and returns a date difference in days.
CREATE FUNCTION fnDateDifferance(@StartDate Datetime, @EndDate Datetime)
returns varchar(150)
AS 
BEGIN
	Return (Select Convert(varchar(150),Datediff(Day,@StartDate,@EndDate)))
END

Select  dbo.fnDateDifferance('2020-05-14','2020-07-10')


--4. Create a scalar valued function which accepts two parameters 
--year in integer & month in integer and returns total days in passed month & year.
CREATE FUNCTION fnDaysInMonthcount (@year INT, @Month INT)
RETURNS INT 
AS
BEGIN
    -- FIRST CONVERT THE YEAR AND MONTH TO A DATE BY CASTING TO CHAR
    -- THEN CONCATENATING TO CREATE A STRING IN THE FORMAT yyyyMMdd
    -- THIS DATEFORMAT IS CULTURE INSENSITIVE SO WILL WORK NO MATTER
    -- WHAT YOUR REGIONAL SETTINGS ARE

    DECLARE @Date DATE = CAST(
                            CAST(@Year AS CHAR(4)) 
                            + RIGHT('0' + CAST(@Month AS VARCHAR(2)), 2)
                            + '01' AS DATE);

    -- USE ESTABLISHED METHODS OF GETTING 1ST OF THE MONTH AND FIRST OF 
    -- THE NEXT MONTH AND CALCULATE THE DIFFERENCE
    RETURN DATEDIFF(DAY, 
            DATEADD(MONTH, DATEDIFF(MONTH, 0, @Date), 0),
            DATEADD(MONTH, DATEDIFF(MONTH, 0, @Date) + 1, 0));
END
SELECT dbo.fnDaysInMonthcount(2022,5)

--5. Create a scalar valued function which accepts two parameters 
--year in integer & month in integer and returns first date 
--in passed month & year.


/*1. Display all the employees whose name starts with “m” and 4 th character is “h”.
2. Find the value of 3 raised to 5. Label the column as output.
3. Write a query to subtract 20 days from the current date.
4. Write a query to display name of employees whose name starts with “j” and contains “n” in their name.
5. Display 2nd to 9th character of the given string “SQL Programming”.
6. Display name of the employees whose city name ends with “ney” &contains six characters.
7. Write a query to convert value 15 to string.
8. Add department column with varchar (20) to Employee table.
9. Set the value of department to Marketing who belongs to London city.
10. Display all the employees whose name ends with either “n” or “y”.
11. Find smallest integer value that is greater than or equal to 63.1, 63.8 and -63.2.
12. Display all employees whose joining date is not available.
13. Display name of the employees in capital letters and city in small letters.
14. Change the data type of Ename from varchar (30) to char (30).
15. Display city wise maximum salary.
16. Produce output like <Ename> works at <city> and earns <salary> (In single column).
17. Find total number of employees whose salary is more than 5000.
18. Write a query to display first 4 & last 3 characters of all the employees.
19. List the city having total salaries more than 15000 and employees joined after 1st January, 2014.
20. Write a query to replace “u” with “oo” in Ename.
21. Display city with average salaries and total number of employees belongs to each city.
22. Display total salaries paid to female employees.
23. Display name of the employees and their experience in years.
24. Remove column department from employee table.
25. Update the value of city from syndey to null.
26. Retrieve all Employee name, Salary & Joining date.
27. Find out combine length of Ename & Gender.
28. Find the difference between highest & lowest salary.
29. Rename a column from Ename to FirstName.
30. Rename a table from Employee to EmpMaster.
*/
USE DHRUV_21010101188

CREATE TABLE EMPLOYEE
(EID INT,
ENAME VARCHAR(100) ,
GENDER VARCHAR(10) ,
JOININGDATE DATETIME ,
SALARY DECIMAL(8,2) ,
CITY VARCHAR(100)
)


--QUERY 1
SELECT ENAME FROM EMPLOYEE 
	WHERE ENAME LIKE 'M__H%'

--QUERY 2
 SELECT  POWER(3,5) AS OUTPUT
 
 --QUERY 3
 SELECT  DATEDIFF(DAY ,20, GETDATE()) AS DATE_20
 
 --QUERY 4
 SELECT ENAME FROM EMPLOYEE 
	WHERE ENAME LIKE 'J%N%'

--QUERY 5
SELECT  SUBSTRING('SQL PROGRAMMING',2,8)
	AS CHAR_STRING

--QUERY 6
SELECT ENAME FROM EMPLOYEE
	WHERE CITY LIKE '___NEY'

--QUERY 7
SELECT CAST (15 AS VARCHAR(10))  AS CONVERT_STRING

--QUERY 8
ALTER TABLE  EMPLOYEE ADD   DEPARTMENT  VARCHAR(20)

--QUERY 9
UPDATE EMPLOYEE
	SET  DEPARTMENT = 'MARKETING' 
		WHERE CITY LIKE 'LONDON'

--QUERY 10
SELECT ENAME FROM EMPLOYEE 
	WHERE ENAME LIKE '%N' OR ENAME LIKE '%Y' 
 
--QUERY 11
SELECT 
FLOOR(63.1),
FLOOR(63.8),
FLOOR(-63.2) 
AS SMALL_INTEGER

--QUERY 12
SELECT * FROM EMPLOYEE
	WHERE JOININGDATE=NULL
	   
--QUERY 13
SELECT UPPER(ENAME) FROM  EMPLOYEE AS UPPER_ENAME
SELECT LOWER(CITY) FROM   EMPLOYEE AS LOWER_CITY 

--QUERY 14
ALTER TABLE EMPLOYEE 
	ALTER COLUMN ENAME CHAR(30)

--QUERY 15
SELECT CITY,MAX(SALARY) FROM EMPLOYEE GROUP BY CITY 

--QUERY 16
SELECT CONCAT(RTRIM(ENAME),'WORKS AT',CITY,'AND EARNS',SALARY)  FROM EMPLOYEE

--QUERY 17
SELECT ENAME FROM EMPLOYEE  
	WHERE SALARY>5000

--QUERY 18
SELECT LEFT(ENAME ,4) FROM EMPLOYEE 
SELECT RIGHT(ENAME ,3) FROM EMPLOYEE

--QUERY 19 
SELECT CITY FROM EMPLOYEE
	WHERE JOININGDATE >2014-01-01
		GROUP BY CITY HAVING  SUM(SALARY)>15000 

--QUERY 20
SELECT REPLACE(ENAME, 'U' ,'OO') FROM EMPLOYEE 

--QUERY 21
SELECT AVG(SALARY),COUNT(ENAME) FROM EMPLOYEE GROUP BY CITY  

--QUERY 22
SELECT SUM(SALARY) FROM EMPLOYEE
	WHERE  GENDER='FEMALE'

--QUERY 23
SELECT ENAME,DATEDIFF(YEAR , GETDATE() ,JOININGDATE) FROM EMPLOYEE 

--QUERY 24
ALTER TABLE EMPLOYEE 
	DROP DEEPARTMENT

--QUERY 25
UPDATE  EMPLOYEE  SET CITY = NULL
	WHERE CITY ='SYDNEY'

--QUERY 26
SELECT ENAME,SALARY,JOININGDATE FROM EMPLOYEE

--QUERY 27
SELECT LEN(CONCAT(ENAME , GENDER)) FROM EMPLOYEE

--QUERY 28
SELECT MAX(SALARY) - MIN(SALARY) FROM EMPLOYEE AS SALARY_DIFFERANCE

--QUERY 29
SP_RENAME 'EMPLOYEE.ENAME' , 'FIRSTNAME' 

--QUERY 30
SP_RENAME 'EMPLOYEE' , 'EMPLOYEEMASTER'

		 

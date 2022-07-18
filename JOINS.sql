CREATE DATABASE DHRUV_21010101188

USE DHRUV_21010101188

--QUERY 1
SELECT PERSON1.PERSONNAME ,DEPARTMENT1.DEPARTMENTNAME,DEPARTMENT1.DEPARTMENTCODE FROM PERSON1 INNER JOIN DEPARTMENT1 ON PERSON1.DEPARTMENTID=DEPARTMENT1.DEPARTMENTID 

--QUERY 2
SELECT DEPARTMENT1.DEPARTMENTNAME, 
		MAX(PERSON1.SALARY) AS MAXSAL,
			MIN(PERSON1.SALARY) AS MINSAL FROM		
					PERSON1 INNER JOIN DEPARTMENT1 ON 
						PERSON1.DEPARTMENTID=DEPARTMENT1.DEPARTMENTID GROUP BY 
							DEPARTMENT1.DEPARTMENTNAME


--QUERY 3
SELECT DEPARTMENT1.DEPARTMENTNAME 
	FROM PERSON1 INNER JOIN DEPARTMENT1 ON 
		PERSON1.DEPARTMENTID=DEPARTMENT1.DEPARTMENTID			
			GROUP BY DEPARTMENT1.DEPARTMENTNAME 
				HAVING  SUM(PERSON1.SALARY)>100000

--QUERY 4
SELECT PERSON1.PERSONNAME,PERSON1.SALARY,DEPARTMENT1.DEPARTMENTNAME
	FROM PERSON1 INNER JOIN DEPARTMENT1 ON 
		PERSON1.DEPARTMENTID=DEPARTMENT1.DEPARTMENTID
			WHERE PERSON1.CITY ='JAMNAGAR'
			
--QUERY 5
SELECT PERSON1.PERSONNAME,DEPARTMENT1.DEPARTMENTID
	FROM PERSON1 INNER JOIN DEPARTMENT1 ON 
		PERSON1.DEPARTMENTID=DEPARTMENT1.DEPARTMENTID
			WHERE DEPARTMENT1.DEPARTMENTID IS NULL
			
--QUERY 6
SELECT DEPARTMENT1.DEPARTMENTNAME,
	COUNT(DEPARTMENT1.DEPARTMENTID) "Person count"
		FROM PERSON1 INNER JOIN DEPARTMENT1 ON 
			PERSON1.DEPARTMENTID=DEPARTMENT1.DEPARTMENTID
				GROUP BY DEPARTMENT1.DEPARTMENTNAME

--QUERY 7
	SELECT AVG(PERSON1.SALARY)
		FROM PERSON1 INNER JOIN DEPARTMENT1 ON 
			PERSON1.DEPARTMENTID=DEPARTMENT1.DEPARTMENTID
				WHERE PERSON1.CITY='AHMEDABAD'

--QUERY 8
SELECT PERSON1.PERSONNAME + 'EARNS' + PERSON1.SALARY + 'FROM DEPARTMENT'  + DEPARTMENT1.DEPARTMENTNAME +'MONTHLY'
	FROM PERSON1 INNER JOIN DEPARTMENT1 ON 
			PERSON1.DEPARTMENTID=DEPARTMENT1.DEPARTMENTID

--QUERY 9
	SELECT
Department1.DepartmentName
FROM Person1 
FULL OUTER JOIN Department1
ON Person1.DepartmentID=Department1.DepartmentID
GROUP BY Department1.DepartmentName 
HAVING COUNT (Person1.DepartmentID) =0

--QUERY 10
SELECT
MAX(Person1.Salary) "Max Salary",
AVG(Person1.Salary) "AVG Salary"
FROM Person1 
INNER JOIN Department1
ON Person1.DepartmentID=Department1.DepartmentID 
GROUP BY Department1.DepartmentName


--QUERY 11
	SELECT DISTINCT CITY FROM PERSON
	
--QUERY 12

SELECT

DEPARTMENT1.DEPARTMENTNAME,
COUNT(PERSON1.DEPARTMENTID) AS TOTAL
FROM PERSON1 
RIGHT OUTER JOIN DEPARTMENT1
ON PERSON1.DEPARTMENTID=DEPARTMENT1.DEPARTMENTID 
GROUP BY DEPARTMENT1.DEPARTMENTNAME 
HAVING COUNT(PERSON1.DEPARTMENTID) > 2
SALARY = ((SALARY*10)/100) +SALARY
WHERE DEPARTMENT1ID=
(SELECT DEPARTMENTID FROM DEPARTMENT1 WHERE DEPARTMENTNAME='computer')
WHERE (GETDATE()-JOININGDATE)>36
# Introduction
This file contains a collection of TSQL queries that I have found to be useful. 
I have gathered these queries in one place as a reference point to refer back to whenever I need them.

<details>
<summary><b><font size="+1">Select</font></b></summary>
</br>

SELECT statement.
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
    Customer;
```

SELECT TOP (n) statement.
```sql
SELECT TOP 5
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer;
```

SELECT TOP (n) percent statement.
```sql
SELECT TOP 5 PERCENT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer;
```

SELECT TOP (n) with TIES statement.
```sql
SELECT TOP 10 WITH TIES
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
ORDER BY 
    City;
```

SELECT DISTINCT statement.
```sql
SELECT DISTINCT
	City
FROM 
	Customer;
```

SELECT with AS operator.
```sql
SELECT
	FirstName AS GivenName,
	LastName AS Surname,
	City,
	Country
FROM 
	Customer;
```
</details>

<details>
<summary><b><font size="+1">Where</font></b></summary>
</br>

WHERE clause.
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
WHERE 
	City = 'London';

-- (Comparison operators !=, >, >=, <, <=, !>, !<)
```

WHERE clause with AND operator.
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
WHERE 
	FirstName = 'Nate' AND City = 'London';
```

WHERE clause with OR operator.
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
WHERE 
	FirstName = 'Nate' OR FirstName = 'Jane';
```

WHERE clause with BETWEEN operator.
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country,
    StartDate,
FROM 
	Customer
WHERE 
	StartDate BETWEEN '2020-12-01' AND '2020-12-31';
```

WHERE clause with IN operator.
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country,
FROM 
	Customer
WHERE 
	FirstName IN ('Nate', 'Jane', 'John');
```

WHERE clause with LIKE operator.
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
WHERE 
	FirstName LIKE 'Nat%';
```

WHERE clause with EXISTS operator.
```sql
SELECT
	Id,
	ProductName
	UnitPrice
FROM 
	Product
WHERE EXISTS
	(
		SELECT 
			ProductId
		FROM
			OrderItem
		WHERE
			Product.Id = OrderItem.ProductId			
	);
```
</details>

<details>
<summary><b><font size="+1">And, Or, Not</font></b></summary>
</br>

AND operator.

```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
WHERE 
	FirstName = 'Nate' AND City = 'London';
```

Multiple AND operators.

```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
WHERE 
	FirstName = 'Nate' AND
    LastName = 'Darker' AND
    City = 'London';
```

OR operator.

```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
WHERE 
	FirstName = 'Nate' OR
    FirstName = 'John';
```

Multiple OR operators.

```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
WHERE 
	FirstName = 'Nate' OR
    FirstName = 'John' OR
    FirstName = 'Jane';
```

OR operator executed before AND operator.
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
WHERE 
	(FirstName = 'Nate' OR
    FirstName = 'John') AND
    City = 'London';
```

NOT operator.
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
WHERE 
	NOT Country = 'UK';
```

Multiple NOT operators.
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
WHERE 
	NOT Country = 'UK' AND
	NOT Country = 'USA';
```

</details>

<details>
<summary><b><font size="+1">Between, Like & In</font></b></summary>
</br>

BETWEEN operator.
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country,
    StartDate,
FROM 
	Customer
WHERE 
	StartDate BETWEEN '2020-12-01' AND '2020-12-31';
```

LIKE operator.
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
WHERE 
	FirstName LIKE 'Nat%';
```

IN operator.
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country,
FROM 
	Customer
WHERE 
	FirstName IN ('Nate', 'Jane', 'John');
```
</details>

<details>
<summary><b><font size="+1">Order By</font></b></summary>
</br>

ORDER BY clause (ascending).
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
ORDER BY
    Country;
```

ORDER BY clause (descending).
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
ORDER BY
    Country DESC;
```

ORDER BY clause (multiple columns).
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
ORDER BY
    FirtName,
    Country DESC;
```

ORDER BY with OFFSET clause.
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
ORDER BY
	Country
OFFSET 10 ROWS;
```

ORDER BY with OFFSET and FETCH NEXT clause.
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
ORDER BY
	Country
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;

-- Skip 10 rows and only return the 10 rows after
```
</details>

<details>
<summary><b><font size="+1">Group By</font></b></summary>
</br>

GROUP BY statement.
```sql
SELECT
	Country,
	COUNT(Country) AS Total
FROM 
	Customer
GROUP BY
	Country
ORDER BY Total DESC;
```

GROUP BY statement with HAVING clause.
```sql
SELECT
	Country,
	COUNT(Country) AS Total
FROM 
	Customer
GROUP BY
	Country
HAVING COUNT(Country) >=5
ORDER BY Total DESC;
```

GROUP BY statement with ROLLUP.
```sql
SELECT
	ISNULL(Country,'Total') AS Country,
	COUNT(Country) AS Total
FROM 
	Customer
GROUP BY ROLLUP
	(Country)
ORDER BY Total DESC;
```

</details>
<details>
<summary><b><font size="+1">Update & Delete</font></b></summary>
</br>

UPDATE statement.
```sql
UPDATE
	Customer
SET
	FirstName = 'John'
WHERE
	FirstName = 'Jonathan' AND
	LastName = 'Jones';
```

UPDATE statement, setting multiple values.
```sql
UPDATE
	Customer
SET
	FirstName = 'John',
    EmailAddress = 'John.Jones@email.com'
WHERE
	FirstName = 'Jonathan' AND
	LastName = 'Jones';
```

DELETE statement.
```sql
DELETE
FROM 
    Customer
WHERE
    EmailAddress = 'John.Jones@email.com'
```
</details>

<details>
<summary><b><font size="+1">Min, Max, Count, Avg & Sum</font></b></summary>
</br>

MIN function.
```sql
SELECT 
	MIN(UnitPrice) AS MinimumValue 
FROM 
	Orderitem;
```
MAX function
```sql
SELECT 
	MAX(UnitPrice) AS MaximumValue 
FROM 
	Orderitem;
```

COUNT function.
```sql
SELECT 
	COUNT(UnitPrice) AS Count 
FROM 
	Orderitem;
```

AVG function.
```sql
SELECT 
	AVG(UnitPrice) AS AveragePrice
FROM 
	Orderitem;
```

SUM function.
```sql
SELECT 
	Sum(UnitPrice) TotalPrice
FROM 
	Orderitem;
```

</details>

<details>
<summary><b><font size="+1">Insert Into, Select Into & Insert into Select</font></b></summary>
</br>

INSERT INTO statement.
```sql
INSERT INTO FootballTeams -- Specifying column names
(Team,City,Country, League)
VALUES
('AC Milan', 'Milan', 'Italy', 'Serie A'),
('FC Barcelona', 'Barcelona', 'Spain', 'La Liga'),
('Manchester United', 'Manchester', 'England', 'Premier League'),
('PSG', 'Paris', 'France', 'Ligue 1'),
('Bayern Munich', 'Munich', 'Germany', 'Bundesliga');
```

SELECT INTO statement.
```sql
SELECT *
INTO 
	TestDB
FROM
	Customer;
```

SELECT INTO statement using specific columns.
```sql
SELECT
    FirstName,
    LastName,
    EmailAddress,
    Country
INTO 
	TestDB
FROM
	Customer;
```

INSERT INTO SELECT statement
```sql
INSERT INTO 
	TestDB
SELECT *
FROM
	Customer;
```

INSERT INTO SELECT statement using specific columns.
```sql
INSERT INTO 
	TestDB
SELECT
    FirstName,
    LastName,
    EmailAddress,
    Country
FROM
	Customer;
```

INSERT INTO SELECT statement using specific columns and a WHERE clause.
```sql
INSERT INTO 
	TestDB
SELECT
    FirstName,
    LastName,
    EmailAddress,
    Country
FROM
	Customer
WHERE
    Country = 'UK';
```
</details>

<details>
<summary><b><font size="+1">Joins</font></b></summary>
</br>

INNER JOIN.
```sql
SELECT
	e.FirstName,
	e.LastName,
	e.HireDate,
	e.EmailAddress,
	o.Name AS Office
FROM Employee AS e
INNER JOIN Office AS o
	ON e.OfficeID = o.OfficeID;
```

INNER JOIN on multiple tables.
```sql
SELECT
	e.FirstName,
	e.LastName,
	e.HireDate,
	e.EmailAddress,
	o.Name AS Office,
	d.Name AS Department,
	j.Title AS JobTitle
FROM Employee AS e
INNER JOIN Office AS o
	ON e.OfficeID = o.OfficeID
INNER JOIN Department AS d
	ON e.DepartmentID = d.DepartmentID
INNER JOIN JobTitle AS j
	ON e.JobTitleID = j.TitleID;
```

LEFT JOIN.
```sql
SELECT
	e.FirstName,
	e.LastName,
	e.HireDate,
	e.EmailAddress,
	o.Name AS Office
FROM Employee AS e
LEFT JOIN Office AS o 
	ON e.OfficeID = o.OfficeID;

//*Returns all records from the left table (Employee) 
and matches from the right table (Office)
```
RIGHT JOIN.
```sql
SELECT
	e.FirstName,
	e.LastName,
	e.HireDate,
	e.EmailAddress,
	o.Name AS Office
FROM Employee AS e
RIGHT JOIN Office AS o 
	ON e.OfficeID = o.OfficeID;

//*Returns all records from the right table (Office) 
and matches from the left table (Employee)
```
FULL JOIN.
```sql
SELECT
	e.FirstName,
	e.LastName,
	e.HireDate,
	e.EmailAddress,
	o.Name AS Office
FROM Employee AS e
FULL JOIN Office AS o
	ON e.OfficeID = o.OfficeID;

-- Returns all records from both tables
```
</details>

<details>
<summary><b><font size="+1">Union, Intersect, Except</font></b></summary>
</br>

UNION operator.
```sql
SELECT
	FirstName,
	LastName
FROM
	CustomerDB
UNION 
SELECT
	FirstName,
	LastName
FROM
	OrderDB;

-- Returns distinct values (non duplicate)
```

UNION operator with WHERE clause.
```sql
SELECT
	FirstName,
	LastName
FROM
	CustomerDB
WHERE
	FirstName = 'Nate' OR 
	FirstName = 'John'
UNION 
SELECT
	FirstName,
	LastName
FROM
	OrderDB
WHERE
	FirstName = 'Nate' OR
	FirstName = 'John';
    
-- Returns distinct values (non duplicate)
```

UNION ALL operator.
```sql
SELECT
	FirstName,
	LastName
FROM
	CustomerDB
UNION ALL
SELECT
	FirstName,
	LastName
FROM
	OrderDB;

-- Returns all values including duplicates
```
INTERSECT operator.
```sql
SELECT
	FirstName,
	LastName
FROM
	CustomerDB
INTERSECT
SELECT
	FirstName,
	LastName
FROM
	OrderDB;

-- Returns values that match in both tables
```

EXCEPT operator.
```sql
SELECT
	FirstName,
	LastName
FROM
	CustomerDB
EXCEPT
SELECT
	FirstName,
	LastName
FROM
	OrderDB;

//*Returns values in the left table (CustomerDB) that do not have a matching value in the right table (OrderDB)
```
</details>

<details>
<summary><b><font size="+1">Any & All</font></b></summary>
</br>

ANY operator.
```sql
SELECT
	*
FROM
	sales.SalesOrderHeader
WHERE
	SalesOrderID = ANY
	(
		SELECT 
			SalesOrderID
		FROM
			Sales.SalesOrderDetail
		WHERE
			OrderQty = 20
	); 

-- Returns true where ANY of the values meet the condition
```

ALL operator.
```sql
SELECT
	*
FROM
	sales.SalesOrderHeader
WHERE
	SalesOrderID = ALL
	(
		SELECT 
			SalesOrderID
		FROM
			Sales.SalesOrderDetail
		WHERE
			Status = 5
	); 

-- Returns true where ALL of the values meet the condition
```
</details>

<details>
<summary><b><font size="+1">Case</font></b></summary>
</br>

CASE statement.
```sql
SELECT
	FirstName,
	LastName,
	Country,
	CASE
		WHEN Country = 'UK' THEN 'Zone 1'
		WHEN Country = 'USA' THEN 'Zone 2'
		WHEN Country = 'Spain' THEN 'Zone 3'
		WHEN Country = 'Germany' THEN 'Zone 4'
		ELSE 'No zone applied'
	END AS 'Information'
FROM 
	Customer
ORDER BY
	Information DESC;
```

CASE statement in a WHERE clause.
```sql
SELECT
	FirstName,
	LastName,
	Country,
	CASE
		WHEN Country = 'UK' THEN 'Zone 1'
		WHEN Country = 'USA' THEN 'Zone 2'
		WHEN Country = 'Spain' THEN 'Zone 3'
		WHEN Country = 'Germany' THEN 'Zone 4'
		ELSE 'No zone applied'
	END AS 'Information'
FROM 
	Customer
WHERE
	CASE
		WHEN Country = 'UK' THEN 'Zone 1'
		WHEN Country = 'USA' THEN 'Zone 2'
		WHEN Country = 'Spain' THEN 'Zone 3'
		WHEN Country = 'Germany' THEN 'Zone 4'
		ELSE 'No zone applied'
	END = 'Zone 1'
ORDER BY
	Information DESC;
```

</details>

<details>
<summary><b><font size="+1">Null</font></b></summary>
</br>

NULL value.
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
WHERE 
	Country = NULL;
```

IS NULL operator.
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
WHERE 
	Country IS NULL;
```

IS NOT NULL operator.
```sql
SELECT
	FirstName,
	LastName,
	City,
	Country
FROM 
	Customer
WHERE 
	Country IS NOT NULL;
```

ISNULL function.
```sql
SELECT
	CustomerId, 
	BillingAddress, 
	BillingCity, 
	ISNULL(BillingPostalCode,'Not Listed') AS PostCode
FROM 
	Invoice;
```
</details>

<details>
<summary><b><font size="+1">Operators</font></b></summary>
</br>

## Comparison Operators
```
=   ---  Equal to
!=  ---  Not qual to
<>  ---  Not equal to
>   ---  Greater than
<   ---  Less than
>=  ---  Greater than or equal to
<=  ---  Less than or equal to
!>  ---  Not great than
!<  ---  Not less than
```

## Logical Operators

**ALL** - TRUE if all of the subquery values meet the condition.

**AND** - TRUE if all the conditions separated by AND is TRUE.

**ANY** - TRUE if any of the subquery values meet the condition.

**BETWEEN** - TRUE if the operand is within the range of comparisons.

**EXISTS** - TRUE if the subquery returns one or more records.

**IN** - TRUE if the operand is equal to one of a list of expressions.

**LIKE** - TRUE if the operand matches a pattern.

**NOT** - Displays a record if the condition(s) is NOT TRUE.

**OR** - TRUE if any of the conditions separated by OR is TRUE.

**SOME** - TRUE if any of the subquery values meet the condition.

</details>

<details>
<summary><b><font size="+1">Functions</font></b></summary>
</br>

## Date Functions

Convert the date to British standard (103).
```sql
SELECT
	TimeGenerated,
	CONVERT(CHAR(10), TimeGenerated, 103) AS AltDate 
FROM
	OrderDB;
```

Extract parts of the date into separate columns.
```sql
SELECT
	TimeGenerated,
	DATENAME(DAY,timeGenerated) AS DayCol,
	DATENAME(MONTH, timeGenerated) AS MonthCol,
	DATENAME(YEAR, timeGenerated) AS YearCol
FROM
	OrderDB;
```

Reformat the date and concatenate into a new column.
```sql
SELECT
	TimeGenerated,
	DATENAME(WEEKDAY, timeGenerated) + ' '+
	DATENAME(DAY,timeGenerated) + ', ' + 
	DATENAME(MONTH, timeGenerated) + ' ' +
	DATENAME(YEAR, timeGenerated) AS Date
FROM
	OrderDB;
```

```sql
-- Extracts the year
YEAR(timeGenerated)

--Extracts the month
MONTH(timeGenerated)

-- Extracts the day
DAY(timeGenerated)

-- Extracts the weekday
DATENAME(WEEKDAY, timeGenerated)

-- Extracts the month
DATENAME(MONTH, timeGenerated)

-- Extracts the year
DATENAME(YEAR, timeGenerated) 

-- Displays the date from 3 months ago
DATEADD(M,-3,GETDATE())

-- Displays the date in 7 days from now
DATEADD(D, 7, GETDATE()) 

-- Displays the difference in days
DATEDIFF(D, timeGenerated, GETDATE())
```

## Text Functions

Extract the first and last name from a column.
```sql
SELECT 
	Name,
	LEFT(name,CHARINDEX(',',name)-1) AS FirstName,
	RIGHT(name,LEN(name)-Charindex(',', name)) AS LastName
FROM 
	Customer;
```

Extract first and last name from a column and concatenate.
```sql
SELECT 
	Name,
	LEFT(name,CHARINDEX(',',name)-1) 
    + ', ' + 
	RIGHT(name,LEN(name)-Charindex(',', name)) 
AS FullName 
FROM 
	Customer;
```
</details>

<details>
<summary><b><font size="+1">DB's & Tables</font></b></summary>
</br>

CREATE DB.
```sql
CREATE DATABASE TestDB;
```

CREATE DB with additional details.
```sql
CREATE DATABASE TestDB
 ON  PRIMARY 
( NAME = N'TestDB', FILENAME = N'C:\\Program Files\\Microsoft SQL Server\\MSSQL15.MSSQLSERVER\\MSSQL\\DATA\\TestDB.mdf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestDB_log', FILENAME = N'C:\\Program Files\\Microsoft SQL Server\\MSSQL15.MSSQLSERVER\\MSSQL\\DATA\\TestDB_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB );
```
DROP DB.
```sql
DROP DATABASE TestDB;
```
DROP DB if it exists and recreate it.
```sql
DROP DATABASE IF EXISTS TestDB;
GO
CREATE DATABASE TestDB;
```

CREATE a table.
```sql
USE TestDB;
GO
CREATE TABLE Users (
	ID INT PRIMARY KEY IDENTITY(1000,1),
	FirstName NVARCHAR(20) NOT NULL,
	LastName NVARCHAR(20),
	Age INT,
	Country NVARCHAR(20),
);
```

DROP a table if it exists and recreate it.
```sql
USE TestDB;
GO
DROP Table IF EXISTS Users;
CREATE TABLE Users (
	ID INT PRIMARY KEY IDENTITY(1000,1),
	FirstName NVARCHAR(20) NOT NULL,
	LastName NVARCHAR(20),
	Age INT,
	Country NVARCHAR(20),
);
```

DROP a table.

```sql
DROP TABLE Users;
```

DROP a table if it exists and recreate it.
```sql
USE TestDB;
GO
DROP TABLE IF EXISTS Users;
Create Table Users (
	ID INT PRIMARY KEY IDENTITY(1000,1),
	FirstName NVARCHAR(20) NOT NULL,
	LastName NVARCHAR(20),
	Age INT,
	Country NVARCHAR(20),
);
```

ALTER table.

```sql
ALTER TABLE Users
ADD JoinDate DATE;
```
</details>

<details>
<summary><b><font size="+1">Views</font></b></summary>
</br>

CREATE VIEW.
```sql
CREATE VIEW vw_CustomerLocation
AS
SELECT 
    Customer.FirstName, 
    Customer.Id, 
    Customer.LastName, 
    Customer.City, 
    Location.Country
FROM 
    Customer INNER JOIN
    Location ON Customer.Id = Location.Id;
```

ALTER VIEW.
```sql
ALTER VIEW vw_CustomerLocation
AS
SELECT
    Customer.FirstName, 
    Customer.Id, 
    Customer.LastName, 
    Customer.City, 
    Location.Country
FROM
    Customer INNER JOIN
    Location ON Customer.Id = Location.Id;
```

DROP VIEW.
```sql
DROP VIEW vw_CustomerLocation;
```
</details>

<details>
<summary><b><font size="+1">Users</font></b></summary>
</br>

CREATE a new user using SQL Server Authentication.
```sql
CREATE LOGIN [TestUser] WITH PASSWORD=N'Password', 
DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF;
```

CREATE a new user using Windows Authentication.
```sql
CREATE LOGIN [Domain\\TestUser] FROM WINDOWS WITH DEFAULT_DATABASE=[master];
```
EXECUTE AS a different user.
```sql
EXECUTE AS USER = 'Domain\\TestUser';

SELECT SUSER_SNAME();
-- Revert back to original user when complete
```
</details>

<details>
<summary><b><font size="+1">Stored Procedures</font></b></summary>
</br>

CREATE Stored Procedure.
```sql
CREATE PROC spCustomer  
    @FirstName nvarchar(50),   
    @LastName nvarchar(50)   
AS   
    SELECT 
		FirstName, 
		LastName
    FROM 
		Customer
    WHERE 
		FirstName = @FirstName AND 
		LastName = @LastName  
GO

EXEC spCustomers 'Nate', 'Dean';
```
CREATE Stored Procedure with optional parameter (@City).
```sql
CREATE PROCEDURE spCustomer  
    @FirstName nvarchar(50),   
    @LastName nvarchar(50),
	@City nvarchar(50) = NULL
AS   
    SELECT 
		FirstName, 
		LastName,
		City
    FROM 
		Customer
    WHERE 
		FirstName = @FirstName AND 
		LastName = @LastName  
GO
```
ALTER Stored Procedure.
```sql
ALTER PROC spCustomer  
    @FirstName nvarchar(50),   
    @LastName nvarchar(50),
	@City nvarchar(50)
	
AS
BEGIN
    SELECT 
		FirstName, 
		LastName,
		City
    FROM 
		Customer
    WHERE 
		FirstName = @FirstName AND 
		LastName = @LastName AND
		City = 'London'
END

EXEC spCustomers 'Nate', 'Dean', 'London';
```

DROP Stored Procedure.
```sql
DROP PROC spCustomers
```

</details>

<details>
<summary><b><font size="+1">Variables</font></b></summary>
</br>

DECLARE and SET variables.
```sql
DECLARE @DateSent DATETIME;
DECLARE @InboundEmail INT;
DECLARE @OutboundEmail INT;
DECLARE @TotalRequests INT;

SET @DateSent = '2020-01-12 08:00';
SET @InboundEmail = (SELECT COUNT(*) FROM queuedNotification WHERE direction = 1);
SET @OutboundEmail = (SELECT COUNT(*) FROM queuedNotification WHERE direction = 0);
SET @TotalRequests = (SELECT COUNT(*) FROM request);
```

SET variable using SELECT.
```sql
DECLARE @DateSent DATETIME;
DECLARE @InboundEmail INT;
DECLARE @OutboundEmail INT;
DECLARE @TotalRequests INT;

SET @DateSent = '2020-01-12 08:00';
SET @InboundEmail = (SELECT COUNT(*) FROM queuedNotification WHERE direction = 1); -- Variable set using Select statement
SET @OutboundEmail = (SELECT COUNT(*) FROM queuedNotification WHERE direction = 0);
SET @TotalRequests = (SELECT COUNT(*) FROM request);

-- Output content of variables in a row
SELECT 
		@TotalRequests AS Total,
		@InboundEmail AS Inbound,
		@OutboundEmail AS Outbound;

-- Output content of variables using Union
SELECT 'Total Requests' AS Info, @TotalRequests AS Total
UNION
SELECT 'Total Inbound Emails', @InboundEmail
UNION
SELECT 'Total Outbound Emails', @OutboundEmail;
```

```sql
DECLARE @FirstName NVARCHAR(50), @LastName NVARCHAR(50);
SELECT @FirstName = FirstName, -- Select variable 1 @LastName = LastName -- Select variable 2
FROM Contacts 
WHERE BusinessEntityID = 20778; -- Output content of variables
SELECT @FirstName AS Firstname, @LastName AS Lastname;
```

Return the output of variables using the PRINT statement.
```sql
SET NOCOUNT ON -- Removes the row count message
DECLARE @DateSent DATETIME
DECLARE @InboundEmail INT
DECLARE @OutboundEmail INT
DECLARE @TotalRequests INT

SET @DateSent = '2020-01-12 08:00'
SET @InboundEmail = (SELECT COUNT(*) FROM queuedNotification WHERE direction = 1)
SET @OutboundEmail = (SELECT COUNT(*) FROM queuedNotification WHERE direction = 0)
SET @TotalRequests = (SELECT COUNT(*) FROM request)

PRINT 'Total Requests in the system: ' + CAST(@TotalRequests AS VARCHAR(MAX)) -- Casts from INT to VARCHAR
PRINT 'Total Inbound Emails sent: ' + CAST(@InboundEmail AS VARCHAR(MAX))
PRINT 'Total Outbound Emails sent: ' + CAST(@OutboundEmail AS VARCHAR(MAX))
```

Output variable in a comma separated list.
```sql
DECLARE @Dictionary NVARCHAR(MAX);SET @Dictionary = '';
SELECT  @Dictionary = @Dictionary + name + ' ,'
FROM    dictionary;
PRINT @Dictionary;
```

Output variable on a separate line.
```sql
DECLARE @Dictionary NVARCHAR(MAX);
SET @Dictionary = '';
SELECT @Dictionary = @Dictionary + name + CHAR(10)
FROM dictionary;
PRINT @Dictionary;
```
</details>
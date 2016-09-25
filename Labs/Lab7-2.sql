/*
Lab 7-2: CTE = common table expression and derived tables (AKA table subqueries)

Derived tables are defined in the FROM clause of an outer query.

Challenge 2: Retrieve Customer Sales Revenue

Each Adventure Works customer is a retail company with a named contact. You must create queries that
return the total revenue for each customer, including the company and customer contact names.

Tip: Review the documentation for the WITH common_table_expression syntax in the Transact-SQL
language reference.

-- Syntax for SQL Server, Azure SQL Database, Azure SQL Data Warehouse, Parallel Data Warehouse  
  
[ WITH <common_table_expression> [ ,...n ] ]  
  
<common_table_expression>::=  
    expression_name [ ( column_name [ ,...n ] ) ]  
    AS  
    ( CTE_query_definition ) 

1. Retrieve sales revenue by customer and contact

Retrieve a list of customers in the format Company (Contact Name) together with the total revenue for
that customer. Use a derived table or a common table expression to retrieve the details for each sales
order, and then query the derived table or CTE to aggregate and group the data.

*** EXAMPLE ***

-- Define the CTE expression name and column list.  
WITH Sales_CTE (SalesPersonID, SalesOrderID, SalesYear)  
AS  
-- Define the CTE query.  
(  
    SELECT SalesPersonID, SalesOrderID, YEAR(OrderDate) AS SalesYear  
    FROM Sales.SalesOrderHeader  
    WHERE SalesPersonID IS NOT NULL  
)  
-- Define the outer query referencing the CTE name.  
SELECT SalesPersonID, COUNT(SalesOrderID) AS TotalSales, SalesYear  
FROM Sales_CTE  
GROUP BY SalesYear, SalesPersonID  
ORDER BY SalesPersonID, SalesYear;  

*/

-- You can do this 2 ways: Either using a derived table or using 
-- a CTE (common table expression)

-- (1) Using a derive table:

SELECT CompanyContact, SUM(SalesAmount) AS Revenue
FROM
	(SELECT CONCAT(c.CompanyName, CONCAT(' (' + c.FirstName + ' ', c.LastName + ')')), SOH.TotalDue
	 FROM SalesLT.SalesOrderHeader AS SOH
	 JOIN SalesLT.Customer AS c
	 ON SOH.CustomerID = c.CustomerID) AS CustomerSales(CompanyContact, SalesAmount)
GROUP BY CompanyContact
ORDER BY CompanyContact;

-- (2) Using a common table expression (CTE)

WITH CustomerSales(CompanyContact, SalesAmount)
AS
(SELECT CONCAT(c.CompanyName, CONCAT(' (' + c.FirstName + ' ', c.LastName + ')')), SOH.TotalDue
 FROM SalesLT.SalesOrderHeader AS SOH
 JOIN SalesLT.Customer AS c
 ON SOH.CustomerID = c.CustomerID)
SELECT CompanyContact, SUM(SalesAmount) AS Revenue
FROM CustomerSales
GROUP BY CompanyContact
ORDER BY CompanyContact;

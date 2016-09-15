-- Module 3 Demos

-- Return all customers even if they don't have any orders
SELECT c.FirstName, c.LastName, oh.SalesOrderNumber
FROM SalesLT.Customer AS c
LEFT OUTER JOIN SalesLT.SalesOrderHeader AS oh
ON c.CustomerID = oh.CustomerID
ORDER BY c.CustomerID;

-- Return customers that haven't bought anything.
SELECT c.FirstName, c.LastName
FROM SalesLT.Customer AS c
LEFT OUTER JOIN SalesLT.SalesOrderHeader AS oh
ON c.CustomerID = oh.CustomerID
WHERE oh.SalesOrderNumber IS NULL
ORDER BY c.CustomerID;

-- Return all products even if they haven't ever been ordered
SELECT p.Name AS ProductName, oh.SalesOrderNumber
FROM SalesLT.Product as p
LEFT OUTER JOIN SalesLT.SalesOrderDetail as od
ON p.ProductID = od.ProductID
LEFT OUTER JOIN SalesLT.SalesOrderHeader as oh
ON od.SalesOrderID = oh.SalesOrderID
ORDER BY p.ProductID;

-- Return all products even if they haven't ever been ordered
-- Add the product category.
SELECT p.Name AS ProductName, cat.Name AS Category, oh.SalesOrderNumber
FROM SalesLT.Product AS p
LEFT OUTER JOIN SalesLT.SalesOrderDetail AS od
ON p.ProductID = od.ProductID
LEFT OUTER JOIN SalesLT.SalesOrderHeader AS oh
ON od.SalesOrderID = oh.SalesOrderID
INNER JOIN SalesLT.ProductCategory AS cat
ON p.ProductCategoryID = cat.ProductCategoryID
ORDER BY p.ProductID; 

-- Create employee table so we can try out self join
CREATE TABLE SalesLT.Employee
(EmployeeID int IDENTITY PRIMARY KEY,
EmployeeName nvarchar(256),
ManagerID int);
GO
-- Populate the table using data from existing table
INSERT INTO SalesLT.Employee (EmployeeName, ManagerID)
SELECT DISTINCT Salesperson, NULLIF(CAST(RIGHT(SalesPerson, 1) as INT), 0)
FROM SalesLT.Customer;
GO
SELECT * FROM SalesLT.Employee;
UPDATE SalesLT.Employee
SET ManagerID = (SELECT MIN(EmployeeID) FROM SalesLT.Employee WHERE ManagerID IS NULL)
WHERE ManagerID IS NULL
AND EmployeeID > (SELECT MIN(EmployeeID) FROM SalesLT.Employee WHERE ManagerID IS NULL);
GO
-- Now, who reports to whom?
-- Use a self-join. A self-join is an inner, outer or cross join that matches rows in a table
-- to othe rows in the same table.
-- When defining a self-join, you mush specify an alias for at least one instance of
-- the table bing joined.
SELECT e.EmployeeName, m.EmployeeName AS ManagerName
FROM SalesLT.Employee AS e
LEFT JOIN SalesLT.Employee AS m
ON e.ManagerID = m.EmployeeID
ORDER BY e.ManagerID;
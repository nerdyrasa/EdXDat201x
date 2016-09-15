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

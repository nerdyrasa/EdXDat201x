-- Lab 3

-- 1-1. Retrieve customer orders.
SELECT c.CompanyName, s.SalesOrderID, s.TotalDue
FROM SalesLT.Customer AS c
INNER JOIN SalesLT.SalesOrderHeader as s
ON c.CustomerID = s.CustomerID;

-- 1-2. Retrieve customer orders with addresses.
SELECT c.CompanyName, a.AddressLine1 AS 'Line 1', 
       ISNULL(a.AddressLine2,'') AS 'Line 2', a.City, a.StateProvince, a.PostalCode, a.CountryRegion,
       s.SalesOrderID, s.TotalDue
FROM SalesLT.Customer AS c
INNER JOIN SalesLT.SalesOrderHeader as s
ON c.CustomerID = s.CustomerID
INNER JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Main Office'
INNER JOIN SalesLT.Address AS a
ON ca.AddressID = a.AddressID;
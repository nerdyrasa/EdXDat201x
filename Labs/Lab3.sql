-- Lab 3

--Challenge 1: Genereate Invoice Reports.

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

-- Challenge 2: Retrieve Sales Data

-- 2-1. Retrieve a list of all customers and their orders.
-- Customers who haven't placed any orders should be at the bottom of the list.
SELECT c.CompanyName, c.FirstName + ' ' + c.LastName AS Name, oh.SalesOrderID, oh.TotalDue
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.SalesOrderHeader AS oh
ON c.CustomerID = oh.CustomerID
ORDER BY oh.SalesOrderID DESC;  -- Specify DESC to show nulls at bottom of list.

-- 2-2. Retrieve a list of customers with no address.
SELECT c.CustomerID, c.CompanyName, c.FirstName + ' ' + c.LastName AS Name, c.Phone
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
WHERE ca.CustomerID IS NULL;

-- Just exploratory queries.
select * from saleslt.customer;
select * from saleslt.customeraddress;
select distinct addresstype from saleslt.customeraddress order by AddressType;

-- how many main office addresses
-- how many shipping addresses
select count (addresstype) from saleslt.customeraddress where addresstype = 'Main Office';
select count (addresstype) from saleslt.customeraddress where addresstype = 'Shipping';

-- 2-3. Retrieve a list of customers and products without orders.
-- A list of customers without orders
-- and  a list of products without orders in one table. 
-- Why you would want to do this, nobody knows.

SELECT c.CustomerID, p.ProductID
FROM SalesLT.Customer AS c
FULL JOIN SalesLT.SalesOrderHeader AS oh
ON c.CustomerID = oh.CustomerID
FULL JOIN SalesLT.SalesOrderDetail AS od
ON oh.SalesOrderID = od.SalesOrderID
FULL JOIN SalesLT.Product AS p
ON od.ProductID = p.ProductID
WHERE oh.SalesOrderID IS NULL
ORDER BY ProductID, CustomerID;

-- Doing this separately
Select c.CustomerID, oh.SalesOrderID
FROM SalesLT.Customer as c
full join SalesLT.SalesOrderHeader as oh
on c.customerID = oh.CustomerID
where oh.salesorderID is null
order by c.customerID;

Select p.productID, od.salesorderID
from SalesLT.Product as p
full join SalesLT.SalesOrderDetail as od
on p.productID = od.ProductID
where od.SalesOrderID IS NULL
order by ProductID;

SELECT c.CustomerID, p.ProductID
FROM SalesLT.Customer AS c
FULL JOIN SalesLT.SalesOrderHeader AS oh
ON c.CustomerID = oh.CustomerID
FULL JOIN SalesLT.SalesOrderDetail AS od
ON oh.SalesOrderID = od.SalesOrderID
FULL JOIN SalesLT.Product AS p
ON od.ProductID = p.ProductID
WHERE od.SalesOrderID IS NULL  -- can use either oh.SalesOrderID or od.SalesOrderID
							   -- doesn't seem to matter
ORDER BY ProductID, CustomerID;
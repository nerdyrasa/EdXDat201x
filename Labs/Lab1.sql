-- Lab 1

-- 1-1. Retrieve customer details.
SELECT * 
FROM SalesLT.Customer;

-- 1-2. Retrieve customer name data.
SELECT Title, FirstName, MiddleName, LastName, Suffix
FROM SalesLT.Customer;

-- 1-3. Retrieve customer names and phone numbers.
SELECT SalesPerson, CONCAT(Title, ' ',  LastName) AS CustomerName, Phone
FROM SalesLT.Customer;

-- Use ' ', NOT " "
-- 
SELECT SalesPerson, ISNULL(Title + ' ', '')  +  LastName AS CustomerName, Phone
FROM SalesLT.Customer;

-- 2-1. Retrieve a list of customer companies.
SELECT CAST(CustomerID AS varchar(5)) + ': ' + CompanyName AS Customers
FROM SalesLT.Customer; 

--
SELECT * FROM SalesLT.SalesOrderHeader;

-- 2-2. Retrieve a list of sales order revisions.
SELECT CAST(SalesOrderID as varchar(5)) + '(' + CAST(RevisionNumber as varchar(1)) + ')' AS SalesOrder,
CONVERT(varchar(10), OrderDate, 102) AS OrderDate
FROM SalesLT.SalesOrderHeader;

-- 3-1. Retrieve customer contact names with middle names if known.
SELECT FirstName + ISNULL(' ' + MiddleName + ' ', ' ') + LastName AS CustomerName
FROM SalesLt.Customer;

-- 3-2. Retrieve primary contact details.
SELECT CustomerID, COALESCE(EmailAddress, Phone) AS PrimaryContact
FROM SalesLt.Customer;

-- 3-3. Retrieve shipping status.
SELECT	SalesOrderID,
		CASE
			WHEN ShipDate IS NULL
				THEN 'Awaiting Shipment'
			ELSE 'Shipped'
		END AS ShippingStatus
FROM SalesLT.SalesOrderHeader;
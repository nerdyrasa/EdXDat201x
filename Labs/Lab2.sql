-- Lab 2

-- 1-1. Retrieve a list of cities.
SELECT DISTINCT City, StateProvince 
FROM SalesLT.Address; 

-- 1-2. Retrieve the heaviest products.
SELECT TOP 10 PERCENT Name, Weight
FROM SalesLT.Product
ORDER BY Weight DESC;

-- 1-3. Retrieve the heaviest 100 products not including the heaviest ten.
SELECT Name
FROM SalesLT.Product
ORDER BY Weight DESC
OFFSET 10 ROWS FETCH NEXT 100 ROWS ONLY;

-- 2-1. Retrieve product details for product model 1.
SELECT Name, Color, Size
FROM SalesLT.Product 
WHERE ProductModelID = 1;

-- 2-2. Filter products by color and size.
-- Doesn't seem to be case sensitive: black or Black, S or s
SELECT ProductNumber, Name -- , Color, Size
FROM SalesLT.Product
WHERE Color IN ('Black','Red','White') AND Size IN ('s','m');

-- 2-3. Filter products by product number.
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-%';

-- 2-4. Retrieve specific products by product number.
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';

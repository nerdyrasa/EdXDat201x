-- Lab 5

-- Challenge 1: Retrieve Product Information

-- 1. Retrieve 
-- productID
-- productName in UPPER
-- ApproxWeight rounder to the nearest whole unit

-- ROUND ( numeric_expression , length [ ,function ] )
-- UPPER ( character_expression ) 

SELECT ProductID, UPPER(Name), ROUND( weight, 0) AS ApproxWeight
FROM SalesLT.Product;

-- How to drop the .00?

-- 2. Retrieve
-- year
-- month name 
-- in which products were first sold.

-- DATENAME ( datepart , date ) 
-- YEAR ( date ) 

SELECT ProductID, UPPER(Name), ROUND( weight, 0) AS ApproxWeight,
YEAR(SellStartDate), DATENAME(mm, SellStartDate)
FROM SalesLT.Product;

-- 3. Extract
-- product types - leftmost 2 characters from product numbers.

SELECT ProductID, UPPER(Name), ROUND( weight, 0) AS ApproxWeight,
YEAR(SellStartDate), DATENAME(mm, SellStartDate)
,LEFT(ProductNumber, 2) AS ProductType
FROM SalesLT.Product;

-- GENERAL QUERY
SELECT * FROM SalesLT.Product;


-- 4. Filter so that only products with a numeric size are included.

SELECT ProductID, UPPER(Name), ROUND( weight, 0) AS ApproxWeight,
YEAR(SellStartDate) AS SellStartYear, 
DATENAME(mm, SellStartDate) AS SellStartMonth
,LEFT(ProductNumber, 2) AS ProductType
FROM SalesLT.Product
WHERE ISNUMERIC(Size) = 1;  -- 1 is true
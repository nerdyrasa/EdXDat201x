/*

Lab 7

Challenge 1 : Retrieve product model descriptions.

*/

-- views encapsulate select queries
-- can query a view the same way you query a table

--1. Retrieve product model description

SELECT P.ProductID, P.Name AS ProductName, PM.Name AS ProductModel, PM.Summary
FROM SalesLT.Product AS P
JOIN SalesLT.vProductModelCatalogDescription AS PM
ON P.ProductModelID = PM.ProductModelID
ORDER BY ProductID;

--2. Create a table of distinct colors. 

-- Use variables.

/*

Create a table variable and populate it with a list of distinct colors 
from the SalesLT.Product table. Then use the table variable to filter 
a query that returns the product ID, name, and color from the SalesLT.Product 
table so that only products with a color listed in the table variable 
are returned.

*/

DECLARE @colors AS TABLE (Color nvarchar(15));

INSERT INTO @Colors
SELECT DISTINCT Color FROM SalesLT.Product;

SELECT ProductID, Name, Color
FROM SalesLT.Product
WHERE Color IN (SELECT Color FROM @Colors);

/*

3. Retrieve product parent categories
The AdventureWorksLT database includes a table-valued function named dbo.ufnGetAllCategories, 
which returns a table of product categories (for example ‘Road Bikes’) and parent categories 
(for example ‘Bikes’). Write a query that uses this function to return a list of all products 
including their parent category and category.

*/

SELECT C.ParentProductCategoryName AS ParentCategory,
       C.ProductCategoryName AS Category,
       P.ProductID, P.Name AS ProductName
FROM SalesLT.Product AS P
JOIN dbo.ufnGetAllCategories() AS C
ON P.ProductCategoryID = C.ProductCategoryID
ORDER BY ParentCategory, Category, ProductName;
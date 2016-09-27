/*  MODULE 9: Modifying Data

Challenge 1: Inserting Products
Each Adventure Works product is stored in the SalesLT.Product table, and each product has a unique ProductID identifier, 
which is implemented as an IDENTITY column in the SalesLT.Product table. 
Products are organized into categories, which are defined in the SalesLT.ProductCategory table. 
The products and product category records are related by a common ProductCategoryID identifier, 
which is an IDENTITY column in the SalesLT.ProductCategory table. Tip: Review the documentation for INSERT in the Transact-SQL Language Reference.

1. Insert a product
Adventure Works has started selling the following new product. Insert it into the SalesLT.Product table, 
using default or NULL values for unspecified columns:
Name
ProductNumber
StandardCost
ListPrice
ProductCategoryID
SellStartDate
LED Lights
LT-L123
2.56
12.99
37
<Today>   GETDATE()
After you have inserted the product, run a query to determine the ProductID that was generated. 

@@IDENTITY: The last identity genereated in the session
SELECT SCOPE_IDENTITY() AS ProductID; The last identity generated in the current scope
IDENT_CURRENT('table_name'): The last identity inserted into a table

Then run a query to view the row for the product in the SalesLT.Product table.

*/

INSERT INTO SalesLT.Product(Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID,
SellstartDate)
VALUES
('LED Lights', 'LT-L123', 2.56, 12.99, 37, GETDATE());

select scope_identity() as ProductID;
select ident_current('saleslt.product');

select * from SalesLT.product where productid = scope_identity();
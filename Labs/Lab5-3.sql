-- Challenge 3: Aggregate Product Sales

-- 1. Retrieve total sales by product

-- product names
-- total revenue
-- as sum of LineTotal
-- sort in desc order of total revenue

SELECT  Name, SUM(LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS od
JOIN SalesLT.Product AS p ON od.ProductID=p.ProductID
GROUP BY p.Name
ORDER BY TotalRevenue DESC;

-- 2. Filter the product sales list to include only products that cost over $1000
SELECT  Name, SUM(LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS od
JOIN SalesLT.Product AS p ON od.ProductID=p.ProductID
WHERE p.ListPrice > 1000
GROUP BY p.Name
ORDER BY TotalRevenue DESC;

-- 3. Filter the product sales groups to include only totalsales over $20,000
SELECT  Name, SUM(LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS od
JOIN SalesLT.Product AS p ON od.ProductID=p.ProductID
WHERE p.ListPrice > 1000
GROUP BY p.Name
HAVING SUM(LineTotal) > 20000
ORDER BY TotalRevenue DESC;


-- extra

--

SELECT COUNT(ProductID) AS ProductIDCount, COUNT(OrderQty) AS QuantityCount, SUM(UnitPrice) AS PriceSum
FROM SalesLT.SalesOrderDetail;

SELECT PRODUCTID, ORDERQTY, UNITPRICE FROM SALESLT.SalesOrderDetail;

--
SELECT COUNT(CustomerID) AS CustomerCount, City AS CustomerCity, State AS CustomerState
FROM Sales.Customer


select count(addressid) AS AddressCount, city AS CustomerCity, stateprovince AS CustomerState
from saleslt.address
group by city, stateprovince;

select count(addressid), city, stateprovince
from saleslt.address
group by stateprovince, city;

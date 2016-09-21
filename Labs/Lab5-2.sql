-- Lab 5-2

-- Challenge 2: Rank Customers by Revenue

-- 1. Retrieve companies ranked by sales totls.

-- want a list of company names with a ranking of their place in a list of highest TotalDue values from the sales order header table

select * from SalesLT.SalesOrderHeader;
select count(*) from SalesLT.SalesOrderHeader;
select DISTINCT(CustomerID) from SalesLT.SalesOrderHeader;


SELECT c.CompanyName, 
oh.TotalDue AS Revenue,
RANK() OVER (ORDER BY oh.TotalDue DESC) AS Rank
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader as oh
ON c.CustomerID = oh.CustomerID;




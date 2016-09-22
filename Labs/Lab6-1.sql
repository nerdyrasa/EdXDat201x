-- Lab 6

/*
 Subqueries are Transact-SQL queries nested within an outer query.
 Scalar subqueries return a single value.
 Multi-valued subqueries return a single-column rowset.

 Challenge 1

1. Retrieve products whose list price is higher than the average unit price.

 Do this stepwise. Find the average unit price for all products that have sold.
 This is just all items in the salesorderdetail table.
 If the product sold, it's in this table.

*/

select avg(unitprice) from saleslt.salesorderdetail;

select productid, name, listprice
from saleslt.product
where listprice > (select avg(unitprice) from saleslt.salesorderdetail);

-- 2. Retrieve products with a list price of $100 or more that have been sold
-- for less than $100

select productid, name, listprice from saleslt.product
where productid in 
(select productid from saleslt.salesorderdetail
where unitprice < 100)
AND listprice >= 100
order by productid;

-- 3. Retrieve the cost, list price and average selling price for each product
-- that has been sold.


select productid, name, standardcost, listprice,
(select avg(od.unitprice) from saleslt.salesorderdetail as od 
where od.productid = p.productid) as AvgSellingPrice
from saleslt.product as p
order by productid;

/* What if I didn't want to include nulls--the products that didn't sell? */

-- 4. Retrieve products that have an average selling price that is lower than the cost

-- Filter previous query to include only products where the cost price is higher
-- than the average selling price.

select productid, name, standardcost, listprice,
(select avg(od.unitprice) from saleslt.salesorderdetail as od 
where od.productid = p.productid) as AvgSellingPrice
from saleslt.product as p
where standardcost > (select avg(od.unitprice) from saleslt.salesorderdetail as od 
where od.productid = p.productid)
order by productid;
 
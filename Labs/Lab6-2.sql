/*

Challeng2 2: Retrieve Customer Information

Using APPLY operator: there are two forms of apply:
1) cross apply -- returns only rows from outer table that produce a result set from tvf
2) outer apply -- retruns all rows, returning null in columns from tvf

1. Retrieve customer information for all sales orders.
Use dbo.ufnGetCustomerInformation function
*/

SELECT soh.SalesOrderID, soh.CustomerID, c.FirstName, c.LastName, soh.totaldue
FROM SalesLT.SalesOrderHeader AS soh
CROSS APPLY ufnGetCustomerInformation(soh.customerid) AS c
order by soh.SalesOrderID;

/*

2. Retrieve customer address information.

Retrieve customer id, first, last, address line 1 and city for all customers from 
saleslt.address and saleslt.customeraddress tables and the ufnGetCustomerInformation function.
*/
SELECT ca.CustomerID, ci.FirstName, ci.LastName, a.addressline1, a.city
from saleslt.address as a
join saleslt.customeraddress as ca
on a.addressid = ca.addressid
cross apply ufnGetCustomerInformation(ca.CustomerID) as ci
order by ca.CustomerID;


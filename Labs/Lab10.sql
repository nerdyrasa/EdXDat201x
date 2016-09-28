/*



Challenge 1: Creating scripts to insert sales orders
You want to create reusable scripts that make it easy to insert sales orders. 
You plan to create a script to insert the order header record, and a separate script to insert order detail records for a specified order header. 
Both scripts will make use of variables to make them easy to reuse. Tip: Review the documentation for variables and the IF…ELSE block in the Transact-SQL Language Reference.

1. Write code to insert an order header
Your script to insert an order header must enable users to specify values for the order date, due date, and customer ID. 
The SalesOrderID should be generated from the next value for the SalesLT.SalesOrderNumber sequence and assigned to a variable. 
The script should then insert a record into the SalesLT.SalesOrderHeader table using these values and a hard-coded value of ‘CARGO TRANSPORT 5’ 
for the shipping method with default or NULL values for all other columns.

After the script has inserted the record, it should display the inserted SalesOrderID using the PRINT command.
Test your code with the following values:
Order Date
Due Date
Customer ID
Today’s date
7 days from now
1


*/

DECLARE @OrderDate datetime = GETDATE();
DECLARE @DueDate datetime = DATEADD(dd, 7, GETDATE());
DECLARE @CustomerID int = 1;
DECLARE @OrderID int;

-- The db I'm using has SalesOrderID as an identity column, so the following doesn't work
-- SET @OrderID = NEXT VALUE FOR SalesLT.SalesOrderNumber;

INSERT INTO SalesLT.SalesOrderHeader(OrderDate, DueDate, CustomerID, ShipMethod)
VALUES
( @OrderDate, @DueDate, @CustomerID, 'CARGO TRANSPORT 5');

SET @OrderID = ident_current('SalesLT.SalesOrderHeader');

PRINT @OrderID;

DECLARE @SalesOrderID int, @ProductID int = 760, @Quantity int = 1, @UnitPrice money = 782.99;

SET @SalesOrderID = @OrderID;

PRINT @SalesOrderID

IF EXISTS (Select * FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID)
BEGIN
	INSERT INTO SalesLT.SalesOrderDetail (SalesOrderID, OrderQty, ProductID, UnitPrice)
	VALUES
	(@SalesOrderID, @Quantity, @ProductID, @UnitPrice);
	PRINT 'Successfully inserted.'
END
ELSE
BEGIN
	PRINT 'The order does not exist'
END


--if 'yes'='no'
--print 'true'
--else
--print 'false'

--update saleslt.product
--set discontinueddate=getdate()
--where productid=680;

--if @@rowcount<1
--begin
--	print 'Product was not found'
--end
--else
--begin
--	print 'Product Updated'
--end

--print ident_current('saleslt.product')

--declare @mostrecentid int = ident_current('saleslt.product')
--print @mostrecentid

--sp_help 'saleslt.product'

select * from saleslt.salesorderheader where salesorderid > 71955;

select * from saleslt.salesorderdetail where salesorderid > 71955;
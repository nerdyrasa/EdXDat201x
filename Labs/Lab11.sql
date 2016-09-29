/*

Lab 11:  Error Handling and Transactions

Challenge 1: Logging Errors
You are implementing a Transact-SQL script to delete orders, and you want to handle any errors that occur during the deletion process. Tip: Review the documentation for THROW and TRY…CATCH in the Transact-SQL Language Reference.
1. Throw an error for non-existent orders
You are currently using the following code to delete order data:
DECLARE @SalesOrderID int = <the_order_ID_to_delete>
DELETE FROM SalesLT.SalesOrderDetail WHERE SalesOrderID = @SalesOrderID;
DELETE FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID;
This code always succeeds, even when the specified order does not exist. Modify the code to check for the existence of the specified order ID before attempting to delete it. If the order does not exist, your code should throw an error. Otherwise, it should go ahead and delete the order data.
2. Handle


*/

DECLARE @SalesOrderID int = 0

-- Find a record to delete
SELECT @SalesOrderID = MIN(SalesOrderID) FROM SalesLT.SalesOrderHeader; 
-- Delete it
DELETE FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID;


BEGIN TRY
	IF NOT EXISTS (SELECT * FROM SalesLT.SalesOrderHeader
				   WHERE SalesOrderID = @SalesOrderID)
	BEGIN
		-- Throw a custom error if the specified order doesn't exist
		DECLARE @error varchar(100);
		SET @error = 'Order #' + cast(@SalesOrderID as varchar) + ' does not exist';
		THROW 50001, @error, 0
	END
	ELSE
	BEGIN
		DELETE FROM SalesLT.SalesOrderDetail
		WHERE SalesOrderID = @SalesOrderID;

		DELETE FROM SalesLT.SalesOrderHeader
		WHERE SalesOrderID = @SalesOrderID;
	END
END TRY
BEGIN CATCH
	-- Catch and print the error
	PRINT  ERROR_MESSAGE();
END CATCH

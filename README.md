### Microsoft: DAT201x Querying with Transact-SQL on EdX ###

- [x] LAB 1 : INTRODUCTION TO TRANSACT-SQL
- [x] LAB 2 : QUERYING TABLES WITH SELECT
- [x] LAB 3 : QUERYING MULTIPLE TABLES WITH JOINS
- [x] LAB 4 : USING SET OPERATORS
- [X] LAB 5 : USING FUNCTIONS AND AGGREGATING DATA
- [X] LAB 6 : USING SUBQUERIES AND APPLY
- [X] LAB 7 : USING TABLE EXPRESSIONS
    1. Derived tables
    2. Common table expressions (CTEs)
    3. Views
    4. Inline table-valued function (inline TVFs)
- [ ] LAB 8 : GROUPING SETS AND PIVOTING DATA
- [ ] LAB 9 : MODIFYING DATA
    1. IDENT_CURRENT('saleslt.product')  (NOTE: May be issues with IDENT_CURRENT)
- [ ] LAB 10: PROGRAMMING WITH TRANSACT-SQL
    1. When working with azure database, I was able to use SET @OrderID = NEXT VALUE FOR SalesLT.SalesOrderNumber. The sequence shows up under the programmability folder.
    2. When working with my local db, I had to use SET @OrderID = IDENT_CURRENT('table_name') since there was no sequence in my programmability folder.
    3. Must declare variables to use them: DECLARE @OrderDate datetime = GETDATE();
    4. DATEADD(dd, 7, GETDATE())
- [ ] LAB 11: ERROR HANDLING AND TRANSACTIONS
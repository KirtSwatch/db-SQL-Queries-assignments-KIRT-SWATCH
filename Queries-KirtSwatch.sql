-- KIRTVIR SINGH SWATCH (8800968)
-- COURSE – PROG8590 (RELATIONAL DATABASES)
-- INDIVIDUAL ASSIGNMENT – 1 (WEEK 3) 
-- SUBMITTED TO – MARYAM TRIKI

-- Question 1 – Query full names and birthdates and sort them by their birthdates.
-- ANSWER EXPLANATION – 
-- We can simply fetch First Name, Last Name, and Birthdate. Also, to sort the records, we need to use "order by" followed by the column name in descending order after the table name.

SELECT firstname, lastname, birthdate 
FROM Person 
ORDER BY birthdate DESC;

-- Question 2 – We need to get the postal code of the person with number: 7572381
-- ANSWER EXPLANATION -
-- In the WHERE clause, we simply put the number 7572381 as provided in the question. After SELECT, we fetch only the postal code as required.

SELECT postalCode 
FROM Person 
WHERE number = '7572381';

-- Question 3 - Write a query to show number, local city, and balance of the students with a negative amount in their balance and sort them by their balances from the highest value to the lowest. Change the Title to “Student ID” and “City”
-- ANSWER EXPLANATION –
-- We use the "AS" keyword to change the predefined column names. In the WHERE clause, we fetch all records with a balance less than 0. The ORDER BY clause is used for sorting the results.

SELECT number AS "Student ID", localCity AS "City", balance 
FROM Student 
WHERE balance < 0 
ORDER BY balance DESC;

-- Question 4 - Write a query to show the first name, last name, alternate phone number, and country code of the persons who have a NULL value in their alternate phone numbers and their country code is not ‘CAN’.
-- ANSWER EXPLANATION –
-- We use the 'NULL' keyword to fetch data with NULL values from columns. The '!=' (not equal) is used to fetch all data other than the CAN country code.

SELECT firstname, lastName, alternatePhone, countryCode 
FROM Person 
WHERE alternatePhone IS NULL 
AND countryCode != 'CAN';

------------//--------------------------------------------------------------------------------//----------------------------------------------------------------------------------//-------------------------------------------------------------

-- KIRTVIR SINGH SWATCH (8800968)
-- COURSE – PROG8590 (RELATIONAL DATABASES)
-- INDIVIDUAL ASSIGNMENT – 2
-- SUBMITTED TO – MARYAM TRIKI

-- Question 1 – Query full names (Title, First name, middle name, and last name) and email address for all persons. (You need to manage NULL values while concatenating the name parts).
-- ANSWER EXPLANATION –
-- We can simply fetch First Name, Middle Name, and Last Name by concatenation but here we need to include those columns having NULL Value also. so, need to use ISNULL function, because if any Title or middle name record has NULL value, it will skip it, add space (+ ' ') and continue concatenating the next column.

SELECT ISNULL(TITLE, '') + ' ' + FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName AS FullName,
       ea.EmailAddress
FROM person.Person p
INNER JOIN person.EmailAddress ea ON p.BusinessEntityID = ea.BusinessEntityID;

-- Question 2 – Query the products that are NOT in the Inventory. Use alias for the tables

-- ANSWER EXPLANATION –
-- We have to fetch all the product records which are not in the production inventory table.
-- used left join (on product and product inventory) and with the help of where clause - excluded common records between both tables so we can get the records which are not in inventory.

SELECT *
FROM Production.Product AS p
LEFT JOIN Production.ProductInventory AS Pin ON p.ProductID = pin.ProductID
WHERE pin.ModifiedDate IS NULL;

-- Question 3 - Write a query to show products (product ID, product name ) with a special offer.

-- ANSWER EXPLANATION –
-- Just joining them with the help of inner join with the help of product id. Based on the matching product ID in the product table and product ID in the special offer table

SELECT p.productid, p.[name]
FROM production.product p
INNER JOIN sales.SpecialOfferProduct Sop ON p.ProductID = Sop.ProductID;

-- Question 4 - Write a query to show products with the same rating.

-- ANSWER EXPLANATION –
-- Self joining the table based on Rating (will retrieve all the matching columns)
-- and in where clause just put email address not equal to email from self table. This way we discarded all the records having the same email in both tables (i.e. same) and the query will eventually fetch the unique products having the same rating.

SELECT *
FROM Production.ProductReview PR1
INNER JOIN Production.ProductReview PR2 ON PR1.Rating = PR2.Rating
WHERE PR1.EmailAddress != PR2.EmailAddress;


------------//--------------------------------------------------------------------------------//----------------------------------------------------------------------------------//-------------------------------------------------------------



-- KIRTVIR SINGH SWATCH (8800968) 
-- COURSE – PROG8590 (RELATIONAL DATABASES) 
-- INDIVIDUAL ASSIGNMENT – 3 
-- SUBMITTED TO – MARYAM TRIKI | DUE DATE – 24 FEB 2022

-- Question 1 – Count the number of un-repeated product IDs in the PurchaseOrderDetail table.
-- Using aggregate function distinct to count all the distinct product IDs, then again including this result in count function so we can count the no of rows returned by distinct function.
SELECT COUNT(DISTINCT ProductID) AS Product_Count FROM Purchasing.PurchaseOrderDetail;

-- Question 2 – Show the productID of the most profitable product after price and order quantity are considered.
-- Using order quantity and ProductID in group by clause to group them. Selecting only the top 1 ProductID row, then getting the maximum profit by multiplying Order quantity and sum of all the unit prices under that product ID.
SELECT TOP 1 ProductID, (SUM(UnitPrice) * OrderQty) AS Maximum_Profit 
FROM Purchasing.PurchaseOrderDetail 
GROUP BY OrderQty, ProductID 
ORDER BY Maximum_Profit DESC;

-- Question 3 - Show the names of the top 5 most profitable products, considering price and quantity sold.
-- Joining 2 tables Purchasing.PurchaseOrderDetail (to sum LineTotal) and Production.Product (to fetch the names of products) with the help of inner joining them with ProductID. Grouping the query by Name and summing up LineTotal in descending order to retrieve top 5 products.
SELECT TOP (5) P.Name AS TOP_PROFITABLE_PRODUCT_NAMES 
FROM Purchasing.PurchaseOrderDetail POD 
INNER JOIN Production.Product P ON POD.ProductID = P.ProductID
GROUP BY P.Name
ORDER BY SUM(POD.LineTotal) DESC;

-- Question 4 - Show all product IDs with stock quantity less than the average stock quantity.
-- Using a subquery to fetch the average of stocked quantity from PurchaseOrderDetail table. Then using the resulted average value to fetch ProductID and Stocked Quantity and putting the subquery result after the WHERE condition.
SELECT ProductID, StockedQty 
FROM Purchasing.PurchaseOrderDetail 
WHERE StockedQty < (SELECT AVG(StockedQty) FROM Purchasing.PurchaseOrderDetail);

-- Question 5 - Show the product ID and the modified date of the products with the special offer “Half-Price Pedal Sale”.
-- Using a subquery to fetch the special offer ID on all “Half-Price Pedal Sale” products from SpecialOffer Table. By using the result of this sub-query, retrieving Modified Date and Product Id of all the products.
SELECT ProductID, ModifiedDate 
FROM Sales.SpecialOfferProduct 
WHERE SpecialOfferID = (SELECT SpecialOfferID FROM Sales.SpecialOffer WHERE Description = 'Half-Price Pedal Sale');



------------//--------------------------------------------------------------------------------//----------------------------------------------------------------------------------//-------------------------------------------------------------

USE [AdventureWorks2014]
-- Part 1: Simple Subqueries

-- Q1: Show the highest price for which any individual product has been sold.
select ProductID, MAX(UnitPrice) as 'Highest Price'
from [Sales].[SalesOrderDetail] s
group by ProductID

-- Q2: Retrieve products with a ListPrice higher than the maximum selling price.
SELECT [ProductID],[Name]
FROM [Production].[Product]
WHERE [ListPrice] > (SELECT MAX([UnitPrice]) FROM [Sales].[SalesOrderDetail])

-- Q3: Return the ProductID for each product that has been ordered in quantities of 20 or more.
select s.ProductID
from Sales.SalesOrderDetail as s
where OrderQty >= 20

-- Q4: Retrieve the names of the products that have been ordered in quantities of 20 or more using subquery.
select distinct ProductID, [Name]
from Production.product as p
where p.ProductID in (select s.ProductID from Sales.SalesOrderDetail as s where OrderQty >= 20)

-- Q5: Retrieve the names of the products that have been ordered in quantities of 20 or more using Joins.
SELECT DISTINCT NAME 
FROM [Production].[Product] AS P1
INNER JOIN  [Sales].[SalesOrderDetail] AS S1
ON S1.ProductID = P1.ProductID
WHERE S1.OrderQty >= 20

-- Part 2: Correlate Subquery

-- Q1: Return the order ID, product ID, and quantity for each sale of a product with maximum ordered quantity.
SELECT od.SalesOrderID, od.ProductID, od.OrderQty
FROM [Sales].[SalesOrderDetail] od
WHERE od.OrderQty = (SELECT MAX([OrderQty]) FROM [Sales].[SalesOrderDetail] AS s WHERE od.ProductID=s.ProductID)

-- Q2: Retrieve the order ID, order date, and customer ID for each order that has been placed.
SELECT [SalesOrderID],[OrderDate],[CustomerID]
FROM [Sales].[SalesOrderHeader]

-- Q3: Modify the query in 2 to include the company name for each customer using a correlated subquery in the SELECT clause.
SELECT soh.SalesOrderID, soh.OrderDate, soh.CustomerID, 
       (SELECT [AccountNumber] FROM [Sales].[Customer] AS c WHERE c.CustomerID=soh.CustomerID) As companyName
FROM [Sales].[SalesOrderHeader] soh

-- Challenges

-- 1. Retrieve the product ID, name, and list price for each product where the list price is higher than the average unit price for all products that have been sold.
SELECT [ProductID],[Name],[ListPrice]
FROM [Production].[Product]
WHERE [ListPrice] > (SELECT AVG([UnitPrice]) FROM [Sales].[SalesOrderDetail])

-- 2. Retrieve the product ID, name, and list price for each product where the list price is 100 or more and the product has been sold for less than 100.
SELECT [ProductID],[Name],[ListPrice]
FROM [Production].[Product]
WHERE [ListPrice] >= 100
AND ProductID IN (SELECT [ProductID] FROM [Sales].[SalesOrderDetail] WHERE [LineTotal] < 100)

-- 3. Retrieve the product ID, name, cost, and list price for products that have an average selling price that is lower than the cost.
SELECT [ProductID],[Name],[StandardCost],[ListPrice],
       (SELECT AVG([UnitPrice]) FROM [Sales].[SalesOrderDetail] sod WHERE sod.ProductID=p.ProductID) As Average
FROM [Production].[Product] p
WHERE (SELECT AVG([UnitPrice]) FROM [Sales].[SalesOrderDetail] sod WHERE sod.ProductID=p.ProductID) < p.StandardCost

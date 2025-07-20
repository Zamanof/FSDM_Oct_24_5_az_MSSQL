-- Aggregate functions
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/aggregate-functions-transact-sql?view=sql-server-ver17

--SELECT *
--FROM Books_En


-- SUM(column_name)

--SELECT SUM(Pages) AS SumPages
--FROM Books_En

--SELECT SUM(Pages) AS SumPages
--FROM Books_En
--WHERE Category LIKE N'Windows 98'

-- COUNT(* | column_name)

--SELECT COUNT(*) AS BooksCount
--FROM Books_En

--SELECT COUNT(Id) AS BooksCount
--FROM Books_En

--SELECT COUNT(Category) AS CategoryCount
--FROM Books_En

--SELECT COUNT(DISTINCT Category) AS UniqueCategoryCount
--FROM Books_En

--SELECT SUM(Price)/COUNT(Price) AS AveragePrice
--FROM Books_En


-- AVG(column_name)

--SELECT AVG(Price) AS AveragePrice
--FROM Books_En

-- MIN(column_name), MAX(column_name)

--SELECT MIN(Price) AS MinimumPrice
--FROM Books_En

--SELECT MAX(Price) AS MaximumPrice
--FROM Books_En

--SELECT MIN([Name]) AS MinimumName
--FROM Books_En

--SELECT MAX([Name]) AS MaximumName
--FROM Books_En

-- Aggregate functions
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/aggregate-functions-transact-sql?view=sql-server-ver17

--SELECT *
--FROM Books_En

-- SUM(column_name) -

--SELECT SUM(Pages) AS AllPageSum
--FROM Books_En

--SELECT SUM(Pages) AS AllPageSum
--FROM Books_En
--WHERE Category LIKE N'Tutorials'


-- COUNT(* | column_name)

--SELECT COUNT(*) AS BookCount
--FROM Books_En

--SELECT COUNT(Category) AS CategoryCount
--FROM Books_En

--SELECT COUNT(DISTINCT Category) AS UniqueCategoryCount
--FROM Books_En

--SELECT SUM(Price) /COUNT(Price) AS AveragePrice
--FROM Books_En

-- AVG(column_name)

--SELECT AVG(Price) AS AveragePrice
--FROM Books_En

-- MIN(column_name), MAX(column_name)

--SELECT MIN(Price) AS MinimalPrice
--FROM Books_En

--SELECT MAX(Price) AS MaximalPrice
--FROM Books_En

--SELECT MIN([Name]) AS NameMin
--FROM Books_En

--SELECT MAX([Name]) AS NameMax
--FROM Books_En
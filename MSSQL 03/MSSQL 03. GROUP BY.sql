-- Column 'Books_En.Category' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.

--SELECT Category, SUM(Pages) AS SumPagesByCategory
--FROM Books_En
--WHERE Category IS NOT NULL
--GROUP BY Category

--SELECT Category, Topic, SUM(Pages) AS SumPagesByCategoryAndTopic
--FROM Books_En
--WHERE Category IS NOT NULL
--GROUP BY Category, Topic

-- An aggregate may not appear in the WHERE clause unless it is in a subquery contained in a HAVING clause or a select list, and the column being aggregated is an outer reference.

--SELECT Category, AVG(Price) AS AveragePriceByCategory
--FROM Books_En
--WHERE Category IS NOT NULL AND AVG(Price) > 50
--GROUP BY Category

-- HAVING
--SELECT Category, AVG(Price) AS AveragePriceByCategory
--FROM Books_En
--WHERE Category IS NOT NULL
--GROUP BY Category
--HAVING AVG(Price) > 50

-- WHERE VS HAVING
--SELECT Category, SUM(Pages) AS SumPagesByCategory
--FROM Books_En
--WHERE Category IS NOT NULL
--GROUP BY Category
--HAVING SUM(Pages) != 0

--SELECT Category, SUM(Pages) AS SumPagesByCategory
--FROM Books_En
--WHERE Category IS NOT NULL AND Pages != 0
--GROUP BY Category

-- HAVING-də yalnız GROUP BY-da göstərilən sütunları istifadə etmək olar
--SELECT Category, Topic, AVG(Pages) AS AveragePagesByCategoryAndTopic
--FROM Books_En
--WHERE Category IS NOT NULL
--GROUP BY Category, Topic
--HAVING Price > 50

-- Aggregate function-lar üçün digər aggregate function-ları parameter kimi istifadə etmək olmaz
--SELECT Topic, MAX(COUNT(*))
--FROM Books_En
--GROUP BY Topic

SELECT TOP(1) Topic, COUNT(*) AS BookCount
FROM Books_En
WHERE Topic IS NOT NULL
GROUP BY Topic
ORDER BY BookCount DESC


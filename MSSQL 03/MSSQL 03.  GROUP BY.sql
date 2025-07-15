-- Column 'Books_En.Category' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.
--SELECT Category, SUM(Pages) AS SumPagesByCategory
--FROM Books_En

SELECT Category, SUM(Pages) AS SumPagesByCategory
FROM Books_En
WHERE Category IS NOT NULL
GROUP BY Category

SELECT Category, Topic, SUM(Pages) AS SumPagesByCategory
FROM Books_En
WHERE Category IS NOT NULL
GROUP BY Category, Topic


-- An aggregate may not appear in the WHERE clause unless it is in a subquery contained in a HAVING clause or a select list, and the column being aggregated is an outer reference.

--SELECT Category, AVG(Pages) AS AVGPagesByCategory
--FROM Books_En
--WHERE Category IS NOT NULL AND AVG(Pages) > 300
--GROUP BY Category

--SELECT Category, AVG(Pages) AS AVGPagesByCategory
--FROM Books_En
--WHERE Category IS NOT NULL
--GROUP BY Category
--HAVING AVG(Pages) > 300

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

--SELECT Category, Topic, AVG(Pages) AS AVGPagesByCategory
--FROM Books_En
--WHERE Category IS NOT NULL
--GROUP BY Category, Topic
--HAVING Price > 20

-- Aggregate funksiyalara parametr olaraq digər Aggregate funksiyaları göndərmək olmaz
-- Cannot perform an aggregate function on an expression containing an aggregate or a subquery.

SELECT Topic, MAX(COUNT(*))
FROM Books_En
GROUP BY Topic


SELECT TOP(1) Topic, COUNT(*) AS BookCount
FROM Books_En
WHERE Topic IS NOT NULL
GROUP BY Topic
ORDER BY BookCount DESC
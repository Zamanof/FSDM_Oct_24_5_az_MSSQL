-- Subquery

-- Correlation Subquery - example 3
-- Alt sorğunun nəticəsi əsas sorğuda seçilən sətirlərdən asılı olur

-- Non Correlation Subquery - example 1, 2, 4
-- Əgər SELECT Sorğusu bütün sorğu üçün faktiki olaraq
-- bir sorğu yerinə yetirir
-- Yəni alt sorğunun nəticəsi əsas sorğuda seçilən 
-- sətirlərdən asılı olmur

-- 1.
-- without subquery
SELECT TOP(1) *
FROM Students
ORDER BY Age

-- with subquery
SELECT *
FROM Students
WHERE Age = (SELECT MIN(Age) FROM Students)

-- 2.
SELECT *
FROM Students
WHERE Age > (SELECT AVG(Age) FROM Students)
ORDER BY Age


-- 3. 
-- without subquery
SELECT [Group], AVG(Age)
FROM Students
GROUP BY [Group]

-- subquery
SELECT DISTINCT [Group],
				( SELECT AVG(Age)
				  FROM Students AS SubStud
				  WHERE SubStud.[Group] = Stud.[Group] 
				  ) AS AverageAge
FROM Students AS Stud


-- 4.
SELECT FirstName + N' ' + LastName AS FullName
FROM (	SELECT Id, FirstName, LastName
		FROM Students
		WHERE Age > 50) AS Studs 


-- SELECT, FROM, WHERE

--SELECT *
--FROM Students.dbo.Students

--SELECT *
--FROM dbo.Students

--SELECT *
--FROM Students

--SELECT FirstName, LastName, Age, [Group] 
--FROM Students


--SELECT FirstName + ' ' + LastName, 2025 - Age
--FROM Students

-- Alias
--SELECT FirstName + ' ' + LastName AS FullName, 2025 - Age AS [Born Year]
--FROM Students

--SELECT ALL [Group]
--FROM Students

-- DISTINCT - təkrarlanan dataları, təkrarlanmadan seçmək üçündür
--SELECT DISTINCT [Group]
--FROM Students

-- ORDER BY column_name [ASC | DESC] - by default ASC
--SELECT FirstName, LastName, Age
--FROM Students
--ORDER BY Age ASC

--SELECT FirstName, LastName, Age
--FROM Students
--ORDER BY Age DESC


--SELECT FirstName, LastName, Age
--FROM Students
--ORDER BY FirstName, Age DESC

-- WHERE -  dataların şərtə uyğun olaraq seçilməsi
-- comparison operators: 
-- >		- Greater Than
-- <		- Less Than
-- >=		- Great or Equal
-- <=		- Less or Eqaul
-- =		- Equal 
-- <> (!=)  - Not Equal

--SELECT FirstName, LastName, Age
--FROM Students
--WHERE Age > 55


--SELECT FirstName, LastName, Age
--FROM Students
--WHERE FirstName = N'Olqa'

-- AND, OR, NOT

--SELECT FirstName, LastName, Age
--FROM Students
--WHERE FirstName = N'Olqa' AND Age > 70


--SELECT FirstName, LastName, Age
--FROM Students
--WHERE FirstName = N'Olqa' OR Age > 70


--SELECT FirstName, LastName, Age
--FROM Students
--WHERE FirstName = N'Olqa' OR NOT Age > 70

-- IS [NOT] NULL
SELECT FirstName, LastName, Age, [Group]
FROM Students
WHERE [Group] IS NULL

SELECT FirstName, LastName, Age, [Group]
FROM Students
WHERE [Group] IS NOT NULL

-- IN, BETWEEN 

-- BETWEEN Example
--SELECT FirstName, LastName, Age, [Group]
--FROM Students
--WHERE Age >= 43 AND Age <= 85

--SELECT FirstName, LastName, Age, [Group]
--FROM Students
--WHERE Age BETWEEN 43 AND 85

-- IN Example
--SELECT FirstName, LastName, Age, [Group]
--FROM Students
--WHERE FirstName = N'Olqa' OR  FirstName = N'Petr' OR  FirstName = N'Ruslan'

--SELECT FirstName, LastName, Age, [Group]
--FROM Students
--WHERE FirstName IN (N'Olqa', N'Petr', N'Ruslan')


/*
LIKE - sətirlərdə daha dəqiq seçimlər etmək üçün

%			- 0 və ya daha çox istənilən simvol
_			- 1 istənilən simvol
[aet]		- göstərilən simvollardan hər hansı biri
[a-t]		- göstərilən aralıqda simvollardan hər hansı biri
[^aet]		- göstərilən simvollardan heç biri
*/

--SELECT FirstName, LastName, Age
--FROM Students
--WHERE FirstName = N'Olqa'

--SELECT FirstName, LastName, Age
--FROM Students
--WHERE FirstName LIKE N'Olqa'

--SELECT FirstName, LastName, Age
--FROM Students
--WHERE FirstName LIKE N'O%'

--SELECT FirstName, LastName, Age
--FROM Students
--WHERE FirstName NOT LIKE N'O%'

--SELECT FirstName, LastName, Age
--FROM Students
--WHERE FirstName LIKE N'O%' AND LastName NOT LIKE N'M%'

--SELECT FirstName, LastName, Age
--FROM Students
--WHERE FirstName LIKE N'_a%'

--SELECT FirstName, LastName, Age
--FROM Students
--WHERE FirstName LIKE N'[OQPY]%'

--SELECT FirstName, LastName, Age
--FROM Students
--WHERE FirstName LIKE N'[^OQPY]%'

--SELECT FirstName, LastName, Age
--FROM Students
--WHERE FirstName LIKE N'[N-Y]%'

--SELECT FirstName, LastName, Age
--FROM Students
--WHERE FirstName LIKE N'[^N-Y]%'

--SELECT FirstName, LastName, Age
--FROM Students
--WHERE LastName LIKE N'%ova'

--SELECT FirstName, LastName, Age
--FROM Students
--WHERE LastName LIKE N'%ov%'


-- TOP (N) - ilk N sayda seçimi göstər

-- cədvəldə olan ilk 5 tələbəni göstər
SELECT TOP(5) FirstName, LastName, Age
FROM Students

--ən cavan bir tələbə
--SELECT TOP(1) FirstName, LastName, Age
--FROM Students
--ORDER BY Age


--ən yaşlı bir tələbə
--SELECT TOP(1) FirstName, LastName, Age
--FROM Students
--ORDER BY Age DESC


-- OFFSET (N) ROWS - Seçim N sayda sətrini buraxmaq
-- (Yalnız ORDER BY ilə işləyir və TOP istifadə etmək olmaz)
--Error: A TOP can not be used in the same query or sub-query as a OFFSET.
SELECT FirstName, LastName, Age
FROM Students
ORDER BY FirstName
OFFSET (7) ROW

-- FETCH NEXT (N) ROWS ONLY - Növbəti N sayda sətri göstər
-- (OFFSET açar sözü ilə birlikdə işləyir)

--SELECT FirstName, LastName, Age
--FROM Students
--ORDER BY FirstName
--OFFSET (7) ROW
--FETCH NEXT (3) ROWS ONLY


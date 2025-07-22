-- User Definition Functions - (UDF)

-- UDF iki tipdə olur
-- Scalar-valued functions
-- Table-valued functions

USE [Library]

--CREATE FUNCTION CountBooksForReturn(@stud_id AS int)
--RETURNS int
--AS
--BEGIN
--	DECLARE @books AS int = 0
--	SELECT @books = COUNT(*)
--	FROM S_Cards
--	WHERE S_Cards.Id_Student = @stud_id AND S_Cards.DateIn IS NULL

--	RETURN @books
--END

--SELECT dbo.CountBooksForReturn(5) AS BookCount

--DECLARE @count int = 0
--EXEC @count = CountBooksForReturn 5
--SELECT @count AS BookCount

-- Table valued example
--CREATE FUNCTION BookList()
--RETURNS TABLE
--AS
--RETURN(
--	SELECT	B.[Name] AS BookName, 
--			C.[Name] AS CategoryName,
--			T.[Name] AS ThemeName,
--			A.FirstName + N' '+ A.LastName AS Author

--	FROM Books AS B
--	INNER JOIN Authors AS A ON A.Id = B.Id_Author
--	INNER JOIN Categories AS C ON C.Id = B.Id_Category
--	INNER JOIN Themes AS T ON T.Id = B.Id_Themes
--)

--SELECT *
--FROM BookList()


--CREATE FUNCTION BooksCountByAuthor()
--RETURNS @BooksAuthors TABLE (Author nvarchar(50), BooksCount int)
--AS
--BEGIN 
--	DECLARE @temp_books TABLE (Author nvarchar(50), BooksCount int)
--	INSERT @temp_books
--	SELECT A.FirstName + N' ' + A.LastName, COUNT(SC.Id_Book)
--	FROM Books AS B
--	INNER JOIN Authors AS A ON B.Id_Author = A.Id
--	INNER JOIN S_Cards AS SC ON SC.Id_Book = B.Id
--	GROUP BY A.FirstName, A.LastName

--	INSERT @temp_books
--	SELECT A.FirstName + N' ' + A.LastName, COUNT(TC.Id_Book)
--	FROM Books AS B
--	INNER JOIN Authors AS A ON B.Id_Author = A.Id
--	INNER JOIN T_Cards AS TC ON TC.Id_Book = B.Id
--	GROUP BY A.FirstName, A.LastName

--	DECLARE @temp_books2 TABLE (Author nvarchar(50), BooksCount int)
--	INSERT @temp_books2
--	SELECT T.Author, SUM(T.BooksCount)
--	FROM @temp_books AS T
--	GROUP BY T.Author

--	INSERT @BooksAuthors
--	SELECT T.Author, T.BooksCount
--	FROM @temp_books2 AS T

--	RETURN
--END

--SELECT  *
--FROM BooksCountByAuthor() AS B
--WHERE BooksCount = (SELECT MAX(BooksCount)
--					  FROM BooksCountByAuthor() AS B)

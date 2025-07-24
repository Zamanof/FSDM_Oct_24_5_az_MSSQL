/*
UDF - adlandirilmish T_SQL komandalar blokudur.
Parametrler qebul ede bilir ve deyer qaytara bilir (skalyar ve ya table)

Istifadechi funksiyalari neyinse deyishdirilmesi uchun yox, 
hesablamalarin heyata kechirilmesi ve melumatlarin sechilmesi uchun nezerde tutulub

Istifadechi funksiyalarinin Sql Server melumatlarina girish huququ var,
amma onlar DDL-i yerine yetire bilmirler, 
bu, o demekdir ki, onlar cedveller yarada bilmir,cedvelleri, 
indeksleri ve ya istenilen diger obyektleri modifikasiya ede bilmir. 
Onlar hemchinin DML instruksiyalarinin komeyi ile daimi cedvellerde istenilen 
melumatlari deyishdire bilmir.

   IstifadechiIstifadechi terefinden teyin olunan funksiyanin 2 esas tipi movcuddur :
	+ skalyar funksiyalar (chagirish eden terefe yegane anlami qaytarir)
	+ cedvel anlamli funksiyalar(cedveli qaytarir)

	Skalyar funksiyalar Bir anlami qaytaran deyimin meydana gele bildiyi istenilen sorgu yerinde peyda ola biler.

    Cedvel anlamli funksiya T-SQL sorgusunda cedvel neticesinin gozlenildiyi yerde chagirila biler(FROM cumlesinde oldugu kimi)
	Bele funksiyani Exec-in komeyile chagirmaq mumkun deyil


CREATE FUNCTION func_name
(param1 AS data_type [= deafault value],
...
paramN AS data_type [= deafault value]
)
RETURNS return_data_type
AS
BEGIN
	function_body
	RETURN value
END

table tipli deyishenin yaradilmasi
DECLARE @variable_name
	col1 data_type specificator
	col2 data_type specificator
	...
	colN data_type specificator
*/

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

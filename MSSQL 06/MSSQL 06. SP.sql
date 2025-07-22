-- Stored Procedure (SP)
/*
/*
	Saxlanilan prosedurlar - SP  (Stored procedures - SP)

	Saxlanilan prosedur  - T-SQL komandalarinin adıqoyilmuş blokudur.Blok giriş və çıxış parametrlərinə malik ola bilər
	
	Saxlanılan prosedur həmişə səhvin kodu olan rəqəmi qaytarir.Əgər prosedur uğurla yerinə yetirilibsə, onda sıfır qayıdır, əgər uğursuz yerinə yetirilibsə onda səhvin kodu qayıdır.
	
	Saxlanılan prosedurlar hansısa əməliyyatlarin yerine yetirilmesi üçün  nəzərdə tutulub : məlumatlarda  dəyişikliklərin edilməsi, BD arxitekturası ilə birgə əməkdaşlıq

	SP ilə nə etmək olar :
	+ onları EXECUTE KOMANDASİNİN KOMEYİLE T-SQL KODUNDAN ÇAĞIRMAQ  OLAR
	;onlara məlumatları giriş parametrlərinin vasitəsilə ötürmək və onlardan məlumatları çıxış parametrləri vasitəsilə geri almaq olar
	+ onlar nəticələndirən sorğular qrupunu kliyent proqramına qaytara bilirlər
	+ onlar cədvəldəki məlumatlarda dəyişikliklər edə bilirlər
	+ оnlar cədvəl və indeks yarada,dəyişdirə və ləğv edə bilirlər

	SP-den istifade etmeyin ustunlukleri 
	+ T-SQL kodunun inkapsulyasiyasi
	+ melumatlar bazasinin daha da tehlukesiz olmasinin temin edilmesi
	+ Istifadecilere ve proqramlara melumatlardan istifade ucun daha universal girish seviyyesinin tegdim edilmesi
	+yerine yetirilme planlarinin yaradilmasi vasitesile mehsuldarligin yukseldilmesi.bu planlar tekraren istifade oluna biler

	:Demek olar ki, BUTUN T-SQL INSTRUKSIYALARI SAXLANILAN PROSEDURA DAXIL EDILE BILER
	+  USE <database name>;komandasini istifade etmek olmaz
	+ Create instruksiyasini bu tip komandalarla istifade etmek olmaz: AGGREGATE, RULE, DEFAULT, 
	  CREATE, FUNCTION, TRIGGER, PROCEDURE ya  VIEW;
	+ CREATE, ALTER  ve DROP instruksiyalarinin komeyi ile cedvel ve indeksi yaratmaq, deyishmek ve leğv etmek olar

*/
USE [Library]

GO

--CREATE PROCEDURE TakenBooks
--AS 
--BEGIN
--	SELECT S.FirstName, S.LastName, B.[Name]
--	FROM Students AS S
--	INNER JOIN S_Cards AS SC
--	ON S.Id = SC.Id_Student
--	INNER JOIN Books AS B
--	ON SC.Id_Book = B.Id
--	WHERE SC.DateIn IS NULL
--END

--EXECUTE TakenBooks

--EXEC TakenBooks

--ALTER PROCEDURE TakenBooks
--	@group AS nvarchar(50)
--AS 
--BEGIN
--	SELECT S.FirstName, S.LastName, B.[Name]
--	FROM Students AS S
--	INNER JOIN S_Cards AS SC
--	ON S.Id = SC.Id_Student
--	INNER JOIN Books AS B
--	ON SC.Id_Book = B.Id
--	INNER JOIN Groups AS G
--	ON S.Id_Group = G.Id
--	WHERE SC.DateIn IS NULL AND G.[Name] = @group
--END

--EXEC TakenBooks '18P2 '

--SELECT *
--FROM Groups

--ALTER PROCEDURE TakenBooks
--	@group AS nvarchar(50),
--	@count_studs AS int OUTPUT
--AS 
--BEGIN
--	SELECT S.FirstName, S.LastName, B.[Name]
--	FROM Students AS S
--	INNER JOIN S_Cards AS SC
--	ON S.Id = SC.Id_Student
--	INNER JOIN Books AS B
--	ON SC.Id_Book = B.Id
--	INNER JOIN Groups AS G
--	ON S.Id_Group = G.Id
--	WHERE SC.DateIn IS NULL AND G.[Name] = @group

--	SET @count_studs = @@ROWCOUNT
--END

--DECLARE @count AS int

--EXEC TakenBooks '18P2 ', @count OUTPUT

--SELECT @count

ALTER PROC NeedCall
	@stud_id AS int
AS
BEGIN
	DECLARE @books AS int = 0
	SELECT @books = COUNT(*)
	FROM S_Cards
	WHERE S_Cards.Id_Student = @stud_id

	IF @books > 0 
		BEGIN 
			PRINT 'Call!!!'
			PRINT 'This Student (Id= ' 
					+ CAST (@stud_id AS varchar(5))
					+') should return '
					+ CAST (@books AS varchar(5))
					+ ' books'
		END

END


--EXEC NeedCall 3

DECLARE @i AS int = 1

WHILE @i <= 25
BEGIN
	EXEC NeedCall @i
	SET @i+=1
END
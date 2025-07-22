-- Triggers
-- DML Trigger
-- DML Events (INSERT, UPDATE, DELETE)

USE [Library]

--CREATE TRIGGER BooksUpdate
--ON Books
--AFTER UPDATE
--AS
--BEGIN
--	PRINT CAST(@@ROWCOUNT AS nvarchar(MAX)) + N' sətir yeniləndi'
--END

--UPDATE Books
--SET Pages += 1

--UPDATE Books
--SET Pages += 1
--WHERE [Name] LIKE N'%[0-9]%'

--CREATE TRIGGER OldBooks
--ON Books
--AFTER INSERT
--AS
--BEGIN
--	DECLARE @year int
--	SELECT @year = YearPress
--	FROM inserted

--	IF @year <= 1980
--		BEGIN
--			PRINT N'Bizə Nadir müəllimnən yaşıd olan və ya daha qoca kitablar lazım deyil.'
--			ROLLBACK TRAN
--		END
--	ELSE
--		BEGIN
--			PRINT N'Həəəə. Bu daha təzə kitabdır. Nadir müəllim qədər qoca deyil.'
--		END
--END

--INSERT INTO Books (Id, [Name], Pages, YearPress, Id_Author, Id_Category, Id_Themes, Id_Press, Quantity)
--VALUES(103, N'Salam Dar ağacı, Aleykum Salam', 123, 1978, 3, 2, 5, 4, 2365)

--INSERT INTO Books (Id, [Name], Pages, YearPress, Id_Author, Id_Category, Id_Themes, Id_Press, Quantity)
--VALUES(104, N'Imtahana az qalıb. Nə düşünürsünüz?',8 , 2025, 15, 2, 5, 4, 10)

--CREATE TRIGGER NotBinom 
--ON Books
--AFTER DELETE
--AS
--BEGIN
--		IF EXISTS(SELECT * FROM deleted WHERE Id_Press = 4)
--		BEGIN
--			PRINT N'Binom nəşrtiyatından olan kitabları silmək olmaz. Çünki orda Nadir m-in kitabı var'
--			ROLLBACK TRAN
--		END
--END

--DELETE FROM Books WHERE Id = 5

--CREATE TRIGGER MotInsertLibrarian
--ON Libs
--INSTEAD OF INSERT
--AS
--BEGIN
--	PRINT N'Olmaz'
--END

--INSERT INTO Libs(Id, FirstName, LastName)
--VALUES(3, N'Gülay','Yusifli')

--DROP TRIGGER MotInsertLibrarian

/*
Triggerler -  her hansi bir hadise (Event) bash veren 
zaman ishe dushen adlandirilmish kod blokudur.

Triggerlerin 3 esas novu var:
	- DML triggers
	- DDL triggers
	- LOG ON triggers
DDL triggerler - serverde ve ya verilenler bazasinda 
DDL Event-ler bash veren zaman ishe dushen triggerlerdir
(CREATE, ALTER, DROP)

LOG ON triggerler - serverde istifadechi seansi qurashdirilan
zaman ishe dushen triggerlerdir

DML triggerler - erverde ve ya verilenler bazasinda 
DML Event-ler bash veren zaman ishe dushen triggerlerdir.
(INSERT, UPDATE, DELETE)

DML triggerlerin istifadesi:
	- INSERT, UPDATE, DELETE emeliyyatlari zamani her hansi
	bir sehvin qarshisini almaq uscun
	- Elaqelendirilmish cedvellerde kaskad emeliyyatlarin 
	yerine yetirilmesi uchun

DML triggerler AFTER ve ya INSTEAD OF triggerler ola biler
		- AFTER - INSERT, UPDATE, DELETE emeliyyatlari heyata kechdikden 
		sonra trigger ishe dushecek
		- INSTEAD OF - INSERT, UPDATE, DELETE emeliyyatlarinin evezine
		yerine yetirilecek komandalar blokudur


Triggerlerin yaradilmasi zamani bezi qaydalar toplusu movcuddur
	- Triggerler muveqqeti cedvellerde yaradila bilmez
	- Triggerler parametr qebul etmir
	- Triggerleri achiq-ashkar ishe salmaq olmaz
	- Triggerler lazim geldikde deyer qaytara biler
	- Bir cedvelde bir emeliyyat uchcun birden artiq 
	INSTEAD OF trigger yaratmaq olmaz
	- Triggerlerde ashaqidaki komandalar istifade edile bilmez
		+ DROP
		+ CREATE
		+ ALTER DATABASE
		+ ALTER TABLE
		+ GRANT
		+ REVOKE

Sintaksis
CREATE TRIGGER <trigger_name> ON <table_name>
{INSTEAD OF | AFTER}
{INSERT | UPDATE | DELETE}
AS
Trigger body
*/

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

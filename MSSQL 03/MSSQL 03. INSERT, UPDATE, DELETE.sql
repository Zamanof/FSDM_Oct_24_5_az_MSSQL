USE Students

SELECT *
FROM Students

-- INSERT
/*
INSERT INTO <table_name> ([col1, col2, ..., colN])
VALUES (val1, val2, ..., valN)
*/

--INSERT INTO Students(FirstName, LastName, Age, [Group])
--VALUES(N'Ali', N'Aliyev', '25', N'24_4_az')


-- auto increment on/off

--SET IDENTITY_INSERT Students ON

--INSERT INTO Students(Id, FirstName, LastName, Age, [Group])
--VALUES(27, N'Vali', N'Valiyev', 39, N'24_4_az')

--SET IDENTITY_INSERT Students OFF

-- multi values insert
--INSERT INTO Students(FirstName, LastName, Age, [Group])
--VALUES	(N'Zahid', N'Vahidov', 19, N'24_4_az'),
--		(N'Amil', N'Kamilov', 33, N'24_4_az'),
--		(N'Qara', N'Ağayev', 126, N'24_4_az'),
--		(N'Həbib', N'Dostəliyev', 98, N'24_4_az')

-- UPDATE
--UPDATE Students
--SET Age += 1  -- Age = Age + 1

--UPDATE Students
--SET Age = 18
--WHERE Id = 3

--UPDATE Students
--SET Age = 18
--WHERE Gender LIKE N'female'

--UPDATE Students
--SET Age = 17, [Group] = 'female_1', Gender = N'female'
--WHERE Gender LIKE N'female' OR Id = 36

-- DELETE
DELETE FROM Students
WHERE Id > 25

DELETE FROM Students
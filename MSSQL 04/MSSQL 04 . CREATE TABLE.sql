﻿-- Create table

/*
	Data types
	https://learn.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver16

	CREATE TABLE
	https://learn.microsoft.com/en-us/sql/t-sql/statements/create-table-transact-sql?view=sql-server-ver16

	ALTER TABLE 
	https://learn.microsoft.com/en-us/sql/t-sql/statements/alter-table-transact-sql?view=sql-server-ver16

	DROP TABLE
	https://learn.microsoft.com/en-us/sql/t-sql/statements/drop-table-transact-sql?view=sql-server-ver16
*/

/*
	Constraints - məhdudiyyətlər
		PRIMARY KEY
		IDENTITY (seed, incremet)
		UNIQUE(column_name)
		DEFAULT(value)
		CHECK(condition)
		NULL/NOT NULL
		FOREIGN KEY

Cədvəllərə qoyulan məhtudiyyətlər (constraints) 
	Cədvəlləri yaradan zaman T-SQL-də biz atributlar sırasını göstərə bilərik, hanslar ki, özləri elə məhdudiyyətlərdir.
	Bu atributları nəzərdən keçirək.

	PRIMARY KEY
	PRIMARY KEY ifadəsinin vasitəsi ilə sütunu ilkin açar etmək mümkündür.
	İlkin açar sətri cədvəldə unikal identifikasiya edir. İlkin açar kimi 
	int növlü sütunların çıxış etməsi vacib deyil, onlar istənilən digər növü təqdim edə bilərlər.

	IDENTITY(seed, increment)
	IDENTITY atributu sütunu identifikatora çevirməyə imkan yaradır. Bu atribut ədədi növlü sütunlar INT, SMALLINT, BIGINT, TYNIINT, DECIMAL və NUMERIC üçün başlaya bilər. 
SQL Server cədvəlinə yeni məlumatlar əlavə etdikdə sonuncu qeyddə bu sütunun mənası inkrementasiya ediləcəkdir.
 Bir qayda kimi, identifikator rolunda elə həmən ilkin açar olan sütun çıxış edir, halbuki bu demək olar ki vacib deyil.


	UNIQUE
	Əgəe biz cədvəlin yalnız unikal mənalara sahib olmasını istəyiriksə, o zaman onun üçün UNIQUE  atributunu təyin edə bilərik.

	NULL və NOT NULL
 Cədvəlin NULL mənasını qəbul edib edə bilməməsini göstərmək üçün, sütunu təyin edərkən ona NULL və yaxud NOT NULL atributunu təyin etmək olar.
 Əgər bu artibut açıq-aşkar istifadə olunmasa, o zaman mexaniki olaraq sütun NULL mənasını əldə edəcəkdir.
 İstisnad olaraq bir hal baş verir, o da sütunun ilkin açar rolunda çıxış etməsidir – bu zaman mexaniki olaraq sütun NOT NULL mənasını daşıyır.

	DEFAULT value
	DEFAULT atributu cədvəl üçün mənanı mexaniki olaraq təyin edir. Əgər məlumatların əlavə olunması zamanı cədvəl üçün məna nəzərdə tutulmuşdursa, o zaman onun üçün məna mexaniki olaraq istifadə olunacaq.

	CHECK(condition)
	CHECK açar sözü cədvəldə saxlana biləcək mənalar diapazonu üçün məhdudiyyət qoyur.	
Bunun üçün CHECK sözündən sonra mötərizədə şərt göstərilir, hansına ki sütun və yaxud bir neçə sütun əməl etməlidir. 
	Şərtlərin birləşdirilməsi üçün AND açar sözündən istifadə olunur. Şərtləri müqayisə əməliyyatları şəklində təyin etmək olar: dan2 çox (>),dan2 az (<), bərabər deyil (!=). 

		Prefiks:
			+ "PK_"		- For PRIMARY KEY
			+ "FK_"		- For FOREIGN KEY
			+ "DF_"		- For DEFAULT
			+ "CK_"		- For CHECK
			+ "UQ_"		- For UNIQUE
*/

USE [master]

GO

CREATE DATABASE [MiniInsta]

GO

USE [MiniInsta]

GO

CREATE TABLE [Users](
[Id] int IDENTITY(1, 1) NOT NULL,
[Login] nvarchar(30) NOT NULL,
[Password] nvarchar(50) NOT NULL,
[IsOpen] bit NOT NULL DEFAULT(1),
CONSTRAINT PK_Users PRIMARY KEY([Id]),
CONSTRAINT UQ_Login UNIQUE([Login]),
CONSTRAINT CK_Login CHECK([Login] != N''),
CONSTRAINT CK_Password CHECK([Password] != N'')
)

GO

CREATE TABLE [Posts](
[Id] int IDENTITY(1, 1) NOT NULL,
[IdUser] int NOT NULL,
[Date] datetime2(7) NOT NULL DEFAULT(SYSDATETIME()),
[Text] nvarchar(MAX) NULL,
[ImagePath] nvarchar(MAX) NOT NULL,
CONSTRAINT PK_Posts PRIMARY KEY([Id]),
CONSTRAINT FK_Posts_Users FOREIGN KEY([IdUser]) REFERENCES [Users]([Id])
ON DELETE CASCADE
ON UPDATE CASCADE
)

/*
ON DELETE {NO ACTION | CASCADE | SET NULL | SET DEFAULT}
ON UPDATE {NO ACTION | CASCADE | SET NULL | SET DEFAULT}
*/

GO

CREATE TABLE [Tags](
[Id] int IDENTITY(1, 1) NOT NULL,
[Tag] nvarchar(100) NOT NULL,
CONSTRAINT PK_Tags PRIMARY KEY([Id]),
CONSTRAINT CK_Tags_Tag CHECK([Tag] != N'')
)

GO

CREATE TABLE [PostsTags](
[IdPost] int NOT NULL,
[IdTAg] int NOT NULL,
CONSTRAINT FK_PostsTags_Post FOREIGN KEY([IdPost]) REFERENCES [Posts]([Id])
ON DELETE NO ACTION
ON UPDATE CASCADE,
CONSTRAINT FK_PostsTags_Tag FOREIGN KEY([IdTag]) REFERENCES [Tags]([Id])
ON DELETE NO ACTION
ON UPDATE CASCADE
)


GO

ALTER TABLE [Users]
ADD [Gender] bit NOT NULL DEFAULT(1)

GO

ALTER TABLE [Users]
ADD [BirthDate] datetime2(7) NULL

GO

ALTER TABLE [Users]
ADD CONSTRAINT CK_Users_BirthDate CHECK([BirthDate] >= '20000101' )

GO

ALTER TABLE [Users]
DROP CK_Users_BirthDate

GO

ALTER TABLE [Users]
ADD CONSTRAINT CK_Users_BirthDate 
				CHECK([BirthDate] >= '20000101' AND [BirthDate] <= SYSDATETIME())

-- DROP TABLE [Posts]

--DROP DATABASE MiniInsta

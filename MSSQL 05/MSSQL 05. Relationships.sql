-- Relationships

-- One To One
-- Bir cədvəldən bir yazı digər cədvəldən yalnız bir yazıya
-- uyğun gəlməlidir

--CREATE TABLE Countries(
--[Id] int PRIMARY KEY IDENTITY(1, 1),
--[Name] nvarchar(50) NOT NULL
--)

--CREATE TABLE Capitals(
--[Id] int PRIMARY KEY IDENTITY(1, 1),
--[Name] nvarchar(50) NOT NULL,
--[CountryId] int NOT NULL UNIQUE
--CONSTRAINT FK_Capitals FOREIGN KEY ([CountryId]) REFERENCES Countries(Id)
--)


-- One To Many
-- Bir cədvəldən bir yazı digər cədvəldən bir neçə yazıya
-- uyğun gələ bilər

--CREATE TABLE Groups(
--[Id] int PRIMARY KEY IDENTITY(1, 1),
--[Name] nvarchar(50) NOT NULL
--)

--CREATE TABLE Students(
--[Id] int PRIMARY KEY IDENTITY(1, 1),
--[FirstName] nvarchar(50) NOT NULL,
--[LastName] nvarchar(50) NOT NULL,
--[BirthDate] date NOT NULL,
--[GroupId] int REFERENCES Groups(Id)
)

-- Many To Many
-- Bir cədvəldən bir neçə yazı digər cədvəldən bir neçə yazıya
-- uyğun gələ bilər. Bu əlaqənin qurulması üçün 
-- mütləq 3-cü cədvəl olmalıdır

--CREATE TABLE Authors(
--[Id] int PRIMARY KEY IDENTITY(1, 1),
--[FirstName] nvarchar(50) NOT NULL,
--[LastName] nvarchar(50) NOT NULL,
--[BirthDate] date NOT NULL,
--)

--CREATE TABLE Books(
--[Id] int PRIMARY KEY IDENTITY(1, 1),
--[Name] nvarchar(50) NOT NULL,
--[Page] int NOT NULL,
--[Price] money NOT NULL
--)


--CREATE TABLE AuthorsBooks(
--[AuthorId] int NOT NULL,
--[BookId] int NOT NULL,
--CONSTRAINT FK_Authors_Id FOREIGN KEY ([AuthorId]) REFERENCES Authors(Id),
--CONSTRAINT FK_Books_Id FOREIGN KEY ([BookId]) REFERENCES Books(Id)
--)

/*
	Xarici açarlar və cədvəllərin arasında olan əlaqələr (Foreign keys and relationships between tables)

	Məlumat bazalarının daxilində cədvəllər ola bilər, hansılar ki,öz aralarında müxtəlif əlaqələr ilə bağlıdırlar. 
	Əlaqə (relationship) müxtəlif növlü mahiyyətlər arasında assosiyasiyanı təsfir edir.

	Əlaqəni vurğulayarkən, əsas və yaxud valideyn (primary key table / master 
	table) və tabeli və yaxud ikincidərəcəli cədvəli vurğulayırlar (foreign key table / child table). İkibcidərəcəli cədvəl velideyn cədvəlindən asılıdır.

	Əlaqənin təşkil olunması üçün xarici açarlardan istifadə olunur. 
	
	Xarici açar – bu, bir cədvəldən olan bir və bir neçə yaxud sütundur, bu cədvəl eyni zamanda 
	Digər cədvəldən potensial ilkin açardır. Xarici açarın əsas cəlvəldən ilkin açara uyğun olması vacib deyil.
 Hərçənd, bir qayda olaraq, asılı cədvəldən xarici açar əsas cədvəldən ilkin açara işarə edir.

*/
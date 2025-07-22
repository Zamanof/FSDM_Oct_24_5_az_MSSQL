-- VIEW - təqdimat

/*
Təqdimatlar (View) – virtual cədvəldir, hansı ki özü ilə adlandırılmış sorğunu təsfir edir. 
	Yəni ki, təqdimatın tərkibi məlumatlar əsasında dinamik olaraq hesablanır, hansılar ki təqdimata müraciət olunan zaman baş verir həmən anda real cədvəllərə yerləşir.

	Təqdimatlar baza cədvəlləri kimi yalnız real cədvəllərdən istifadə edə bilərlər.

	Təqdimatdan SELECT  sorusunun vasitəsi ilə seçim etmək olar. Həmçinin təqdimatlara modifikasiya sorğularını tətbiq etməkolar.


	Təqdimatların vasitəsi ilə baza cədvəlinin məlumatlarını dəyişmək olar, hələ ki sıradakı qaydalara riayyət olunur:
	+ DML-instruksiyaları (INSERT, UPDATE и DELETE) bir dəfəyə d
Qiq bir cədvələ əsaslanmalıdırlar, təqdimatın neçə cədvələ əsaslanmasının əhəmiyyəti yoxdur.
	+ Təqdimatın sütunları cədvəllərin sütunlarına birbaşa əsaslanmalıdırlar və hesablanan məna olmamalıdırlar.

	+ UNION/UNION ALL, CROSS JOIN, EXCEPT или INTERSECT operatorlarının vasitəsi ilə formalaşan təqdimat sütununu modifikasiya etmək olmaz.
	+ Mənası qruplaşma nəticəsində alınan, məsələn, DISTINCT, GROUP BY и HAVING əlavələrinin istifadəsi nəticəsində alınan təqdimatın sütununu modifikasiya etmək olmaz. 


	 SQL-də təqdimatlar məlumat bazasına daxil olan sorğuların saxlanması və təkrar istifadə olunması üçün istifadə olunur.	Beləliklə, mürəkkəb məntiqi inkapsullaşdırmaq olar və onu məlumat bazasında müəyyən ad altında gələcəkdə istifadə üçün saxlamaq olar.
 Həmçinin təqdimatların vasitəsi ilə məlumatlara giriş hüquqlarını rahat şəkildə təqdim etmək olar.

*/

/*
	CREATE VIEW view_name
	[WITH SCHEMABINDING]
	AS
	SELECT
	...

	ALTER VIEW view_name
	AS
	SELECT
	...

	DROP VIEW view_name

*/

USE [Library]

-- VIEW yaradılması

--CREATE VIEW StudInfo
--AS
--SELECT S.FirstName, S.LastName, G.[Name] AS GroupName
--FROM Students AS S 
--INNER JOIN Groups AS G ON S.Id_Group = G.Id

SELECT *
FROM StudInfo


-- VIEW yaradılması
--ALTER VIEW StudInfo
--AS
--SELECT S.Id, S.FirstName, S.LastName, G.[Name] AS GroupName, F.[Name] AS FacultyName
--FROM Students AS S 
--INNER JOIN Groups AS G ON S.Id_Group = G.Id
--INNER JOIN Faculties AS F ON F.Id = G.Id_Faculty

-- VIEW tərəfindən DB cədvəllərində dəyişiklik etmək
--UPDATE StudInfo
--SET FirstName = N'İskəndər', LastName = N'Makedoniyalı'
--WHERE Id = 17

-- bir neçə real cədvəli bir sorğu ilə dəyişmək qeyri mümkündür
-- View or function 'StudInfo' is not updatable because the modification affects multiple base tables.
--UPDATE StudInfo
--SET FirstName = N'İsgəndər', GroupName = 'FSD_13'
--WHERE Id = 17


/*
SCHEMABINDING
	Əgər SCHEMABINDING arqumenti göstərilmişdirsə, cədvəli və yaxud cədvəlləri belə üsulla dəyişmək olmaz, hansı ki təqdimatın müəyyən edilməsinə təsir göstərə bilər.
 Öncə cədvəldən olan asılılıqları yığmaq üçün, hansını ki dəyişmək lazımdır, təqdimatın özünü dəyişmək və yaxud silmək lazımdır. 
SCHEMABINDING arqumentindən istifadə edən zaman select_statement instruksiyası cədvələrin, təqdimatların və yaxud istifadəçi funksiyalarının ikikomponentli adlarını (schema.object) daxil etməlidir, hansılar ki cümlədə yada salınır. 
İnstruksiyada göstərilən bütün obyektlər bir məlumat bazasında yerləşməlidirlər.

*/

-- SCHEMABINDING
--ALTER VIEW StudInfo
--WITH SCHEMABINDING
--AS
--SELECT S.Id, S.FirstName, S.LastName, G.[Name] AS GroupName, F.[Name] AS FacultyName
--FROM dbo.Students AS S 
--INNER JOIN dbo.Groups AS G ON S.Id_Group = G.Id
--INNER JOIN dbo.Faculties AS F ON F.Id = G.Id_Faculty

--ALTER TABLE Students
--DROP COLUMN FirstName


--DROP VIEW StudInfo



-- System Views


--SELECT *
--FROM INFORMATION_SCHEMA.TABLES

--SELECT *
--FROM sys.tables



--SELECT *
--FROM INFORMATION_SCHEMA.VIEWS

--SELECT *
--FROM sys.views

--SELECT *
--FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS

--SELECT *
--FROM sys.key_constraints

--SELECT *
--FROM sys.foreign_keys

--SELECT *
--FROM sys.check_constraints

--SELECT *
--FROM sys.default_constraints

--SELECT *
--FROM INFORMATION_SCHEMA.COLUMNS
--WHERE TABLE_NAME = N'Books'

--SELECT *
--FROM sys.columns 
--INNER JOIN sys.tables 
--ON sys.columns.object_id = sys.tables.object_id
--WHERE sys.tables.[name] = N'Books'




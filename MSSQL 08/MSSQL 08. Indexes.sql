--  Indexes
--  BD melumatlar faylinda melumatlar( verilenler) ardicil veziyyetde saxlanilir (hem fiziki, hem mentiqi). 
    
    
--  Verilenlerin fiziki strukturu. 
    
--  SQL Server  melumatlari sehifeler sheklinde saxlayir. 
--  Sehife (page) –yalniz bir obyekte mexsus olan, hecmi 8 kb olan melumatlar blokudur. (meselen, cedvel)
    
--  Sehifeler ekstentlerde birleshir. Ekstent(extent) -8 ardicil sehife.  
--  Ekstentleri qarishiq ve bircinslilere bolurler. 
--  Qarishiq ekstentler oz daxilinde muxtelif obyektlerin sehifelerini saxlaya bilir. 
--  Bircinsli ekstentler ise, oz daxilinde bir obyektin sehifesini saxlayir. 
--  Obyekt uchun birinci sehife yaradilanda o qarishiq ektentde yerleshir. 
--  Lakin, eger obyekte 8-den artiq sayda sehife ayirmaq lazimdirsa onda novbeti sehifeler uchun bircinsli ekstent ayrilir. 

	

--	---------------------------------------------------------------------------------------------------------

--	Melumatlarin mentiqi strukturu. 

--	SQL Server  cedvel melumatlarini topa ya da, balanslashdirilmish toplu sheklinde yerleshdirir. 


--	Yigin  (Heap)

--	Yigin —sehifeler ve ekstentlerin qeyri-ardicil destidir. 
--  Yigindaki melumatlar hech bir mentiqi teshkilatlanmaya malik deyiller.  

--	Her bir cedvel uchun en azi bir sehife  IAM (Index Allocation Map)ayrilir. 
--	Bu sehife mehz bu cedvele mexsus olan sehife ve ekstentleri daxilinde saxlayir. 

--	SQL Server yigindaki (topadaki)  melumatlari yalniz butun yigina,  
--  daha deqiq desek butun IAM  sehifelere baxib tapa biler(hetta sorguya yalniz bir setri chixartmaq lazimdirsa da). 
	
--	Yiginda yeni setirlerin yerleshdirilmesi musteqil olaraq bash verir.  
--  SQL Server yeni setri movcud sehifede saxlaya biler(eger sehife dolmayibsa). 
--  Ve ya obyekt uchun yeni sehife ya da, ekstent ayira biler. 
--	Vaxt kechdikce yiginlar fraqmenteshe biler. 
	
	
--	Balanslashdirilmish “agac ” (Balanced tree)

--	eger cedvelde klasterleshdirilmish indeks varsa, cedvel balanslashdirilmish “agac” (toplu) kimi qurulur. 

--	Indeks- Verilenlere olan muvafiq istinadlarla birge cedvelin unikal anlamlarinin toplusudur. 
--  Indeksler cedvellerin bendleri ve teqdimatlar uchun yaradilir. 
--  Indekslerin esas ustunluyu  suretli axtarishidir. chunki, 
--  toplu uzre axtarish topada(yiginda) elementlerin yerbeyer  edilmesinden daha tez heyata kechirilir. 
	 
	
--	Agac bashlangic  sehifeden ve son sehifelerden ibaretdir. 
--  Bashlangic sehifelerde diger bashlangic cedvellerin unvanlari ya da, son sehifelerin unvanlari yerleshir. 

--  Son sehifelerde melumatlar(verilenler)saxlanilir(eger bu toplu klasterleshdirilmish indeksdendirse)
--  Klasterleshdirilmish indeksi unikal sutunun ichine yerleshdirmek vacib deyil.  

--  Siz indeksi qeyri-unikal  sutuna elave etseniz onda SQL server anlami yene de unikallashdiracaq 
--  (ona siralama nomresini elave etmekle siralama nomresinin hecmi 4 bayt olacaq)
--  Bir cedvele yalniz bir klaster indeksi ve istenilen sayda qeyri-klaster indeksleri elave etmek olar. 

--  Klasterleshdirilmish ve klasterleshdirilmemish indeksler balanslashdirilmish toplunun eyni strukturuna malikdir. 
--  Yalniz bir ferq var: klasterleshdirilmemish indeksin sonuncu seviyyesi melumatlarin sehifeleri 
--  evezine indekslerin sehifelerinden ibaretdir. 

--  Indeksin sehifesindeki her setirde klasterleshdirmemish achar anlami ve setir gostericisi var. 
--  eger klasterleshdirlmemish indeks daxilinde  klasterli indeks olan cedvele elave edilirse 
--  onda setire olan gosterici nishan klasterli indeksin acharidir. 

--  eger klasterleshdirilmemish indeks cedvele topa sheklinde elave edilirse (klasterli indeks yoxdur) 
--  onda setir uchun gosterici nishan melumatlarin yerleshdiyi topanin sehifesindeki setire olan istinaddir. 



/*
CREATE [CLUSTERED | NONCLUSTERED] INDEX index_name
ON table_name or view_name
(field_name1 [ASC|DESC],  field_name2 [ASC|DESC], . . .  )
*/

-- https://learn.microsoft.com/en-us/sql/t-sql/statements/create-index-transact-sql?view=sql-server-ver16

USE [master]

GO

CREATE DATABASE IndexTest

GO

USE [IndexTest]

GO

--CREATE TABLE TableInHeap(
--[Id] int NOT NULL,
--[Field1] char(36) NOT NULL,
--[Field2] char(216) NOT NULL
--)

--CREATE PROC ShowInfoTableInHeap
--AS
--BEGIN
--	SELECT OBJECT_NAME(object_id) AS TableName, [name] AS IndexName, [type], [type_desc]
--	FROM sys.indexes
--	WHERE object_id = OBJECT_ID('dbo.TableInHeap')

--	SELECT index_type_desc, page_count, record_count, avg_page_space_used_in_percent
--	FROM sys.dm_db_index_physical_stats(DB_ID('IndexTest'), OBJECT_ID('dbo.TableInHeap'), NULL, NULL, 'DETAILED')

--	EXEC dbo.sp_spaceused 'TableInHeap'
--END

--EXEC ShowInfoTableInHeap

--INSERT INTO TableInHeap(Id, Field1, Field2)
--VALUES(1, 'a', 'b')

--DECLARE @id int = 2
--WHILE @id <= 30
--BEGIN
--	INSERT INTO TableInHeap(Id, Field1, Field2)
--	VALUES(@id, 'a', 'b')
--	SET @id+=1
--END

--INSERT INTO TableInHeap(Id, Field1, Field2)
--VALUES(31, 'a', 'b')


--DECLARE @id int = 32
--WHILE @id <= 3000000
--BEGIN
--	INSERT INTO TableInHeap(Id, Field1, Field2)
--	VALUES(@id, 'a', 'b')
--	SET @id+=1
--END

--CREATE CLUSTERED INDEX Index1
--ON TableInHeap(Id)

DECLARE @start_time AS datetime = SYSDATETIME(), @end_time AS datetime

SELECT *
FROM TableInHeap
WHERE Id = 365982

SET @end_time = SYSDATETIME()

SELECT DATEDIFF(NANOSECOND, @start_time, @end_time) AS [Duration in nanoseconds]

-- Without index
-- first data ~ 63333333
-- last data  ~ 76666667
-- not found data ~ 73333333

-- with index
-- first data ~ 0
-- last data  ~ 0
-- not found data ~ 0


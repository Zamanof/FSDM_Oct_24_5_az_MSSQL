-- MSSQL - Microsoft Structured Query Language
-- T-SQL - Transaction - Structured Query Language
--Məlumat bazası (Database) –məlumatlar toplusudur, hansılar ki adətən öz aralarında bağlı və ardıcıldırlar.


--Məlumatlar bazalarının idarəetmə sistemi- MBİS (Database management system - DBMS) – proqram təminatı, məlumatların yaddaşa salınması və məlumatlarla idarə etmək.


--MBİS-in əsas funksiyaları:

--+ xarici yaddaşda (disklərdə) olan məlumatların idarə olunması;

--+ oerativ yaddaşda yerləşən məlumatların disk keşinin vasitəsi ilə idarə olunması;

--+ dəyişikliklərin jurnala salınması, məlumat bazasının zədələnmədən sonra ehtiyatlı kopi edilməsi və bərpa edilməsi;

--+ MB dillərinin dəstəklənməsi (məlumatların mqəyyən edilmə dili,məlumatlarla manipulyasiya etmə dili).


--Adətən müasir MBİS sıradakı komponentlərdən ibarətdir:

--+ nüvə, hansı ki məlumatların xarici və operativ yaddaşda idarə olunmasına və jurnala salınmasına cavabdehdir,

--+ məlumat bazasının prosessoru, hansl ki sorğuların məlumatların çıxarılması və dəyişdirilməsi və bir qayda olaraq maşın-asılı olmayan icarə edilən daxili kodun yaradılması üçün optimallaşmasını təmin edir,

--+ подсистему поддержки времени исполнения, которая интерпретирует программы манипуляции данными, создающие пользовательский

--MBİS-i olan interfeys

--+ həmçinin servis proqramları (xarici utilitlər), hansı ki xidmət göstərmək üçün məlumat sisteminin əlavə imkanlar sırasını təmin edir.


----------------------------------------------------------------------------------------------------------------------------------



--MBİS-nin təsnifatı

--https://ru.wikipedia.org/wiki/məlumat _bazası _ilə _idarəetmə_sistemi


--Məlumatlar modeli üzrə:

--+ İyerarxik

--+ Şəbəkə

--+ Nisbi olan(SQL)

--+ Qeyri0nisbi(NOSQL)

--+ obyekt üzrə istiqamətləndirilmiş


--Bölüşdürülmə dərəcəsi üzrə:

--+ Lokal MB(Local DB) – lokal MBİS-nin bütün hissələri bir kompyuterdə yerləşir

--+ Bölüşdürülmüş MB(Distributed DB) – MB-nin hissələri iki və daha çox kompyuterdə yerləşə bilər


--MB-yə daxil olunma üsulu üzrə:

--+ Fayl-server (File-server) – məlumatların faylları fayl-serverdə mərkəzləşdirilmiş şəkildə yerləşir, MBİS hər müştəri kompyuterində yerləşir

--+ Müştəri-server (Client-server) – MBİS serverdə MB ilə birgə yerləşir və MB-yə daxil olmanı bilavasitə monopoliya rejimində həyata keçirir

--+ Əlavə olunan (Embedded) -MBİS, hansı ki Sərbəst quraşdırma prosedurunu tələb etməyərək hansısa bir məhsulun tərkibi hissəsi kimi quraşdırıla bilər


----------------------------------------------------------------------------------------------------------------------------------


--Koddun 12 qaydaları – bu, 13 qaydadır, hansını ki hər nisbi məlumat bazaları üzrə idarəetmə sistemi yerinə yetirməlidir.

--https://ru.wikipedia.org/wiki/Koddun_12_qaydası


----------------------------------------------------------------------------------------------------------------------------------


--Nisbi MB (Relational DB)


--Nisbi model məlumatların sxemlərdə saxlanılmasını nəzərdə tutur, hansı ki öz aralarında bağlı ola bilər.


--Sxem özü ilə sütunlarən və sətirlərin toplusunu təqdim edir.

--Sütunlar məlumatların xüsusiyyətlərini təsfir edir, hansı ki sxemdə yerləşir.

--Sətirlər xüsusiyyətlərin məna toplusu (yəni hansısa bir obyekti) təsfir edir.


--İlkin açar – sətrin bir sxem çərçivəsində olan unikal identifikatorudur. İlkin açar bir və yaxud bir neçə mənalar (sütunlar) ilə təsfir oluna bilər.

--İlkin açar unikal və qeyri-izafi olmalıdır.


----------------------------------------------------------------------------------------------------------------------------------


--MS SQL Server – bu, SQL Server-in bütün komponentlərinin daxil olması, ayarlanması, idarəetməsi və administratorlaşdırılması üçün nəzərdə tutulan mühiddir.


--Bölmələr:

--Database –cari serverin bütün məlumat bazasıdır.

--master – istifadəçilər, prosedurlar, səhvlər haqda olan köməkçi məlumatdır

--model – cari serverdə yaradılan bütün MB-lər üçün nəzərdə tutulan şablonldur

--msdb - sql server agent xidməti ilə işləyir, tapşırıqlar, bildirişlər, nisbi nüsxələr və s. haqda olan məlumatlar

--tempdb – məlumatların müvəqqəti nəticələri və yaxud digər dəyişiklikləri, hansı ki əlavə yer tələb edir

--Secuirity – təhlükəsizlik sistemi

--Server Objects – kompyuterin digər xidmətləri ilə idarəetmə vasitələri: serverlərin bir birinə bağlanması üçün

--Replication – replikasiya (cavab) stukturu

--Managment - sql server-in administratorlaşdırılma vasitələri


----------------------------------------------------------------------------------------------------------------------------------


--SQL – sorğunun deklarativ təsfir olunma dili. Nisbi MB-də yerləşən məlumatların yaradılması, modifikasiyası və idarə etməsi, MB-nin arxitekturunun yaradılması və dəyişilməsi, təhlükəsizlik ilə idarəetmək üçün istifadə olunur.


--Sorğu(Query) – bu, SQL dilində yazılmış komandadır.


--T-SQL – bu, strukturlaşdırılmış sorğuların dilinin dialektidir, MS SQL Server MBİS-də tətbiq olunur.


--Məsələdən asılı olaraq, hansını ki T-SQL komandası həyata keçirir, o, sıradakı növlərdən birinə aid ola bilər:

--+ DDL (Data Definition Language). Bu növə müxtəlif komandalar aiddir, hansı ki məlumat bazasını, sxemləri, indeksləri, saxlanılan prosedurları və s. yaradır. Bir sözlə, məlumatları müəyyənləşdirir. (CREATE, ALTER, DROP, TRUNCATE)

--+ DML (Data Manipulation Language). Bu növə məlumatların seçilməsi, onların yenilənməsi, əlavə olunması, silinməsi – bir sözlə, bütün o komandalar aiddir ki, hansıların vasitəsi ilə məlumatları idarəedə bilərik. (SELECT, UPDATE, INSERT, DELETE)

--+ DCL (Data Control Language). Bu növə komandalar aiddir, hansı ki məlumatlara daxil olma hüquqlarını idarə edir.

--(GRANT, REVOKE)


----------------------------------------------------------------------------------------------------------------------------------


--Məlumatların növləri

--https://msdn.microsoft.com/ru-ru/library/ms187752(v=sql.120).aspx

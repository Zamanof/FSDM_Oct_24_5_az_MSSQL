--- Transactions - Tranzaksiyalar

﻿/*
	Тranzaksiyalar(Transactions)

	 Tranzaksiya-hamısı müvəffəqiyyətlə yerinə yetirilən və ya 
	 heç biri yerinə yetirilməyən bir və ya bir neçə əməliyyat.
	 Məntiqi olaraq bölünməyən iş vahididir
	 (baxmayaraq ki, fiziki olaraq bir neçə komandadan ibarətdir)

	BD-ye deyishiklik getiren istenilen hereketi SQL Server tranzaksiya kimi qebul edir

	Tranzaksiyalar butun hallarda melumatların razilaşdirirlmasinin 
	təmin edilməsi üçün zeruridir, hetta serverin işində qəfil  
	dayanma ve ya başqa problemler yaranarsa.
	

 ACID tranzaksiyalarinin xususiyyetleri(Sql Server butun xususiyyetleri temin edir
	+ Аtomarlıq(atomicity). 
		Her bir tranzaksiya işin atomar vahididir. 
		Bu, o demekdir ki, tranzaksiyada məlumatlar bazasinin butun dəyişiklikleri 
		yerine yetirilir ve ya heç biri yerine yetirilmir 
	+ Razılıq (consistency). 
		Her bir tranzaksiya(hem bitmiş, həm kəsilmiş)melumatlar bazasini 
		razılaşdırılmış vəziyyətdə saxlayır
		(melumatlar bazasının və obyektlərin bütün məhdudiyyətləri ilə təyin edildiyi kimi)
	+ İzolyasiya (isolation). 
		Her bir tranzaksiya elə yerinə yetirilir ki,
		sanki o butun diger tranzaksiyalardan ayrı olaraq movcuddur
	+ Dayanıqlılıq (durability). 
		Hər bir tranzaksiya servisde dayanmalarin shahidi olur.
		Servis bərpa olunan kimi butun bərkidilmish tranzaksiyalar gətirilir , 
		butun bərkidilmemish tranzaksiyalar ise kənar ediliry


	Hər bir SQL Server məlumat bazası azı 2 fayla malikdir
		+icinde bilavasite məlumatlarin saxlandigi məlumatlar faylı
		+icinde BD-nin dəyişikliklər loqunun saxlandığı tranzaksiya jurnalinin faylı 


	 SQL Server-də 2 əsas tranzaksiya tipi mövcuddur
		+ Sistem tranzaksiyaları. SQL Server onları sistem cədvəlləri 
			ilə işləmək üçün istifadə edir. İstifadəciler bu tranzaksiyaları idarə edə bilmir.
		+ İstifadəçi tranzaksiyaları. Dəyişmə prosesində istifadəçilər 
		  tərəfindən yaradılan tranzaksiyalar
	
    SQL Server-də 3 istifadəçi tranzaksiyası rejimi mövcuddur
		+ Avtofiksasiya(autocommit)Her bir komandanı server ayrıca bir 
			tranzaksiya kimi qəbul edir. 
			Server özü uğurla yerinə yetirilmə zamanı fiksasiya edir. 
			Əks halda ise, tranzaksiyanı kənarlashdirir.
		+ Bilinməyən tranzaksiya(implicit transaction) - Tranzaksiyanı açmaq lazim deyil. 
		   Amma fiksasiya və ya kənarlaşdırmanı müvafiq komandalarin 
		   komeyi ile gostermek lazimdir. 
		   Davranışı ishə salmaq - SET IMPLICIT_TRANSACTIONS ON.
		+ Bilinən tranzaksiya (explicit transaction) - istifadəçi tranzaksiyanın həm başlanmasını,
		   həm də bitməsini göstərməlidir(müvafiq komandalarin komeyi ile)
	Sintaksis
	BEGIN TRANSACTION və ya BEGIN TRAN - tranzaksiyanı başla
	COMMIT - tranzaksiyanın fiksasiyası(uğurla həyata keçirilibsə)
	ROLLBACK - tranzaksiyanın imtinası(səhvlər olduğu halda)
    SAVE TRANSACTION - saxlanma nöqtəsinin təyin edilməsi
	*/


--CREATE PROC AddCommentMark
--@comid AS int,
--@userid AS int,
--@mark AS int
--AS
--	BEGIN
--		BEGIN TRAN CommentMark

--		INSERT INTO CommentRating(IdUser, IdComment, Mark)
--		VALUES(@userid, @comid, @mark)

--		IF @@ERROR != 0
--			BEGIN
--				PRINT 'INSERT ERROR'
--				ROLLBACK TRAN CommentMark
--			END
--		ELSE
--			BEGIN
--				PRINT 'INSERT OK'
--				UPDATE Comments
--				SET Rating = (	SELECT CAST(SUM(Mark) AS float) / COUNT(*)
--								FROM Comments AS C
--								INNER JOIN CommentRating AS CR
--								ON C.Id = CR.IdComment
--								WHERE C.Id = @comid)
--				WHERE Id = @comid
--				IF @@ERROR != 0
--					BEGIN
--						PRINT 'UPDATE ERROR'
--						ROLLBACK TRAN CommentMark
--					END
--				ELSE
--					BEGIN
--						PRINT 'UPDATE OK'
--						COMMIT TRAN CommentMark
--					END
--			END
--	END


--EXEC AddCommentMark 2, 3, 4
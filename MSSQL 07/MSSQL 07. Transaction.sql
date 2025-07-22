-- Transactions - Tranzaksiyalar

/*
	ACID
	 * Atomicity	(Atomar)
	 * Consistency	(Razılıq)
	 * Isolatinon   (İzolyasiya)
	 * Durability   (Dayanıqlılıq)
*/


-- BEGIN TRANSACTION or BEGIN TRAN
-- COMMIT
-- ROLLBACK
-- SAVE TRAN

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
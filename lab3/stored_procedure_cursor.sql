
CREATE PROCEDURE dbo.cntGames
AS
    DECLARE @cnt int
    DECLARE cntCursor CURSOR FOR
    SELECT TOP 20 Participant_id FROM dbo.participants
    OPEN cntCursor
    FETCH NEXT FROM cntCursor INTO @cnt
    WHILE @@FETCH_STATUS = 0
    BEGIN
    PRINT dbo.GamesCount(@cnt)
    FETCH NEXT FROM cntCursor INTO @cnt END
    CLOSE cntCursor
    DEALLOCATE cntCursor
GO

EXECUTE dbo.cntGames

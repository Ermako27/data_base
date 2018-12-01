DROP PROCEDURE dbo.GamesCountProcedure

IF OBJECT_ID (N'dbo.GamesCountProcedure', N'IF') IS NOT NULL
    DROP PROCEDURE dbo.GamesCountProcedure;
GO

CREATE PROCEDURE dbo.GamesCountProcedure 
    @participantId int
AS
    DECLARE @res int;
    SELECT @res = COUNT(PG.Game_id)
    FROM dbo.ParticipantGameJoin() AS PG
    WHERE PG.Participant_id = @participantId
    RETURN @res;
GO

DECLARE @value int
EXECUTE @value = dbo.GamesCountProcedure @participantId = 1667
SELECT @value "количество олимпийских игр"
GO
IF OBJECT_ID (N'dbo.ParticipantGameJoin', N'IF') IS NOT NULL
    DROP FUNCTION dbo.ParticipantGameJoin;
GO

CREATE FUNCTION dbo.ParticipantGameJoin ()
RETURNS TABLE
AS
RETURN
(
    SELECT P.Participant_id, P.PersonName, P.Sex, P.Age, P.WeightP, P.HeightP, P.Team,
    G.Game_id, G.YearG, G.Season, G.City
    FROM participants AS P
    JOIN participant_game_relation AS R ON P.Participant_id = R.Participant_id
    JOIN games AS G ON R.Game_id = G.Game_id
);
GO

IF OBJECT_ID (N'dbo.GamesCount', N'IF') IS NOT NULL
    DROP FUNCTION dbo.GamesCount;
GO

CREATE FUNCTION dbo.GamesCount(@participantId int)
RETURNS int
AS
BEGIN
    DECLARE @res int;
    SELECT @res = COUNT(PG.Game_id)
    FROM dbo.ParticipantGameJoin() AS PG
    WHERE PG.Participant_id = @participantId
    RETURN @res;
END;
GO

SELECT dbo.GamesCount(1667)
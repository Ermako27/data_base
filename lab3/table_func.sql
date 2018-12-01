IF OBJECT_ID (N'dbo.OldParticipants', N'IF') IS NOT NULL
    DROP FUNCTION dbo.OldParticipants;
GO
CREATE FUNCTION dbo.OldParticipants ()
RETURNS TABLE
AS
RETURN
(
    SELECT P.Participant_id, P.PersonName, P.Team, P.YearG, P.City
    FROM dbo.ParticipantGameJoin() AS P
    WHERE P.YearG = 2016
);
GO

SELECT * FROM dbo.OldParticipants()
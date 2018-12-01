IF OBJECT_ID (N'dbo.OldPersonFunc', N'FN') IS NOT NULL
    DROP FUNCTION dbo.OldPersonFunc
GO

CREATE FUNCTION dbo.OldPersonFunc()
RETURNS @OldPerson TABLE 
(
    Participant_id INT NOT NULL, 
    PersonName VARCHAR(100), 
    Team VARCHAR(30),
    YearG INT,
    City VARCHAR(30)
)
AS
BEGIN
    INSERT INTO @OldPerson
    SELECT P.Participant_id, P.PersonName, P.Team, P.YearG, P.City
    FROM dbo.ParticipantGameJoin() AS P
    WHERE P.YearG BETWEEN 1950 AND 1960
RETURN
END
GO


SELECT * FROM dbo.OldPersonFunc()
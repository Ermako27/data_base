IF OBJECT_ID ( N'dbo.SelectTallMen', 'P' ) IS NOT NULL
      DROP PROCEDURE dbo.SelectTallMen
GO

CREATE PROCEDURE dbo.SelectTallMen
AS
    WITH TallMen (PersonName, Age, Sex)
    AS 
    (
        SELECT P.PersonName, P.Age, P.Sex
        FROM dbo.participants AS P
        WHERE P.HeightP > 165 AND P.Sex = 'M'

        UNION ALL

        SELECT PG.PersonName, PG.Age, PG.Sex
        FROM dbo.ParticipantGameJoin() AS PG 
        JOIN TallMen ON PG.PersonName = TallMen.PersonName
        WHERE PG.Age > TallMen.Age
    )
    SELECT *
    FROM TallMen

GO

EXECUTE dbo.SelectTallMen
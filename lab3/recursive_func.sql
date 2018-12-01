IF OBJECT_ID ( N'dbo.SelectTallMenFunc', 'P' ) IS NOT NULL
      DROP PROCEDURE dbo.SelectTallMenFunc
GO

CREATE FUNCTION dbo.SelectTallMenFunc ()
RETURNS TABLE AS RETURN
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

SELECT * FROM dbo.SelectTallMenFunc()

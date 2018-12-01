SELECT  
        1 AS TAG,
        NULL AS PARENT,
        P.Participant_id AS [Participant!1!Participant_id],
        P.PersonName AS [Participant!1!PersonName],
        P.Sex AS [Participant!1!Sex],
        P.Age AS [Participant!1!Age],
        P.WeightP AS [Participant!1!WeightP],
        P.HeightP AS [Participant!1!HeightP],
        P.Team AS [Participant!1!Team],
        NULL AS [Game!2!Game_id],
        NULL AS [Game!2!YearG],
        NULL AS [Game!2!Season],
        NULL AS [Game!2!City]
FROM participants AS P
UNION ALL
SELECT 
        2 AS TAG,
        1 AS PARENT,
        J.Participant_id,
        J.PersonName,
        J.Sex,
        J.Age,
        J.WeightP,
        J.HeightP,
        J.Team,
        J.Game_id,
        J.YearG,
        J.Season,
        J.City
FROM dbo.ParticipantGameJoin() AS J
ORDER BY [Participant!1!Participant_id], [Game!2!Game_id]
FOR XML EXPLICIT, ROOT
SELECT *
FROM participants AS P JOIN (
    SELECT Participant_id, YearG, City AS SQ
    FROM participant_game_relation AS R
    JOIN games AS G ON R.Game_id = G.Game_id
) AS OD ON OD.Participant_id = P.Participant_id

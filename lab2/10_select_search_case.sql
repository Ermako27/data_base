SELECT PersonName, YearG,
    CASE
        WHEN Age > 25 THEN 'old'
        WHEN Age < 25 THEN 'young'
    END AS 'Olimp'
FROM participants AS P 
JOIN participant_game_relation AS R ON P.Participant_id = R.Participant_id
JOIN games AS G ON R.Game_id = G.Game_id


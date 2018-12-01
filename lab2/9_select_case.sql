SELECT PersonName, YearG,
    CASE YearG
        WHEN 2014 THEN 'Sochi'
        WHEN 2016 THEN 'Rio'
    END AS 'Olimp'
FROM participants AS P 
JOIN participant_game_relation AS R ON P.Participant_id = R.Participant_id
JOIN games AS G ON R.Game_id = G.Game_id


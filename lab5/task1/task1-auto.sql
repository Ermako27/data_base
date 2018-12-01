SELECT  Participant.Participant_id,
        Participant.PersonName,
        Participant.Sex,
        Participant.Age,
        Participant.WeightP,
        Participant.HeightP,
        Participant.Team,
        Game.Game_id,
        Game.YearG,
        Game.Season,
        Game.City
FROM participants AS Participant, dbo.ParticipantGameJoin() AS Game
WHERE Participant.Participant_id = Game.Participant_id
FOR XML AUTO, ELEMENTS  


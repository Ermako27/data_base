-- отобрать всех пловцов

USE OlympicDB
GO

SELECT participants.Participant_id, PersonName
FROM participants
WHERE EXISTS (
    SELECT P.Participant_id
    FROM participants AS P 
    JOIN participants_events_relation AS R ON P.Participant_id = R.Participant_id
    JOIN events AS E on E.Event_id = R.Event_id
    WHERE E.Sport LIKE '%Swimming%'
)
GO
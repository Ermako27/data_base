SELECT  P.Participant_id, P.PersonName
FROM dbo.participants AS P
WHERE P.Participant_id > 100 AND P.Participant_id < 150
FOR XML RAW('Participant'), ELEMENTS
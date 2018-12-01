USE OlympicDB
GO

SELECT Participant_id, PersonName, Age FROM participants WHERE Age BETWEEN 20 AND 25
GO
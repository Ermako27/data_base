USE OlympicDB
GO

SELECT F.EventName
FROM events F JOIN events S ON F.EventName = S.EventName
WHERE  F.EventName LIKE '%Hockey%'

GO
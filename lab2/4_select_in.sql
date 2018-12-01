-- получить список состязаний по плаванию, в которых более 200 участников

USE OlympicDB
GO

SELECT EventName, PCount
FROM events
WHERE EventName IN 
    (
        SELECT EventName
        FROM events
        WHERE Sport = 'Swimming'
    ) AND PCount > 200


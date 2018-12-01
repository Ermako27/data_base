--


USE OlympicDB
GO

SELECT PersonName, Age FROM participants
WHERE Age > ALL (
    SELECT Age FROM participants WHERE Sex = 'M'
)
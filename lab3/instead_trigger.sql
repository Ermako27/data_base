IF OBJECT_ID('dbo.participants_duplicates', 'U') IS NOT NULL
    DROP TABLE dbo.participants_duplicates
GO

CREATE TABLE dbo.participants_duplicates
(
    Participant_id INT,
    PersonName VARCHAR(90) NOT NULL,
    Sex CHAR,
    Age INT, 
    HeightP INT,
    WeightP INT,
    Team VARCHAR(50)
);
GO

DROP TRIGGER DenyInsert ;
GO

CREATE TRIGGER DenyInsert 
ON dbo.participants
INSTEAD OF INSERT
AS 
BEGIN
    IF (EXISTS(
        SELECT P.Participant_id
        FROM dbo.participants AS P, inserted AS I
        WHERE P.Participant_id = I.Participant_id
    ))
        -- RAISERROR('Duplicate!!!.',10,1);
        INSERT INTO dbo.participants_duplicates SELECT * FROM inserted
END;
GO

INSERT dbo.participants (Participant_id,PersonName,Sex,Age,HeightP,WeightP,Team) VALUES ('80','HZ','A','100','100','100','Russia')
GO

SELECT * FROM dbo.participants_duplicates

-- когда была создана новая таблица написать ее имя и когда была создана
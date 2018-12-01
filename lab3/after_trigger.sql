IF OBJECT_ID (N'dbo.SexCheck', N'IF') IS NOT NULL
    DROP TRIGGER dbo.SexCheck;
GO

CREATE TRIGGER dbo.SexCheck ON dbo.participants
AFTER INSERT
AS
BEGIN
    DECLARE @someone varchar(10);
    SET @someone = (SELECT Sex FROM inserted)
    IF (@someone != 'M' OR @someone != 'F')
        RAISERROR ('unknow entity.', 16, 1);
END;
GO


INSERT dbo.participants (Participant_id,PersonName,Sex,Age,HeightP,WeightP,Team) VALUES ('100501','HZ','A','100','100','100','Russia')
GO
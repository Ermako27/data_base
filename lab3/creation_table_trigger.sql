CREATE TRIGGER crt
ON DATABASE AFTER CREATE_TABLE
AS 
BEGIN 
    select EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]','nvarchar(max)') 
    select EVENTDATA().value('(/EVENT_INSTANCE/PostTime)[1]','nvarchar(max)')
END;
GO


DROP TABLE NewTable
--Test the trigger.  
CREATE TABLE NewTable (Column1 int);  
GO  
--Drop the trigger.  
DROP TRIGGER crt 
ON DATABASE;  
GO  

IF OBJECT_ID (N'dbo.test', N'IF') IS NOT NULL
    DROP FUNCTION dbo.test;
GO
CREATE FUNCTION dbo.test ()
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM dbo.clients
);
GO

CREATE FUNCTION dbo.Count(@clientName VARCHAR(50))
RETURNS int
AS
BEGIN
    DECLARE @res int;
    SELECT @res = COUNT(C.id)
    FROM dbo.clients AS C
    WHERE C.fio = @clientName
    RETURN @res;
END;
GO

-- фукнции можно достать так 
SELECT * FROM sys.objects
WHERE   type = N'FN'

-- или так
SELECT name AS function_name   
  ,SCHEMA_NAME(schema_id) AS schema_name  
  ,type_desc  
  ,create_date  
  ,modify_date  
FROM sys.objects  
WHERE type_desc LIKE '%FUNCTION%';  
GO  
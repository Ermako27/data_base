IF OBJECT_ID ( N'dbo.tables', 'P' ) IS NOT NULL
      DROP PROCEDURE dbo.tables
GO



CREATE PROCEDURE dbo.tables
AS
    DECLARE @TableName varchar(255)
    DECLARE TableCursor CURSOR FOR
    SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_TYPE = 'BASE TABLE'
    OPEN TableCursor
    FETCH NEXT FROM TableCursor INTO @TableName
    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @TableName
    FETCH NEXT FROM TableCursor INTO @TableName END
    CLOSE TableCursor
    DEALLOCATE TableCursor
GO

EXECUTE dbo.tables
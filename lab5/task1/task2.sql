DECLARE @idoc int
DECLARE @doc xml
SELECT @doc = c FROM OPENROWSET(BULK '/media/ermak/94B2DAA4B2DA8A5E/data_base/lab5/task1/task1-explicit.xml', SINGLE_BLOB) AS TEMP(c)
EXEC sp_xml_preparedocument @idoc OUTPUT, @doc
SELECT *  
FROM OPENXML (@idoc, '/root/Participant/Game',2)
WITH (Participant_id int '../@Participant_id',
      PersonName NVARCHAR(50) '../@PersonName',
      Sex NVARCHAR(50) '../@Sex',
      Age int '../@Age',
      WeightP int '../@WeightP',
      HeightP int '../@HeightP',
      Team NVARCHAR(50) '../@Team',
      Game_id int '@Game_id',
      YearG int '@YearG',
      Season NVARCHAR(50) '@Season',
      City NVARCHAR(50) '@City');
EXEC sp_xml_removedocument @idoc

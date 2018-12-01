BULK INSERT OlympicDB.dbo.participants
FROM '/media/ermak/94B2DAA4B2DA8A5E/data_base/lab1/participants.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = '|', ROWTERMINATOR = '0x0a');
GO 

BULK INSERT OlympicDB.dbo.games 
FROM '/media/ermak/94B2DAA4B2DA8A5E/data_base/lab1/games.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = '|', ROWTERMINATOR = '0x0a');
GO 

BULK INSERT OlympicDB.dbo.events
FROM '/media/ermak/94B2DAA4B2DA8A5E/data_base/lab1/events.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = '|', ROWTERMINATOR = '0x0a');
GO 

BULK INSERT OlympicDB.dbo.participants_events_relation
FROM '/media/ermak/94B2DAA4B2DA8A5E/data_base/lab1/participants_events.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = '|', ROWTERMINATOR = '0x0a');
GO 

BULK INSERT OlympicDB.dbo.event_game_relation
FROM '/media/ermak/94B2DAA4B2DA8A5E/data_base/lab1/events_games.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = '|', ROWTERMINATOR = '0x0a');
GO 

BULK INSERT OlympicDB.dbo.participant_game_relation
FROM '/media/ermak/94B2DAA4B2DA8A5E/data_base/lab1/games_participants.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = '|', ROWTERMINATOR = '0x0a');
GO 


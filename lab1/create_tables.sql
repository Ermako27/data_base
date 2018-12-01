IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'OlympicDB'
)

CREATE DATABASE OlympicDB
GO

USE OlympicDB
GO

IF OBJECT_ID('dbo.participants', 'U') IS NOT NULL
DROP TABLE dbo.participants
GO

CREATE TABLE dbo.participants
(
    Participant_id INT NOT NULL PRIMARY KEY,
    PersonName VARCHAR(90) NOT NULL,
    Sex CHAR,
    Age INT, 
    HeightP INT,
    WeightP INT,
    Team VARCHAR(50)
);
GO


IF OBJECT_ID('dbo.games', 'U') IS NOT NULL
DROP TABLE dbo.games                
GO
-- Create the table in the specified schema
CREATE TABLE dbo.games
(
    Game_id INT NOT NULL PRIMARY KEY,
    YearG INT,
    Season VARCHAR(20),
    City VARCHAR(70),
);
GO


IF OBJECT_ID('dbo.events', 'U') IS NOT NULL
DROP TABLE dbo.events
GO

CREATE TABLE dbo.events
(
    Event_id INT NOT NULL PRIMARY KEY, 
    Sport VARCHAR(50), 
    EventName VARCHAR(100),
    PCount INT
);
GO

IF OBJECT_ID('dbo.participants_events_relation', 'U') IS NOT NULL
DROP TABLE dbo.participants_events_relation
GO

CREATE TABLE dbo.participants_events_relation
(
    id INT NOT NULL PRIMARY KEY,
    Participant_id INT,
    Event_id INT
)


IF OBJECT_ID('dbo.event_game_relation', 'U') IS NOT NULL
DROP TABLE dbo.event_game_relation
GO


CREATE TABLE dbo.event_game_relation
(
    id INT NOT NULL PRIMARY KEY,
    Game_id INT,
    Event_id INT,
)


IF OBJECT_ID('dbo.participant_game_relation', 'U') IS NOT NULL
DROP TABLE dbo.participant_game_relation
GO


CREATE TABLE dbo.participant_game_relation
(
    id INT NOT NULL PRIMARY KEY,
    Participant_id INT,
    Game_id INT
)

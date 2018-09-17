IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'OlympicDB'
)

CREATE DATABASE OlympicDB
GO

USE OlympicDB
GO

-- Create a new table called 'T' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.participants', 'U') IS NOT NULL
DROP TABLE dbo.participants
GO
-- Create the table in the specified schema
CREATE TABLE dbo.participants
(
    PersonId INT NOT NULL PRIMARY KEY,
    PersonName VARCHAR(100) NOT NULL,
    Sex CHAR,
    Age INT, 
    HeightP INT,
    WeightP INT,
    Team VARCHAR(20)
);
GO

-- Create a new table called 'S' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.games', 'U') IS NOT NULL
DROP TABLE dbo.games                
GO
-- Create the table in the specified schema
CREATE TABLE dbo.games
(
    GameId INT NOT NULL PRIMARY KEY,
    YearG INT,
    Season VARCHAR(15),
    City VARCHAR(50),
);
GO

-- Create a new table called 'P' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.events', 'U') IS NOT NULL
DROP TABLE dbo.events
GO
-- Create the table in the specified schema
CREATE TABLE dbo.events
(
    EventId INT NOT NULL PRIMARY KEY, 
    Sport VARCHAR(50), 
    EventName VARCHAR(150),
    PCount INT
);
GO
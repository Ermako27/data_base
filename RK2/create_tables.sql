USE RK2
GO

IF OBJECT_ID('dbo.drivers', 'U') IS NOT NULL
DROP TABLE dbo.drivers
GO


CREATE TABLE dbo.drivers
(
    id INT NOT NULL PRIMARY KEY,
    drivers_number INT,
    phone_number INT,
    fio VARCHAR(50)
)
GO

IF OBJECT_ID('dbo.cars', 'U') IS NOT NULL
DROP TABLE dbo.cars
GO

CREATE TABLE dbo.cars
(
    id INT NOT NULL PRIMARY KEY,
    brand VARCHAR(50),
    model VARCHAR(50),
    creation_date INT,
    registration_date INT,
    driver_id INT
)
GO


IF OBJECT_ID('dbo.penalty', 'U') IS NOT NULL
DROP TABLE dbo.penalty
GO

CREATE TABLE dbo.penalty
(
    id INT NOT NULL PRIMARY KEY,
    fine INT,
    warning VARCHAR(50)
)
GO

IF OBJECT_ID('dbo.driver_penalty_relation', 'U') IS NOT NULL
DROP TABLE dbo.driver_penalty_relation
GO

CREATE TABLE dbo.driver_penalty_relation
(
    id INT NOT NULL PRIMARY KEY,
    driver_id INT,
    penalty_id INT
)
GO


ALTER TABLE dbo.cars ADD
CONSTRAINT C_ID FOREIGN KEY (driver_id) REFERENCES dbo.drivers (id)
GO

ALTER TABLE dbo.driver_penalty_relation ADD 
CONSTRAINT D_ID FOREIGN KEY (driver_id) REFERENCES dbo.drivers (id),
CONSTRAINT P_ID FOREIGN KEY (penalty_id) REFERENCES dbo.penalty (id)
GO


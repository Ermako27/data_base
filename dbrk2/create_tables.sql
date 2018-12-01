IF OBJECT_ID('dbo.clients', 'U') IS NOT NULL
DROP TABLE dbo.clients
GO

CREATE TABLE dbo.clients
(
    id  INT NOT NULL PRIMARY KEY,
    fio VARCHAR(50),
    addressof VARCHAR(50),
    age INT
)

IF OBJECT_ID('dbo.bills', 'U') IS NOT NULL
DROP TABLE dbo.bills
GO

CREATE TABLE dbo.bills
(
    id  INT NOT NULL PRIMARY KEY,
    typeof VARCHAR(50),
    open_date INT,
    close_date INT,
    client_id INT,
    bank_id INT,
    fine INT

)


IF OBJECT_ID('dbo.banks', 'U') IS NOT NULL
DROP TABLE dbo.banks
GO

CREATE TABLE dbo.banks
(
    id  INT NOT NULL PRIMARY KEY,
    nameof VARCHAR(50),
    inn INT,
    addressof VARCHAR(50)
)

ALTER TABLE dbo.bills ADD
CONSTRAINT C_ID FOREIGN KEY (client_id) REFERENCES dbo.clients (id),
CONSTRAINT B_ID FOREIGN KEY (bank_id) REFERENCES dbo.banks (id)
GO






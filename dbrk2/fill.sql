INSERT dbo.clients (id,fio,addressof,age) VALUES (1,'ivan','a1',10)
INSERT dbo.clients (id,fio,addressof,age) VALUES (2,'petr','a2',33)
INSERT dbo.clients (id,fio,addressof,age) VALUES (3,'vasya','a1',10)
INSERT dbo.clients (id,fio,addressof,age) VALUES (4,'alex','a3',20)
INSERT dbo.clients (id,fio,addressof,age) VALUES (5,'ivan','a5',15)
INSERT dbo.clients (id,fio,addressof,age) VALUES (6,'max','a2',60)
INSERT dbo.clients (id,fio,addressof,age) VALUES (7,'ivan','a6',48)
INSERT dbo.clients (id,fio,addressof,age) VALUES (8,'nikita','a5',25)
GO

INSERT dbo.bills (id,typeof,open_date,close_date, client_id, bank_id,fine) VALUES (1,'t1',1999,2000,1,6,1000)
INSERT dbo.bills (id,typeof,open_date,close_date, client_id, bank_id,fine) VALUES (2,'t2',2001,2001,1,1,2000)
INSERT dbo.bills (id,typeof,open_date,close_date, client_id, bank_id,fine) VALUES (3,'t3',2001,2003,2,4,3000)
INSERT dbo.bills (id,typeof,open_date,close_date, client_id, bank_id,fine) VALUES (4,'t4',2010,2020,5,4,4000)
INSERT dbo.bills (id,typeof,open_date,close_date, client_id, bank_id,fine) VALUES (5,'t5',2011,2012,5,1,5000)
INSERT dbo.bills (id,typeof,open_date,close_date, client_id, bank_id,fine) VALUES (6,'t6',1990,1995,3,7,6000)
INSERT dbo.bills (id,typeof,open_date,close_date, client_id, bank_id,fine) VALUES (7,'t7',2002,2002,4,2,7000)
INSERT dbo.bills (id,typeof,open_date,close_date, client_id, bank_id,fine) VALUES (8,'t8',1999,2001,8,8,8000)
INSERT dbo.bills (id,typeof,open_date,close_date, client_id, bank_id,fine) VALUES (9,'t9',2001,2003,6,3,3000)
INSERT dbo.bills (id,typeof,open_date,close_date, client_id, bank_id,fine) VALUES (10,'t10',2012,2013,7,3,7000)
GO


INSERT dbo.banks (id,nameof, inn, addressof) VALUES (1,'alfa',1,'a1')
INSERT dbo.banks (id,nameof, inn, addressof) VALUES (2,'sber',2,'a2')
INSERT dbo.banks (id,nameof, inn, addressof) VALUES (3,'tink',3,'a3')
INSERT dbo.banks (id,nameof, inn, addressof) VALUES (4,'raif',4,'a4')
INSERT dbo.banks (id,nameof, inn, addressof) VALUES (5,'ros',5,'a5')
INSERT dbo.banks (id,nameof, inn, addressof) VALUES (6,'vtb',6,'a6')
INSERT dbo.banks (id,nameof, inn, addressof) VALUES (7,'lol',7,'a7')
INSERT dbo.banks (id,nameof, inn, addressof) VALUES (8,'kek',8,'a8')
GO

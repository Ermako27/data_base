
INSERT dbo.drivers (id,drivers_number,phone_number,fio) VALUES (1,100,99,'Ivan')
INSERT dbo.drivers (id,drivers_number,phone_number,fio) VALUES (2,101,98,'Peter')
INSERT dbo.drivers (id,drivers_number,phone_number,fio) VALUES (3,102,97,'Max')
INSERT dbo.drivers (id,drivers_number,phone_number,fio) VALUES (4,103,96,'Nikita')
INSERT dbo.drivers (id,drivers_number,phone_number,fio) VALUES (5,104,95,'Roman')
INSERT dbo.drivers (id,drivers_number,phone_number,fio) VALUES (6,105,94,'Ivan')
INSERT dbo.drivers (id,drivers_number,phone_number,fio) VALUES (7,106,93,'Alex')
INSERT dbo.drivers (id,drivers_number,phone_number,fio) VALUES (8,107,92,'Max')
INSERT dbo.drivers (id,drivers_number,phone_number,fio) VALUES (9,108,91,'Andrew')
INSERT dbo.drivers (id,drivers_number,phone_number,fio) VALUES (10,109,90,'Nikita')
GO

INSERT dbo.cars (id,brand,model,creation_date,registration_date,driver_id) VALUES (1,'bmw','x5', 2007,2009,8)
INSERT dbo.cars (id,brand,model,creation_date,registration_date,driver_id) VALUES (2,'mers','e63', 2015, 2018, 3)
INSERT dbo.cars (id,brand,model,creation_date,registration_date,driver_id) VALUES (3,'lexus','rx', 2003, 2005, 5)
INSERT dbo.cars (id,brand,model,creation_date,registration_date,driver_id) VALUES (4,'audi', 's5', 2012, 2013, 1)
INSERT dbo.cars (id,brand,model,creation_date,registration_date,driver_id) VALUES (5,'rols','phantom',2014, 2015, 9)
INSERT dbo.cars (id,brand,model,creation_date,registration_date,driver_id) VALUES (6,'ferrari','458',1968, 1969, 3)
INSERT dbo.cars (id,brand,model,creation_date,registration_date,driver_id) VALUES (7,'lamba','aventador',2017, 2018,2)
INSERT dbo.cars (id,brand,model,creation_date,registration_date,driver_id) VALUES (8,'bmx','x6m',2009,2010, 4)
INSERT dbo.cars (id,brand,model,creation_date,registration_date,driver_id) VALUES (9,'audi','q7',2016, 2017, 2)
INSERT dbo.cars (id,brand,model,creation_date,registration_date,driver_id) VALUES (10,'mclaren','senna', 2019, 2019, 10)

INSERT dbo.cars (id,brand,model,creation_date,registration_date,driver_id) VALUES (11,'pagani','zonda', 2013,2014,7)
INSERT dbo.cars (id,brand,model,creation_date,registration_date,driver_id) VALUES (12,'infinity','q60', 2017, 2018, 3)
INSERT dbo.cars (id,brand,model,creation_date,registration_date,driver_id) VALUES (13,'lexus','rx', 2003, 2005, 6)
INSERT dbo.cars (id,brand,model,creation_date,registration_date,driver_id) VALUES (14,'audi', 'q5', 2019, 2020, 6)
INSERT dbo.cars (id,brand,model,creation_date,registration_date,driver_id) VALUES (15,'rols','ghost',2014, 2015, 9)
INSERT dbo.cars (id,brand,model,creation_date,registration_date,driver_id) VALUES (16,'ferrari','spider',2000, 2000, 1)
INSERT dbo.cars (id,brand,model,creation_date,registration_date,driver_id) VALUES (17,'lamba','urus',2017, 2018,10)
INSERT dbo.cars (id,brand,model,creation_date,registration_date,driver_id) VALUES (18,'bmx','5',2007,2015, 4)
INSERT dbo.cars (id,brand,model,creation_date,registration_date,driver_id) VALUES (19,'audi','r8',2009, 2010, 2)
INSERT dbo.cars (id,brand,model,creation_date,registration_date,driver_id) VALUES (20,'porsche','macan', 2016, 2018, 3)
GO

INSERT dbo.penalty (id,fine,warning) VALUES (1,'1000','penalty 1')
INSERT dbo.penalty (id,fine,warning) VALUES (2,'2000','penalty 2')
INSERT dbo.penalty (id,fine,warning) VALUES (3,'1000','penalty 3')
INSERT dbo.penalty (id,fine,warning) VALUES (4,'4000','penalty 4')
INSERT dbo.penalty (id,fine,warning) VALUES (5,'1000','penalty 5')
INSERT dbo.penalty (id,fine,warning) VALUES (6,'6000','penalty 6')
INSERT dbo.penalty (id,fine,warning) VALUES (7,'7000','penalty 7')
INSERT dbo.penalty (id,fine,warning) VALUES (8,'5000','penalty 8')
INSERT dbo.penalty (id,fine,warning) VALUES (9,'9000','penalty 9')
INSERT dbo.penalty (id,fine,warning) VALUES (10,'10000','penalty 10')
GO

INSERT dbo.driver_penalty_relation (id,driver_id,penalty_id) VALUES (1,1,1)
INSERT dbo.driver_penalty_relation (id,driver_id,penalty_id) VALUES (2,1,5)
INSERT dbo.driver_penalty_relation (id,driver_id,penalty_id) VALUES (3,1,9)
INSERT dbo.driver_penalty_relation (id,driver_id,penalty_id) VALUES (4,7,3)
INSERT dbo.driver_penalty_relation (id,driver_id,penalty_id) VALUES (5,7,10)
INSERT dbo.driver_penalty_relation (id,driver_id,penalty_id) VALUES (6,2,4)
INSERT dbo.driver_penalty_relation (id,driver_id,penalty_id) VALUES (7,6,2)
INSERT dbo.driver_penalty_relation (id,driver_id,penalty_id) VALUES (8,9,6)
INSERT dbo.driver_penalty_relation (id,driver_id,penalty_id) VALUES (9,4,7)
INSERT dbo.driver_penalty_relation (id,driver_id,penalty_id) VALUES (10,5,7)
INSERT dbo.driver_penalty_relation (id,driver_id,penalty_id) VALUES (11,4,8)
INSERT dbo.driver_penalty_relation (id,driver_id,penalty_id) VALUES (12,7,10)
INSERT dbo.driver_penalty_relation (id,driver_id,penalty_id) VALUES (13,2,2)
INSERT dbo.driver_penalty_relation (id,driver_id,penalty_id) VALUES (14,8,5)
GO














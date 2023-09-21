USE JCAC_CormacF
DELIMITER $$
DROP PROCEDURE IF EXISTS CreateDeliveryEmployeeTable2 $$
CREATE PROCEDURE CreateDeliveryEmployeeTable2()
BEGIN
  START TRANSACTION;


CREATE TABLE Delivery_Employee (
  DemployeeID int PRIMARY KEY AUTO_INCREMENT ,
  FirstName varchar(70),
  LastName varchar(70),
  Salary Decimal(10,2),
  BankAccount varchar(16),
  NationalInsurance varchar(11));


INSERT INTO Delivery_Employee (FirstName, LastName, Salary, BankAccount, NationalInsurance )
  VALUES ('Joseph', 'Magee', 19000 ,'87212667578643', 'AD913336R'),
    ('Samuel','Buyan',19000,'21785671234598','AR650465N'),('John', 'Smith', 100000, '34422315894589', 'HG124809K'),
    ('Joshua','Kelso',900000,'21932721875632','KF242148H'),('Harry','Potter' ,12000, '81760910454545','YT877799U'),
    ('Mario','Mario',50000,'31571073452189', 'ZX941818B'),('Steve','Rodgers',20000,'52818372454532','BG165344K'),
    ('Clark','Kent', 45000,'27701114874367','XS633662U'),('Kim-Jong','Un', 10000, '28899322343434','FD714955B'),
    ('Obiwon','Kenobi',400000,'74044710564354','YU617277W');

SELECT * FROM Delivery_Employee;

  -- check the number of affected rows
  GET DIAGNOSTICS @rows = ROW_COUNT;
  IF @rows = 0 THEN
    -- if an error occurred,
    ROLLBACK;
    SELECT 'Transaction rolled back due to error.';
  ELSE
    -- If no error occurred, commit the Transaction
    COMMIT;
    SELECT 'Transaction committed successfully.';
  END IF;
END $$
DELIMITER ;
CALL CreateDeliveryEmployeeTable2();

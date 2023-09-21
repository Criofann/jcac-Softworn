DELIMITER $$
DROP PROCEDURE IF EXISTS Delivery_Employee_Table $$
CREATE PROCEDURE Delivery_Employee_Table()
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
VALUES ('Joseph', 'Magee', 19000 ,'87212667', '389133361'),
('Samuel','Buyan',19000,'21785671','326504657'),('John', 'Smith', 100000, '34422315', '851248097'),
('Joshua','Kelso',900000,'21932721','702421488'),('Harry','Potter' ,12000, '81760910','938777996'),
('Mario','Mario',50000,'31571073', '719418187'),('Steve','Rodgers',20000,'52818372','771653448'),
('Clark','Kent', 45000,'27701114','166336620'),('Kim-Jong','Un', 10000, '28899322','707149553'),
('Obiwon','Kenobi',400000,'74044710','456172772');

Select*from Delivery_Employee;

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
CALL Delivery_Employee_Table();

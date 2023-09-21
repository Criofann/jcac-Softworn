USE JCAC_CormacF
DELIMITER $$
DROP PROCEDURE IF EXISTS CreateSalesEmployeeTable_1 $$
CREATE PROCEDURE CreateSalesEmployeeTable_1()
BEGIN
  START TRANSACTION;

	-- Create the Sales_Employee table
    CREATE TABLE Sale_Employee (
	SaleEmployeeID int AUTO_INCREMENT PRIMARY KEY,
    FirstName Varchar(100),
    LastName Varchar(100),
    Salary Decimal(10,2),
    BankAccount varchar(16),
    NationalInsurance varchar(11)
		);
    
    # Insert records into the Sales_Employee table
    INSERT INTO Sale_Employee (FirstName, LastName, Salary, BankAccount, NationalInsurance)
	VALUES 	('Rick', 'Novac', '21000.00', '77288022023794', 'GH345676D'),
			('Susan', 'Connor', '21000.00', '55395927509208', 'HG736459S'),
			('Margaret', 'Adelman', '21000.00', '58848591014791', 'SW245435A'),
			('Ronald', 'Barr', '21000.00', '16641433863684', 'AQ725493S'),
			('Marie', 'Broadbet', '21000.00', '94542881443647', 'JI747298K'),
			('Roger', 'Lum', '21000.00', '30586904781009', 'BH234321D'),
			('Marlene', 'Donahue', '21000.00', '85799665369254', 'DE827364J'),
			('Jeff', 'Johnson', '21000.00', '99830647039832', 'XD938472K'),
			('Melvin', 'Forbis', '21000.00', '77890167964853', 'FV837461K'),
			('Conor', 'Egan', '21000.00', '37270017933073', 'DR295563D');

    # Check the number of affected rows
    GET DIAGNOSTICS @rows = ROW_COUNT;
    IF @rows = 0 THEN
      # If an error has occured, rollback the transaction
      ROLLBACK;
      SELECT 'Transaction rolled back due to error.';
    ELSE
      # If no error has occured, commit the transaction
      COMMIT;
      SELECT 'Transaction has committed sucessfully.';
    END IF;
  END $$
DELIMITER ;
CALL CreateSalesEmployeeTable_1();

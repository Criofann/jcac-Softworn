USE JCAC_CormacF;
DELIMITER $$
DROP PROCEDURE IF EXISTS CreateClientTable_3 $$
CREATE PROCEDURE CreateClientTable_3()

BEGIN
    START TRANSACTION;

      CREATE TABLE Client (
      ClientID int,
      Name varchar(70),
      Address varchar(200),
      Phone varchar(64)
      );

      ALTER TABLE Client
      ADD PRIMARY KEY(ClientID);

      ALTER TABLE Client MODIFY ClientID int AUTO_INCREMENT;

    -- Insert a new record into the "Client" table
      INSERT INTO Client (Name,Address,Phone)
      VALUES ('Shaun Gauley','4-6 Upper Crescent, Belfast','028 9057 1100'), ('Denise McShaw','Lisburn Road','028 7748 4523'), ('Flora Sava','Carneybaun Estate','028 9073 2278'),
      ('Peter Blair','York Street','028 0094 3853'), ('Mark Landing','Ballybogey','028 8746 32983'), ('Fiona Carey','Smithfield Lane','028 8535 3254'),
      ('Theresa August','Willowbrook Park','028 7486 4320'), ('Mary Gilbert','Princess Street','028 7473 9347'), ('Matthew Smith','Corbyfield Park','028 0274 3439'),
      ('William McDonald','Sherbert Lane','028 4376 8203');


    -- Check the number of affected rows
    GET DIAGNOSTICS @rows = ROW_COUNT;
    IF @rows = 0 THEN
       -- If an error occurred, rollback the transaction
       ROLLBACK;
       SELECT 'Transaction rolled back due to error.';
    ELSE
        -- If no error occurred, commit the transaction
        COMMIT;
        SELECT 'Transaction committed successfully';
    END IF;
END $$
DELIMITER ;
CALL CreateClientTable_3();

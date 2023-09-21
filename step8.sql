USE JCAC_CormacF
DELIMITER $$
DROP PROCEDURE IF EXISTS AssignClientToProject $$
CREATE PROCEDURE AssignClientToProject()
BEGIN
  START TRANSACTION;
    ALTER TABLE Project
      ADD COLUMN ClientID int
      AFTER Technology;

    ALTER TABLE Project
      ADD CONSTRAINT fk_project_clientID
  		  FOREIGN KEY(ClientID)
          REFERENCES Client(ClientID);
      UPDATE Project
        SET ClientID = 1
        WHERE ProjectID=1;

      UPDATE Project
        SET ClientID = 1
        WHERE ProjectID=2;

      UPDATE Project
        SET ClientID = 3
        WHERE ProjectID=3;

      UPDATE Project
        SET ClientID = 2
        WHERE ProjectID=4;

      UPDATE Project
        SET ClientID = 4
        WHERE ProjectID=5;

      UPDATE Project
        SET ClientID = 9
        WHERE ProjectID=6;

      UPDATE Project
        SET ClientID = 4
        WHERE ProjectID=7;

      UPDATE Project
        SET ClientID = 8
        WHERE ProjectID=8;

      UPDATE Project
        SET ClientID = 2
        WHERE ProjectID=9;

      UPDATE Project
        SET ClientID = 1
        WHERE ProjectID=10;

  SELECT ProjectName as `Project`, Name as `client`
    FROM Project
    JOIN Client ON Client.ClientID= Project.ClientID
  GROUP BY Project;
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
CALL AssignClientToProject();

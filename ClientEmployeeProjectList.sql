DELIMITER $$
DROP PROCEDURE IF EXISTS ClientEmployeeProjectList_1 $$
CREATE PROCEDURE ClientEmployeeProjectList_1()
BEGIN
  START TRANSACTION;


	--  a list of clients, the name of the sales employee who works with that client and the list of projects that the client has
  SELECT Client.Name as 'Client Name', 
	CONCAT(Sale_Employee.FirstName, ' ', Sale_Employee.LastName) as 'Sale Employee',
	GROUP_CONCAT(Project.ProjectName separator ', ') as 'List of Projects'
  FROM Client
  JOIN Sale_Employee ON Client.ClientID = Sale_Employee.SaleEmployeeID
  JOIN Project ON Client.ClientID = Project.ProjectID
	GROUP BY Client.ClientID;
  

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
CALL ClientEmployeeProjectList_1();
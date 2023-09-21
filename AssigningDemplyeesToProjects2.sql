USE JCAC_CormacF
DELIMITER $$
DROP PROCEDURE IF EXISTS AssignDemployeToProject $$
CREATE PROCEDURE AssignDemployeToProject()
BEGIN
  START TRANSACTION;

  CREATE TABLE demployee_project (
    demployee_projectID int PRIMARY KEY AUTO_INCREMENT,
    DemployeeID int,
    ProjectID int);

  #drop table demployee_project;

  INSERT INTO demployee_project( DemployeeID,ProjectID)
    VALUES(1,1),(1,3),(3,1),(4,9),(6,6),(5,8),(8,3),(4,7),(3,6),(6,8),(3,7),(7,8),(3,9);

  ALTER TABLE demployee_project
    ADD CONSTRAINT fk_demployee_project_Delivery_EmployeeID
    FOREIGN KEY (DemployeeID)
    REFERENCES Delivery_Employee(DemployeeID);

  ALTER TABLE demployee_project
    ADD CONSTRAINT fk_demployee_project_ProjectID
  	FOREIGN KEY (ProjectID)
    REFERENCES Project(ProjectID);


  SELECT ProjectName as `project`, GROUP_CONCAT(CONCAT(FirstName, " ", LastName) SEPARATOR ', ') as `names` from Project
    INNER JOIN demployee_project
    ON Project.ProjectID = demployee_project.projectID
    INNER JOIN Delivery_Employee
    ON demployee_project.DemployeeID  = Delivery_Employee.DemployeeID
    GROUP BY `project`;

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
CALL AssignDemployeToProject();

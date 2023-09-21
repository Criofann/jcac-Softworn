USE JCAC_CormacF;
DELIMITER $$
DROP PROCEDURE IF EXISTS my_project_table $$
CREATE PROCEDURE my_project_table()
BEGIN
  START TRANSACTION;

	# Creating a Project Table
	CREATE TABLE Project (
	ProjectID INT PRIMARY KEY AUTO_INCREMENT,
	ProjectName VARCHAR(70),
    `Value` DECIMAL (10,2),
	Technology VARCHAR (255)
    TechLead 
    );
    
    # Inserting values into the project table
	INSERT INTO Project (ProjectName, `Value`, Technology) VALUES
	("Project1", 100.27, "SQL, Java, Python"),
    ("Project2", 1000, "SQL, Java, RubyOnRails"),
    ("Project3", 10000, "Java, HTML, CSS"),
    ("Project4", 250000, "AppInventor, Scratch, Python"),
    ("Project5", 19233.91, "Visual Basic"), 
    ("Project6", 0.81, "Binary"),
    ("Project7", 999999.99, "SQl, Java, Visual Basic, Scratch"),
    ("Project8", 0.01, "Binary"),
    ("Project9", 13, "C#, C++"),
    ("Project10", 10000000.01, "Machine Code"); 
    
    SELECT * FROM Project;

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
CALL my_project_table();
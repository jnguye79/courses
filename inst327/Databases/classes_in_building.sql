-- Partial script for the 'classes_in_building' stored procedure
-- Feel free to remove/edit the comments once you have finished the code (in fact, please do)
USE ischool;

DROP PROCEDURE IF EXISTS classes_in_building;

DELIMITER //
-- The CREATE statement is below, be sure to create the varchar parameter!
CREATE PROCEDURE  (
	
	)

BEGIN
-- --> The procedure is made up of a select statement with the following columns:
-- --- course - combination of the course_code and course_number,
-- --- section - combination of semester and the section_number,
-- --- credits, start_time, building_code and room_number.

-- --> Only include courses that have a section in that building (at any time).
-- --- Order results by room number, course, and section.

		

END //

DELIMITER ;

-- --> Run the statement below to test your code: 
CALL classes_in_building('BPS');

-- --> Do you see the rows with the following values? Column names should match the names outlined above. 
	-- --- INST311	Fall 0203	3	15:00:00	BPS		1228
	-- --- INST327	Fall 0202	3	11:00:00	BPS		1228
	-- --- INST327	Fall 0203	3	12:00:00	BPS		1228
	-- --- INST414	Fall 0102	3	17:30:00	BPS		1236
	-- --- INST490	Fall 0104	3	18:00:00	BPS		1238

-- --> If "Yes", you have built the stored procedure as required; 
-- --- if "No", continue working on it.

-- --> If you would like to test the output with different buildings you simply need to replace 'BPS' with any other building code in the database. 
-- --- SELECT DISTINCT building_code FROM locations;


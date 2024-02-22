USE ischool;

/* Question 1 (Views): 
For this view, we want to list location information for all people with the "staff"
classification. Create the view staff_addresses which returns the following information
matching all data and format aspects, including column headers. Be sure to only list
each person once! Note: Once you've created the view you can easily run it with the 
following code: SELECT * FROM staff_addresses */

DROP VIEW IF EXISTS staff_addresses;

CREATE VIEW staff_addresses AS
	SELECT CONCAT(lname, ', ', fname) AS person, department, street, CONCAT(city, ', ', state) AS location, classification
    FROM people JOIN person_addresses USING (person_id)
		JOIN addresses USING (address_id)
		JOIN person_classifications USING (person_id)
		JOIN classification USING (classification_id)
	WHERE classification = 'Staff' AND city IS NOT NULL AND state IS NOT NULL
    ORDER BY state, lname;
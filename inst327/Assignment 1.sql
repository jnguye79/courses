USE ischool;

/* Answer 1: Simple SELECT and Aliases
Use the addresses table in the iSchool database for this question: Write a query that 
replicates the result set shown below (in course, not open to public). Check the sample
output for a pattern to use in a WHERE to limit which rows are returned. Order results
by state, city, and street (all in ascending order) */

SELECT street AS 'Street', CONCAT(city, ', ', state) AS 'City/State', zipcode AS 'Postal Code', LEFT(main_phone, 3) AS 'Main Phone Area Code'
	FROM addresses
	/* WHERE clause used to exclude a RANGE of states - acceptable */
	WHERE state >= 'MS' AND state <= 'NY'
	ORDER BY state, city, street;

/* Answer 2: Simple Select
Use the people table in the iSchool database for this question: Write a query that
replicates the result set shown below (in course, not open to public). Use the sample
output to determine which columns to order by in your query. */

SELECT person_id AS 'UID', CONCAT(fname, ' ', lname) AS 'name', start_date, department, title
	FROM people
    /* WHERE clause used to filter NULL values - acceptable */
    WHERE title IS NOT NULL
    ORDER BY start_date DESC;
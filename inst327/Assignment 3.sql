USE ischool;

/* Clean Execution Code */
DROP TABLE IF EXISTS people_copy;
DROP TABLE IF EXISTS enrollments_copy;

/* Question 1 - CREATE and INSERT
i. First, create the two tables people_copy and enrollments_copy then insert all of
the data from their original tables. When creating the tables, preserve column
attributes and indexes (this can be done with the LIKE keyword)*/

CREATE TABLE people_copy 
	LIKE people;
INSERT INTO people_copy
	SELECT *
    FROM people;
    
CREATE TABLE enrollments_copy
	LIKE enrollments;
INSERT INTO enrollments_copy
	SELECT *
	FROM enrollments;
    
/* ii. Once your table has been created, write INSERT statements to add the
following information (Insert a new student into people_copy table with these
values for each column) :
		person_id: The next automatically generated ID value
        lname: Smith
        fname: Ricky
        pronoun_id: 2
        email: rsmith@umd.edu
        college: College of Information Studies
        department: BSIS
        title: NULL
        state_date: Use a function here that will insert the date and time at
        the moment this record is added */
		
INSERT INTO people_copy (person_id, lname, fname, pronoun_id, email, college, department, title, start_date)
	VALUE(DEFAULT, 'Smith', 'Ricky', 2, 'rsmith@umd.edu', 'College of Information Studies', 'BSIS', NULL, NOW());
    
/* iii. Insert 3 new rows into the enrollments_copy table to place Ricky in the
following classes. Note that you may hardcode the id values but you will
need to investigate other tables to get the correct section_id values.
Ricky is enrolled in INST327 section 103 for this Spring, and he was
enrolled in INST201 section 0101 and INST311 section 0102 in the Fall. */

INSERT INTO enrollments_copy (person_id, section_id)
	VALUES
		/* Hardcoding ID values - acceptable */
		(132466128, 173),
		(132466128, 15),
		(132466128, 32);

/* Question 2: UPDATE 
i. Turns out one of the original enrollments for Ricky was incorrect and we need to
change which section he is in. Keep the inserts the same but write an update that
switches Ricky from INST327 section 103 into INST327 section 102. Be sure not to
change any other values in enrollments_copy. */

UPDATE enrollments_copy
	SET section_id = 172
    WHERE person_id = 132466128 AND section_id = 173;

/* ii. Then, write a SELECT that replicates the results below to make sure Ricky’s
enrollments are correct after your UPDATE query. Be sure that your query replicates the
result set shown below, matching all data and format aspects, including column headers 
(3 rows returned. Order does not matter for this question.) */

SELECT CONCAT(fname, ' ', lname) AS 'student_name', CONCAT(course_code, course_number) as 'course', section_number, CONCAT(semester, ' ', year) AS 'semester_year'
	FROM people_copy JOIN enrollments_copy
		USING (person_id)
	LEFT JOIN course_sections
		USING (section_id)
	LEFT JOIN courses
		USING (course_id)
	WHERE fname = 'Ricky' AND lname = 'Smith';
    
/* Question 3: DELETE
i. The university has decided to cancel INST327 for the 2022 year, so next, you need to
remove all enrollments for the course for this Spring. First, write a query that replicates
the result set below, matching all data and format aspects, including column headers.
This query is to help you determine which values need to be removed from the
enrollments_copy table. Please order by section_id but any additional ordering is not
necessary as your output does not need to exactly match. (41 rows returned.) */

SELECT section_id, section_number, CONCAT(course_code, course_number) AS 'course', CONCAT(fname, ' ', lname) AS student_name
	FROM course_sections JOIN courses
		USING (course_id)
	LEFT JOIN enrollments_copy
		USING (section_id)
	LEFT JOIN people_copy
		USING (person_id)
	WHERE course_number = 327 AND year = '2022' 
    AND fname IS NOT NULL AND lname IS NOT NULL
    /* Order beyond section_id is unnecessary - noted */
    ORDER BY section_id;

/* ii. Then, write a DELETE query to remove all students enrolled in any INST327 sections
for Spring 2022. To make sure the values are properly deleted, include the same
SELECT query you wrote after the DELETE again to check the values were removed.
Again, you must include the SELECT query before and after the DELETE. (0 rows returned.) */

DELETE FROM enrollments_copy
	WHERE section_id >= 171 AND section_id <= 178;

SELECT section_id, section_number, CONCAT(course_code, course_number) AS 'course', CONCAT(fname, ' ', lname) AS student_name
	FROM course_sections JOIN courses
		USING (course_id)
	LEFT JOIN enrollments_copy
		USING (section_id)
	LEFT JOIN people_copy
		USING (person_id)
	WHERE course_number = 327 AND year = '2022'
    AND fname IS NOT NULL AND lname IS NOT NULL
    /* Order beyond section_id is unnecessary - noted */
    ORDER BY section_id;

USE ischool;

/* Answer 1: JOINS and UNION
You must make use of the UNION keyword for this question. Write a query that replicates
the result set (in course, not open to public) shown below, matching all data and
format aspects, including column headers. Query should list course information for all
courses lower than a 300 level. */

SELECT CONCAT(course_code, ' ', course_number) AS 'course_name', section_number, CONCAT(fname, ' ', lname) AS 'instructor', course_description, course_prereq, credits
	FROM courses JOIN course_sections cs 
		USING (course_id)
	JOIN people p
		ON cs.instructor_id = p.person_id
	WHERE course_prereq IS NOT NULL AND course_number < 300
UNION
SELECT CONCAT(course_code, ' ', course_number) AS 'course_name', section_number, CONCAT(fname, ' ', lname) AS 'instructor', course_description, "No Prereqs", credits
	FROM courses JOIN course_sections cs 
		USING (course_id)
	JOIN people p
		ON cs.instructor_id = p.person_id
	WHERE course_prereq IS NULL AND course_number < 300
ORDER BY course_name, section_number, instructor;

/* Answer 2: Special JOINs
Write a query that replicates the result set below (in course, not open to public). THis
query lists course and enrollment info for all sections of INST327 even if no students are
enrolled in the section. For the purpose of this question, you may disregard the 
instructions and use an exact match case since we are only interested in one course. */

SELECT CONCAT(course_code, course_number) AS 'course', CONCAT(semester, ' - ', year) AS 'semester', section_number,
CONCAT(fname, ' ', lname) AS 'enrolled_student', meeting_days
	FROM courses c JOIN course_sections cs
		USING (course_id)
	LEFT JOIN enrollments e
		USING (section_id)
	LEFT JOIN people p
		USING (person_id)
	/* Using exact match cases - acceptable */
	WHERE course_number = "327"
    ORDER BY semester, section_number, enrolled_student
    
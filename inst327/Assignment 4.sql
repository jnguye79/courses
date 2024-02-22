USE ischool;

/* Question 1 (Aggregate Functions):
Write a query that replicates the result set shown below, matching all data and
format aspects, including column headers. The columns are enrollments, which
lists the number of courses the student is enrolled in; credit count, which lists the
number of credits they have taken; and latest_end, which is the latest end time
from the courses they are enrolled in (See the time_format() function for help
with formatting here). Only consider sections from the 2021 year. Include a final
row that lists the super-aggregates for each column (i.e total enrollments, total
credits of all students, latest end time). Only include students with more than 2
enrollments. */

SELECT CONCAT(lname, ', ', fname) AS 'student_name', COUNT(person_id) AS 'enrollments', 
SUM(credits) AS 'credit_count', TIME_FORMAT(MAX(end_time), '%r') AS 'latest_end'
	FROM people JOIN enrollments USING (person_id)
    JOIN course_sections USING (section_id)
    JOIN courses USING (course_id)
    WHERE course_sections.year = 2021
    GROUP BY student_name WITH ROLLUP
    HAVING COUNT(person_id) > 2;

/* Question 2 (Subquery/CTE):
Replicate the result set below which counts both the number of sections and the number
of students for each course. Only include courses with 5 or more enrolled students. To
properly count both values you must use either a subquery or CTE of your choice.
Counting both values within one SELECT query will return incorrect results, so using a
subquery or CTE is necessary. */

SELECT DISTINCT CONCAT(course_code, course_number) AS 'course', course_description, 
COUNT(course_number) AS 'section_count', enrollment_count
	FROM courses JOIN course_sections USING (course_id)
    JOIN (SELECT course_id, COUNT(person_id) AS 'enrollment_count'
			FROM people JOIN enrollments USING (person_id)
			LEFT JOIN course_sections USING (section_id)
			GROUP BY course_id
			HAVING COUNT(person_id) >= 5
			ORDER BY enrollment_count DESC) AS T1 USING (course_id)
    GROUP BY course_number
    HAVING enrollment_count >= 5
    ORDER BY section_count DESC;

/* Explanation (+2 Points): 
Provide a short explanation of why you used either option
(subquery/CTE). Neither answer is more correct, we would just like you to explain your
choice. There is no rubric for this but answers should be more than a simple sentence */

/* For my answer above, I used the subquery as I was more similar to the formatting structure 
than I was to a CTE. However throughout my work process, I noticed the similarities between both options. Since that's
the case, I will be implementing a CTE version of the question to get some more practice in on my own time. */
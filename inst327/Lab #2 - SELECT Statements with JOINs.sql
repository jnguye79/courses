/* Name: J.N.
Date Created: February 22, 2022
Date Finished: February 22, 2022
Lab 2 - SELECT Statements with JOINs */

/* Question 1
Replicate this result set (in course, not open to public) from the ap database. The 
result set has 122 rows; only a subset is pictured. */

USE ap;

SELECT vendor_name, vendor_state
	FROM vendors
    WHERE vendor_state = 'CA'
UNION
SELECT vendor_name, 'Outside CA'
	FROM vendors
    WHERE vendor_state != 'CA'
ORDER BY vendor_name;

/* Question 2
Replicate this result set (in course, not open to public) from the ex database. The
result set has 7 rows. */

USE ex;

SELECT department_name, CONCAT (first_name, ' ', last_name) AS 'employee_name'
	FROM departments d JOIN employees e
		USING (department_number)
	ORDER BY department_name;

/* Question 3
Replicate this result set (in course, not open to public) from the ap database. The
result set has 4 rows. */

USE ap;

SELECT vendor_name, invoice_date, invoice_number, CONCAT('# ', invoice_sequence)
AS 'inv_sequence', line_item_amount AS 'li_amount'
	FROM vendors JOIN invoices
		USING (vendor_id)
	JOIN invoice_line_items
		USING (invoice_id)
	WHERE vendor_name = 'Wells Fargo Bank'
	ORDER BY inv_sequence;
    
/* Question 4
Replicate this result set (in course, not open to public) from the ex database. The
result set has 1 row. */

USE ex;

SELECT department_number, department_name, employee_id
	FROM departments LEFT JOIN employees
		USING (department_number)
	WHERE department_number = 3;
    
/* Question 5
Replicate this result set (in course, not open to public) from the ap database. 
Use the USING keyword. The result set has 118 row. */

USE ap;

SELECT invoice_number, vendor_name, line_item_description, line_item_amount
	FROM invoices JOIN vendors
		USING (vendor_id)
	LEFT JOIN invoice_line_items
		USING (invoice_id)
	ORDER BY invoice_number;
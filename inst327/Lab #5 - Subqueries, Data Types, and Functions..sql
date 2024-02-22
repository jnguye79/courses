/* Name: J.N.
Date Created: March 4, 2022
Date Finished: March 4, 2022
Lab 5 - Subqueries, Data types, and Functions */

Use ap;

/* Question 1: Use the ap database to list vendors by name, first name & state from whom we bought a 
line item that costs less than $100. Use one subquery and one join to build your overall query. 
Hint: There are at least two ways you can write this query. In one of them, the JOIN will be inside the 
subquery: in the other, the JOIN will be outside of the subquery. You do not need any aggregation/summary for this query. */

SELECT vendor_name, vendor_contact_first_name, vendor_state
	FROM vendors
    WHERE vendor_id IN
		(SELECT vendor_id
		FROM invoices JOIN invoice_line_items USING (invoice_id)
		WHERE line_item_amount > 100 )
	ORDER BY vendor_name;

/* Question 2: This is should produce the same result set as Question 2. Use 1 common table expression instead of a subquery.
List vendors by name, first name & state from whom we bought a line item that costs less than $100. */

WITH invoice_items_CTE AS
	(SELECT DISTINCT vendor_id
	FROM invoices JOIN invoice_line_items USING (invoice_id)
	WHERE line_item_amount > 100 )
    
SELECT vendor_name, vendor_contact_first_name, vendor_state
	FROM vendors JOIN invoice_items_CTE USING (vendor_id)
    ORDER BY vendor_contact_first_name;

/* Use a correlated subquery to return one row per vendor, representing the vendor's newest invoice (the one with the latest date)
and invoice_total should be less than $100. Each row should include these four columns:
- vendor_name as "Vendor Name",
- invoice_number as "Invoice Number" [formatted as $99,999.99],
- invoice_date as "Invoice Date/Time" [use the CAST function to return the invoice_date column with its full date and time],
and
- invoice_total as "Invoice Total".
This should return 9 or 10 rows.
Sort the results by the invoice_total. Do not forget to USE the correct database. */

SELECT vendor_name AS 'Vendor Name', invoice_number AS 'Invoice Number', CAST(invoice_date AS DATETIME) AS 'Invoice Date/Time', 
CONCAT('$', FORMAT(invoice_total, 2) AS 'Invoice Amount', vendor_st
	FROM invoices JOIN vendors USING (vendor_id)
    WHERE invoice_date = 
		(SELECT MAX(invoice_date)
        FROM invoices
        WHERE vendor_id = vendor_id) AND invoice_total < 100
	ORDER BY invoice_total;
/* Name: J.N.
Date Started: February 25, 2022
Date Finished: February 25, 2022
Lab 4 - Summary Queries, Subqueries, and Common Table Expressions

/* Question 1
Write a SELECT statement using the ap database that will:
1. Count the invoices for each vendor AS (invoice_count)
2. Sum of invoice total values by vendor AS (invoice_total_count)
3. Average invoice_total amount for each vendor AS (invoice_average) */

USE ap;

SELECT vendor_name, COUNT(invoice_number) AS 'invoice_count', 
CONCAT('$', FORMAT(SUM(invoice_total),2)) AS 'invoice_total_count',
CONCAT('$', FORMAT(AVG(invoice_total), 2)) AS 'invoice_average'
	FROM vendors JOIN invoices
		USING (vendor_id)
	GROUP BY vendor_name
    ORDER BY invoice_count DESC;
    
/* Question 2
Write a SELECT statement that returns the same result set as the SELECT statement below, but don't use a join.
Instead, use a subquery in a WHERE clause that uses the IN keyword.

				Example Given:
					SELECT DISTINCT vendor_name
						FROM vendors v JOIN invoices i
						USING (vendor_id)
						ORDER BY vendor_name; */
                        
USE ap;

SELECT DISTINCT vendor_name
	FROM vendors
	WHERE vendor_id IN
		(SELECT vendor_id 
			FROM invoices)
	ORDER BY vendor_name;
    
/* Question 3
Which invoices have a payment total that's greater than the average invoice total for all invoices with an invoice total
greater than 0? Return the invoice_number and invoice_total columns for each invoice. This should return 18 rows. Sort the 
results by the invoice_total column in descending order. */

USE ap;

SELECT invoice_number, invoice_total
	FROM invoices
    WHERE payment_total >
		(SELECT AVG(invoice_total)
			FROM invoices
            WHERE invoice_total > 0)
    ORDER BY invoice_total DESC;
    
/* Question 4
Write a SELECT statement that returns two columns:
- vendor_id
- largest unpaid invoice (i.e. invoices with a balance due > 0)  for each vendor
Hint: You can group the result set by the vendor_id to return 7 rows.

Now, use the query you created above in a common table expression (CTE) to return a single value that shows the total sum
of the largest unpaid invoices for each vendor. */

WITH max_invoice AS
(
	SELECT vendor_id, MAX(invoice_total) AS 'invoice_max'
		FROM invoices
        WHERE invoice_total - credit_total - payment_total > 0
        GROUP BY vendor_id
)

SELECT SUM(invoice_max) as sum_of_maximums
	FROM max_invoice;
/* Name: J.N.
Date Started: February 21, 2022
Date Ended: February 21, 2022
Lab Exercise #1 - Getting Acquainted with Workbench */

/* Question 1
Using the ap database, display vendor name, address, and city for vendors that
are in New York. Order the list by city and for those within the same city, order by
vendor name */

USE ap;

SELECT vendor_name, vendor_address1, vendor_address2, vendor_city
	FROM vendors
	WHERE vendor_state = 'NY'
	ORDER BY vendor_city, vendor_name;
    
/* Question 2
In the ap database, complete the following query to discover the invoice numbers
for which there is no payment. Complete this WHERE clause using the
payment_date. */

USE ap;

SELECT invoice_number, payment_date, payment_total
	FROM invoices
    WHERE payment_date IS NULL;
    
/* Question 3
The item table in the om database includes songs and artists. Some artists are
listed more than once. Write a query that lists each artist only once, in reverse
alphabetical order. */

USE om;

SELECT DISTINCT artist
	FROM items
    ORDER BY artist DESC;
    
/* Question 4
Using the CONCAT function, list all customers in the ex databases in the format
last name, first name, e.g., "Anders, Maria" and use an alias to display "Full 
Name" as the column heading. */

USE ex;

SELECT CONCAT(customer_last_name, ", ", customer_first_name) AS 'Full Name'
	FROM customers
    ORDER BY customer_last_name, customer_first_name;
    
/* Question 5
In the ap database, list the invoice numbers, payment date, due date, and 
credit amount for those invoices that include a credit and have a payment 
that is past the due date. */

USE ap;

SELECT invoice_number, payment_date, invoice_due_date, credit_total
	FROM invoices
    WHERE credit_total != 0 AND payment_date > invoice_due_date;
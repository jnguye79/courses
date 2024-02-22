/* Name: J.N.
Date Created: February 25, 2022
Date Finished: February 25, 2022
Lab 3 - INSERT/UPDATE/DELETE and Aggregate Functions 
*Use the om database for  all subsequent questions.* */

/* Question 1 - (Given)
Execute the following command. */
USE om;

CREATE TABLE customers_copy AS
	SELECT * 
	FROM customers;

/* Question 2
Using two CREATE TABLE statements, create copies of the orders and order_details tables. 
Name the tables orders_copy and order_details_copy. */

USE om;

CREATE TABLE orders_copy AS
	SELECT *
	FROM orders;

CREATE TABLE order_details_copy AS
	SELECT *
	FROM order_details;

/* Question 3
Adjust the safe update mode setting via this command:
SET SQL_SAFE_UPDATES = 0;
Then delete orders from orders_copy if they have shipped.
HINT: You should use a SELECT query to verify what you want to delete before executing your delete 
and to verify what remains after the deletion. */

USE om;
SET SQL_SAFE_UPDATES = 0;

/* Verification before the deletion process */
SELECT *
	FROM orders_copy;

/* Deletion Method */
DELETE FROM orders_copy
	WHERE shipped_date IS NOT NULL;
    
/* Verification AFTER the deletion process */
SELECT *
	FROM orders_copy; 

/* Question 4
Update the order_details_copy, increasing the quantity of items ordered by 2 for order_id 829 and item 5.
HINT: Make sure to verify values of the row(s) that you will update before and after the update. */

USE om;
SET SQL_SAFE_UPDATES = 0;

SELECT *
	FROM order_details_copy
	WHERE order_id = 829 AND item_id = 5;

UPDATE order_details_copy
	SET order_qty = order_qty + 2
    WHERE order_id = 829 AND item_id = 5;
    
SELECT *
	FROM order_details_copy
	WHERE order_id = 829 AND item_id = 5;

/* Question 5
Insert a new customer into the customers_copy table, with customer_id = 26. Set the customer name, 
address information, and phone information to whatever you like. Write and execute a second command 
to verify the success of your insert. */

USE om;
SET SQL_SAFE_UPDATES = 0;

INSERT INTO customers_copy
	VALUES('26', 'Saturn', 'Neptune', '515 Sunrise Blvd', 'Midgard', 'NY', '55555','2759158264', NULL);

SELECT *
	FROM customers_copy;

/* Question 6
Write a query to return order 829 from the order_details_copy table and the count of items ordered. */

USE om;

SELECT order_id, COUNT(item_id) AS 'Item Count'
	FROM order_details_copy
    WHERE order_id = 829;
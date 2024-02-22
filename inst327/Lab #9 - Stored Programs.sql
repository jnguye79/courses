/* Name: J.N.
Date Created: April 29, 2022
Date Finished: April 29, 2022
Lab 9 - Stored Programs */

USE ForestGlenInn;

DROP FUNCTION IF EXISTS CalcFee;
DELIMITER //

/* Question 4 (Function):
Calculate the cancellation fee based on how many days ahead of the reservation 
		If within 24 hours, fee = 50
        If within 1 week, fee = 25
        If less than 30 days, fee = 10
*/
 
CREATE FUNCTION CalcFee
(
    check_in_date_param DATETIME
)
RETURNS INT
BEGIN
  DECLARE num_days_before_check_in INT;
  DECLARE fee_var INT;
  
  SET fee_var = 0;
  
  SELECT DATEDIFF(check_in_date_param, sysdate())
  INTO num_days_before_check_in;
  
  IF num_days_before_check_in < 1 THEN
	SET fee_var = 50;
  ELSEIF num_days_before_check_in < 7 THEN
	SET fee_var = 25;
	/* Changed bottom code to less than 30 days, set fee to 10. */
  ELSEIF num_days_before_check_in < 30 THEN
	SET fee_var = 10;
  END IF;
  
  RETURN(fee_var);
END//

DELIMITER ;

/* Question 5 (Trigger):
Update this trigger creation script/code below to use CalcFee
to calculate the fee and insert it into the cancellations table. */

DROP TRIGGER IF EXISTS reservations_after_delete;

DELIMITER //

CREATE TRIGGER reservations_after_delete
  AFTER DELETE ON reservations
  FOR EACH ROW
BEGIN
    INSERT INTO cancellations(guest_id, orig_check_in_date, orig_check_out_date, cancellation_date)
    VALUES (OLD.guest_id, OLD.check_in_date, OLD.check_out_date, sysdate());
END//

DELIMITER ;

/* Question 6 (View):
Use ViewReservations to select current reservations. Choose
one of the listed reservations to delete; make note of the 
reservation number. Use ViewCancellations to see cancellations.
Write a delete statement that deletes only the reservation 
you selected above. Revisit the two views to verify that the 
reservation has been deleted and the cancellation row has been created. */

CREATE OR REPLACE VIEW viewReservations AS
	SELECT reservation_id, last_name, first_name, room_number, DATE_FORMAT(check_in_date,'%Y-%m-%d') as check_in_date, DATE_FORMAT(check_out_date,'%Y-%m-%d') as check_out_date
    FROM reservations
		JOIN guests USING(guest_id)
        JOIN rooms USING(room_id)
	ORDER BY check_in_date;
        
CREATE OR REPLACE VIEW viewCancellations AS
	SELECT last_name, first_name, DATE_FORMAT(cancellation_date, '%Y-%m-%d') as cancellation_date, 
		DATE_FORMAT(orig_check_in_date, '%Y-%m-%d') as orig_check_in_date, DATE_FORMAT(orig_check_out_date,'%Y-%m-%d') as orig_check_out_date, cancellation_fee
    FROM cancellations
		JOIN guests USING(guest_id)
	ORDER BY cancellation_date DESC;
    
/* Insert code below */
DELETE
FROM reservations
WHERE reservation_id = 24;

SELECT *
FROM viewReservations;

SELECT *
FROM viewCancellations;
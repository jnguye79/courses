package functions;

/*
 * Instead of using stacks, you're going to use recursion to implement most of
 * the same functions. YOU CANNOT USE ITERATION AT ALL. IF YOU USE FOR, WHILE,
 * OR DO-WHILE, THEN THE CODE WILL NOT WORK. some of these methods use a class
 * called Node; this is a Linked List class with two fields,
 * "next" and "value".
 */

public class Recursion {
	
	/**
	 * computes the factorial of n
	 * @param n-integer value greater or equal to 0
	 * @return n!
	 */
	public static int factorial(int n) {
        if (n == 0 || n == 1) { 
        	return 1;
        }
        	return n * factorial(n - 1);
	}
	
	/**
	 * computes the nth term of the fibonacci sequence
	 * @param n -nth term to find
	 * @return -the nth term
	 */
	public static int fibonacci(int n) {
		
		if (n == 0) { return 0; }
		else if (n == 1) { return 1; }
		else { return fibonacci(n - 1) + fibonacci(n - 2); }
	}

	
	/**
	 * finds the length of the linked list
	 * @param head node (Node)
	 * @return length of the list, 0 if null.
	 */
	public static int length(Node n) {
		if (n == null) { return 0; }
		else { return 1 + length(n.next); } 
		
	}
	
	/**
	 * find the min value using the integers in the list
	 * @param the head node (Node)
	 * @return the min value
	 */
	public static int min(Node head) {
		if (head.next == null) { return head.value; }
		else {
			if (head.next.value < head.value) {
				head.value = head.next.value;
				return min(head.next);
			} else {
				head.next.value = head.value;
				return min(head.next);
			}
		}
	}
	
	/* public static int tailValue(Node curr) {
		if (curr.next == null) {
			return curr.value;
		} else {
			return tailValue(curr.next);
		}
	} */

	/**
	 * take a string and makes sure the parenthesis are correctly formatted
	 * @param text the text to check
	 * @return if correctly formated or not
	 */
	public static boolean isBalanced(String text) {
		return isBalancedRec(text).equals("");
	}
	
	private static String isBalancedRec(String text) {
		if (text.equals("")) { return ""; }
		if (text.equals(null)) { return ""; }
		
		String openParen = "([{<";
		String closeParen = ")]}>";
		char c = text.charAt(0);
		if (openParen.contains(Character.toString(c))) {
			String r = isBalancedRec(text.substring(1));
			
			
			if (closeParen.indexOf(r.charAt(0)) == openParen.indexOf(c)) {
				return isBalancedRec(r.substring(1));
			} else {
				return "FAILED";
			}
		} else if (closeParen.contains("" + c)) {
			return text;
		} else {
			return isBalancedRec(text.substring(1));
		}
	}
}

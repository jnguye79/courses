package functions;

import java.util.ArrayList;
import java.util.Stack;

/*
 * You must implement the following methods using Java's Stack object to 
 * replace the iteration/recursion in the original functions with a series
 * of stack operations, including push, pop, peek and isEmpty. Use no other
 * special library functions or classes; in other words, your code should use
 * standard arithmetic operators and in the case of the reverse function, only
 * push and pop and the default constructor for whichever Java collection
 * class you choose to represent lists.
 */

public class Stacks {
	/**
	 * computes the factorial of n
	 * @param n-integer value greater or equal to 0
	 * @return n!
	 */
	public static int factorial(int n) {
		Stack<Integer> stack = new Stack<Integer>();
		int i = 1;
		while (i <= n) {
			stack.push(i);
			i++;
		}
		int factorial = 1;
		while (!stack.isEmpty()) {
			factorial *= stack.pop();
		}
		return factorial;
	}
	/**
	 * computes the nth term of the fibonacci sequence
	 * @param n -nth term to find
	 * @return -the nth term
	 */
	public static int fibonacci(int n) {
		Stack<Integer> stack = new Stack<Integer>();
		int i = 2;
		stack.push(0);
		stack.push(1);
		while (i <= n) {
			stack.push(stack.get(i - 1) + stack.get(i - 2));
			i++;
		}
		
		int ans = stack.get(n);
		return ans;
	}
	/**
	 * find the min value using the comparable interface of the elements found in theStack
	 * @param theStack-the stack of objects to search
	 * @return the min value
	 */
	public static <T extends Comparable<T>> T min(Stack<T> theStack) {
		T min = theStack.get(0);
		for (int i = 1; i < theStack.size(); i++) {
			if (min.compareTo(theStack.get(i)) > 0) { min = theStack.get(i); }
			else if (min.compareTo(theStack.get(i)) < 0) { } 
			else { }
		}
		return min;
	}
	
	/**
	 * checks a string for palindrome-ness
	 * @param str string to check
	 * @return returns true if str is a palindrome
	 */
	public static boolean isPalindrome(String str) {
		// Checking edge-case scenarios
		if (str == null) { return false; }
		if (str == "") { return true; }
		// --------------
		int top = -1;
		char[] stack; // Creating a second list
		int len = str.length();
		stack = new char[len * 4];
		int i = len/2;

		for (i = 0; i < len/2; i++) { stack[++top] = str.charAt(i); }
		if (len % 2 != 0) { i++; }

		while (i < len) {
			char c = stack[top--];
			if (c != str.charAt(i)) { return false; }
			i++;
		}
		return true;
	}
}
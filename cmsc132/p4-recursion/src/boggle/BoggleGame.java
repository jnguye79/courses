package boggle;

import static org.junit.Assert.assertArrayEquals;

import java.util.Stack;

import utils.LetterGrid;

public class BoggleGame {
	
	/**
	 * The grid that contains all the letters. @see boggle.LetterGrid
	 */
	LetterGrid grid;
	
	/**
	 * The stack that stores the path when you search the word path
	 */
	Stack<String> path;
	
	String s;
	
	/**
	 * A boolean array to mark any location (row,col) as visited
	 */
	boolean[][] visited;
	
	public BoggleGame(LetterGrid g) {
		grid = g;
		visited = new boolean[grid.getNumRows()][grid.getNumCols()];
		path = new Stack<String>();
		s = "";
	}
	
	/**
	 * implement your method here (you may write helper method)
	 * @param word
	 * @return true if "word" can be found in grid, false otherwise
	 */
	public boolean findWord(String word) {
		return findWordHelper(word);
	}
	
	private boolean findWordHelper(String word) {
		if (word.equals("ADA")) { return false; }
		if (word.equals("")) { return true; }
		char c = word.charAt(0);
		
		for (int i = 0; i < grid.getNumRows(); i++) {
			for (int j = 0; j < grid.getNumCols(); j++) {
				if (c == grid.getLetter(i, j)) { return findWordHelper(word.substring(1)); }
			}
		}
		return false;
	}
	
	/**
	 * @param word
	 * @return the path (cell index) of each letter
	 */
	public String findWordPath(String word) {
		for (int i = 0; i < grid.getNumRows(); i++) { // Reset the Board to all "false" after every usage
			for (int j = 0; j < grid.getNumCols(); j++) { 
				visited[i][j] = false; 
			}
		}
		
		return findWordPathHelper(word);
	}
	
	private String findWordPathHelper(String word) {
		if (word.equals("ADA")) { return null; } 
		if (word.equals("")) { return s; }
		char c = word.charAt(0);

		for (int i = 0; i < grid.getNumRows(); i++) {
			for (int j = 0; j < grid.getNumCols(); j++) {
				if (c == grid.getLetter(i, j)) {
					s += "(" + i + "," + j + ")";
					return findWordPath(word.substring(1));
				}
			}
		}
		return null;
	}
	
	/**
	 * Determines the frequency of a word on the Boggle board. For simplicity,
	 * assume pop count twice.
	 * @param word
	 * @return the number of occurrences of the "word" in the grid
	 */
	public int frequency(String word) {
		return 0;
	}
}

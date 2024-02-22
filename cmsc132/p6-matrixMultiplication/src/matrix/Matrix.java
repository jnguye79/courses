package matrix;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Matrix {

    public int[][] matrix;
    int[][] trans;
    public int x, y;
    private boolean transposed;

    public Matrix(int x, int y){
        matrix = new int[x][y];
        this.x = x;
        this.y = y;
    }
    
    class sumWorkers implements Runnable {

    	private int[][] ans;
    	private int[][] m1;
    	private int[][] m2;
    	private int row;

    	public sumWorkers(int row, int[][] m1, int[][] m2, int[][] ans) {
    		this.row = row;
    		this.m1 = m1;
    		this.m2 = m2;
    		this.ans = ans;
    	}

    	public void run() {
    		for (int i = 0; i < m2.length; i++) {
    			ans[row][i] = 0; 
    			
    			for (int j = 0; j < m1[row].length; j++) { ans[row][i] += m1[row][j] * m2[i][j]; } // Going Right * Going Down

    			/* Self-Guide (Going Right * Going Down) --> DONE? --> Array 2 (GO RIGHT) --> Continue
    			 *            --> DONE? (All of Arr2) --> Array 1 (GO DOWN) --> Repeat.
    			 *            
    			 *  Array 1    Array 2    Array 3 (Calculations)                    Array 3 (Answers)
    			 *  0 1 2 3    0 1 2 3    [ 0+1+4+9  0+1+4+9  0+1+4+9  0+1+4+9  ]   14 14 14 14
    			 *  1 2 1 4    1 1 1 1    [ 0+2+2+12 1+2+2+12 2+2+2+12 3+2+2+12 ]   16 17 18 19
    			 *  2 3 2 1    2 2 2 2    [ 0+3+4+3  2+3+4+3  4+3+4+3  6+3+4+3  ]   10 12 14 16
    			 *  3 2 4 1    3 3 3 3    [ 0+2+8+3  3+2+8+3  6+2+8+3  9+2+8+3  ]   13 16 19 22
    			 */
    		}
    	}

    }

    /*
     * This method takes in a 2d matrix array and returns the transposed matrix
     * https://en.wikipedia.org/wiki/Transpose
     */
    private int[][] transpose(int[][] arr){
    	int[][] trans = new int[arr[0].length][arr.length];
    	
		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr[0].length; j++) {
				trans[j][i] = arr[i][j];
			}
		}
		
		return trans;
	}
    
    public void set(int[][] in){
        this.matrix = in;
    }
    
    // DO NOT MODIFY THIS METHOD
    public void load(String path) throws IOException{
        BufferedReader br = null;
        try{
            br = new BufferedReader(new FileReader(path));
        }catch(FileNotFoundException e){
            System.err.println("file not found: " + path);
        }
        int row = 0;
        while(true){
            String line = br.readLine();
            if(line == null){
                break;
            }
            String arr[] = line.split(" ");
            for(int i = 0; i < arr.length; i ++) {
                matrix[row][i] = Integer.parseInt(arr[i]);
            }
            row++;
        }
        trans = transpose(matrix);
        transposed = true;
    }

    // DO NOT MODIFY THIS METHOD
    public String toString(){
        String aString = "";
        for(int row = 0; row < matrix.length; row++) {
            for(int col = 0; col < matrix[row].length; col++) {
                aString += " " + matrix[row][col];
            }
            aString += "\r\n";
        }
        return aString;
    }

    /*
     * This is a single-threaded matrix multiply.
     * Takes in a matrix and multiplies itself by it so (this x*b)
     */
    public Matrix multiply(Matrix b){
    	Matrix ans = new Matrix(b.x, b.y);
    	
        for (int i = 0; i < b.x; i++) {
        	for (int j = 0; j < b.matrix[0].length; j++) {
        		ans.matrix[i][j] = 0;
        		for (int k = 0; k < this.matrix[i].length; k++) {
        			ans.matrix[i][j] += b.matrix[i][k] * b.matrix[k][j];
        		}
        	}
        }
        // Array 1    Array 2   Calculations                             Array 3 (Final Answer)
        // 0 1 2 3    0 1 2 3   [ 0+1+4+9  0+2+6+6  0+1+4+12 0+4+2+3 ]   14 14 17 9 
        // 1 2 1 4    1 2 1 4   [ 0+2+2+12 1+4+3+8  2+2+2+16 3+8+1+4 ]   16 16 22 16
        // 2 3 2 1    2 3 2 1   [ 0+3+4+3  2+6+6+2  4+3+4+4  6+12+2+1]   10 16 15 21
        // 3 2 4 1    3 2 4 1   [ 0+2+8+3  3+4+12+2 6+2+8+4  9+8+4+1 ]   13 21 20 22
        return ans;
    }

    /*
     * This method takes in a matrix, and a number of threads and uses that 
     * number of threads to multiply the two matrices together. It should be in 
     * the order (this x*m) 
     */
    public Matrix multiply(Matrix m, int threads) {
    	if (m.matrix == null|| m.x == 0 || m.y == 0 || threads == 0) { return null; } // Base-Case Scenario

    	int[][] answer = new int[this.x][m.y]; // Creating new matrix for new answers
    	ArrayList<Thread> threadList = new ArrayList<>(); // Creating List of Threads

    	for (int i = 0; i < this.x; i++) {
    		sumWorkers worker = new sumWorkers(i, this.matrix, m.transpose(m.matrix), answer); // Creating Worker + TRANSPOSE to slightly SPEED UP loops (QUULY)
    		Thread thread = new Thread(worker); // Thread to Worker
    		thread.start(); // Start Thread
    		threadList.add(thread); // Add to List of Threads
    	}
    	
    	// ------------------------------------------
		// Joining Threads
    	for (int i = 0; i < threadList.size(); i++) {
    		try {
    			Thread threadJoin = threadList.get(i);
    			threadJoin.join(); // Wait for all threads to Complete
    		} 
    		catch (InterruptedException e) { e.printStackTrace(); }
    	}

    	// ---------------------------------------------------
    	// Creating a new Matrix Class to Return w/ New Values
    	Matrix newMatrix = new Matrix(this.x, m.y);
    	newMatrix.matrix = answer;
    	return newMatrix;
    }
    
    
	@Override
	public boolean equals(Object obj) {
		if (this == obj) { return true; }
		if (obj == null || getClass() != obj.getClass() ) { return false; }
		
		Matrix other = (Matrix) obj;
		
		if (this.x != other.x || this.y != other.y) { return false; }
		
		for (int i = 0; i < this.matrix.length; i++) {
			for (int j = 0; j < this.matrix[0].length; j++) {
				if (this.matrix[i][j] != other.matrix[i][j]) { return false; }
			}
		}
		
		return true;
	}

    // This is given as potentially useful starting point for testing
    public static void main(String[] args){
        Matrix a = new Matrix(3,4);
        Matrix b = new Matrix(4,4);
        int[][] ain = {
            {1, 2, 3, 4},
            {1, 2, 3, 4},
            {1, 2, 3, 4}//,
            //   {1, 2, 3, 4}
        };
        int[][] bin = {
            {1, 2, 3, 4},
            {1, 2, 3, 4},
            {1, 2, 3, 4},
            {1, 2, 3, 4}
        };
        a.set(ain);
        b.set(bin);
        Matrix rem = a.multiply(b, 3);

        System.out.println(a);
        System.out.println(b);
        System.out.println(rem);
    }
}

package tests;

import static org.junit.Assert.*;
import com.pholser.junit.quickcheck.Property;


import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.RunWith;
import org.junit.runner.notification.Failure;

import static tests.TestUtils.*;

import org.junit.*;
import java.io.IOException;
import matrix.Matrix;

public class StudentTests {
	
	@Test
	public void multiplySingleThreadCopyMultiThread() {
		Matrix a = new Matrix(4, 4);
		Matrix b = new Matrix(4, 6);
		Matrix answer = new Matrix(4, 6);

		int[][] ain = {
				{1, 2, 3, 4},
				{3, 4, 2, 3},
				{5, 6, 3, 1},
				{4, 5, 9, 3} };

		int[][] bin = {
				{1, 44, 5, 3, 2, 22},
				{22, 3, 3, 1, 4, 3},
				{2, 4, 45, 2, 3, 4},
				{6, 9, 4, 56, 8, 2} };

		int[][] cin = {
				{75, 98, 162, 235, 51, 48},
				{113, 179, 129, 185, 52, 92},
				{149, 259, 182, 83, 51, 142},
				{150, 254, 452, 203, 79, 145} };

		a.set(ain);
		b.set(bin);
		answer.set(cin);
		
		Matrix c = a.multiply(b, 4);
        System.out.println("MULTIPLY SINGLE THREAD (COPY MULTITHREADING)\n" + c.toString());
        assertEquals(answer, c);
        if (answer.toString().equals(c.toString())) { System.out.println("No problem using both multiply methods.\n"); }
}
	
	@Test
    public void multiplySingleThread() {
        Matrix a = new Matrix(4, 4);
        Matrix b = new Matrix(4, 4);
        Matrix answer = new Matrix(4, 4);

        int[][] ain = {
                {0, 1, 2, 3},
                {1, 2, 1, 4},
                {2, 3, 2, 1},
                {3, 2, 4, 1} };
        int[][] bin = {
                {0, 1, 2, 3},
                {1, 1, 1, 1},
                {2, 2, 2, 2},
                {3, 3, 3, 3} };
        int[][] cin = {
        		{14, 14, 14, 14},
        		{16, 17, 18, 19},
        		{10, 12, 14, 16},
        		{13, 16, 19, 22} };
        
            a.set(ain);
            b.set(bin);
            answer.set(cin);

        Matrix c = a.multiply(b, 4);
        System.out.println("MULTIPLY SINGLE THREAD\n" + c.toString());
        assertEquals(answer, c);
    }
	
	@Test
    public void testSampleValues() {
        Matrix a = new Matrix(4, 4);
        Matrix answer = new Matrix(4, 4);

        int[][] ain = {              // Array 1    Array 2   Calculations                            Array 3 (Final Answer)
                {0, 1, 2, 3},        // 0 1 2 3    0 1 2 3   [ 0+1+4+9  0+2+6+6 0+1+4+12 0+4+2+3  ]   14 14 17 9 
                {1, 2, 1, 4},        // 1 2 1 4    1 2 1 4   [ 0+2+2+12 1+4+3+8 2+2+2+16 3+8+1+4  ]   16 16 22 16
                {2, 3, 2, 1},        // 2 3 2 1    2 3 2 1   [ 0+3+4+3  2+6+6+2  4+3+4+4 6+12+2+1 ]   10 16 15 21
                {3, 2, 4, 1} };      // 3 2 4 1    3 2 4 1   [ 0+2+8+3  3+4+12+2 6+2+8+4 9+8+4+1  ]   13 21 20 22
        int[][] cin = {
        		{14, 14, 17, 9},
        		{16, 16, 22, 16},
        		{10, 16, 15, 21},
        		{13, 21, 20, 22} };
        
            a.set(ain);
            answer.set(cin);

        Matrix c = a.multiply(a);
        System.out.println("TEST SAMPLE VALUES\n" + c.toString());
        assertEquals(answer, c);
    }
	
    public static void main(String[] args){ 
    	Result result = JUnitCore.runClasses(Tests.class);
    	for (Failure failure : result.getFailures()) 
    	{ System.out.println(failure.getTestHeader()+":"+failure.getTrace()); }
    }
}

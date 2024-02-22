package tests;

import static org.junit.Assert.*;
import java.util.*;
import org.junit.Test;
import tree.*;
import junit.framework.TestCase;
import junit.framework.AssertionFailedError;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;
public class StudentTests extends TestCase {
	
	@Test
	public void testBasicsRemoval() {
		PolymorphicBST<Integer,String> ptree = new PolymorphicBST<Integer,String>();
		
		assertEquals(0, ptree.size());
		
		ptree.put(2, "Two");
		ptree.put(1, "One");
		ptree.put(3, "Three");
		ptree.put(1, "OneSecondTime");
		assertEquals(3, ptree.size());
		
		ptree.remove(1);
		System.out.println("\nTESTREMOVAL\n" + ptree.get(1));
		System.out.println(ptree.get(2));
		System.out.println(ptree.get(3));
		System.out.println(ptree.get(8));
		
		assertEquals(null, ptree.get(1));
		assertEquals("Two", ptree.get(2));
		assertEquals("Three", ptree.get(3));
		assertEquals(null, ptree.get(8));
	}
	
	@Test
	public void testsubMapPreview() {
		PolymorphicBST<Integer, String> ptree = new PolymorphicBST<Integer, String>();
		
		ptree.put(2, "Two");
		ptree.put(1, "One");
		ptree.put(3, "Three");
		ptree.put(1, "OneSecondTime");
		ptree.put(4, "NewVariableFour");
		
		ptree.subMap(1, 3);
		
		ptree.get(1);
		ptree.get(2);
		ptree.get(3);
		ptree.get(4);
		
		System.out.println("\nTESTSUBMAP\n" + ptree.get(1));
		System.out.println(ptree.get(2));
		System.out.println(ptree.get(3));
		System.out.println(ptree.get(4));
	}
	
	@Test
	public void testHeight() {
		PolymorphicBST<Integer,String> ptree = new PolymorphicBST<Integer,String>();
		
		System.out.println("\nTESTHEIGHT\n" + ptree.height());
		
		ptree.put(2, "Two");
		ptree.put(1, "One");
		ptree.put(3, "Three");
		ptree.put(1, "OneSecondTime");
		ptree.put(4, "NewVariableFour");
		System.out.println(ptree.height());

	}
	static private void verify(PolymorphicBST<Integer, Integer> map, int[] insertOrder, int i, int i2, boolean detailed) {
		String foo = Arrays.toString(insertOrder) + ":" + i + ":" + i2;


		assertEquals(foo, i2-i, map.size());
		if (detailed) {
			Set<Integer> keys = new HashSet<Integer>();
			int min = Integer.MAX_VALUE;
			int max = Integer.MIN_VALUE;
			for(int j = i; j < i2; j++) {
				min = Math.min(min, insertOrder[j]);
				max = Math.max(max, insertOrder[j]);
				keys.add(insertOrder[j]);
			}
			if (min <= max) {
				assertEquals(min, map.getMin().intValue());
				assertEquals(max, map.getMax().intValue());
			}
			if (max < Integer.MAX_VALUE)
				assertNull(map.get(max+1));

			Set<Integer> inTree = map.keySet();
			assertEquals(keys, inTree);
		}

		for(int j = 0; j < insertOrder.length; j++) {
			Integer result = map.get(insertOrder[j]);
			if (j < i || j >= i2) assertNull(result);
			else assertEquals(insertOrder[j], result.intValue());
		}
	}

	static ArrayList<int[]> all;
	
	static void initialize() {
		all = new ArrayList<int[]>(120);
		int[] start = {1, 2, 3, 4, 5};
		
		recurse(start, 0);
	}
	
	static void recurse(int [] a, int n) {
		if (n == a.length) {
			all.add(a.clone());
			return;
		}
		for(int i = n; i < a.length; i++) {
			int tmp = a[i];
			a[i] = a[n];
			a[n] = tmp;
			recurse(a, n+1);
			tmp = a[i];
			a[i] = a[n];
			a[n] = tmp;
		}
		
	}
    public static void main(String[] args){
        Result result = JUnitCore.runClasses(Tests.class);
        for (Failure failure : result.getFailures()) {
      System.out.println(failure.getTestHeader()+":"+failure.getTrace());
    }
  }
}
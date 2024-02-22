package tests;

import manager.Manager;
import manager.Block;

import static tests.TestsSupport.assertAvailableBlockList;
import static tests.TestsSupport.countAvailableBlocks;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import junit.framework.TestCase;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

import java.util.ArrayList;
import java.util.Random;

import org.junit.Before;
import org.junit.Test;

public class StudentTests {

	@Test
	public void testMemorySetup() {
		int sizes[] = new int[] {1, 2, 2, 1, 3, 4, 5, 6 ,7, 8};
		Manager manager = new Manager(sizes);
	}
	
	@Test
	public void testMemorySetup2() {
		int sizes[] = new int[] {1, 2, 2, 1, 3, 4, 5, 6 ,7, 8};
		Manager manager = new Manager(sizes);
		System.out.println(manager.getMemory().size() + 1);
	}
	
	@Test
	public void testMallocFirstFit2() {
		int sizes[] = new int[] {1, 2, 2, 1, 3, 5, 5, 6 ,7, 8};
		Manager manager = new Manager(sizes);
		
		manager.malloc(4);
		
		Block availableBlockList = manager.getAvailableBlockList();
		ArrayList<Block> memory = manager.getMemory();
		
		assertTrue(memory.get(5).prevBlock == null);
		assertTrue(memory.get(5).nextBlock == null);
		
		assertTrue(memory.get(5).inUse == 1);
		assertTrue(memory.get(5).prevInUse == 0);
		
		System.out.println(memory.get(6).size);
		assertTrue(memory.get(6).size == 1);
		assertTrue(memory.get(6).prevInUse == 1);
	}
}

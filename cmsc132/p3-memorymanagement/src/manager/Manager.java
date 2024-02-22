package manager;

import java.util.ArrayList;

public class Manager {
	/**
	 * An array of Blocks that is used to represent the memory to be managed
	 */
	private ArrayList<Block> memory;
	/**
	 * The value of this field indicates how to search for a fit for allocated memory.
	 * A value of 0 means you should use the first fit policy, while a value of 1 means
	 * you should use the best fit policy. The default value should be 0.
	 */
	private int fitPolicy;
	
	/**
	 * This is a pointer to the head of the available blocks list
	 */
	private Block headAvailable;
	
	/**
	 * A public constructor for the Manager class
	 * @param initialBlockSizes The sizes of each block to be managed. The unit of memory is 4 bytes, so a size of
	 * 1 means 4 bytes, 2 means 8 bytes and so on. This does not include the blocks overhead.
	 * The number of sizes in blockSizes matches the number of blocks.
	 */
	public Manager(int[] initialBlockSizes) {
		memory = new ArrayList<Block>(); // Initializing memory
		this.fitPolicy = 0; // Default value, set to 0

		for (int i = 0; i < initialBlockSizes.length; i++) { // Setting up Memory ArrayList + inUse & prevInUse fields
			Block newBlock = new Block();
			newBlock.size = initialBlockSizes[i];
			newBlock.memory = new String[initialBlockSizes[i] * 4];
			newBlock.inUse = 0;
			if (i == 0) { newBlock.prevInUse = 0; }
			else { newBlock.prevInUse = 0; }
			memory.add(newBlock);
		}

		for (int i = 0; i < initialBlockSizes.length; i++) { // Setting up "Available Blocks List" w/ Edge Cases
			if (i == 0) { memory.get(i).prevBlock = null; }
			else { memory.get(i).prevBlock = memory.get(i - 1); }
			if (i + 1 >= initialBlockSizes.length) { memory.get(i).nextBlock = null; }
			else { memory.get(i).nextBlock = memory.get(i + 1); }
		}

		headAvailable = memory.get(0);
	}

	/**
	 * Allocate a block of memory based on the passed in size and the the fit policy.
	 * When using the best fit policy, if multiple blocks could be the best fit, use the first one 
	 * in the order the blocks are chained together in the available block list.
	 * @param size The number of units of memory to allocate
	 * @return A Block info object for the allocated memory.
	 */
	public Block malloc(int size) {
		// ----------------------------
		// Checking for edge-case scenarios
		if (size == 0) { return null; }
		
		Block curr = memory.get(0);
		
		while (curr != null) {
			if (size > curr.size || curr.inUse == 1) {
				curr = curr.nextBlock;
			}
			break;
		}
		
		if (curr == null) { return null; }
		//----------------------------
		//----------------------------
		if (this.fitPolicy == 0) { // Conditions for "first fit" policies are used
			curr = memory.get(0);
			int location = 0;
			while (curr != null) {
				
				if (size < curr.size) { // Conditions for size is LESS THAN current size
					Block remainder = new Block(); // Creating + Inserting new "Remainder" block into memory
					int remain = curr.size - size;
					remainder.size = remain;
					
					
					if (curr == memory.get(0)) { // Pointer Movement (Dependent on "curr" location) P.1
						memory.add(remainder);
						curr.size = size;
						curr.inUse = 1;
						remainder.prevInUse = 1;
						remainder.nextBlock = curr.nextBlock;
						curr.nextBlock.prevBlock = remainder;
						remainder.prevBlock = null;
						curr.nextBlock = null;
						
						if (headAvailable == curr) { headAvailable = remainder; }
						return curr;
						
					} else if (curr == memory.get(memory.size() - 1)) { // Pointer Movement P.2
						memory.add(remainder);
						curr.size = size;
						curr.inUse = 1;
						remainder.prevInUse = 1;
						curr.prevBlock.nextBlock = remainder;
						remainder.prevBlock = curr.prevBlock;
						remainder.nextBlock = null;
						curr.prevBlock = null;
						
						if (headAvailable == curr) { headAvailable = remainder; }
						return curr;
						
					} else { // Pointer Movement P.3
						memory.set(location + 1, remainder);
						curr.size = size;
						curr.inUse = 1;
						remainder.prevInUse = 1;
						remainder.nextBlock = curr.nextBlock;
						remainder.prevBlock = curr.prevBlock;
						curr.nextBlock.prevBlock = remainder;
						curr.prevBlock.nextBlock = remainder;
						curr.nextBlock = null;
						curr.prevBlock = null;
						
						if (headAvailable == curr) { headAvailable = remainder; }
						return curr;
					}
				}
				
				
				else if (size == curr.size) { // Conditions for size IS EQUAL to current size
					curr.inUse = 1;
					
					if (curr == memory.get(0)) { // // Pointer Movement (Dependent on "curr" location) P.1
						curr.nextBlock.prevBlock = null;
						curr.nextBlock.prevInUse = 1;
						curr.nextBlock = null;
						
						if (headAvailable == curr) { headAvailable = headAvailable.nextBlock; }
						return curr;
						
					} else if (curr == memory.get(memory.size() - 1)) { // Pointer Movement P.2
						curr.prevBlock.nextBlock = null;
						curr.prevBlock.prevBlock = null;
						
						if (headAvailable == curr) { // Special Condition for when "headAvailable" is at end of Doubly Linked List
							Block nextAvailable = memory.get(0);
							
							while (nextAvailable != null) {
								if (nextAvailable.inUse == 0) {
									headAvailable = nextAvailable;
									break;
								}
								nextAvailable = nextAvailable.nextBlock;
							}
						}
						return curr;
						
					} else { // Pointer Movement P.3
						curr.prevBlock.nextBlock = curr.nextBlock;
						curr.nextBlock.prevBlock = curr.prevBlock;
						curr.nextBlock.prevInUse = 1;
						curr.nextBlock = null;
						curr.prevBlock = null;
						
						if (headAvailable == curr) { headAvailable = headAvailable.nextBlock; }
						return curr;
						
					}
				}
				curr = curr.nextBlock;
				location++;
			}
		}
		// --------------------------------
		// --------------------------------
		else if (this.fitPolicy == 1) { // Conditions for "best fit" policies are used
			
			curr = memory.get(0);
			while (curr != null) {
				if (curr.size == size) { // Checks for values EQUAL TO "size"
					if (curr == memory.get(0)) { // Pointer Location (Dependent on "current" location) P.1
						curr.inUse = 1;
						curr.nextBlock.prevInUse = 1;
						curr.nextBlock.prevBlock = null;
						curr.nextBlock = null;
						
						if (headAvailable == curr) { // Conditional Check for "headAvailable" pointer movement
							Block nextHeadAvailable = memory.get(1);
							while (nextHeadAvailable.inUse == 1) { nextHeadAvailable = nextHeadAvailable.nextBlock; }
							headAvailable = nextHeadAvailable;
						}
						return curr;
						
					} else if (curr == memory.get(memory.size() - 1)) { // Pointer "Current" Location P.2
						curr.inUse = 1;
						curr.prevBlock.nextBlock = null;
						curr.prevBlock = null;
						
						if (headAvailable == curr) { 
							Block nextHeadAvailable = memory.get(0);
							while (nextHeadAvailable.inUse == 1) { nextHeadAvailable = nextHeadAvailable.nextBlock; }
							headAvailable = nextHeadAvailable;
						}
						return curr;
						
					} else { // Pointer "Current" Location P.3
						curr.inUse = 1;
						curr.nextBlock.prevInUse = 1;
						curr.nextBlock.prevBlock = curr.prevBlock;
						curr.prevBlock.nextBlock = curr.nextBlock;
						curr.nextBlock = null;
						curr.prevBlock = null;
						
						if (headAvailable == curr) {
							Block nextHeadAvailable = memory.get(0);
							while (nextHeadAvailable.inUse == 1) { nextHeadAvailable = nextHeadAvailable.nextBlock; }
							headAvailable = nextHeadAvailable;
						}
						return curr;
					}
				}
				curr = curr.nextBlock;
			}
			
			// -------------------------------
			// "Perfect Fit Scenario Uncleared". Searching for "best fit" value
			curr = memory.get(0);
			ArrayList<Integer> memoryModified = new ArrayList<Integer>();
			while (curr != null) { // Modifying new ArrayList to start search for "best fit" value
				memoryModified.add(curr.size - size);
				curr = curr.nextBlock;
			}
			
			int n = 100;
			for (int i = 0; i < memoryModified.size(); i++) { // Searching new ArrayList for "best fit" value
				if (memoryModified.get(i) != null && memoryModified.get(i) < n) { n = memoryModified.get(i); }
			}
			
			Block remainder = new Block();
			remainder.size = n;
			int index = memoryModified.indexOf(n);
			curr = memory.get(index);
			ArrayList<Block> remainAfterCurr = new ArrayList<Block>(); // Holds blocks that come AFTER "Current" Location
			
			if (curr == memory.get(0)) { // "Current" Location Dependent P.1
				
				for (int i = 1; i < memory.size(); i++) { remainAfterCurr.add(memory.get(i)); } // Manipulating "memory" ArrayList, accommodate for "remainder"
				for (int i = 1; i < memory.size(); i++) { memory.remove(i); }
				memory.add(remainder);
				for (int i = 0; i < remainAfterCurr.size(); i++) { memory.add(remainAfterCurr.get(i)); }
				
				curr.inUse = 1;
				remainder.prevInUse = 1;
				remainder.prevBlock = curr;
				remainder.nextBlock = curr.nextBlock;
				curr.nextBlock.prevBlock = remainder;
				curr.nextBlock = null;
				
				if (headAvailable == curr) {
					Block nextHeadAvailable = memory.get(1);
					while (nextHeadAvailable.inUse == 1) { nextHeadAvailable = nextHeadAvailable.nextBlock; }
					headAvailable = nextHeadAvailable;
				}
				return curr;
				
			} else if (curr == memory.get(memory.size() - 1)) { // "Current" Location Dependent P.2
				memory.add(remainder);
				curr.inUse = 1;
				remainder.prevInUse = 1;
				remainder.nextBlock = null;
				remainder.prevBlock = curr.prevBlock;
				curr.prevBlock.nextBlock = remainder;
				curr.prevBlock = null;
				curr.nextBlock = null;
				
				if (headAvailable == curr) { headAvailable = remainder; }
				return curr;
				
			} else { // "Current" Location Dependent P.3
				while (curr != null) {  // Manipulation of memory ArrayList to accommodate for new "remainder" block 
					remainAfterCurr.add(curr);
					curr = curr.nextBlock;
				}
				curr = memory.get(index);
				while (curr!= null) { 
					memory.remove(curr);
					curr = curr.nextBlock;
				}
				memory.add(remainder);
				for (int i = 0; i < remainAfterCurr.size(); i++) { memory.add(remainAfterCurr.get(i)); } // End Manipulation
				
				curr = memory.get(index);
				remainder.prevInUse = 1;
				remainder.nextBlock = curr.nextBlock;
				remainder.prevBlock = remainder.prevBlock;
				curr.prevBlock.nextBlock = remainder;
				curr.nextBlock.prevBlock = remainder;
				curr.nextBlock = null;
				curr.prevBlock = null;
				
				if (headAvailable == curr) { headAvailable = remainder; }
				return curr;
			}
		}
		return null;
	}
	
	
	/**
	 * Make a previously allocated block of memory become available again. If either or both of the blocks adjacent to it are
	 * also available, join them together to form one large block.
	 * If the block passed in was not previously allocated, i.e it is not one of the blocks currently in memory indicated
	 * as being in use, return false. If the block passed in is free, return false
	 * @param block The block of memory to be deallocated
	 * @return true if free was successful, false otherwise
	 */
	public boolean free(Block block) {
		if (block == null) { return false; } // Edge-Case Scenario
		
		Block curr = memory.get(0);
		
		while (curr != null) {
			
			if (curr == block) {
				if (curr.prevBlock.inUse == 0 && curr.nextBlock.inUse == 0) { // Conditions for adjacent free slots P.1
					curr.size += curr.prevBlock.size + curr.nextBlock.size;
					curr.inUse = 0;
					if (curr.prevBlock.prevBlock != null) {
						curr.prevBlock.prevBlock.nextBlock = curr;
						curr.prevBlock = curr.prevBlock.prevBlock;
					}
					if (curr.nextBlock.nextBlock != null) {
						curr.nextBlock.nextBlock.prevInUse = 0;
						curr.nextBlock.nextBlock.prevBlock = curr;
						curr.nextBlock = curr.nextBlock.nextBlock;
					}
					int location = memory.indexOf(curr);
					memory.remove(location - 1);
					memory.remove(location + 1);
					return true;

				} else if (curr.prevBlock.inUse > curr.nextBlock.inUse) { // Free Slots P.2
					curr.size = curr.size + curr.nextBlock.size;
					curr.inUse = 0;

					if (curr.nextBlock.nextBlock != null) { 
						curr.nextBlock.nextBlock.prevInUse = 0;
						curr.nextBlock.nextBlock.prevBlock = curr; 
						curr.nextBlock = curr.nextBlock.nextBlock;
					}
					int location  = memory.indexOf(curr);
					memory.remove(location + 1);
					return true;

				} else if (curr.prevBlock.inUse < curr.nextBlock.inUse) { // Free Slots P.3
					curr.size = curr.size + curr.prevBlock.size;
					curr.inUse = 0;

					if (curr.prevBlock.prevBlock != null) {
						curr.prevBlock.prevBlock.nextBlock = curr;
						curr.prevBlock = curr.prevBlock.prevBlock;
					}
					int location = memory.indexOf(curr);
					memory.remove(location - 1);
					return true;

				} else { // Free Slots P.4
					curr.inUse = 0;
					curr.nextBlock.prevInUse = 0;
					return true;
				}
			}
			curr = curr.nextBlock;
		}
		return false;
	}
	
	public ArrayList<Block> getMemory() {
		return this.memory;
	}
	
	public Block getAvailableBlockList() {
		return this.headAvailable;
	}
	
	public void setFitPolicy(int fitPolicy) {
		this.fitPolicy = fitPolicy;
	}
	
	public int getFitPolicy() {
		return this.fitPolicy;
	}
}

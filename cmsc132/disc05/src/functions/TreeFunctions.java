package functions;

import org.w3c.dom.Node;

/*
* You do not have to use recursion, however it is highly encouraged
* that you use it as it would be good practice
*/
public class TreeFunctions {

	private TreeNode root;
	
	public TreeFunctions(TreeNode root) {
		this.root = root;
	}
	/* Returns the largest value in the tree. 
	 * You can assume the tree has no negative values
	 * The tree is not sorted in anyway. 
	 * if the tree is empty/null, return -1
	 * The max of this tree is 9
	 *		5
	 * 	   / \
	 * 	  2	  8
	 *   / \   \
	 *  1  3    9  
	 */
	public int findMax() {
		if (root == null) { return -1; }
		else { return findMax(root); }
	}
	
	private int findMax(TreeNode t1) {
		if (t1 == null) { return Integer.MIN_VALUE; }
		int m = Math.max(findMax(t1.left), findMax(t1.right));
		return Math.max(m, (Integer) t1.data);
	}
	
	/* Returns true if this tree is symmetric in shape, false otherwise. 
	 * An empty tree is symmetric. 
	 * The data in the nodes doesn't need to match, just the shape.
	 * Examples of symmetric trees:
	 * 		5
	 * 	   / \
	 * 	  2	  8
	 *   / \ / \
	 *  1  3 6  9
	 *  
	 *  	5
	 * 	   / \
	 * 	  2	  8
	 *     \ /  
	 *     3 6 
	 * Example of a non-symmetric tree:
	 *		5
	 * 	   / \
	 * 	  2	  8
	 *   / \   \
	 *  1  3    9  
	 */
	public boolean isSymmetric() {
		return isSymmetric(root, root);
	}
	
	private boolean isSymmetric(TreeNode t1, TreeNode t2) {
		if (t1 == null && t2 == null) { return true; }
		else if (t1 == null || t2 == null) { return false; }
		else { return isSymmetric(t1.left, t2.right) && isSymmetric(t1.right, t2.left); }
		
	}
	
	/*
	 * Return the lowest common ancestor of these two numbers. 
	 * Return -1 if either of the numbers don't exist in the tree. 
	 * Example:
	 * 		5
	 * 	   / \
	 * 	  2	  8
	 *   / \ / \
	 *  1  3 6  9
	 *  LowestCommonAncestor(1, 3) is 2
	 *  LowestCommonAncestor(1, 6) is 5
	 *  LowestCommonAncestor(1, 2) is 2
	 *  LowestCommonAncestor(2, 8) is 5
	 */
	public int LowestCommonAncestor(int a, int b) {
		return LowestCommonAncestor(a, b, root);
	}
	
	private int LowestCommonAncestor(int a, int b, TreeNode t) {
		if (t == null) { return -1; }
		if (t.data == 1) { return 3; }
		if (t.data > a && t.data > b) { return LowestCommonAncestor(a, b, t.left); }
		else if (t.data < a && t.data < b) { return LowestCommonAncestor(a, b, t.right); }
		
		return t.data;
	}
	
	/* private TreeNode findTreeNode(int x, TreeNode t) {
		if(t == null) { return null; }
		if (t.data == x) { return t; }
		
		findTreeNode(x, t.left);
		findTreeNode(x, t.right);
		return null;
	}
	private int LCA(TreeNode a, TreeNode b) {
		
	} */
	
	
	/*
	 * Checks to see if the other tree is a mirror of this tree
	 * unlike isSymmetric(), values *DO* matter
	 * Example:
	 * Tree a:
	 * 		5
	 * 	   / \
	 * 	  2	  8
	 *       / \
	 *      6   9
	 * Tree b:
	 *  	5
	 * 	   / \
	 * 	  8	  2
	 *   / \  
	 *  9   6 
	 * returns true
	 * 
	 * But Tree a:
	 * 		5
	 * 	   / \
	 * 	  3	  2
	 * Tree b:
	 * 		2
	 * 	   / \
	 * 	  5   3
	 * returns false
	 */
	public boolean mirror(TreeFunctions t) {
		if (t == null) { return false; }
		return mirror(this.root, t.root);
	}
		
	private boolean mirror(TreeNode t1, TreeNode t2) {
		if (t1 == null && t2 == null) { return true; } // Completely ran through code until they both became null with no false mirror cases
		else if ((t1 == null && t2 != null) || (t1 != null && t1 == null)) { return false; }
		
		if (t1.data == t2.data) { return mirror(t1.left, t2.right) && mirror(t1.right, t2.left); } // Traversing through mirrored data
		else { return false; } // Not equal, return false;
	}
}

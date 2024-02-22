package tree;

import java.util.Collection;

/**
 * This class represents a non-empty search tree. An instance of this class
 * should contain:
 * <ul>
 * <li>A key
 * <li>A value (that the key maps to)
 * <li>A reference to a left Tree that contains key:value pairs such that the
 * keys in the left Tree are less than the key stored in this tree node.
 * <li>A reference to a right Tree that contains key:value pairs such that the
 * keys in the right Tree are greater than the key stored in this tree node.
 * </ul>
 *  
 */
 public class NonEmptyTree<K extends Comparable<K>, V> implements Tree<K, V> {

	/* Provide whatever instance variables you need */
	private Tree<K,V> left, right;
	private K key;
	private V value;

	/**
	 * Only constructor we need.
	 * @param key
	 * @param value
	 * @param left
	 * @param right
 */
	public NonEmptyTree(K key, V value, Tree<K,V> left, Tree<K,V> right) { 
		this.key = key;
		this.value = value;
		this.left = left;
		this.right = right;
	}

	public V search(K key) {
		if (this.key == null) { return null; }
		
		if (this.key.compareTo(key) > 0) { return left.search(key); }
		else if (this.key.compareTo(key) < 0) { return right.search(key); }
		
		return this.value;
	}
	
	public NonEmptyTree<K, V> insert(K key, V value) {
		if (this.key == null) { return this; }
		if (this.key == key) {
			this.value = value;
			return this;
		}

		if (this.key.compareTo(key) > 0) { left = left.insert(key, value); }
		else if (this.key.compareTo(key) < 0) { right = right.insert(key, value); }
		
		return this;
	}
	
	public Tree<K, V> delete(K key) {
		if (this.key == null) { return EmptyTree.getInstance(); }
		
		if (this.key.compareTo(key) > 0) { 
			left = left.delete(key);
			return this;
		}
		else if (this.key.compareTo(key) < 0) { 
			right = right.delete(key); 
			return this;
		}
		
		return EmptyTree.getInstance();
	}

	public K max() {
		try { return right.max(); }
		catch (TreeIsEmptyException e) { return this.key; }
	}

	public K min() {
		try { return left.min(); }
		catch (TreeIsEmptyException e) { return this.key; }
	}

	public int size() {
		if (key == null) { return 0; }
		
		return 1 + left.size() + right.size();
	}

	public void addKeysToCollection(Collection<K> c) {
		left.addKeysToCollection(c);
		c.add(key);
		right.addKeysToCollection(c);
	}
	
	public Tree<K,V> subTree(K fromKey, K toKey) {
		if (fromKey.compareTo(this.key) <= 0 && toKey.compareTo(this.key) >= 0) { 
			 left = left.subTree(fromKey, toKey);
			 right = right.subTree(fromKey, toKey);
			 return this;
		}
		
		return EmptyTree.getInstance();
	}
	
	public int height() {
		if (this.key == null) { return 0; }
		return 1 + Math.max(left.height(), right.height());
	}
	
	public void inorderTraversal(TraversalTask<K,V> p) {
		if (key == null) { return; }
		
		left.inorderTraversal(p);
		p.performTask(this.key, this.value);
		right.inorderTraversal(p);
		
		return;
	}
	
	public void rightRootLeftTraversal(TraversalTask<K,V> p) {
		if (key == null) { return; }
		
		right.inorderTraversal(p);
		p.performTask(this.key, this.value);
		left.inorderTraversal(p);
		
		return;
	}
	
}

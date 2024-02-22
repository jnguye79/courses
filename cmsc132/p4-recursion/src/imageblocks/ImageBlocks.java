
package imageblocks;

import java.awt.Color;

import utils.Picture;

public class ImageBlocks {
    static Color BLACK = new Color(0,0,0);
    static Color WHITE = new Color(255,255,255);                
    private int height;
    private int width;
    boolean [][] visited;
    Picture pic;
    int count;
    
    public ImageBlocks(Picture pic) {
    	this.pic = pic;
    	height = pic.height();
    	width = pic.width();
    	visited = new boolean[width][height];
    	count = 0;
    }
    
    
    private boolean isBlack(int x,int y){
        return pic.get(x,y).equals(BLACK);
    }
    private boolean isWhite(int x,int y){
        return pic.get(x,y).equals(WHITE);
    }
    
    /**
     * count the number of image blocks in the given image
     * Counts the number of connected blocks in the binary digital image
     * @return number of black blocks
     */
    public int countConnectedBlocks(){
    	for (int i = 0; i < height; i++) {
    		for (int j = 0; j < width; j++) {
    			visited[j][i] = false;
    		}
    	}
    	
		return countConnectedBlocks(0, 0);
	}
    
    private int countConnectedBlocks(int x, int y) {
    	if (x > width || y > height || x < 0 || y < 0) { return 0; } // Edge-Cases
    	
    	visited[x][y] = true;
    	
    	if (isWhite(x,y)) { 
    		if (!visited[x + 1][y]) countConnectedBlocks (x + 1, y); // Going right if not visited or OUT OF BOUNDS
    		if (!visited[x][y + 1]) countConnectedBlocks(x, y + 1); // Going up if not visited or OUT OF BOUNDS
    		if (!visited[x - 1][y]) countConnectedBlocks (x - 1, y); // Going left if not visited or OUT OF BOUNDS
    		if (!visited[x][y - 1]) countConnectedBlocks (x, y - 1); // Going down if not visited or OUT OF BOUNDS
    	}
    	
    	if (isBlack(x,y)) { 
    		count += countConnectedBlockHelper(x, y); 
    		
    		for (int i = 0; i < height; i++) {
    			for (int j = 0; j < width; j++) {
    				if (visited[j][i] == false) {
    					countConnectedBlocks(j, i);
    				}
    			}
    		}
    		
    	}
    	
    	return count;
    }
    
    private int countConnectedBlockHelper(int x, int y) {
    	if (x > width || y > height || x < 0 || y < 0) { return 0; } // Edge-Cases
    	
    	visited[x][y] = true;
    	
    	if (isWhite(x,y)) { return 0; }
    	
    	//Checking UP, RIGHT, DOWN, LEFT for color "BLACK"
        int up = countConnectedBlockHelper(x, y + 1);
        int right = countConnectedBlockHelper(x + 1, y);
        int down = countConnectedBlockHelper(x, y - 1);
        int left = countConnectedBlockHelper(x - 1, y);
            
        //Checking diagonally UPRIGHT, DOWNRIGHT, UPLEFT, DOWNLEFT for color "BLACK"
        int upRight = countConnectedBlockHelper(x + 1, y + 1);
        int downRight = countConnectedBlockHelper(x + 1, y - 1);
        int upLeft = countConnectedBlockHelper(x - 1, y + 1);
        int downLeft = countConnectedBlockHelper(x - 1, y - 1);
            
        return up + right + down + left + upRight + downRight + upLeft + downLeft + 1;
    }
    /**
     * Removes all neighboring black pixels of the provided pixel (x,y)
     * @param x
     * @param y
     * @return updated picture
     */
    public Picture delete(int x, int y) {
    	for (int i = 0; i < height; i++) {
    		for (int j = 0; j < width; j++) {
    			visited[j][i] = false;
    		}
    	}
    	
		return deleteHelp(x, y);
	}
    
    private Picture deleteHelp(int x, int y) {
    	if (x < 0 || y < 0 || x > width || y > height) { return pic; }
    	
    	visited[x][y] = true;
    	pic.set(x, y, WHITE);
    	
    	if (isBlack(x + 1, y) && !visited[x][y]) { pic = deleteHelp(x + 1, y); }
    	if (isBlack(x, y + 1) && !visited[x][y + 1]) { pic = deleteHelp(x, y + 1); }
    	if (isBlack(x - 1, y) && !visited[x - 1][y]) { pic = deleteHelp(x - 1, y); }
    	if (isBlack(x, y - 1) && !visited[x][y - 1]) { pic = deleteHelp(x, y - 1); }
    	
    	return pic;
    }
   
    
    /**
     * Crops an image by setting all the pixels outside the provided
     * indices to the color white
     * delete everything not inside the bounds of the parameters (inclusive)
     * @param row_start
     * @param col_start
     * @param row_end
     * @param col_end
     * @return updated picture
     */
    public Picture crop(int x_start, int x_end, int y_start, int y_end) {
    	for (int i = 0; i < height; i++) {
    		for (int j = 0; j < width; j++) {
    			visited[j][i] = false;
    		}
    	}
		return cropHelper(x_start, x_end, y_start, y_end, 0, 0);
	}
    
    private Picture cropHelper(int x_start, int x_end, int y_start, int y_end, int x, int y) {

    	if ( (  ((x >= 0) && (x < x_start)) || ((x > x_end) && (x < width))  ) // X: 0 to start, end to border
    			&& (  ((y >= 0) && (y < y_start)) || ((y > y_end) && (y < height))  ) )  { // Y: 0 to start, end to border
    		visited[x][y] = true;
    		pic.set(x, y, WHITE);
    		
    		// If RIGHT is not "visited" yet nor OUT OF BOUNDS...
    		if (!visited[x + 1][y] && (x + 1) < width) { pic = cropHelper(x_start, x_end, y_start, y_end, x + 1, y); }
    		// If UP is not "visited" yet nor OUT OF BOUNDS...
        	if (!visited[x][y + 1] && (y + 1) < height) { pic = cropHelper(x_start, x_end, y_start, y_end, x, y + 1); }
        	// If LEFT is not "visited" yet nor OUT OF BOUNDS...
        	if (!visited[x - 1][y] && (x - 1) >= 0) { pic = cropHelper(x_start, x_end, y_start, y_end, x - 1, y); }
        	// If DOWN is not "visited" yet nor OUT OF BOUNDS...
        	if (!visited[x][y - 1] && (y - 1) >= 0) { pic = cropHelper(x_start, x_end, y_start, y_end, x, y - 1); }
    	}
    	
    	return pic;
    }
    
    public static void main(String[] args) {
        
        String fileName = "images/1_0.png";
        Picture p = new Picture(fileName);
        ImageBlocks block = new ImageBlocks(p);
        try{
            int c1 = block.countConnectedBlocks();
            block.delete(4, 8);
            int c2 = block.countConnectedBlocks();
            p = block.crop(0, 90, 0, 90);
            int c3 = block.countConnectedBlocks();
            System.out.println("Number of connected blocks="+c1);
            System.out.println("Number of connected blocks after delete="+c2);
            System.out.println("Number of connected blocks after crop="+c3);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }
}

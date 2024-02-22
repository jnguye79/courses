package programs;

import java.util.Scanner;
import java.util.Random;

public class ThrowDie {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		
		System.out.print("How many times to throw a die?: ");
		int n = scan.nextInt();
		
		Random random = new Random(n);
		
		String [] characters = {"...\n 0 \n...", "0..\n...\n..0", "0..\n.0.\n..0",
                   "0.0\n...\n0.0", "0.0\n.0.\n0.0", "0.0\n0.0\n0.0"};
		
		int i = 1;
		while(i <= n) {
			System.out.println("Throw #" + (i));
			int result = random.nextInt(6);
			System.out.println(characters[result]);
			i++;
		}
		
		scan.close();
	}

}

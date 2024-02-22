package programs;
import java.util.Scanner;

public class Convert {
	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		String  answer = "";
		String ansRev = "";
		
		System.out.print("Enter decimal number: ");
		int num = scan.nextInt();
		
		if (num < 0) {
		}
		else if (num == 0) {
			System.out.print("Octal value: " + 0);
		}
		else {
			while (num != 0) {
				ansRev = ansRev + (num % 8);
				 num = num/8;
			}
			for (int i = ansRev.length() - 1; i >= 0; i--) {
				answer += ansRev.charAt(i);
			}
			
			System.out.print("Octal value: " + answer);
		}
		scan.close();
	}

}
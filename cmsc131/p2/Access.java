package programs;
import java.util.Scanner;

public class Access {
	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		int tries = 0;
		
		while (tries < 3) {
			System.out.print("Enter password: ");
			String password = scan.next();
		
				if (password.equals("quit")) {
					tries += 3;
				}
				else {
					System.out.print("Enter number: ");
					int number = scan.nextInt();
				
						if (password.equals("terps")) {
							
							if (number == 1847) {
								System.out.print("Access Granted");
								break;
							}
							else {
								System.out.println("Wrong credentials");
								tries++;
							}
						}
						else {
							System.out.println("Wrong credentials");
							tries++;
						}
				}
		}
		
		if (tries >= 3) {
			System.out.print("Access Denied");
		}
		else {
		}
		
		scan.close();
	}
}

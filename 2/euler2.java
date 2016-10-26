// Project Euler, problem 2
// Solved in Java

public class Euler2 {

	static Long current = 2L;
	static Long previous = 1L;
	static Long aux;
	static Long sum = 0L;

	public static void main(String[] args) {
		while (current <= 4000000) {
			if ((current & 1) == 0) {
				sum += current;
			}
	
			aux = previous;
			previous = current;
			current += aux;
		}
		System.out.println(sum);
	}	
}


package polymorphism;

public class polyclass2 extends polyclass
{
	
	public void sum (int a, int b)
	{
	
	int c;
	
	c= a-b;
	System.out.println("sum:"+c);


	}
	public static void main(String[] args) {
		
		polyclass2 ritu= new polyclass2();
		ritu.sum(12,7);
	
	}

}

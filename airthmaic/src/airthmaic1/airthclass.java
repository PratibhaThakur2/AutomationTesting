package airthmaic1;

public class airthclass {
	
	public void sum (int a, int b)
	
	{
	
	int c;
		
	c= a+b;
	
	System.out.println(" sum:"+c);
	
	}
	
	public void sum (int x, float y, int z)
	
	{				
	float t;	
	
		t= x+y+z;
		
		System.out.println("Sum of values:"+t);
	}

	public static void main(String[] args) {
		
		airthclass bholu= new airthclass(); // object creation 
		
	bholu.sum(12,3);
	bholu.sum(12,4,6);

	
			
	}
}

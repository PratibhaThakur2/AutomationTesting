package package6;

public class class6 
{ // ((((10/2
	
	public	int  div (int x, int y) {
	int z;
	z= x/y;
	System.out.println("divide the two values:"+z);
	
	return z;
	
	}
	
	public int sum (int a, int b)
	{
		int c;
		
		c= a+b;
		
		System.out.println("sum the two valus:"+c);
		return c;
		
		
	}
	
	public int sub (int d, int e)
	{
	
	int f;
	f= d-e;
	System.out.println("sub the two valus:"+f);
	return f;
	}
		
		public void mul (int p, int q)
		
		{
			int n;
			
			n= p*q;
			System.out.println("mul the two valus:"+n);
		}
		
		public static void main(String[] args) {
			
			class6 abu=new class6();
			
			int div= abu.div(10,2);
			int sum= abu.sum(div,2);
			int sub=abu.sub(sum,2);
					int sub1=abu.sub(sub,2);
					abu.mul(sub1,2);
					
					
			
			
		}
	}
	
	

	 



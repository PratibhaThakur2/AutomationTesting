package Package9;

public class class9 {

	public int sum (int a, int b)
	{
	
	int c;
	
	c= a+b;
	System.out.println("sum is:"+c);
	
	return c;
}

public int sub (int d, int e)

{

int i;

i= d-e;

System.out.println("sub is:"+i);

return i;

}
 public int mul (int f, int g)
 
 {
	 int h;
	 h= f*g;
	 System.out.println("mul is:"+h);
	
	 return h;
 }
 
 public void div (int m, int n)
 {
	 int t;
	 
	 t= m/n;
			 
			 System.out.println("div is:"+t);
	 
 }
 public static void main(String[] args) {
	
	 class9 kake=new class9();
	 
	 int pratibha= kake.sum(10,2);
	 int pratibha1= kake.sum(pratibha,2);
	int pratibha2= kake.sub(pratibha1,2);
	int pratibha3= kake.mul(pratibha2,2);
	kake.div(pratibha3,2);
}
	 
	 
	 


}

 
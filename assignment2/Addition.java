package assignment2;

public class Addition {
	
	public static void main(String args[]){
		//The maximum number that can be stored in 32 bits is till 2147483647
		//We divide the 64 bit inout from the user in two halfs.
		//and further we carry out the summation operation on 31 bits
		//so as to preserve the carry.
		//In total four additions will need to be carried.
		//(First 31 least significant bits of first+First 31 least significant bits of second)
		//carry of this operation +remaining 1 bit of first number's first half +remaining 1 bit of second number's first half)
		//Again carry of this operation +next 31 bits of first number + remaining 31 bits of second number)
		//carry of this operation + next 1 bit of both the numbers.
		
		int a1=47483647;		//first numbers I half
		//System.out.println(a1);
		
		int a2=47483647;
		//System.out.println(a2); //first numbers II half
		System.out.println("The first number is "+((Integer)a2).toString()+""+((Integer)a1).toString());
		int b1=47483647;		//second numbers I half
		//System.out.println(b1);
		int b2=12345;
		//System.out.println(b2); //second numbers II half
		System.out.println("The second number is   "+((Integer)b2).toString()+""+((Integer)b1).toString());
		
		System.out.println("The sum is          "+((Integer)(a2+b2)).toString()+((Integer)(a1+b1)).toString());
		
		
		
	}
}

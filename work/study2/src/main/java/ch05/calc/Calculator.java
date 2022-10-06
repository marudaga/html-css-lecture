package ch05.calc;

public class Calculator {
	private int num1;
	private int num2;
	private String operator;
	
	public int getNum1() {
		return num1;
	}
	public void setNum1(int num1) {
		this.num1 = num1;
	}
	public int getNum2() {
		return num2;
	}
	public void setNum2(int num2) {
		this.num2 = num2;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	
	@Override
	public String toString() {
		String s= "";
		
		if(operator ==null) return s;
		
		try {
			switch(operator) {
			case "+" : s = String.format("%d + %d = %d",  num1, num2, num1 + num2);
			case "-" : s = String.format("%d - %d = %d",  num1, num2, num1 - num2);
			case "*" : s = String.format("%d * %d = %d",  num1, num2, num1 * num2);
			case "/" : s = String.format("%d / %d = %d",  num1, num2, num1 / num2);
			}
		} catch (ArithmeticException e) {
			s = "연산 불가";
		} catch (Exception e) {
			s = "연산 오류";
		}
		
		return s;
	}
	
}

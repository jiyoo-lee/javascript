package faqs;

public class ex23 {
	String a = "";
	String b = "";
	
	public String names() {	//getter
		return this.a;
	}
	public String levels() {	//getter
		return this.b;
	}
	
	
	public void inName() { //setter
		this.a = "홍길동"; 
		this.b = "이순신"; 
	}
	
	public void innerName(String nm1, String nm2) {
		this.a = nm1;
		this.b = nm2;
	}

}

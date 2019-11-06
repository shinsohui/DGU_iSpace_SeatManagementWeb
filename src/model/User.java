package model;

public class User {
	private String id;
	private String pw;
	private String name;
	private String my_seatNo;
	private String ifmanager;
	private int count;
	
	
//	public User(String id, String pw) {
//		this.id=id;
//		this.pw=pw;
//	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getpw() {
		return pw;
	}
	
	public void setpw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMy_seatNo() {
		return my_seatNo;
	}

	public void setMy_seatNo(String my_seatNo) {
		this.my_seatNo = my_seatNo;
	}

	public String getIfmanager() {
		return ifmanager;
	}

	public void setIfmanager(String ifmanager) {
		this.ifmanager = ifmanager;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	
}
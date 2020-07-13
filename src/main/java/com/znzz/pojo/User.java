package com.znzz.pojo;

public class User {
	private int id ;      //�û�id
	private String name;  //����
	private int age;      // ����
	private String sex;   //  �Ա�
	private String idcard;// ���п���
	private String phone; //  �绰
	private String address;// ��ַ
	private String time;  //  �볡ʱ��
	private String password;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	//setter getter����������ֵ�ͻ�ȡֵ
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
    // �вι���
	public User(int id, String name, int age, String sex, String idcard, String phone, String address, String time,String password) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.sex = sex;
		this.idcard = idcard;
		this.phone = phone;
		this.address = address;
		this.time = time;
		this.password = password;
	}
	
	
	//�޲ι���
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", age=" + age + ", sex=" + sex + ", idcard=" + idcard + ", phone="
				+ phone + ", address=" + address + ", time=" + time + ", password=" + password + "]";
	}

	

}

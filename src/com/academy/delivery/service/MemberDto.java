package com.academy.delivery.service;

public class MemberDto {
	
	private String 	member_no;
	private String 	member_email;
	private String 	member_password;
	private String 	member_name;
	private String 	member_tel;
	private String 	member_agreesms;
	private String 	member_agreeemail;
	
	//---------------------------------------------------
	// getter / setter
	//---------------------------------------------------
	public String getNo() {
		return member_no;
	}
	public void setNo(String member_no) {
		this.member_no = member_no;
	}
	public String getEmail() {
		return member_email;
	}
	public void setEmail(String member_email) {
		this.member_email = member_email;
	}
	public String getPass() {
		return member_password;
	}
	public void setPass(String member_password) {
		this.member_password = member_password;
	}
	public String getName() {
		return member_name;
	}
	public void setName(String member_name) {
		this.member_name = member_name;
	}
	public String getTel() {
		return member_tel;
	}
	public void setTel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getAgreesms() {
		return member_agreesms;
	}
	public void setAgreesms(String member_agreesms) {
		this.member_agreesms = member_agreesms;
	}
	public String getAgreeemail() {
		return member_agreeemail;
	}
	public void setAgreeemail(String member_agreeemail) {
		this.member_agreeemail = member_agreeemail;
	}

	
	
}
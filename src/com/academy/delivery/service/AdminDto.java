package com.academy.delivery.service;

public class AdminDto {
	
	private String 	id;
	private String 	pass;
	private String 	name;
	private String 	adminlevel;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAdminlevel() {
		return adminlevel;
	}
	public void setAdminlevel(String adminlevel) {
		this.adminlevel = adminlevel;
	}
	
}
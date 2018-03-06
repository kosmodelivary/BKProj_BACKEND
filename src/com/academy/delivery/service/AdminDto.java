package com.academy.delivery.service;

public class AdminDto {
	
	private String 	admin_id;
	private String 	admin_pass;
	private String 	admin_name;
	private String 	admin_level;
	
	public String getId() {
		return admin_id;
	}
	public void setId(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getPass() {
		return admin_pass;
	}
	public void setPass(String admin_pass) {
		this.admin_pass = admin_pass;
	}
	public String getName() {
		return admin_name;
	}
	public void setName(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdminlevel() {
		return admin_level;
	}
	public void setAdminlevel(String admin_level) {
		this.admin_level = admin_level;
	}
	
}
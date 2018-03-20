package com.academy.delivery.service;

import java.sql.Date;

public class MenuDto {
	
	private String 	menu_no;
	private String 	category_name;
	private String 	menu_name;
	private String 	menu_price;
	private String 	menu_weight;
	private String 	menu_calrorie;
	private String 	menu_protein;
	private String 	menu_sodium;
	private String 	menu_sugars;
	private String 	menu_fat;
	private Date   	menu_enddate;
	private String 	menu_file_extension;

	//---------------------------------------------------
	// getter / setter
	//---------------------------------------------------
	
	public String getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(String menu_no) {
		this.menu_no = menu_no;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(String menu_price) {
		this.menu_price = menu_price;
	}
	public String getMenu_weight() {
		return menu_weight;
	}
	public void setMenu_weight(String menu_weight) {
		this.menu_weight = menu_weight;
	}
	public String getMenu_calrorie() {
		return menu_calrorie;
	}
	public void setMenu_calrorie(String menu_calrorie) {
		this.menu_calrorie = menu_calrorie;
	}
	public String getMenu_protein() {
		return menu_protein;
	}
	public void setMenu_protein(String menu_protein) {
		this.menu_protein = menu_protein;
	}
	public String getMenu_sodium() {
		return menu_sodium;
	}
	public void setMenu_sodium(String menu_sodium) {
		this.menu_sodium = menu_sodium;
	}
	public String getMenu_sugars() {
		return menu_sugars;
	}
	public void setMenu_sugars(String menu_sugars) {
		this.menu_sugars = menu_sugars;
	}
	public String getMenu_fat() {
		return menu_fat;
	}
	public void setMenu_fat(String menu_fat) {
		this.menu_fat = menu_fat;
	}
	public Date getMenu_enddate() {
		return menu_enddate;
	}
	public void setMenu_enddate(Date menu_enddate) {
		this.menu_enddate = menu_enddate;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getMenu_file_extension() {
		return menu_file_extension;
	}
	public void setMenu_file_extension(String menu_file_extension) {
		this.menu_file_extension = menu_file_extension;
	}
	
	
}

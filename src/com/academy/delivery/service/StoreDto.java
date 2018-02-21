package com.academy.delivery.service;

public class StoreDto {

	private String 	no;
	private String 	name;
	private String 	tel;
	private String 	address;
	private int 	weekdayon;
	private int 	weekdayoff;
	private int 	weekendon;
	private int 	weekendoff;
	
	//---------------------------------------------------
	// getter / setter
	//---------------------------------------------------
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getWeekdayon() {
		return weekdayon;
	}
	public void setWeekdayon(int weekdayon) {
		this.weekdayon = weekdayon;
	}
	public int getWeekdayoff() {
		return weekdayoff;
	}
	public void setWeekdayoff(int weekdayoff) {
		this.weekdayoff = weekdayoff;
	}
	public int getWeekendon() {
		return weekendon;
	}
	public void setWeekendon(int weekendon) {
		this.weekendon = weekendon;
	}
	public int getWeekendoff() {
		return weekendoff;
	}
	public void setWeekendoff(int weekendoff) {
		this.weekendoff = weekendoff;
	}

	
} // end StoreDto 

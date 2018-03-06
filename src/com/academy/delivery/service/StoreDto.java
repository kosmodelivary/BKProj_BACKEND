package com.academy.delivery.service;

public class StoreDto {

	private String 	store_no;
	private String 	store_name;
	private String 	store_tel;
	private String 	store_addr;
	private int 	store_weekdayon;
	private int 	store_weekdayoff;
	private int 	store_weekendon;
	private int 	store_weekendoff;
	private int		store_minordermoney;

	
	//---------------------------------------------------
	// getter / setter
	//---------------------------------------------------
	public String getStore_no() {
		return store_no;
	}
	public void setStore_no(String store_no) {
		this.store_no = store_no;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getStore_tel() {
		return store_tel;
	}
	public void setStore_tel(String store_tel) {
		this.store_tel = store_tel;
	}
	public String getStore_addr() {
		return store_addr;
	}
	public void setStore_addr(String store_addr) {
		this.store_addr = store_addr;
	}
	public int getStore_weekdayon() {
		return store_weekdayon;
	}
	public void setStore_weekdayon(int store_weekdayon) {
		this.store_weekdayon = store_weekdayon;
	}
	public int getStore_weekdayoff() {
		return store_weekdayoff;
	}
	public void setStore_weekdayoff(int store_weekdayoff) {
		this.store_weekdayoff = store_weekdayoff;
	}
	public int getStore_weekendon() {
		return store_weekendon;
	}
	public void setStore_weekendon(int store_weekendon) {
		this.store_weekendon = store_weekendon;
	}
	public int getStore_weekendoff() {
		return store_weekendoff;
	}
	public void setStore_weekendoff(int store_weekendoff) {
		this.store_weekendoff = store_weekendoff;
	}
	public int getStore_minordermoney() {
		return store_minordermoney;
	}
	public void setStore_minordermoney(int store_minordermoney) {
		this.store_minordermoney = store_minordermoney;
	}
	
} // end StoreDto 

package com.academy.delivery.service;

public class StoreDeliveryDto {

	private String 	delivery_no;
	private String 	store_no;
	private String 	delivery_useable;

	//---------------------------------------------------
	// getter / setter
	//---------------------------------------------------
	public String getDelivery_no() {
		return delivery_no;
	}
	public void setDelivery_no(String delivery_no) {
		this.delivery_no = delivery_no;
	}
	public String getStore_no() {
		return store_no;
	}
	public void setStore_no(String store_no) {
		this.store_no = store_no;
	}
	public String getDelivery_useable() {
		return delivery_useable;
	}
	public void setDelivery_useable(String delivery_useable) {
		this.delivery_useable = delivery_useable;
	}

	
} // end StoreDto 

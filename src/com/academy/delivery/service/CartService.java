package com.academy.delivery.service;

import java.util.List;

public interface CartService {
	
	public List<CartDto> selectToAndroid(String storeName);
	
}
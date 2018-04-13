package com.academy.delivery.service.impl;

import java.util.List;

import com.academy.delivery.service.CartDto;
import com.academy.delivery.service.CartService;

public class CartServiceImpl implements CartService {
	
	private CartDao	cartDao;
	
	public CartServiceImpl() {
		cartDao		= new CartDao(); 
	}

	@Override
	public List<CartDto> selectToAndroid(String storeName) {
		return cartDao.selectToAndroid(storeName);
	}
	
}
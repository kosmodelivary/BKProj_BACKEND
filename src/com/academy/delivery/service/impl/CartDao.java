package com.academy.delivery.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.academy.delivery.common.IbatisUtil;
import com.academy.delivery.service.CartDto;
import com.academy.delivery.service.CartService;

public class CartDao implements CartService {

	@Override
	public List<CartDto> selectToAndroid(String storeName) {
		List<CartDto> list	= null;
		
		try {
			list				= IbatisUtil.getMapper().queryForList("StoreDelivery.selectToAndroid", storeName);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

}
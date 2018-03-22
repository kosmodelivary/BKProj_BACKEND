package com.academy.delivery.service;

import java.util.List;
import java.util.Map;

public interface StoreDeliveryService {

	public List<StoreDeliveryDto> selectList();
	public StoreDeliveryDto selectOne(String uuid);
	
	public int insert(StoreDeliveryDto storeDeliveryDto);
	public int update(StoreDeliveryDto storeDeliveryDto);
	public int delete(String uuid);
	
	public int getTotalDeliveryCount();

}
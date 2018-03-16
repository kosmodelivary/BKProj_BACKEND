package com.academy.delivery.service;

import java.util.List;
import java.util.Map;

public interface StoreService {

	public List<StoreDto> selectList(Map map);
	public StoreDto selectOne(String no);
	
	public int insert(StoreDto storeDto);
	public int update(StoreDto storeDto);
	public int delete(String no);
	
	public int getTotalRecordCount();
	public int getTotalDeliveryCount();

}
package com.academy.delivery.service;

import java.util.List;

public interface StoreService {

	public List<StoreDto> selectList();
	public StoreDto selectOne(String no);
	
	public int insert(StoreDto storeDto);
	public int update(StoreDto storeDto);
	public int delete(String no);

}
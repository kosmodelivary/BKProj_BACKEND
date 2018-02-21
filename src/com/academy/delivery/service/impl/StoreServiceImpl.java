package com.academy.delivery.service.impl;

import java.util.List;

import com.academy.delivery.service.StoreDto;
import com.academy.delivery.service.StoreService;

public class StoreServiceImpl implements StoreService {
	
	private StoreDao	storeDao;
	
	public StoreServiceImpl() {
		storeDao		= new StoreDao();
	}
	
	@Override
	public List<StoreDto> selectList() {
		return storeDao.selectList();
	} // end selectList
	
	@Override
	public StoreDto selectOne(String no) {
		return storeDao.selectOne(no);
	} // end selectOne
	
	@Override
	public int insert(StoreDto storeDto) {
		return storeDao.insert(storeDto);
	} // end insert

	@Override
	public int update(StoreDto storeDto) {
		return storeDao.update(storeDto);
	} // end update

	@Override
	public int delete(String no) {
		return storeDao.delete(no);
	} // end delete

} // end MemberServiceImpl 
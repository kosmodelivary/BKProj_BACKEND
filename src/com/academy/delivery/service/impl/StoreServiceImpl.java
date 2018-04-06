package com.academy.delivery.service.impl;

import java.util.List;
import java.util.Map;

import com.academy.delivery.service.StoreDto;
import com.academy.delivery.service.StoreService;

public class StoreServiceImpl implements StoreService {
	
	private StoreDao	storeDao;
	
	public StoreServiceImpl() {
		storeDao		= new StoreDao();
	}
	
	@Override
	public List<StoreDto> selectList(Map map) {
		return storeDao.selectList(map);
	} // end selectList

	@Override
	public List<String> selectListofName() {
		return storeDao.selectListofName();
	} // selectListofName

	@Override
	public StoreDto selectOne(String no) {
		return storeDao.selectOne(no);
	} // end selectOne
	
	@Override
	public StoreDto selectOneByName(String name) {
		return storeDao.selectOneByName(name);
	}

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

	@Override
	public int getTotalRecordCount() {
		return storeDao.getTotalRecordCount();
	}

	@Override
	public int getTotalDeliveryCount() {
		return storeDao.getTotalDeliveryCount();
	}

	@Override
	public String getDeliveryAddr(String storeNo) {
		return storeDao.getDeliveryAddr(storeNo);
	}

} // end MemberServiceImpl 
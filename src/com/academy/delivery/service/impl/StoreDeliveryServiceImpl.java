package com.academy.delivery.service.impl;

import java.util.List;
import java.util.Map;

import com.academy.delivery.service.StoreDeliveryDto;
import com.academy.delivery.service.StoreDeliveryService;

public class StoreDeliveryServiceImpl implements StoreDeliveryService {
	
	private StoreDeliveryDao	storeDeliveryDao;
	
	public StoreDeliveryServiceImpl() {
		storeDeliveryDao		= new StoreDeliveryDao();
	}
	
	@Override
	public List<StoreDeliveryDto> selectList() {
		return storeDeliveryDao.selectList();
	} // end selectList
	
	@Override
	public StoreDeliveryDto selectOne(String uuid) {
		return storeDeliveryDao.selectOne(uuid);
	} // end selectOne
	
	@Override
	public int insert(StoreDeliveryDto StoreDeliveryDto) {
		return storeDeliveryDao.insert(StoreDeliveryDto);
	} // end insert

	@Override
	public int update(StoreDeliveryDto StoreDeliveryDto) {
		return storeDeliveryDao.update(StoreDeliveryDto);
	} // end update

	@Override
	public int delete(String no) {
		return storeDeliveryDao.delete(no);
	} // end delete

	@Override
	public int getTotalDeliveryCount() {
		return storeDeliveryDao.getTotalDeliveryCount();
	}

	@Override
	public int updateDeliveryComplete(String orderNo) {
		return storeDeliveryDao.updateDeliveryComplete(orderNo);
	}
	
} // end MemberServiceImpl 
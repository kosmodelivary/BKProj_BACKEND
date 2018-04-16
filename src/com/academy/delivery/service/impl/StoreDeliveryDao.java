package com.academy.delivery.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.academy.delivery.common.IbatisUtil;
import com.academy.delivery.service.StoreDeliveryDto;
import com.academy.delivery.service.StoreDeliveryService;

public class StoreDeliveryDao implements StoreDeliveryService {

	@Override
	public List<StoreDeliveryDto> selectList() {
		List<StoreDeliveryDto> list	= null;
		
		try {
			list				= IbatisUtil.getMapper().queryForList("StoreDelivery.selectList");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public StoreDeliveryDto selectOne(String uuid) {
		StoreDeliveryDto storeDeliveryDto	= null;
		
		try {
			storeDeliveryDto		= (StoreDeliveryDto) IbatisUtil.getMapper().queryForObject("StoreDelivery.selectOne", uuid);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return storeDeliveryDto;
	}

	@Override
	public int insert(StoreDeliveryDto storeDeliveryDto) {
		int	affected	= 0;
		
		try {
			affected	= IbatisUtil.getMapper().update("StoreDelivery.insert", storeDeliveryDto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return affected;
	}
	
	@Override
	public int update(StoreDeliveryDto storeDto) {
		int	affected	= 0;
		
		try {
			affected	= IbatisUtil.getMapper().update("StoreDelivery.update", storeDto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return affected;
	}

	@Override
	public int delete(String uuid) {
		int	affected	= 0;
		
		try {
			affected	= IbatisUtil.getMapper().update("StoreDelivery.delete", uuid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return affected;
	}

	@Override
	public int getTotalDeliveryCount() {
		int totalCount	= 0;
		
		try {
			totalCount		= (Integer) IbatisUtil.getMapper().queryForObject("StoreDelivery.getTotalDeliveryCount");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return totalCount;
	}

	@Override
	public int updateDeliveryComplete(String orderNo) {
		int	affected	= 0;
		
		try {
			affected	= IbatisUtil.getMapper().update("StoreDelivery.updateDeliveryComplete", orderNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return affected;
	}

} // end MemberDao
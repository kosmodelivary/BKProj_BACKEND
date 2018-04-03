package com.academy.delivery.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.academy.delivery.common.IbatisUtil;
import com.academy.delivery.service.StoreDto;
import com.academy.delivery.service.StoreService;

public class StoreDao implements StoreService {

	@Override
	public List<StoreDto> selectList(Map map) {
		List<StoreDto> list	= null;
		
		try {
			list				= IbatisUtil.getMapper().queryForList("Store.selectList", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<String> selectListofName() {
		List<String> list	= null;
		
		try {
			list				= IbatisUtil.getMapper().queryForList("Store.selectListofName");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public StoreDto selectOne(String no) {
		StoreDto storeDto	= null;
		
		try {
			storeDto		= (StoreDto) IbatisUtil.getMapper().queryForObject("Store.selectOne", no);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return storeDto;
	}

	@Override
	public StoreDto selectOneByName(String name) {
		StoreDto storeDto	= null;
		
		try {
			storeDto		= (StoreDto) IbatisUtil.getMapper().queryForObject("Store.selectOneByName", name);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return storeDto;
	}

	@Override
	public int insert(StoreDto storeDto) {
		int	affected	= 0;
		
		try {
			affected	= IbatisUtil.getMapper().update("Store.insert", storeDto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return affected;
	}
	
	@Override
	public int update(StoreDto storeDto) {
		int	affected	= 0;
		
		try {
			affected	= IbatisUtil.getMapper().update("Store.update", storeDto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return affected;
	}

	@Override
	public int delete(String no) {
		int	affected	= 0;
		
		try {
			affected	= IbatisUtil.getMapper().update("Store.delete", no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return affected;
	}

	@Override
	public int getTotalRecordCount() {
		int totalCount	= 0;
		
		try {
			totalCount		= (Integer) IbatisUtil.getMapper().queryForObject("Store.getTotalCount");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return totalCount;
	}

	@Override
	public int getTotalDeliveryCount() {
		int totalCount	= 0;
		
		try {
			totalCount		= (Integer) IbatisUtil.getMapper().queryForObject("Store.getTotalDeliveryCount");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return totalCount;
	}

} // end MemberDao
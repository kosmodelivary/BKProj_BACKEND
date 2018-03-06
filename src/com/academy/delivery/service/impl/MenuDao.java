package com.academy.delivery.service.impl;

import java.util.List;

import com.academy.delivery.common.IbatisUtil;
import com.academy.delivery.service.MenuDto;
import com.academy.delivery.service.MenuService;

public class MenuDao implements MenuService{

	@Override
	public List<MenuDto> selectList() {
		List<MenuDto> list = null;
		try {
			list = IbatisUtil.getMapper().queryForList("Menu.selectList");
		} catch(Exception e) {e.printStackTrace();}
		return list;
	}

	@Override
	public MenuDto selectOne(String menu_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(MenuDto mnDto) {
		int affected = 0;
		try {
			affected = IbatisUtil.getMapper().update("Menu.insert", mnDto);
		} catch(Exception e) {e.printStackTrace();}
		
		return affected;
	}

	@Override
	public int update(MenuDto mnDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String menu_no) {
		// TODO Auto-generated method stub
		return 0;
	}

}

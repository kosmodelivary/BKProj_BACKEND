package com.academy.delivery.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.academy.delivery.common.IbatisUtil;
import com.academy.delivery.service.MenuDto;
import com.academy.delivery.service.MenuService;
import com.academy.delivery.service.StoreDto;

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
		MenuDto menuDto	= null;
		
		try {
			menuDto		= (MenuDto) IbatisUtil.getMapper().queryForObject("Menu.selectOne", menu_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return menuDto;
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
		int	affected	= 0;
		try {
			affected	= IbatisUtil.getMapper().update("Menu.update", mnDto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return affected;
	}

	@Override
	public int delete(String menu_no) {
		int	affected	= 0;
		try {
			affected	= IbatisUtil.getMapper().update("Menu.delete", menu_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return affected;
	}

}

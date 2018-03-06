package com.academy.delivery.service.impl;

import java.util.List;

import com.academy.delivery.service.MenuDto;
import com.academy.delivery.service.MenuService;

public class MenuServiceImpl implements MenuService{

	private MenuDao		menuDao;
	
	
	public MenuServiceImpl() {
		menuDao = new MenuDao();
	}

	@Override
	public List<MenuDto> selectList() {
		return menuDao.selectList();
	}

	@Override
	public MenuDto selectOne(String menu_no) {
		return menuDao.selectOne(menu_no);
	}

	@Override
	public int insert(MenuDto mnDto) {
		return menuDao.insert(mnDto);
	}

	@Override
	public int update(MenuDto mnDto) {
		return menuDao.update(mnDto);
	}

	@Override
	public int delete(String menu_no) {
		return menuDao.delete(menu_no);
	}

}

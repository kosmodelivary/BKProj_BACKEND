package com.academy.delivery.service;

import java.util.List;

public interface MenuService {
	
	public List<MenuDto> selectList();
	public MenuDto selectOne(String menu_no);
	
	public int insert(MenuDto mnDto);
	public int update(MenuDto mnDto);
	public int delete(String menu_no);
}

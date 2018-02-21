package com.academy.delivery.service.impl;

import com.academy.delivery.service.AdminDto;
import com.academy.delivery.service.AdminService;

public class AdminServiceImpl implements AdminService {
	
	private AdminDao	adminDao;
	
	public AdminServiceImpl() {
		adminDao		= new AdminDao(); 
	}
	
	public boolean login(AdminDto dto) {
		return adminDao.login(dto); 
	}
	
}
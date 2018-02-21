package com.academy.delivery.service.impl;

import java.sql.SQLException;

import com.academy.delivery.common.IbatisUtil;
import com.academy.delivery.service.AdminDto;
import com.academy.delivery.service.AdminService;

public class AdminDao implements AdminService {
	
	public boolean login(AdminDto dto) {

		try {
			int memberCount = (Integer)IbatisUtil.getMapper().queryForObject("Admin.login", dto);
			if (memberCount == 0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

}
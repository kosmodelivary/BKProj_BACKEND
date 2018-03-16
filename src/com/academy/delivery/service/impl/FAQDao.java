package com.academy.delivery.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.academy.delivery.common.IbatisUtil;
import com.academy.delivery.service.FAQDto;
import com.academy.delivery.service.FAQService;
import com.academy.delivery.service.StoreDto;

public class FAQDao implements FAQService {

	@Override
	public List<FAQDto> selectList(Map map) {
		List<FAQDto> list	= null;
		
		try {
			list				= IbatisUtil.getMapper().queryForList("FAQ.selectList", map);
		} catch (SQLException e) {e.printStackTrace();}

		return list;
	}

	@Override
	public FAQDto selectOne(String no) {
		FAQDto faqDto	= null;
		
		try {
			faqDto = (FAQDto) IbatisUtil.getMapper().queryForObject("FAQ.selectOne",no);
		} catch (SQLException e) {e.printStackTrace();}
		return faqDto;
		
		
	}

	@Override
	public int insert(FAQDto faqDto) {
		int affected = 0;
		
		try {
			affected = IbatisUtil.getMapper().update("FAQ.insert",faqDto);
		} catch (SQLException e) {e.printStackTrace();}
		return affected;
	}

	@Override
	public int update(FAQDto faqDto) {
		int affected =0;
		try {
			affected = IbatisUtil.getMapper().update("FAQ.update",faqDto);
		} catch (SQLException e) {e.printStackTrace();}
		return affected;
	}

	@Override
	public int delete(String no) {
		int affected =0;
		try {
			affected = IbatisUtil.getMapper().update("FAQ.delete",no);
		} catch (SQLException e) {e.printStackTrace();}
		return affected;
	}

	@Override
	public int getTotalRecordCount() {
		int totalCount	= 0;
		try {
			totalCount		= (Integer) IbatisUtil.getMapper().queryForObject("FAQ.getTotalRecordCount");
		} catch (SQLException e) {e.printStackTrace();}
		
		return totalCount;
	}

	

}

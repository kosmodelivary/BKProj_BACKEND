package com.academy.delivery.service.impl;

import java.util.List;
import java.util.Map;

import com.academy.delivery.service.FAQDto;
import com.academy.delivery.service.FAQService;
import com.academy.delivery.service.StoreDto;

public class FAQServiceImpl implements FAQService {
	
	private FAQDao faqDao;
	
	public FAQServiceImpl() {
		faqDao = new FAQDao();
	}
	
	@Override
	public List<FAQDto> selectList(Map map) {
		return faqDao.selectList(map);
	}

	@Override
	public FAQDto selectOne(String no) {
		return faqDao.selectOne(no);
	}
	
	@Override
	public int insert(FAQDto faqDto) {
		return faqDao.insert(faqDto);
	}

	@Override
	public int update(FAQDto faqDto) {
		return faqDao.update(faqDto);
	}

	@Override
	public int delete(String no) {
		return faqDao.delete(no);
	}

	@Override
	public int getTotalRecordCount() {
		return faqDao.getTotalRecordCount();
	}


}

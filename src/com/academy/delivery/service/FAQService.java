package com.academy.delivery.service;

import java.util.List;
import java.util.Map;

public interface FAQService {

	public List<FAQDto> selectList(Map map);
	public FAQDto selectOne(String no);
	
	public int insert(FAQDto faqDto);
	public int update(FAQDto faqDto);
	public int delete(String no);
	
	public int getTotalRecordCount();
	
}

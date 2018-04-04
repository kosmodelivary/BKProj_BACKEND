package com.academy.delivery.service;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	public List<NoticeDto> selectList(Map map);
	public List<String> selectListofName();
	public NoticeDto selectOne(String no);
	public NoticeDto selectOneByName(String name);
	
	public int insert(NoticeDto noticeDto);
	public int update(NoticeDto noticeDto);
	public int delete(String no);
	
	public int getTotalRecordCount();
	public int getTotalDeliveryCount();

}
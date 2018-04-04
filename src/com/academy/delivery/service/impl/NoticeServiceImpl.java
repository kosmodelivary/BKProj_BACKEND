package com.academy.delivery.service.impl;

import java.util.List;
import java.util.Map;

import com.academy.delivery.service.NoticeDto;
import com.academy.delivery.service.NoticeService;
import com.academy.delivery.service.StoreDto;
import com.academy.delivery.service.StoreService;

public class NoticeServiceImpl implements NoticeService {
	
	private NoticeDao	noticeDao;
	
	public NoticeServiceImpl() {
		noticeDao		= new NoticeDao();
	}
	
	@Override
	public List<NoticeDto> selectList(Map map) {
		return noticeDao.selectList(map);
	} // end selectList

	@Override
	public List<String> selectListofName() {
		return noticeDao.selectListofName();
	} // selectListofName

	@Override
	public NoticeDto selectOne(String no) {
		return noticeDao.selectOne(no);
	} // end selectOne
	
	@Override
	public NoticeDto selectOneByName(String name) {
		return noticeDao.selectOneByName(name);
	}

	@Override
	public int insert(NoticeDto noticeDto) {
		return noticeDao.insert(noticeDto);
	} 

	@Override
	public int update(NoticeDto noticeDto) {
		return noticeDao.update(noticeDto);
	} 

	@Override
	public int delete(String no) {
		return noticeDao.delete(no);
	} 

	@Override
	public int getTotalRecordCount() {
		return noticeDao.getTotalRecordCount();
	}

	@Override
	public int getTotalDeliveryCount() {
		return noticeDao.getTotalDeliveryCount();
	}

}/////NoticeServiceImpl 
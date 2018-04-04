package com.academy.delivery.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.academy.delivery.common.IbatisUtil;
import com.academy.delivery.service.NoticeDto;
import com.academy.delivery.service.NoticeService;

public class NoticeDao implements NoticeService {

	@Override
	public List<NoticeDto> selectList(Map map) {
		List<NoticeDto> list	= null;
		
		try {
			list				= IbatisUtil.getMapper().queryForList("Notice.selectList", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<String> selectListofName() {
		List<String> list	= null;
		
		try {
			list				= IbatisUtil.getMapper().queryForList("Notice.selectListofName");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public NoticeDto selectOne(String no) {
		NoticeDto noticeDto	= null;
		
		try {
			noticeDto		= (NoticeDto) IbatisUtil.getMapper().queryForObject("Notice.selectOne", no);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return noticeDto;
	}

	@Override
	public NoticeDto selectOneByName(String name) {
		NoticeDto noticeDto	= null;
		
		try {
			noticeDto		= (NoticeDto) IbatisUtil.getMapper().queryForObject("Notice.selectOneByName", name);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return noticeDto;
	}

	@Override
	public int insert(NoticeDto noticeDto) {
		int	affected	= 0;
		
		try {
			affected	= IbatisUtil.getMapper().update("Notice.insert", noticeDto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return affected;
	}
	
	@Override
	public int update(NoticeDto noticeDto) {
		int	affected	= 0;
		
		try {
			affected	= IbatisUtil.getMapper().update("Notice.update", noticeDto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return affected;
	}

	@Override
	public int delete(String no) {
		int	affected	= 0;
		
		try {
			affected	= IbatisUtil.getMapper().update("Notice.delete", no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return affected;
	}

	@Override
	public int getTotalRecordCount() {
		int totalCount	= 0;
		
		try {
			totalCount		= (Integer) IbatisUtil.getMapper().queryForObject("Notice.getTotalCount");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return totalCount;
	}

	@Override
	public int getTotalDeliveryCount() {
		
		int totalCount	= 0;
		
		try {
			totalCount		= (Integer) IbatisUtil.getMapper().queryForObject("Notice.getTotalDeliveryCount");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}

}/////
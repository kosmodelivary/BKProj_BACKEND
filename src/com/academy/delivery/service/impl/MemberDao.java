package com.academy.delivery.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.academy.delivery.common.IbatisUtil;
import com.academy.delivery.service.MemberDto;
import com.academy.delivery.service.MemberService;

public class MemberDao implements MemberService {
	
	@Override
	public List<MemberDto> selectList() {
		List<MemberDto> list	= null;
		
		try {
			list				= IbatisUtil.getMapper().queryForList("Member.selectList");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	} // end selectList
	
	@Override
	public MemberDto selectOne(String no) {
		MemberDto memberDto	= null;
		
		try {
			memberDto			= (MemberDto) IbatisUtil.getMapper().queryForObject("Member.selectOne", no);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return memberDto;
	} // end selectOne
	
	@Override
	public int update(MemberDto memberDto) {
		int	affected	= 0;
		
		try {
			affected	= IbatisUtil.getMapper().update("Member.update", memberDto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return affected;
	} // end update

	@Override
	public int delete(String no) {
		int	affected	= 0;
		
		try {
			affected	= IbatisUtil.getMapper().update("Member.delete", no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return affected;
	}

	@Override
	public List<MemberDto> selectAgreeEmail() {
		List<MemberDto> list = null;
		
		try {
			list = IbatisUtil.getMapper().queryForList("Member.selectAgreeEmail");
		} catch(Exception e) {e.printStackTrace();}
		
		return list;
	}

} // end MemberDao
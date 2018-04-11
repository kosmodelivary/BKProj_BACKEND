package com.academy.delivery.service.impl;

import java.util.List;

import com.academy.delivery.service.MemberDto;
import com.academy.delivery.service.MemberService;

public class MemberServiceImpl implements MemberService {
	
	private MemberDao	memberDao;
	
	public MemberServiceImpl() {
		memberDao		= new MemberDao();
	}
	
	@Override
	public List<MemberDto> selectList() {
		return memberDao.selectList();
	} // end selectList
	
	@Override
	public MemberDto selectOne(String no) {
		return memberDao.selectOne(no);
	} // end selectOne
	
	@Override
	public int update(MemberDto memberDto) {
		return memberDao.update(memberDto);
	}

	@Override
	public int delete(String no) {
		return memberDao.delete(no);
	}

	@Override
	public List<MemberDto> selectAgreeEmail() {
		return memberDao.selectAgreeEmail();
	}

} // end MemberServiceImpl 
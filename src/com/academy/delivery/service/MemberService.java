package com.academy.delivery.service;

import java.util.List;

public interface MemberService {
	
	public List<MemberDto> selectList();
	public MemberDto selectOne(String no);
	public int update(MemberDto memberDto);
	public int delete(String parameter);
}
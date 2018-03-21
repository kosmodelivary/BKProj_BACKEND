package com.academy.delivery.service;

import java.util.List;

public interface OrderService {
	
	public List<OrderDto> selectList();
	public OrderDto selectOne(String order_no);

	// 주문 추가
	public int insert(OrderDto odDto);
	// 주문 수정
	public int update(OrderDto odDto);
	// 주문 취소
	public int delete(String order_no);
}

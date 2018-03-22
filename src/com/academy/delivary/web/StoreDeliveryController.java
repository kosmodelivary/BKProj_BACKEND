package com.academy.delivary.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.service.StoreDeliveryDto;
import com.academy.delivery.service.StoreDeliveryService;
import com.academy.delivery.service.impl.StoreDeliveryServiceImpl;

public class StoreDeliveryController extends HttpServlet  {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreDeliveryService	service	= new StoreDeliveryServiceImpl();
		
		// 추후 코드 추가
		// - 딜리버리 배달중인 레코드만 추출
		// - 
		List<StoreDeliveryDto>	storeDelivery	= service.selectList();
		req.setAttribute("storeDelivery", storeDelivery);
		req.setAttribute("nowDelivery", service.getTotalDeliveryCount());
		System.out.println(storeDelivery);
		System.out.println(service.getTotalDeliveryCount());
		
		req.getRequestDispatcher("/admin/store/delivery/view.jsp").forward(req, resp);
	}

}

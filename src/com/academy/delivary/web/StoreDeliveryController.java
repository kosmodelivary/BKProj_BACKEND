package com.academy.delivary.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.service.StoreService;
import com.academy.delivery.service.impl.StoreServiceImpl;

public class StoreDeliveryController extends HttpServlet  {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreService	service	= new StoreServiceImpl();
		
		req.setAttribute("nowDelivery", service.getTotalDeliveryCount());
		
		// 추후 코드 추가
		// - 딜리버리 배달중인 레코드만 추출
		// - 
		
		req.getRequestDispatcher("/admin/store/delivery/view.jsp").forward(req, resp);
	}

}

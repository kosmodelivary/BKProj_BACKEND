package com.academy.delivary.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.service.StoreDto;
import com.academy.delivery.service.StoreService;
import com.academy.delivery.service.impl.StoreServiceImpl;

public class StoreViewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreService	storeService	= new StoreServiceImpl();
		StoreDto		storeDto		= storeService.selectOne(req.getParameter("no"));
		
		req.setAttribute("storeDto", storeDto);
		req.getRequestDispatcher("/admin/store/view.jsp").forward(req, resp);
	}
	
}

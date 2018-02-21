package com.academy.delivary.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.service.StoreDto;
import com.academy.delivery.service.StoreService;
import com.academy.delivery.service.impl.StoreServiceImpl;

public class StoreAddController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreService	storeService	= new StoreServiceImpl();

		// get  방식	: 추가 폼 이동
		// post 방식	: 추가 처리
		if (req.getMethod().equalsIgnoreCase("get")) {
			req.getRequestDispatcher("/admin/store/add.jsp").forward(req, resp);
		} else {
			req.setCharacterEncoding("utf-8");

			StoreDto	storeDto		= new StoreDto();
			storeDto.setName(req.getParameter("name"));
			storeDto.setAddress(req.getParameter("address"));
			storeDto.setTel(req.getParameter("tel"));
			storeDto.setWeekdayon(Integer.parseInt(req.getParameter("weekdayon").split(":")[0]));
			storeDto.setWeekdayoff(Integer.parseInt(req.getParameter("weekdayoff").split(":")[0]));
			storeDto.setWeekendon(Integer.parseInt(req.getParameter("weekendon").split(":")[0]));
			storeDto.setWeekendoff(Integer.parseInt(req.getParameter("weekendoff").split(":")[0]));
			
			storeService.insert(storeDto);
			resp.sendRedirect(req.getContextPath() + "/ADMIN/STORE/List.do");
		}
		
	} // end service
	
} // end StoreAddController 

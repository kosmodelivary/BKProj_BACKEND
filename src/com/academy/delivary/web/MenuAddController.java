package com.academy.delivary.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.service.MenuDto;
import com.academy.delivery.service.MenuService;
import com.academy.delivery.service.impl.MenuServiceImpl;

public class MenuAddController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MenuService	menuService		= new MenuServiceImpl();

		// get  방식	: 추가 폼 이동
		// post 방식	: 추가 처리
		if (req.getMethod().equalsIgnoreCase("get")) {
			req.getRequestDispatcher("/admin/menu/add.jsp").forward(req, resp);
		} else {
			req.setCharacterEncoding("utf-8");

			MenuDto	menuDto		= new MenuDto();
			menuDto.setMenu_name(req.getParameter("menu_name"));
			
			
			menuService.insert(menuDto);
			resp.sendRedirect(req.getContextPath() + "/ADMIN/MENU/List.do");
		}
		
	} // end service
	
} // end MenuAddController 

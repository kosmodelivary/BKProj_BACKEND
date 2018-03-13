package com.academy.delivary.web;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.common.FileUtils;
import com.academy.delivery.service.MenuDto;
import com.academy.delivery.service.MenuService;
import com.academy.delivery.service.impl.MenuServiceImpl;
import com.oreilly.servlet.MultipartRequest;

public class MenuAddController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req,
						   HttpServletResponse resp) throws ServletException, IOException {
		MenuService	menuService		= new MenuServiceImpl();

		// get  방식	: 추가 폼 이동
		// post 방식	: 추가 처리
		if (req.getMethod().equalsIgnoreCase("get")) {
			req.getRequestDispatcher("/admin/menu/add.jsp").forward(req, resp);
		} else {
			req.setCharacterEncoding("utf-8");
			
//			MultipartRequest mr = FileUtils.upload(req, req.getServletContext().getRealPath("/Upload"));

			MenuDto	menuDto		= new MenuDto();
			menuDto.setMenu_name(req.getParameter("menu_name"));
			menuDto.setCategory_name(req.getParameter("category_name"));
			menuDto.setMenu_price(req.getParameter("menu_price"));
			menuDto.setMenu_weight(req.getParameter("menu_weight"));
			menuDto.setMenu_calrorie(req.getParameter("menu_calrorie"));
			menuDto.setMenu_protein(req.getParameter("menu_protein"));
			menuDto.setMenu_sodium(req.getParameter("menu_sodium"));
			menuDto.setMenu_sugars(req.getParameter("menu_sugars"));
			menuDto.setMenu_fat(req.getParameter("menu_fat"));
			menuDto.setMenu_enddate(null);
			
			
			
			
			menuService.insert(menuDto);
			resp.sendRedirect(req.getContextPath() + "/ADMIN/MENU/All.do");
		}
		
	} // end service
	
} // end MenuAddController 

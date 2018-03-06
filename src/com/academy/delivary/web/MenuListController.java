package com.academy.delivary.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.service.MenuDto;
import com.academy.delivery.service.MenuService;
import com.academy.delivery.service.impl.MenuServiceImpl;

public class MenuListController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MenuService		menuService		= new MenuServiceImpl();
		List<MenuDto> 	menu			= menuService.selectList();
		
		req.setAttribute("menu", menu);
		req.getRequestDispatcher("/admin/menu/all.jsp").forward(req, resp);
	} // end service
	
} // end StoreListController 

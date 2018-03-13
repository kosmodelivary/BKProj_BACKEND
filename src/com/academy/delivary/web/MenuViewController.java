package com.academy.delivary.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.service.MenuDto;
import com.academy.delivery.service.MenuService;
import com.academy.delivery.service.StoreDto;
import com.academy.delivery.service.StoreService;
import com.academy.delivery.service.impl.MenuServiceImpl;
import com.academy.delivery.service.impl.StoreServiceImpl;

public class MenuViewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MenuService	menuService	= new MenuServiceImpl();
		MenuDto		menuDto		= menuService.selectOne(req.getParameter("no"));
		
		req.setAttribute("menuDto", menuDto);
		req.getRequestDispatcher("/admin/menu/view.jsp").forward(req, resp);
	}
	
}

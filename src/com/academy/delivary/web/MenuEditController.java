package com.academy.delivary.web;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

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

import jdk.nashorn.internal.parser.DateParser;

public class MenuEditController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		MenuService	menuService		= new MenuServiceImpl();

		// get  방식	: 수정 폼 이동
		// post 방식	: 수정 처리
		if (req.getMethod().equalsIgnoreCase("get")) {
			MenuDto	menuDto		= menuService.selectOne(req.getParameter("no"));
			
			req.setAttribute("menuDto", menuDto);
			req.getRequestDispatcher("/admin/menu/edit.jsp").forward(req, resp);
		} else {
			req.setCharacterEncoding("utf-8");
			
			MenuDto	menuDto	= menuService.selectOne(req.getParameter("no"));
			menuDto.setMenu_name(req.getParameter("menu_name"));
			menuDto.setCategory_name(req.getParameter("category_name"));
			menuDto.setMenu_price(req.getParameter("menu_price"));
			menuDto.setMenu_weight(req.getParameter("menu_weight"));
			menuDto.setMenu_calrorie(req.getParameter("menu_calrorie"));
			menuDto.setMenu_protein(req.getParameter("menu_protein"));
			menuDto.setMenu_sodium(req.getParameter("menu_sodium"));
			menuDto.setMenu_sugars(req.getParameter("menu_sugars"));
			menuDto.setMenu_fat(req.getParameter("menu_fat"));
			Date menu_enddate = java.sql.Date.valueOf(req.getParameter("menu_enddate"));
			menuDto.setMenu_enddate(menu_enddate);
			
			req.setAttribute("EDIT_RESULT", menuService.update(menuDto));
			req.getRequestDispatcher("/admin/menu/process.jsp").forward(req, resp);
		}
	} // end service
	
} // end MenuEditController

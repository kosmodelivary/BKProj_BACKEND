package com.academy.delivary.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.common.NCloudService;
import com.academy.delivery.service.MenuDto;
import com.academy.delivery.service.MenuService;
import com.academy.delivery.service.impl.MenuServiceImpl;

public class MenuDeleteController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req,
						   HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		MenuService	menuService	= new MenuServiceImpl();
		
		MenuDto menuDto = new MenuDto();
		menuDto = menuService.selectOne(req.getParameter("no"));
		
		NCloudService ncloud = new NCloudService();
		ncloud.delete(menuDto.getMenu_name()+menuDto.getMenu_file_extension());
        
		req.setAttribute("DELETE_RESULT", menuService.delete(req.getParameter("no")));
		req.getRequestDispatcher("/admin/menu/process.jsp").forward(req, resp);
	} // end service
	
} // end StoreDeleteController

package com.academy.delivary.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.service.FAQService;
import com.academy.delivery.service.StoreService;
import com.academy.delivery.service.impl.FAQServiceImpl;
import com.academy.delivery.service.impl.StoreServiceImpl;

public class FaqDeleteController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		FAQService	faqService	= new FAQServiceImpl();
		req.setAttribute("DELETE_RESULT", faqService.delete(req.getParameter("no")));
		req.getRequestDispatcher("/admin/faq/process.jsp").forward(req, resp);
		
	} // end service
	
} // end FaqDeleteController

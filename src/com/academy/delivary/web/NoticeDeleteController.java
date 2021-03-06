package com.academy.delivary.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.service.NoticeService;
import com.academy.delivery.service.impl.NoticeServiceImpl;

public class NoticeDeleteController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		NoticeService	noticeService	= new NoticeServiceImpl();
		req.setAttribute("DELETE_RESULT", noticeService.delete(req.getParameter("no")));
		req.getRequestDispatcher("/admin/notice/process.jsp").forward(req, resp);
		
	} // end service
	
} // end NoticeDeleteController

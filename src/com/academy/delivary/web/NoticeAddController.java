package com.academy.delivary.web;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.service.NoticeDto;
import com.academy.delivery.service.NoticeService;
import com.academy.delivery.service.impl.NoticeServiceImpl;

public class NoticeAddController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		NoticeService	noticeService	= new NoticeServiceImpl();

		// get  방식	: 추가 폼 이동
		// post 방식	: 추가 처리
		if (req.getMethod().equalsIgnoreCase("get")) {
			req.getRequestDispatcher("/admin/notice/add.jsp").forward(req, resp);
		} else {
			req.setCharacterEncoding("utf-8");

			NoticeDto	noticeDto		= new NoticeDto();
			noticeDto.setNotice_no(req.getParameter("no"));
			noticeDto.setNotice_title(req.getParameter("title"));
			noticeDto.setNotice_content(req.getParameter("content"));
			
			noticeService.insert(noticeDto);
			resp.sendRedirect(req.getContextPath() + "/ADMIN/NOTICE/List.do");
		}
		
	} // end service
	
} // end StoreAddController 

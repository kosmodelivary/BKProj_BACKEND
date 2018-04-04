package com.academy.delivary.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.service.NoticeDto;
import com.academy.delivery.service.NoticeService;
import com.academy.delivery.service.impl.NoticeServiceImpl;

public class NoticeViewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		NoticeService	noticeService	= new NoticeServiceImpl();
		NoticeDto		noticeDto		= noticeService.selectOne(req.getParameter("no"));
		
		noticeDto.setNotice_content(noticeDto.getNotice_content().replace("\r\n", "<br/>"));
		
		req.setAttribute("noticeDto", noticeDto);
		req.getRequestDispatcher("/admin/notice/view.jsp").forward(req, resp);
	}
	
}

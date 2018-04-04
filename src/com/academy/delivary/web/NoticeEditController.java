package com.academy.delivary.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.service.NoticeDto;
import com.academy.delivery.service.NoticeService;
import com.academy.delivery.service.impl.NoticeServiceImpl;

public class NoticeEditController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		NoticeService	noticeService	= new NoticeServiceImpl();

		// get  방식	: 수정 폼 이동
		// post 방식	: 수정 처리
		if (req.getMethod().equalsIgnoreCase("get")) {
			
			NoticeDto	noticeDto		= noticeService.selectOne(req.getParameter("no"));
			
			req.setAttribute("noticeDto", noticeDto);
			req.getRequestDispatcher("/admin/notice/edit.jsp").forward(req, resp);
		} else {
			req.setCharacterEncoding("utf-8");

			NoticeDto	noticeDto		= noticeService.selectOne(req.getParameter("no"));
			
			noticeDto.setNotice_no(req.getParameter("no"));
			noticeDto.setNotice_title(req.getParameter("title"));
			noticeDto.setNotice_content(req.getParameter("content"));
			
			req.setAttribute("EDIT_RESULT", noticeService.update(noticeDto));
			req.getRequestDispatcher("/admin/notice/process.jsp").forward(req, resp);
		}
	}	
}/////NoticeEditController

package com.academy.delivary.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academy.delivery.common.PagingUtil;
import com.academy.delivery.service.StoreDto;
import com.academy.delivery.service.StoreService;
import com.academy.delivery.service.impl.StoreServiceImpl;

public class StoreListController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreService	storeService	= new StoreServiceImpl();

		//페이징을 위한 로직 시작]
		//전체 레코드 수
		int totalRecordCount = storeService.getTotalRecordCount();
		//페이지 사이즈
		int pageSize=Integer.valueOf(req.getServletContext().getInitParameter("PAGESIZE"));
		//블락페이지
		int blockPage=Integer.valueOf(req.getServletContext().getInitParameter("BLOCKPAGE"));
		//전체 페이지수]
		int totalPage =(int)Math.ceil((double)totalRecordCount/pageSize);
		//현재 페이지를 파라미터로 받기]
		int nowPage = req.getParameter("nowPage")==null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		//시작 및 끝 ROWNUM구하기]
		int start= (nowPage-1)*pageSize +1;
		int end  = nowPage*pageSize;
		//페이징을 위한 로직 끝]	

		Map				map		= new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<StoreDto> 	store	= storeService.selectList(map);
		
		// 페이징용 문자열 생성
		String	pagingString	=
				PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath() + "/ADMIN/STORE/List.do?");
		
		req.setAttribute("store", store);
		// 페이징 출력 관련 속성
		req.setAttribute("pagingString", pagingString);
		req.setAttribute("totalRecordCount", totalRecordCount);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("pageSize", pageSize);
		
		req.getRequestDispatcher("/admin/store/list.jsp").forward(req, resp);
	} // end service
	
} // end StoreListController 

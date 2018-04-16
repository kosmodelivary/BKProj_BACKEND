package com.academy.delivary.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.academy.delivery.service.StoreDeliveryDto;
import com.academy.delivery.service.StoreDeliveryService;
import com.academy.delivery.service.StoreService;
import com.academy.delivery.service.impl.StoreDeliveryServiceImpl;
import com.academy.delivery.service.impl.StoreServiceImpl;

public class StoreDeliverySelectorController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreService			storeService	= new StoreServiceImpl();
		StoreDeliveryService	deliveryService	= new StoreDeliveryServiceImpl();
		List<StoreDeliveryDto>	storeDelivery	= deliveryService.selectList();
		
		JSONObject				object			= null;

		try {
			int			index	= 0;
			JSONParser	parser	= new JSONParser();

			// selector에서 선택되어 있는 index 숫자로 변환
			if (req.getParameter("index") != null) {
				object	= (JSONObject) parser.parse(req.getParameter("index"));
				index	= object.get("index").toString() != null ? Integer.parseInt(object.get("index").toString()) - 1 : 0;
			}

			System.out.println("index: " + index);
			// ajax에 돌려줄 매장 주소 json 객체에 저장
			object		= new JSONObject();
			object.put("address", storeService.getDeliveryAddr(storeDelivery.get(index).getStore_no()));
			
			

			// 저장된 객체 응답 객체에 기록
			resp.setContentType("application/x-json");
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().write(object.toJSONString());

		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		// req.getRequestDispatcher("/admin/store/delivery/view.jsp").forward(req, resp);
		
	}

}

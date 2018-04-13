package com.academy.delivary.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.academy.delivery.service.CartDto;
import com.academy.delivery.service.CartService;
import com.academy.delivery.service.StoreDeliveryDto;
import com.academy.delivery.service.StoreDeliveryService;
import com.academy.delivery.service.StoreService;
import com.academy.delivery.service.impl.CartServiceImpl;
import com.academy.delivery.service.impl.StoreDeliveryServiceImpl;
import com.academy.delivery.service.impl.StoreServiceImpl;

public class OrderToAndroidController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CartService		cartService		= new CartServiceImpl();
		List<CartDto> 	dtoList			= null;

		req.setCharacterEncoding("UTF-8");
		try {
			if (req.getParameter("PostData") != null) {
				System.out.println(req.getParameter("PostData"));
				dtoList	= cartService.selectToAndroid(req.getParameter("PostData"));
				
				System.out.println(dtoList.size());
				
				JSONArray	jsonArray	= new JSONArray();
				for (CartDto dto : dtoList) {
					JSONObject		jsonObject	= new JSONObject();
					jsonObject.put("order_no", dto.getOrder_no());
					jsonObject.put("order_addr", dto.getOrder_addr());
					jsonObject.put("member_name", dto.getMember_name());
					jsonObject.put("total_price", dto.getTotal_price());
					jsonArray.add(jsonObject);
				}
				
				System.out.println(jsonArray.toJSONString());
				
				// 저장된 객체 응답 객체에 기록
				resp.setContentType("application/x-json");
				resp.setCharacterEncoding("UTF-8");
				resp.getWriter().write(jsonArray.toJSONString());
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}

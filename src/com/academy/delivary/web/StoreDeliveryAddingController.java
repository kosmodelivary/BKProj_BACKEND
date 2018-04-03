package com.academy.delivary.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.academy.delivery.service.StoreDeliveryDto;
import com.academy.delivery.service.StoreDeliveryService;
import com.academy.delivery.service.StoreService;
import com.academy.delivery.service.impl.StoreDeliveryServiceImpl;
import com.academy.delivery.service.impl.StoreServiceImpl;

public class StoreDeliveryAddingController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		JSONObject 				object;
		JSONParser				parser			= new JSONParser();
		StoreService			storeService	= new StoreServiceImpl();
		StoreDeliveryService	deliveryService	= new StoreDeliveryServiceImpl();

		req.setCharacterEncoding("UTF-8");
		
		try {
			if (req.getParameter("PostData") != null) {
				object = (JSONObject) parser.parse(req.getParameter("PostData"));
				if (object != null) {
					StoreDeliveryDto	dto	= new StoreDeliveryDto();
					
					dto.setDelivery_no(object.get("uuid").toString());
					dto.setStore_no(storeService.selectOneByName(object.get("store").toString()).getStore_no());
					deliveryService.insert(dto);
				}
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} 
		// resp.sendRedirect("/admin/store/delivery/view.jsp");
	}
}

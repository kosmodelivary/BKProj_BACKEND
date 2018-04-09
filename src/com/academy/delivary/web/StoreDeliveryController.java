package com.academy.delivary.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.academy.delivery.service.StoreDeliveryDto;
import com.academy.delivery.service.StoreDeliveryService;
import com.academy.delivery.service.StoreService;
import com.academy.delivery.service.impl.StoreDeliveryServiceImpl;
import com.academy.delivery.service.impl.StoreServiceImpl;

import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class StoreDeliveryController extends HttpServlet  {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StoreService			storeService	= new StoreServiceImpl();
		StoreDeliveryService	deliveryService	= new StoreDeliveryServiceImpl();
		List<StoreDeliveryDto>	storeDelivery	= deliveryService.selectList();
		
		req.setAttribute("storeDelivery", storeDelivery);
		req.setAttribute("nowDelivery", deliveryService.getTotalDeliveryCount());
		
		req.getRequestDispatcher("/admin/store/delivery/view.jsp").forward(req, resp);
		
	}

}

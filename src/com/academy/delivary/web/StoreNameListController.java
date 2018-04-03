package com.academy.delivary.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

import org.json.simple.JSONObject;

import com.academy.delivery.service.StoreService;
import com.academy.delivery.service.impl.StoreServiceImpl;

public class StoreNameListController extends HttpServlet {

	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");

		StoreService	service		= new StoreServiceImpl();
		List<String>	storeList	= service.selectListofName(); 
		
		JSONObject		jsonObject	= new JSONObject();
		jsonObject.put("storeName", Arrays.toString(storeList.toArray()));
		
		PrintWriter 	out 		= resp.getWriter();
		out.print(jsonObject);
		out.flush();
		out.close();
	}

}

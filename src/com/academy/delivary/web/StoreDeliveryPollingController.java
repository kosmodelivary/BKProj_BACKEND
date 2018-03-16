package com.academy.delivary.web;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class StoreDeliveryPollingController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		JSONParser	parser	= new JSONParser();
		JSONObject 	object;

		try {
			if (req.getParameter("PostData") != null) {
				/*
				System.out.println("1");
				object = (JSONObject) parser.parse(req.getParameter("PostData"));
				if (object != null) {
					System.out.println("2");
					req.setAttribute("uuid", object.get("uuid").toString());
					req.setAttribute("latitude", object.get("latitude").toString());
					req.setAttribute("longitude", object.get("longitude").toString());
					req.setAttribute("providerStr", object.get("providerStr").toString());
					System.out.println(object.get("latitude").toString());
					req.setAttribute("loc", object.toJSONString());
					resp.getWriter().print(object);
					resp.getWriter().print(object.toJSONString());
					
					List<Map>			collections		= new Vector<Map>();
					Map location = new HashMap();
					location.put("latitude", object.get("latitude").toString());
					location.put("longitude", object.get("longitude").toString());
					
					req.setAttribute("data", JSONArray.toJSONString(collections));
					System.out.println(JSONArray.toJSONString(collections));
				*/

				object = (JSONObject) parser.parse(req.getParameter("PostData"));
				if (object != null) {
					File file	= null;
					file 		= new File("/admin/store/delivery/json/" + object.get("uuid").toString() + ".json");
					file.createNewFile();
					FileWriter	fw		= new FileWriter(file);
					fw.write(object.toJSONString());
					System.out.println("json 파일 출력 완료: " + object.toJSONString());
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
//		req.getRequestDispatcher("/admin/store/delivery/view.jsp").forward(req, resp);
		resp.sendRedirect("/admin/store/delivery/view.jsp");
		
	}
	
}

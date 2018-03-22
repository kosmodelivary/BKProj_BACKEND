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
				object = (JSONObject) parser.parse(req.getParameter("PostData"));
				if (object != null) {
					File file	= 
							new File(req.getServletContext().getRealPath("/admin/store/delivery/json/") + object.get("uuid").toString() + ".json");
					FileWriter	fw		= new FileWriter(file);
					fw.write(object.toJSONString());
					fw.flush();
					fw.close();
					System.out.println("json 파일 출력 완료: " + 
							req.getServletContext().getRealPath("/admin/store/delivery/json/") + object.get("uuid").toString() + ".json");
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		resp.sendRedirect("/admin/store/delivery/view.jsp");
	}
	
}

package com.academy.delivary.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
					req.setAttribute("uuid", object.get("uuid").toString());
					req.setAttribute("latitude", object.get("latitude").toString());
					req.setAttribute("longitude", object.get("longitude").toString());
					req.setAttribute("providerStr", object.get("providerStr").toString());
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		req.getRequestDispatcher("/admin/store/delivery/view.jsp").forward(req, resp);
		
	}
	
}

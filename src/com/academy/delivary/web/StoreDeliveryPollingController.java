package com.academy.delivary.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.academy.delivery.common.AWSService;
import com.academy.delivery.common.NCloudService;


public class StoreDeliveryPollingController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		JSONParser	parser	= new JSONParser();
		JSONObject 	object;

		try {
			if (req.getParameter("PostData") != null) {
				object = (JSONObject) parser.parse(req.getParameter("PostData"));
				if (object != null) {
					// json 파일 생성
					String	fileFullPath 	= 
							req.getServletContext().getRealPath("/admin/store/delivery/json/") + object.get("uuid").toString() + ".json";
					File 		file  	= new File(fileFullPath);
					FileWriter	fw		= new FileWriter(file);
					fw.write(object.toJSONString());
					fw.flush();
					fw.close();
					
					// 생성된 json 파일 업로드
					NCloudService	ncloud	= new NCloudService();
					ncloud.upload(file, "delivery");
					
					// 스토리지 업로드 완료했으므로 파일 삭제
					file.delete();
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		} 
//		resp.sendRedirect("/admin/store/delivery/view.jsp");
	}
	
}

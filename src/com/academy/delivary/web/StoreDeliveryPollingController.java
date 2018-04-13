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
					// json 파일 임시 저장할 폴더 유무 확인
					String	jsonPath		= req.getServletContext().getRealPath("/admin/store/delivery/json/");
					File	jsonDir			= new File(jsonPath);
					if (!jsonDir.exists()) {
						jsonDir.mkdir();
					}

					// json 파일 생성
					File 		jsonFile  	= new File(jsonPath + object.get("uuid").toString() + ".json");
					jsonFile.createNewFile();
					
					// 생성된 json 파일 stream 연결
					FileWriter	fw		= new FileWriter(jsonFile);
					fw.write(object.toJSONString());
					fw.flush();
					fw.close();
					
					// 생성된 json 파일 업로드
					NCloudService	ncloud	= new NCloudService();
					ncloud.upload(jsonFile, "delivery");
					
					// 스토리지에 업로드 완료했으므로 json 파일 삭제
					jsonFile.delete();
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		} 
//		resp.sendRedirect("/admin/store/delivery/view.jsp");
	}
	
}

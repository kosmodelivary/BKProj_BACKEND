package com.academy.delivary.web;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

public class MemberEmailFormController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");
		
		// json 파일 임시 저장할 폴더 유무 확인
		String		jsonPath		= req.getServletContext().getRealPath("/admin/member/json/");
		File		jsonDir			= new File(jsonPath);
		if (!jsonDir.exists()) {
			jsonDir.mkdir();
		}
		// json 파일 생성
		File 		jsonFile  	= new File(jsonPath + "sendState.json");
		jsonFile.createNewFile();
		
		// json 파일 초기 설정
		JSONObject 	object		= new JSONObject();
		setJsonObject(object, -1, -1);
		FileWriter	fw			= new FileWriter(jsonFile);
		fw.write(object.toJSONString());
		fw.flush();
		fw.close();
		
		req.getRequestDispatcher("/admin/member/emailForm.jsp").forward(req, resp);
	}
	
	private void setJsonObject(JSONObject object, int total, int complete) {
		object.put("total", total);
		object.put("complete", complete);
	}

}

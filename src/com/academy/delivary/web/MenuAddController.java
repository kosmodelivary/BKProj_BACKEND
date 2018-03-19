package com.academy.delivary.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.academy.delivery.common.AWSService;
import com.academy.delivery.service.MenuDto;
import com.academy.delivery.service.MenuService;
import com.academy.delivery.service.impl.MenuServiceImpl;


public class MenuAddController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req,
						   HttpServletResponse resp
						   ) throws ServletException, IOException {
		MenuService	menuService		= new MenuServiceImpl();

		// get  방식	: 추가 폼 이동
		// post 방식	: 추가 처리
		if (req.getMethod().equalsIgnoreCase("get")) {
			req.getRequestDispatcher("/admin/menu/add.jsp").forward(req, resp);
		} else {
			
			/* 업로드 참조, 멀티파트(cos.jar 방식 아님 aws 전용)
			 * https://stackoverflow.com/questions/17937841/multipart-form-data-does-not-support-for-request-getparamerter
			 */ 
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload sfu = new ServletFileUpload(factory);
			MenuDto menuDto = new MenuDto();
			try {
				List<FileItem> list = sfu.parseRequest(req);
				for(FileItem item : list) {
					if(item.isFormField()) {
						switch (item.getFieldName()) {
							case "menu_name":
								menuDto.setMenu_name(item.getString());
								break;
							case "category_name":
								menuDto.setCategory_name(item.getString());
								break;
							case "menu_price":
								menuDto.setMenu_price(item.getString());
								break;
							case "menu_weight":
								menuDto.setMenu_weight(item.getString());
								break;
							case "menu_calrorie":
								menuDto.setMenu_calrorie(item.getString());
								break;
							case "menu_protein":
								menuDto.setMenu_protein(item.getString());
								break;
							case "menu_sodium":
								menuDto.setMenu_sodium(item.getString());
								break;
							case "menu_sugars":
								menuDto.setMenu_sugars(item.getString());
								break;
							case "menu_fat":
								menuDto.setMenu_fat(item.getString());
								break;
						}
					}
					else {
		                AWSService amazonS3 = new AWSService();
		                amazonS3.uploadFile(item.getInputStream(),
		                					item.getSize(), 
		                					FilenameUtils.getName(item.getName()));
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			} finally {
				System.out.println(menuDto.getMenu_name());
				menuService.insert(menuDto);
				resp.sendRedirect(req.getContextPath() + "/ADMIN/MENU/All.do");
			}
			
		}
		
	} // end service
	
} // end MenuAddController 
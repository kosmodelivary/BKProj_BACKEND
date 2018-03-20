package com.academy.delivary.web;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
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
import com.academy.delivery.service.StoreDto;
import com.academy.delivery.service.StoreService;
import com.academy.delivery.service.impl.MenuServiceImpl;
import com.academy.delivery.service.impl.StoreServiceImpl;

import jdk.nashorn.internal.parser.DateParser;

public class MenuEditController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		MenuService	menuService		= new MenuServiceImpl();

		// get  방식	: 수정 폼 이동
		// post 방식	: 수정 처리
		if (req.getMethod().equalsIgnoreCase("get")) {
			MenuDto	menuDto		= menuService.selectOne(req.getParameter("no"));
			
			req.setAttribute("menuDto", menuDto);
			req.getRequestDispatcher("/admin/menu/edit.jsp").forward(req, resp);
		} else {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload sfu = new ServletFileUpload(factory);
			MenuDto menuDto = new MenuDto();
			String filename = null;
			try {
				List<FileItem> list = sfu.parseRequest(req);
				for(FileItem item : list) {
					if(item.isFormField()) {
						switch (item.getFieldName()) {
							case "menu_no":
								menuDto = menuService.selectOne(item.getString());
								filename = menuDto.getMenu_name()+menuDto.getMenu_file_extension();
								System.out.println(filename);
								break;
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
							case "menu_enddate":
								menuDto.setMenu_enddate(Date.valueOf(item.getString()));
						}
					}
					else {
						if(item.getName().equalsIgnoreCase(filename)) {
							AWSService amazonS3 = new AWSService();
			                amazonS3.uploadFile(item.getInputStream(),
			                					item.getSize(), 
			                					FilenameUtils.getName(item.getName()));
			                int idx = item.getName().indexOf('.');
			                menuDto.setMenu_file_extension(item.getName().substring(idx));
						}
						else {
							AWSService amazonS3 = new AWSService();
			                amazonS3.deleteFile(FilenameUtils.getName(filename));
			                amazonS3.uploadFile(item.getInputStream(),
                					item.getSize(), 
                					FilenameUtils.getName(item.getName()));
			                int idx = item.getName().indexOf('.');
			                menuDto.setMenu_file_extension(item.getName().substring(idx));
						}
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			} finally {
				req.setAttribute("EDIT_RESULT", menuService.update(menuDto));
				req.getRequestDispatcher("/admin/menu/process.jsp").forward(req, resp);
			}
		}
	} // end service
	
} // end MenuEditController

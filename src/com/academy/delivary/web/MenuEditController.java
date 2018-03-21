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

	String filename;
	@Override
	protected void service(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		MenuService	menuService		= new MenuServiceImpl();
		
		// get  방식	: 수정 폼 이동
		// post 방식	: 수정 처리
		if (req.getMethod().equalsIgnoreCase("get")) {
			MenuDto	menuDto		= menuService.selectOne(req.getParameter("no"));
			filename = menuDto.getMenu_name()+menuDto.getMenu_file_extension();
			System.out.println("원래 업로드된 파일명 : "+filename);
			req.setAttribute("menuDto", menuDto);
			req.getRequestDispatcher("/admin/menu/edit.jsp").forward(req, resp);
		} else {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload sfu = new ServletFileUpload(factory);
			MenuDto menuDto = new MenuDto();
			String menu_name = null;
			int idx = -1;
			try {
				List<FileItem> list = sfu.parseRequest(req);
				for(FileItem item : list) {
					if(item.isFormField()) {
						switch (item.getFieldName()) {
							case "menu_no":
								System.out.println("menu_no : "+item.getString());
								menuDto.setMenu_no(item.getString());
								break;
							case "menu_name":
								menu_name = new String(item.getString().getBytes("8859_1"),"utf-8");
								System.out.println("menu_name : "+menu_name);
								menuDto.setMenu_name(menu_name);
								break;
							case "category_name":
								System.out.println("category_name : "+item.getString());
								menuDto.setCategory_name(item.getString());
								break;
							case "menu_price":
								System.out.println("menu_price : "+item.getString());
								menuDto.setMenu_price(item.getString());
								break;
							case "menu_weight":
								System.out.println("menu_weight : "+item.getString());
								menuDto.setMenu_weight(item.getString());
								break;
							case "menu_calrorie":
								System.out.println("menu_calrorie : "+item.getString());
								menuDto.setMenu_calrorie(item.getString());
								break;
							case "menu_protein":
								System.out.println("menu_protein : "+item.getString());
								menuDto.setMenu_protein(item.getString());
								break;
							case "menu_sodium":
								System.out.println("menu_sodium : "+item.getString());
								menuDto.setMenu_sodium(item.getString());
								break;
							case "menu_sugars":
								System.out.println("menu_sugars : "+item.getString());
								menuDto.setMenu_sugars(item.getString());
								break;
							case "menu_fat":
								System.out.println("menu_fat : "+item.getString());
								menuDto.setMenu_fat(item.getString());
								break;
							case "menu_enddate":
								System.out.println("menu_enddate : "+item.getString());
								menuDto.setMenu_enddate(Date.valueOf(item.getString()));
								break;
						}
					}
					else {
						idx = FilenameUtils.getName(item.getName()).indexOf('.');
						if(!FilenameUtils.getName(item.getName()).equalsIgnoreCase(filename)) {
							AWSService amazonS3 = new AWSService();
			                amazonS3.deleteFile(filename);
			                amazonS3.uploadFile(item.getInputStream(),
                					item.getSize(), 
                					FilenameUtils.getName(item.getName()));
			                menuDto.setMenu_file_extension(FilenameUtils.getName(item.getName()).substring(idx));
			                System.out.println("Menu_file_extension : "+FilenameUtils.getName(item.getName()).substring(idx));
						}
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			} finally {
				System.out.println("menu_name : "+menuDto.getMenu_name());
				System.out.println("category_name : "+menuDto.getCategory_name());
				System.out.println("menu_price : "+menuDto.getMenu_price());
				System.out.println("menu_weight : "+menuDto.getMenu_weight());
				System.out.println("menu_calrorie : "+menuDto.getMenu_calrorie());
				System.out.println("menu_protein : "+menuDto.getMenu_protein());
				System.out.println("menu_sodium : "+menuDto.getMenu_sodium());
				System.out.println("menu_sugars : "+menuDto.getMenu_sugars());
				System.out.println("menu_fat : "+menuDto.getMenu_fat());
				System.out.println("menu_enddate : "+menuDto.getMenu_enddate());
				System.out.println("menu_file_extension : "+menuDto.getMenu_file_extension());
				req.setAttribute("EDIT_RESULT", menuService.update(menuDto));
				req.getRequestDispatcher("/admin/menu/process.jsp").forward(req, resp);
			}
		}
	} // end service
	
} // end MenuEditController

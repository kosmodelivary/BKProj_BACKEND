package com.academy.delivary.web;

import java.io.IOException;
import java.io.InputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.sql.Date;
import java.util.Arrays;
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
import com.academy.delivery.common.NCloudService;
import com.academy.delivery.service.MenuDto;
import com.academy.delivery.service.MenuService;
import com.academy.delivery.service.impl.MenuServiceImpl;

import jdk.jfr.events.FileWriteEvent;


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
			String menu_name = null;
			try {
				List<FileItem> list = sfu.parseRequest(req);
				for(FileItem item : list) {
					if(item.isFormField()) {
						switch (item.getFieldName()) {
							case "menu_name":
//								http://entro80.tistory.com/17
								menu_name = new String(item.getString().getBytes("8859_1"),"utf-8");
								System.out.println("menu_name"+menu_name);
								menuDto.setMenu_name(menu_name);
								break;
							case "category_name":
								System.out.println("category_name"+item.getString());
								menuDto.setCategory_name(item.getString());
								break;
							case "menu_price":
								System.out.println("menu_price"+item.getString());
								menuDto.setMenu_price(item.getString());
								break;
							case "menu_weight":
								System.out.println("menu_weight"+item.getString());
								menuDto.setMenu_weight(item.getString());
								break;
							case "menu_calrorie":
								System.out.println("menu_calrorie"+item.getString());
								menuDto.setMenu_calrorie(item.getString());
								break;
							case "menu_protein":
								System.out.println("menu_protein"+item.getString());
								menuDto.setMenu_protein(item.getString());
								break;
							case "menu_sodium":
								System.out.println("menu_sodium"+item.getString());
								menuDto.setMenu_sodium(item.getString());
								break;
							case "menu_sugars":
								System.out.println("menu_sugars"+item.getString());
								menuDto.setMenu_sugars(item.getString());
								break;
							case "menu_fat":
								System.out.println("menu_fat"+item.getString());
								menuDto.setMenu_fat(item.getString());
								break;
							case "menu_enddate":
								System.out.println("menu_enddate"+item.getString());
								menuDto.setMenu_enddate(Date.valueOf(item.getString()));
						}
					}
					else {
//		                AWSService amazonS3 = new AWSService();
//		                amazonS3.uploadFile(item.getInputStream(),
//		                					item.getSize(), 
//		                					FilenameUtils.getName(item.getName()));
						NCloudService ncloud = new NCloudService();
						String filepath = req.getServletContext().getRealPath("/admin/menu/"+FilenameUtils.getName(item.getName()));
						File file = new File(filepath);
						FileOutputStream fos = new FileOutputStream(filepath);
						int data = -1;
						byte [] b = new byte[128];
						System.out.println("파일 생성 완료 - 파일존재여부 : "+file.exists());
						InputStream is = item.getInputStream(); 
						while((data = is.read(b)) != -1){
							fos.write(b,0,data);
							fos.flush();
						}
						System.out.println("여기까지 오는가?");
						if(is != null) is.close();
						if(fos != null) fos.close();

						ncloud.upload(file, "menu");
						
						file.delete();

						int idx = FilenameUtils.getName(item.getName()).indexOf('.');
		                menuDto.setMenu_file_extension(FilenameUtils.getName(item.getName()).substring(idx));
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			} finally {
				menuService.insert(menuDto);
				resp.sendRedirect(req.getContextPath() + "/ADMIN/MENU/All.do");
			}
			
		}
		
	} // end service
	
} // end MenuAddController 
package com.academy.delivery.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUtils {
	
//	파일 업로드 로직
	public static MultipartRequest upload(HttpServletRequest req, String saveDir) {
		MultipartRequest mr = null;
		
		try {
			mr = new MultipartRequest(req, saveDir, 1024*1024*500, "UTF-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {e.printStackTrace();}
		
		return mr;
	}
	
//	파일 삭제 로직
	public static void deleteFile(HttpServletRequest req, String filename) {
		
		//서버의 물리적 경로 얻어오기
		String path = req.getServletContext().getRealPath("/Upload");
//		DataRoomDTO drdto = new DataRoomDTO();
		
		File del_file = new File(path+File.separator+filename);// "/" 로 안한 이유는 윈도우는 \로 접근하기 때문?
		if(del_file.exists()) {
			del_file.delete();
		}
	}
	
//	파일 다운로드 로직
	public static void download(HttpServletRequest request, HttpServletResponse response,
								String directory, String filename) {
		/*
		웹브라우저가 인식하지 못하는 컨텐츠 타입을 응답헤더 설정하면 웹브라우저는 자체 다운로드창을 띄움.
		서버에 저장된 파일을 출력스트림을 통해 웹브라우저에 출력한다.
		*/
		//out.println(filename);[확인]
				
		//2]파일이 저장된 서버의 물리적 경로 얻기
		String saveDirectory = request.getServletContext().getRealPath(directory);//getRealPath 중요한 메소드.
		
		//3]파일 크기를 얻기 위한 파일 객체 생성
		//  - 다운로드시 프로그레스바를 표시하기 위함. 윈도우 separator \ 맥 & 유닉스 & 리눅스 separator /
		File file = new File(saveDirectory+File.separator+filename);//파일 전체경로 표시
		long length = file.length();
		
		/*
			다운로드를 위한 응답 헤더 설정
		*/
		//4]다운로드창을 보여주기 위한 응답헤더 설정
		//4-1]웹브라우저가 인식하지 못하는 컨텐츠타입(MIME)타입 결정.
		response.setContentType("binary/octect-stream");
		
		//4-2]다운로드시 프로그레스바를 표시하기 위한 컨텐츠 길이 설정
		response.setContentLength((int)length);
		
		//4-3]응답헤더명 : Content-Disposition
	/*
			   응답헤더명에 따른 값 : attachment;filename=파일명
			  setHeader(응답헤더명,헤더값)으로 추가
			   브라우저 종류에 따라 한글파일명이 깨지는 경우가 있으므로
			   브라우저별 인코딩 방식을 달리 하자(파일명을 인코딩)
	*/
		boolean isIE = request.getHeader("user-agent").toUpperCase().indexOf("MSIE") != -1 ||
					   request.getHeader("user-agent").indexOf("11.0") != -1;
		try {
			if(isIE) {//브라우저가 IE 라면
				filename = URLEncoder.encode(filename, "UTF-8");
			}
			else {//그 외의 브라우저(파폭, 크롬 외 등등..)
				//new String(byte[] bytes, String charset)사용
				//1]파일명을 byte형 배열로 변환
				//2]String클래스 생성자에 변환한 배열과 charset에는 8859_1을 지정
				filename = new String(filename.getBytes("UTF-8"), "8859_1");
			}
			
			response.setHeader("Content-Disposition", "attachment;filename="+filename);
			//다운로드를 위한 응답헤더 설정이 끝남.
			
			//IO작업을 통해 서버에 있는 파일을 웹브라우저에 바로 출력
			/*
				데이터 소스 : 파일 - 노드 스트림 : FileInputStream
								필터 스트림 : BufferedInputStream
				데이터 목적지 : 파일 - 노드 스트림 : response.getOutputStream()
								   필터 스트림 : BufferedOutputStream
			*/
			
			BufferedInputStream bis =
				new BufferedInputStream(new FileInputStream(file));
			/*
				jsp에서 servlet으로 변환시 내부적으로 out객체가 지역변수로 선언되며 생성된다.
				out내장객체 생성 후 response내장객체로 출력스트림 얻으면 이미 생성된
				out내장객체와 충돌이 나타나서 이미 호출되었다는 에러메시지가 뜬다.
				단, 서블릿에서는 상관없다.
				response객체로 출력스트림 생성 전에
				다음과 같이 기존의 out 객체를 초기화하는 코드를 넣어주면 된다.
				out.clear(); 
				out = pageContext.pushBody();
			
			
			out.clear(); 
			out = pageContext.pushBody();
			*/
			
//			6]웹브라우저에 연결할 출력 스트림 생성
			BufferedOutputStream bos =
				new BufferedOutputStream(response.getOutputStream());
			
//			7]bis로 읽고 bos로 웹브라우저에 출력
			int data;
			while((data = bis.read()) != -1){
				bos.write(data);
				bos.flush();
			}
			
//			8]스트림 닫기
			bis.close();
			bos.close();
		}
		catch(Exception e) {e.printStackTrace();}
	}
}

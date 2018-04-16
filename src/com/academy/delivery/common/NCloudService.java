package com.academy.delivery.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.net.URLEncoder;

import com.ncloud.filestorage.FSRestClient;
import com.ncloud.filestorage.model.FSClientException;
import com.ncloud.filestorage.model.FSMetaData;
import com.ncloud.filestorage.model.FSResourceID;
import com.ncloud.filestorage.model.FSResourceInfo;
import com.ncloud.filestorage.model.FSServiceException;
import com.ncloud.filestorage.model.FSUploadFileResult;
import com.ncloud.filestorage.model.FSUploadSourceInfo;

public class NCloudService {
	
	private FSRestClient	client;

	public NCloudService() {
		
	} // public NCloudService
	
	/*
	 * file: 업로드할 파일 객체
	 * uploadKeyworld: 업로드할 파일 특징 키워드
	 *   > delivery: 딜리버리에 사용할 json
	 *   > menu: 메뉴에 사용할 image (jpg, png)
	 */
	public void upload(File file, String uploadKeyword) {
		initialize();
		
		FSResourceID		rid 		= null;
		FSUploadSourceInfo 	info 		= null;
		String				contentType	= getContentType(uploadKeyword, file); 
				
		try {
			if (uploadKeyword.contains("delivery")) {
				rid = new FSResourceID("bkproject/json/delivery/" + URLEncoder.encode(file.getName(), "UTF-8"));
			}
			else if (uploadKeyword.contains("menu")) {
				String filename = URLEncoder.encode(file.getName(), "UTF-8");
				rid = new FSResourceID("bkproject/image/menu/" + filename);
			}
			info 	= new FSUploadSourceInfo(file, contentType, null);
			
			uploadFile(file, contentType, rid, info);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
			// 이미 있는 파일이면 지우고 다시 업로드
			if (e.getMessage().contains("alreayExistFile")) {
				try {
					client.deleteFile(rid, null);
					uploadFile(file, contentType, rid, info);
				} catch (Exception e1) {
					e1.printStackTrace();
				} 
			}
		}
		
		//더 이상 사용하지 않는 경우 초기화 시 생성한 resource를 제거한다
		FSRestClient.destroy();
	}
	
	
	
	public void delete(String fileName) {
		initialize();

		try {
			FSResourceID	rid = new FSResourceID("bkproject/json/delivery/" + fileName);
			client.deleteFile(rid, null);
		} catch (FSClientException e) {
			e.printStackTrace();
		} catch (FSServiceException e) {
			e.printStackTrace();
		}
		
		FSRestClient.destroy();
	} // delete
	
	// ------------------------------------------------------------------------------------------------
	private void initialize() {
		FSRestClient.initialize();
		client	= new FSRestClient("restapi.fs.ncloud.com", 
									80, 
									"4QMvvaLtS0qh2dvhYKOc", 
									"KCpV1vUEFli6IIozTahgAvn4j2jtj9exnq5XDA4A");
	} // initialize
	
	private void uploadFile(File file, String fileType, FSResourceID rid, FSUploadSourceInfo info) 
			throws FileNotFoundException, FSClientException, FSServiceException {
		FileInputStream		fis		= new FileInputStream(file);
		info 						= new FSUploadSourceInfo(fis, fileType, file.length(), null);
		FSUploadFileResult 	result 	= client.uploadFile(rid, info);
	} // uploadFile
	
	
	
	private String getContentType(String uploadKeyword, File file) {
		if (uploadKeyword.trim().equalsIgnoreCase("delivery")) {
			return "application/json";
		} else if (uploadKeyword.trim().equalsIgnoreCase("menu")) {
			if (file.getName().contains("jpg")) {
				return "image/jpeg";
			} else if (file.getName().contains("png")) {
				return "image/png";
			}
		}
		
		return null;
	} // getContentType

} // NCloudService

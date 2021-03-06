package com.academy.delivery.common;

import java.io.InputStream;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.DeleteObjectsRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3ObjectSummary;

public class AWSService {
    private static final String BUCKET_NAME = "bkprojserver";
    private static final String BUCKET_JSON = "bkproj-json";
    
    private static final String ACCESS_KEY = "AKIAJY7ID7RJTQE7EB5Q";
    private static final String SECRET_KEY = "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";
    private AmazonS3 amazonS3;
    private ObjectMetadata omd;
 
    public AWSService() {
        AWSCredentials awsCredentials = new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY);
        amazonS3 = new AmazonS3Client(awsCredentials);
    }
 
    // ------- Menu 관리 전용 시작
    public void uploadFile(InputStream is, Long size, String filename) {
        if (amazonS3 != null) {
            try {
            	int idx = filename.lastIndexOf(".");
            	omd = new ObjectMetadata();
            	omd.setContentLength(size);
            	omd.setContentType("image/"+filename.substring(idx+1));
                com.amazonaws.services.s3.model.PutObjectRequest putObjectRequest =
                		new PutObjectRequest(BUCKET_NAME, filename, is, omd);
                putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead);
                amazonS3.putObject(putObjectRequest); // upload file
                is.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                amazonS3 = null;
            }
        }
    }
    
    public void deleteFile(String filename) {
    	amazonS3.deleteObject(BUCKET_NAME, filename);
    }
    // ------- Menu 관리 전용 끝
    

    // ------- 위도, 경도 json 관리 전용 시작
    public void uploadJson(InputStream is, Long size, String filename) {
        if (amazonS3 != null) {
            try {
            	int idx = filename.lastIndexOf(".");
            	omd = new ObjectMetadata();
            	omd.setContentLength(size);
            	omd.setContentType("application/json");
                com.amazonaws.services.s3.model.PutObjectRequest putObjectRequest =
                		new PutObjectRequest(BUCKET_JSON, filename, is, omd);
                putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead);
                amazonS3.putObject(putObjectRequest); // upload file
                is.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                amazonS3 = null;
            }
        }
    }

    public void deleteJson(String filename) {
    	amazonS3.deleteObject(BUCKET_JSON, filename);
    }
    // ------- 위도, 경도 json 관리 전용 시작
    
}



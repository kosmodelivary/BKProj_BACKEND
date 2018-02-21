package com.academy.delivery.common;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class IbatisUtil {

	private static 	SqlMapClient sqlMapper;
	
	static {
	   try {
	     Reader 	reader 	= Resources.getResourceAsReader("ibatis/SqlMapConfig.xml");
	     sqlMapper 			= SqlMapClientBuilder.buildSqlMapClient(reader);
	     reader.close(); 
	   } catch (IOException e) {
	   		e.printStackTrace();
	   }
	}
	
	public static SqlMapClient getMapper() {
		return sqlMapper;	
	}
	
}

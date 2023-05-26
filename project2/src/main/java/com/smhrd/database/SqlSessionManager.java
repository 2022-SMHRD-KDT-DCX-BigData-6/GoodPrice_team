package com.smhrd.database;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// DB설정 정보를 읽어온 후 DB관련 처리를 할 수 있도록 해주는 역활
public class SqlSessionManager {
	  public static SqlSessionFactory sqlSessionFactory;
	   
	  static {

	      String resource = "com/smhrd/database/mybatis-config.xml";

	      Reader reader;
	      try {
	   
	         reader = Resources.getResourceAsReader(resource);
	      
	         sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
	      }catch (IOException e) {
	         e.printStackTrace();
	      }
	   }
	   

	   public static SqlSessionFactory getSqlSession() {
	      return sqlSessionFactory;
	   }
}

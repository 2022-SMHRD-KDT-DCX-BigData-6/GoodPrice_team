package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tb_storeDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	public List<tb_storeDTO> showStore(){

		List<tb_storeDTO> store_list = sqlSession.selectList("com.smhrd.database.StoreMapper.selectAllStore");
		
		sqlSession.close();
		
		return store_list;
	}
}

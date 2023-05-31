package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tb_storeDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	public List<tb_storeDTO> selectAllStore(){

		List<tb_storeDTO> store_list = sqlSession.selectList("selectAllStore");
		
		sqlSession.close();
		
		return store_list;
	}

	public List<tb_storeDTO> selectStore(tb_storeDTO dto){
		
		List<tb_storeDTO> store_list = sqlSession.selectList("selectStore", dto);
		
		sqlSession.close();
		
		return store_list;
	}
}

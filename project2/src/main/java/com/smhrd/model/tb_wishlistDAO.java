package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tb_wishlistDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

	public int insertWish(tb_wishlistDTO dto){
		
		int cnt = 0;
		
		cnt = sqlSession.insert("insertWish", dto);
		
		sqlSession.close();
		
		return cnt;
	}
	
	public int CountWish(tb_wishlistDTO dto) {
		
		int cnt = 0;
		
		cnt = sqlSession.selectOne("CountWish", dto);
		
		sqlSession.close();
		
		return cnt;
		
	}
	
}

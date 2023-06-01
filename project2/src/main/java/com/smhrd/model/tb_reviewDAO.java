package com.smhrd.model;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tb_reviewDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	
	public int insertReview(tb_reviewDTO dto){
		
		int cnt = 0;
		
		cnt = sqlSession.insert("insertReview", dto);
		
		sqlSession.close();
		
		return cnt;
	}
	
	public int CountReview(tb_reviewDTO dto) {
		
		int cnt = 0;
		
		cnt = sqlSession.selectOne("CountReview", dto);
		
		sqlSession.close();
		
		return cnt;
		
	}
	
	public tb_reviewDTO SelectReviewData(tb_reviewDTO dto) {
		
		tb_reviewDTO data;
		
		data = sqlSession.selectOne("SelectReviewData", dto);
		
		sqlSession.close();
		
		return data;
	}
	
}

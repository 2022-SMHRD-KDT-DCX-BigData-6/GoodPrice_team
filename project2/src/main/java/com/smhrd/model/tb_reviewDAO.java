package com.smhrd.model;


import java.util.List;

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
	
		//마이페이지 리뷰목록 메소드 - 이은화 강효석
		public List<tb_reviewDTO> reviewList(String m_id) {
			
			List<tb_reviewDTO> result = null;
			
			result = sqlSession.selectList("reviewList", m_id);
			
			sqlSession.close();
			
			return result;
		}
		
		//마이페이지 리뷰 날짜 메소드- 이은화 강효석
		public List<tb_reviewDTO> dateToChar(String m_id) {
		
		List<tb_reviewDTO> result = null;

		result = sqlSession.selectList("dateToChar", m_id);
		
		sqlSession.close();
		return result;
		}
	
}

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
	
	// 가게별 평점 평균 조회하는 메서드
	public tb_reviewDTO SelectReviewData(tb_reviewDTO dto) {
		
		tb_reviewDTO data;
		
		data = sqlSession.selectOne("SelectReviewData", dto);
		
		sqlSession.close();
		
		return data;
		
	}
	
	// 가게별 이용자 성별 조회하는 메서드
	public GenderCountDTO SelectGenderData(tb_reviewDTO dto) {
		
		GenderCountDTO data = null;
		
		data = sqlSession.selectOne("SelectGenderData", dto);
		
		sqlSession.close();
		
		return data;
		
	}

	// 가게별 이용자 연령 조회하는 메서드
	public AgeCountDTO SelectAgeData(tb_reviewDTO dto) {
		
		AgeCountDTO data = null;
		
		data = sqlSession.selectOne("SelectAgeData", dto);
		
		sqlSession.close();
		
		return data;
		
	}

	// 가게별 리뷰 조회
	public List<ReviewListDTO> SelectReview(tb_reviewDTO dto) {
		
		List<ReviewListDTO> data = null;
		
		data = sqlSession.selectList("SelectReview", dto);
		
		sqlSession.close();
		
		return data;
		
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
	
	// 마이페이지 리뷰 삭제 메소드 - 이은화, 강효석
	
	public int reviewListDelete(int Review_idx) {
	
	int result = 0;
	
	result = sqlSession.delete("reviewListDelete", Review_idx);
	
	sqlSession.close();
	
	return result;
	}
			
	
}

package com.smhrd.model;

import java.util.List;

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
	
	//마이페이지 찜 리스트 (select - 가게이름) 메소드 - 이은화, 강효석
	public List<tb_wishlistDTO> wishList(String m_id) {
		
		List<tb_wishlistDTO> result = null;
		
		result = sqlSession.selectList("wishList", m_id);
	
		sqlSession.close();
		
		return result;
	}
	
	//마이페이지 찜 리스트 삭제 - 이은화 강효석
	public int delWishList(int wish_idx) {
		
		int result = 0;
		
		result = sqlSession.delete("delWishList", wish_idx);
		
		sqlSession.close();
		
		return result;
	}
	
	//찜 테이블 모든 컬럼 가져오는 메소드 - 강효석
	public List<tb_wishlistDTO> selectAllWish(String m_id) {
		
		List<tb_wishlistDTO> result = null;
		
		result = sqlSession.selectList("selectAllWish", m_id);
		
		sqlSession.close();
		
		return result;
		
		
	}
	
}

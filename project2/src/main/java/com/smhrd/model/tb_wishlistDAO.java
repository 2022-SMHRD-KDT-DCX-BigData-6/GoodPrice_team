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
	
	//마이페이지 찜 리스트 메소드 - 이은화, 강효석
	public List<tb_wishlistDTO> wishList(String m_id) {
		
		List<tb_wishlistDTO> result = null;
		
		result = sqlSession.selectList("wishList", m_id);
	
		sqlSession.close();
		
		return result;
	}
	
}

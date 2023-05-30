package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tb_boardDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	// 파일 업로드
	public int insertBoard(tb_boardDTO dto) {
		
		int cnt = 0;
		cnt = sqlSession.insert("com.smhrd.database.BoardMapper.insertBoard",dto);
		sqlSession.close();
		return 0;
	}
}

package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class WebMemberDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	public WebMemberDTO selectMember(WebMemberDTO dto) {
		
		WebMemberDTO member = null;
		
		member = sqlSession.selectOne("com.smhrd.database.WebMemberMapper.selectMember", dto);
		
		sqlSession.close();
		
		return member;
	}
	
	public int insertMember(WebMemberDTO dto) {
		
		int cnt = 0;
		
		cnt = sqlSession.insert("com.smhrd.database.WebMemberMapper.insertMember", dto);
		
		sqlSession.close();
		
		return cnt;
	}
	
	public int updateMember(WebMemberDTO dto) {
		
		int cnt = 0;
		
		cnt = sqlSession.insert("com.smhrd.database.WebMemberMapper.updateMember", dto);
		
		sqlSession.close();
		
		return cnt;
	}

	public int deleteMember(WebMemberDTO dto) {
		
		int cnt = 0;
		
		cnt = sqlSession.delete("com.smhrd.database.WebMemberMapper.deleteMember", dto);
		
		sqlSession.close();
		
		return cnt;
	}
	
	// 전체회원조희
	public List<WebMemberDTO> selectAllMember() {
		
		List<WebMemberDTO> list = sqlSession.selectList("com.smhrd.database.WebMemberMapper.selectAllMember");
		
		sqlSession.close();
		
		return list;
	}
	
	
}

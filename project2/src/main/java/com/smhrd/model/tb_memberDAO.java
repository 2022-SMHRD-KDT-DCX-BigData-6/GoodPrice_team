package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tb_memberDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	public int JoinService(tb_memberDTO paramJoinDto) {
		
		int result = 0;
		
		result = sqlSession.insert("com.smhrd.database.memberMapper.insertMember", paramJoinDto);
		
		sqlSession.close();
		
		return result;
	} 
	
	
	public tb_memberDTO loginMember(tb_memberDTO paramLoginDto) {
		
		tb_memberDTO result = null;
		
		result = sqlSession.selectOne("com.smhrd.database.memberMapper.selectMember", paramLoginDto);
		
		sqlSession.close();
		
		return result;
		
	}
	
	public tb_memberDTO emailCheck(tb_memberDTO paramEmailCheckDto) {
		
		tb_memberDTO result = null;
		
		result = sqlSession.selectOne
		("com.smhrd.database.memberMapper.emailCheck", paramEmailCheckDto);
		
		sqlSession.close();
		
		return result;
	}
	
	public int UpdatePoint(tb_memberDTO dto) {
		
		int cnt = 0;
		
		cnt = sqlSession.update("UpdatePoint", dto);	
		
		sqlSession.close();
		
		return cnt;
	}
}

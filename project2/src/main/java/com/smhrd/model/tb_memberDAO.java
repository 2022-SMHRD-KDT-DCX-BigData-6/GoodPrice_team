package com.smhrd.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	// 아이디 찾기 메소드 - 효석
		public String findId(tb_memberDTO paramFindIdDto) {
			
			String result = null;
			
			result = sqlSession.selectOne("findId", paramFindIdDto);
			
			sqlSession.close();
			
			return result;
		}
		
	//멤버 포인트 가져오기 메소드 - 효석
		public Double memPoint(String m_id) {
			
			Double result = null;
			
			result = sqlSession.selectOne("memPoint",m_id);
			
			sqlSession.close();
			
			return result; 
		}
		
	//마이페이지 정보 수정 - 효석
		public int updateMember(tb_memberDTO dto) {
			
			int result = 0;
			
			result = sqlSession.update("com.smhrd.database.memberMapper.updateMember", dto);
			
			sqlSession.close();
			
			
			return result;
		}
		
	//마이페이지 회원탈퇴 - 효석
		public int outMember(String m_id) {
			
			int result = 0;
			
			result = sqlSession.delete("com.smhrd.database.memberMapper.outMember", m_id);
			
			sqlSession.close();
			
			return result;
		}
		
		
		 //마이페이지 포인트 차감
		public int myPagePtMinus(Double m_point, String m_id) {
		 
		 int result = 0;
		 
		 Map<String, Object> params = new HashMap<>();
		 params.put("param1", m_point);
		 params.put("param2", m_id);
		 
			
		result = sqlSession.update("com.smhrd.database.memberMapper.updatePoint",params);
			
		 
		 sqlSession.close();
		 
		 return result; 
		 }
		 
}

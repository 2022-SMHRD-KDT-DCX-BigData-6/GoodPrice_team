package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class WebBoardDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	// 파일 업로드
	public int boardUpload(WebBoardDTO dto) {
		
		int cnt = 0;
		
		cnt = sqlSession.insert("com.smhrd.database.WebBoardMapper.boardUpload", dto);
		
		return cnt;
	}
	
	// 게시글 조회
	public List<WebBoardDTO> showBoard(){

		List<WebBoardDTO> board_list = sqlSession.selectList("com.smhrd.database.WebBoardMapper.selectAllBoard");
		
		sqlSession.close();
		
		return board_list;
	}
	
	// 게시글 내용 조회
	public WebBoardDTO showContent(int num) {
		
		WebBoardDTO content = sqlSession.selectOne("com.smhrd.database.WebBoardMapper.selectContent", new WebBoardDTO(num));
	
		sqlSession.close();
		
		return content;
	}
}

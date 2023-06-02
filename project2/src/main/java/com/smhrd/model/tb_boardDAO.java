package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.database.SqlSessionManager;

public class tb_boardDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession;

    public tb_boardDAO() {
        sqlSessionFactory = SqlSessionManager.getSqlSession();
    }
    
    // 파일 업로드
    public int tb_boardUpload(tb_boardDTO dto) {
    	sqlSession = sqlSessionFactory.openSession(true);
    	
        int cnt = sqlSession.insert("com.smhrd.database.tb_BoardMapper.tb_boardUpload", dto);
        
        sqlSession.close();
        
        return cnt;
    }
    
    // 게시판 main 화면에서 게시글들 조회하기
    public List<tb_boardDTO> showBoard() {
    	sqlSession = sqlSessionFactory.openSession(true);
    	
        List<tb_boardDTO> boardList = sqlSession.selectList("com.smhrd.database.tb_BoardMapper.getBoardList");
        
        sqlSession.close();
        
        return boardList;
    }
    // b_idx로 게시글 정보 가져오기
    public tb_boardDTO getBoardById(int b_idx) {
    	sqlSession = sqlSessionFactory.openSession(true);
    	
        tb_boardDTO board = sqlSession.selectOne("com.smhrd.database.tb_BoardMapper.getBoardById", b_idx);
        
        sqlSession.close();
        
        return board;
    }
    
    // 게시글 수정하기
    public int updateBoard(tb_boardDTO dto) {
    	sqlSession = sqlSessionFactory.openSession(true);
    	
    	int cnt = sqlSession.update("com.smhrd.database.tb_BoardMapper.updateBoard", dto);
    	
    	sqlSession.close();
    	
    	return cnt;
    }
    
    // 게시글 삭제하기
    public int deleteBoard(int b_idx) {
    	sqlSession = sqlSessionFactory.openSession(true);
        
    	int cnt = sqlSession.delete("com.smhrd.database.tb_BoardMapper.deleteBoard", b_idx);
        
        sqlSession.close();
        
        return cnt;
    }
    
    // 조회수 증가
    public void increaseViews(int b_idx) {
    	sqlSession = sqlSessionFactory.openSession(true);
    	
        sqlSession.update("com.smhrd.database.tb_BoardMapper.increaseViews", b_idx);
        
        sqlSession.close();
    }
    // 좋아요 증가
    public void increaseLikes(int b_idx) {
    	sqlSession = sqlSessionFactory.openSession(true);
    	
        sqlSession.update("com.smhrd.database.tb_BoardMapper.increaseLikes", b_idx);
        
        sqlSession.close();
    }

}
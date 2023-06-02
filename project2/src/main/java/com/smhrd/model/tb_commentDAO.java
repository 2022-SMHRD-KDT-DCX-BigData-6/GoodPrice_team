package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class tb_commentDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

    // 댓글 조회하기
    public List<tb_commentDTO> getCommentsByBoardId(int b_idx) {
    	List<tb_commentDTO> commentList = sqlSession.selectList("com.smhrd.database.tb_CommentMapper.getCommentsByBoardId", b_idx);
    	
    	sqlSession.close();
    	
    	return commentList;
    }
    // 댓글 등록하기
    public int insertComment(tb_commentDTO dto) {
    	int cnt = sqlSession.insert("com.smhrd.database.tb_CommentMapper.insertComment", dto);
    	
    	sqlSession.close();
    	
        return cnt;
    }
}

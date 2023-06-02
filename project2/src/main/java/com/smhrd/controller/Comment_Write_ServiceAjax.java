package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.tb_commentDAO;
import com.smhrd.model.tb_commentDTO;

public class Comment_Write_ServiceAjax extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/plain; charset=UTF-8");
	        PrintWriter out=null;
	        int cnt = 0;
	        int b_idx=0;
			try {
				out = response.getWriter();			
				
				// 전달된 파라미터 값 가져오기
				b_idx = Integer.parseInt(request.getParameter("b_idx"));
				String m_id = request.getParameter("m_id");
				String cmt_content = request.getParameter("comment");
				
				System.out.println("b_idx는 "+b_idx); 
				System.out.println("m_id는 "+m_id); 
				System.out.println("cmt_content는 "+cmt_content); 
				
				// 댓글 등록을 위해 DAO 및 DTO 인스턴스 생성
				tb_commentDTO dto = new tb_commentDTO(b_idx, cmt_content, m_id);
				cnt = new tb_commentDAO().insertComment(dto);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(cnt > 0) {
				System.out.println("댓글 등록 성공");
			}
			else {
				System.out.println("댓글 등록 실패");
			}
			out.println("OK");
	}
}

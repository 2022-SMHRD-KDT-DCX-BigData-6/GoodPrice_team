package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.tb_boardDAO;

public class IncreaseLikesAjax extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/plain; charset=UTF-8");
	        PrintWriter out=null;
	        int cnt = 0;
	        int b_idx=0;
			try {
				out = response.getWriter();			
				
				// 전달된 파라미터 값 가져오기
				b_idx = Integer.parseInt(request.getParameter("b_idx"));
				
				System.out.println("b_idx는 "+b_idx); 
				
				// 댓글 등록을 위해 DAO 및 DTO 인스턴스 생성
				tb_boardDAO dao = new tb_boardDAO();
				dao.increaseLikes(b_idx);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(cnt > 0) {
				System.out.println("좋아요 증가 실패");
			}
			else {
				System.out.println("좋아요 증가 성공");
			}
			out.println("OK");
	}
}

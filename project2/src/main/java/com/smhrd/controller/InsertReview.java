package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.tb_memberDAO;
import com.smhrd.model.tb_memberDTO;
import com.smhrd.model.tb_reviewDAO;
import com.smhrd.model.tb_reviewDTO;

@WebServlet("/InsertReview")
public class InsertReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/x-json; charset=UTF-8"); //JSON형식으로 response 타입지정
		
		double shopIdx = Double.parseDouble(request.getParameter("shopIdx"));
		String userId = request.getParameter("userId");
		double serviceRating = Double.parseDouble(request.getParameter("serviceRating"));
		double effectiveRating = Double.parseDouble(request.getParameter("effectiveRating"));
		double cleanRating = Double.parseDouble(request.getParameter("cleanRating"));
		String content = request.getParameter("content");
		String filename = request.getParameter("filename");
		String userGender = request.getParameter("userGender");
		String userAge = request.getParameter("userAge");
		
		tb_reviewDTO dto = new tb_reviewDTO(shopIdx, userId, serviceRating, effectiveRating, cleanRating, content, filename);
		tb_reviewDAO dao = new tb_reviewDAO();
		int cnt = 0;
		cnt = dao.insertReview(dto);
		
	}

}

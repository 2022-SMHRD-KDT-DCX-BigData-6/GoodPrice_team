package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.tb_reviewDAO;
import com.smhrd.model.tb_reviewDTO;
import com.smhrd.model.tb_wishlistDAO;
import com.smhrd.model.tb_wishlistDTO;

@WebServlet("/InsertWish")
public class InsertWish extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/x-json; charset=UTF-8"); //JSON형식으로 response 타입지정
		
		double shopIdx = Double.parseDouble(request.getParameter("shopIdx"));
		String userId = request.getParameter("userId");
		
		tb_wishlistDTO dto = new tb_wishlistDTO(shopIdx, userId);
		tb_wishlistDAO dao = new tb_wishlistDAO();
		int cnt = 0;
		cnt = dao.insertWish(dto);
	}

}

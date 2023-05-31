package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.smhrd.model.tb_reviewDAO;
import com.smhrd.model.tb_reviewDTO;
import com.smhrd.model.tb_storeDAO;
import com.smhrd.model.tb_storeDTO;

@WebServlet("/Count_Review")
public class Count_Review extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/x-json; charset=UTF-8"); //JSON형식으로 response 타입지정
		
		System.out.println("값 확인 : " + request.getParameter("shopIdx"));
		double shopIdx = Double.parseDouble(request.getParameter("shopIdx"));
		tb_reviewDTO dto = new tb_reviewDTO(shopIdx);
		tb_reviewDAO dao = new tb_reviewDAO();
		
		int cnt = 0;
		cnt = dao.CountReview(dto);
		
		JsonObject obj = new JsonObject();
		obj.addProperty("cnt", cnt);
		
		response.getWriter().print(obj);
	}

}

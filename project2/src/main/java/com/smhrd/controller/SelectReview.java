package com.smhrd.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.smhrd.model.ReviewListDTO;
import com.smhrd.model.tb_reviewDAO;
import com.smhrd.model.tb_reviewDTO;

public class SelectReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/x-json; charset=UTF-8"); //JSON형식으로 response 타입지정
		
		double shopIdx = Double.parseDouble(request.getParameter("shopIdx"));
		tb_reviewDTO dto = new tb_reviewDTO(shopIdx);
		tb_reviewDAO dao = new tb_reviewDAO();
		List<ReviewListDTO> review_list = dao.SelectReview(dto);
		
		JsonArray arrayObj = new JsonArray();
		
		for(int i = 0; i < review_list.size(); i++) {
			String m_nick = review_list.get(i).getM_nick();
			String review_content = review_list.get(i).getReview_content();
			Double review_score = review_list.get(i).getReview_score();
			String review_dt = review_list.get(i).getReview_dt();
			
			JsonObject obj = new JsonObject();
			obj.addProperty("m_nick", m_nick);
			obj.addProperty("review_content", review_content);
			obj.addProperty("review_score", review_score);
			obj.addProperty("review_dt", review_dt);
			
			arrayObj.add(obj);
		}
		
		response.getWriter().print(arrayObj);
	}

}

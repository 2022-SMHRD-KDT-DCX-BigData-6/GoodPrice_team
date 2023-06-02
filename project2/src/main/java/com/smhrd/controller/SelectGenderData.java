package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.smhrd.model.GenderCountDTO;
import com.smhrd.model.tb_reviewDAO;
import com.smhrd.model.tb_reviewDTO;

@WebServlet("/SelectGenderData")
public class SelectGenderData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/x-json; charset=UTF-8"); //JSON형식으로 response 타입지정
		
		double shopIdx = Double.parseDouble(request.getParameter("shopIdx"));
		tb_reviewDTO dto = new tb_reviewDTO(shopIdx);
		tb_reviewDAO dao = new tb_reviewDAO();
		
		GenderCountDTO data = dao.SelectGenderData(dto);
		JsonObject obj = new JsonObject();
		Double Man = data.getMale();
		Double Woman = data.getFemale();

		obj.addProperty("man", Man);
		obj.addProperty("woman", Woman);
		
		response.getWriter().print(obj);
	}

}

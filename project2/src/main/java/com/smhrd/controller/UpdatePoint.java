package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.smhrd.model.tb_memberDAO;
import com.smhrd.model.tb_memberDTO;

@WebServlet("/UpdatePoint")
public class UpdatePoint extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/x-json; charset=UTF-8"); //JSON형식으로 response 타입지정
		
		String m_id = request.getParameter("user_Id");
		tb_memberDTO dto = new tb_memberDTO(m_id);
		tb_memberDAO dao = new tb_memberDAO();
		
		int cnt = 0;
		cnt = dao.UpdatePoint(dto);
	}

}

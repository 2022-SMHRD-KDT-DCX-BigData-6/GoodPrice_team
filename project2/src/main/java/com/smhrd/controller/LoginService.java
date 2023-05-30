package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.tb_memberDAO;
import com.smhrd.model.tb_memberDTO;

public class LoginService implements Command{
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
	
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		
		tb_memberDTO loginDto = new tb_memberDTO(m_id, m_pw, null, null, null, null, null, null, null, null);
		
		tb_memberDAO loginDao = new tb_memberDAO();
		
		tb_memberDTO result = loginDao.loginMember(loginDto);
		
		// m_id, m_pw 입력정보에 맞는 사용자 정보가 있으면 
		if (result != null) {
			HttpSession hs = request.getSession();
			//다음페이지로(메인페이지) 세션(사용자 정보) 넘김
			hs.setAttribute("loginResult", result);
			
			moveURL = "main.jsp";
			System.out.println("성공 : " + result);
		}else {
			moveURL = "login.jsp";
			System.out.println("실패");
			
		}
		
		return moveURL;
	}
}

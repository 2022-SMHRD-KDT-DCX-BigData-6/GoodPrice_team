package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.tb_memberDAO;

public class emailCheck implements Command{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		HttpSession hs = request.getSession();
		String id = request.getParameter("m_id");
		String domain = request.getParameter("inputDomain");
		String m_id = id + "@" + domain; 
		
		tb_memberDAO dao = new tb_memberDAO();
		String result = dao.emailCheck(m_id);
		System.out.println(result);
		// result = null = 중복 아니다
		//중복 아니면 입력한 아이디값 담아서 세션으로 보냄
		String moveURL = null;
		if (result == null ) {
			System.out.println("아이디 중복 아님");
			
			hs.setAttribute("emailCheckResult", m_id);
			moveURL = "register.jsp";
		}else {
			System.out.println("아이디 중복임");
			//result != null = 중복임
			//아이디 중복이면 result값 비워서 세션으로 보냄
			result = null;
			hs.setAttribute("emailCheckResult", result);
			moveURL = "register.jsp";
		}
		return moveURL;
	}
}

package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.WebMemberDAO;
import com.smhrd.model.WebMemberDTO;

public class JoinService implements Command{
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		
		WebMemberDTO dto = new WebMemberDTO(email, pw, tel, address);
		WebMemberDAO dao = new WebMemberDAO();
		int cnt = dao.insertMember(dto);
		
		String moveURL = null;
		
		if(cnt != 0) {
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			moveURL = "joinSuccess.jsp";
		}
		else {
			moveURL = "main.jsp";
		}
		return moveURL;
	}
}

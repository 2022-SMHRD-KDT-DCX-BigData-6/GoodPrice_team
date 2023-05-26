package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.WebMemberDAO;
import com.smhrd.model.WebMemberDTO;

public class UpdateService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		WebMemberDTO member = (WebMemberDTO)session.getAttribute("member");
		
		String email = member.getEmail();
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		
		WebMemberDAO dao = new WebMemberDAO();
		member = new WebMemberDTO(email, pw, tel, address);
		int cnt = dao.updateMember(member);
		
		String moveURL = null;
		
		if(cnt != 0) {
			session.setAttribute("member", member);
			moveURL = "main.jsp";
		}
		else {
			moveURL = "update.jsp";
		}
		return moveURL;
	}

}

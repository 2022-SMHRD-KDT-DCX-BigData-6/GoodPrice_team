package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.model.WebMemberDAO;
import com.smhrd.model.WebMemberDTO;

public class DeleteService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		
		WebMemberDAO dao = new WebMemberDAO();
		int cnt = dao.deleteMember(new WebMemberDTO(email));

		String moveURL = null;
		
		if(cnt != 0) {
			System.out.println("삭제성공");
			moveURL = "select.jsp";
		}
		else {
			System.out.println("삭제실패");
			moveURL = "select.jsp";
		}
		return moveURL;
	}

}

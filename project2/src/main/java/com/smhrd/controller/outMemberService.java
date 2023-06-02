package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.tb_memberDAO;
import com.smhrd.model.tb_memberDTO;

public class outMemberService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession hs = request.getSession();
		tb_memberDTO loginResult = (tb_memberDTO)hs.getAttribute("loginResult");
		
		String m_id = loginResult.getM_id();
		
		tb_memberDAO outMemberDao = new tb_memberDAO();
		int result = outMemberDao.outMember(m_id);
		
		String moveURL = null;
		
		if (result > 0) {
			System.out.println("삭제 성공");
			hs.invalidate();
			moveURL = "main.jsp";
		}else {
			System.out.println("삭제 실패");
			moveURL = "myPage.jsp";
			
		}
		return moveURL;
	}
}

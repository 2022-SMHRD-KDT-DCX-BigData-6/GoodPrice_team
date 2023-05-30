package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.smhrd.command.Command;
import com.smhrd.model.tb_memberDAO;
import com.smhrd.model.tb_memberDTO;


public class emailCheck  implements Command{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String m_id = request.getParameter("m_id");
		
		tb_memberDTO emailCheckDto = new tb_memberDTO(m_id, null, null, null, null, null, null, null, null, null);
		tb_memberDAO emailCheckDao = new tb_memberDAO();
		
		tb_memberDTO emailCheckResult = emailCheckDao.emailCheck(emailCheckDto);
		
		HttpSession hs = request.getSession();
				hs.setAttribute("emailCheckResult", emailCheckResult);
		
		
		return "register.jsp";
	}
}

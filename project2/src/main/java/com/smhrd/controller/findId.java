package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.tb_memberDAO;
import com.smhrd.model.tb_memberDTO;

public class findId implements Command{
	
	
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String moveURL = null;
		try {
			String m_name = request.getParameter("m_name");
			String m_pw = request.getParameter("m_pw");
			
			
			tb_memberDTO fintIdDto = new tb_memberDTO(m_pw, m_name);
			tb_memberDAO findIdDao = new tb_memberDAO();
			String result =  findIdDao.findId(fintIdDto);
			System.out.println(result);
			
			if (result != null) {
				HttpSession hs = request.getSession();
				hs.setAttribute("findId", result);
				moveURL = "findIdResult.jsp";
				System.out.println("이메일 찾기 성공");
			}else {
				moveURL = "findIdResult.jsp";
				System.out.println("이메일 찾기 실패");
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		
		
		
		
		return moveURL;
	}
	
}

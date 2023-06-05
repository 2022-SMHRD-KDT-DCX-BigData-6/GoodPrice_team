package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.smhrd.command.Command;
import com.smhrd.model.tb_memberDAO;
import com.smhrd.model.tb_memberDTO;

public class UpdateMemberService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession hs = request.getSession();
		tb_memberDTO member = (tb_memberDTO)hs.getAttribute("loginResult");
		
		String m_id = member.getM_id();
		
		String m_name = request.getParameter("m_name");
		String m_pw = request.getParameter("m_pw");
		String m_nick = request.getParameter("m_nick");
		String m_addr = request.getParameter("m_addr");
		System.out.println("업데이트 들어왔니");
		//tb_memberDTO(m_id=123, m_pw=강효석, m_name=HTT, m_nick=광주 서구 화정로 29111, m_age=null, m_gender=null, m_addr=smart@gmail.com, m_point=null, m_joindate=null, admin_yn=null)
		
		tb_memberDTO updateMemDto = new tb_memberDTO(m_pw, m_name, m_nick,m_addr,m_id);
		tb_memberDAO updateMemDao = new tb_memberDAO();
		int result = updateMemDao.updateMember(updateMemDto);
		String moveURL = null;
		
		if (result != 0) {
			hs.setAttribute("updateMember", updateMemDto);
			moveURL = "myPage.jsp";
			System.out.println("수정 성공 : " + updateMemDto);
		}else {
			moveURL = "myPage.jsp";
			System.out.println("수정 실패 : " + updateMemDto);
		}
		return moveURL;
	}
}

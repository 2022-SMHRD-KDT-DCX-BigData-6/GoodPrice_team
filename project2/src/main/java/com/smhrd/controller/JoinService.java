package com.smhrd.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.WebMemberDAO;
import com.smhrd.model.WebMemberDTO;
import com.smhrd.model.tb_memberDAO;
import com.smhrd.model.tb_memberDTO;

public class JoinService implements Command{
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 0. 받아온 값 한글 인코딩 해주기 (닉네임, 성별 등 한글 데이터)
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("joinService - 인코딩 문제야");
		}
		
		
		// 1. 입력받은 회원정보 가져오기
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_checkPw = request.getParameter("m_checkPw");
		String m_name = request.getParameter("m_name");
		String m_nick = request.getParameter("m_nick");
		Date m_birthdate = null;
		 try {
	            
			 String birthDate = request.getParameter("m_birthDate"); // "2023-05-27"
	            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	            m_birthdate = format.parse(birthDate);
	        } catch(ParseException e) {
	            e.printStackTrace();
	        }
	    
		
		
		
		String m_gender = request.getParameter("m_gender");
		
		String m_addr = request.getParameter("m_addr");
		// 이동할 URL 값 담을 변수
		String moveURL = null;
		
	
		tb_memberDTO joinDto = new tb_memberDTO(m_id, m_pw, m_name, m_nick, m_birthdate, m_gender, m_addr, null, null, null);
		tb_memberDAO joinDao = new tb_memberDAO();
		System.out.println(joinDto);
		int result = joinDao.JoinService(joinDto);
		
		
		if (result > 0) {
			HttpSession hs = request.getSession();
			hs.setAttribute("joinInfo",joinDto);
			
			moveURL = "login.jsp";
		}else {
			moveURL = "register.jsp";
		}
		
		
		return moveURL;
	}
}

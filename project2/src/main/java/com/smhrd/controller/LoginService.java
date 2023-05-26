package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.WebMemberDAO;
import com.smhrd.model.WebMemberDTO;

public class LoginService implements Command{
	
	public String execute(HttpServletRequest request, HttpServletResponse response){
		// [로그인기능]
		
		// 1.입력받은 이메일, 비밀번호 가져오기
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		// 2.데이터베이스에 해당 회원이 존재하는지 조회
		WebMemberDAO dao = new WebMemberDAO();
		WebMemberDTO member = dao.selectMember(new WebMemberDTO(email, pw));
		
		// 2-1.회원이 존재할 경우, 세션영역에 저장하고 main.jsp로 이동
		if(member != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			
//			response.sendRedirect("main.jsp");
		}
		// 2-2.비회원일 경우, main.jsp로 이동
		else {
//			response.sendRedirect("main.jsp");
		}
		return "main.jsp";
	}
}
package com.smhrd.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.Command;
import com.smhrd.controller.JoinService;
import com.smhrd.controller.LoginService;
import com.smhrd.controller.LogoutService;
import com.smhrd.controller.emailCheck;
import com.smhrd.controller.FindId;


public class Frontcontroller1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("[Frontcontroller2]");

		// 공통되는 부분 = post방식 인코딩
		request.setCharacterEncoding("UTF-8");

		// 어떤 요청이 들어왔는지 구분
		String reqURI = request.getRequestURI();
		System.out.println("주소 : " + reqURI);

		
		// ContextPath 출력
		String contextPath = request.getContextPath();
		System.out.println(contextPath);

		String result = reqURI.substring(contextPath.length() + 1);
		System.out.println(result);

		String moveURL = null;
		Command service = null;
		if (result.equals("JoinService.do")) {
			service = new JoinService();
		}
		else if(result.equals("LoginService.do")) {
			service = new LoginService();  
//			
		}
		else if(result.equals("LogoutService.do")) {
			service = new LogoutService();
		}
		else if (result.equals("emailCheck.do")) {
			service = new emailCheck();
		}
//		else if(result.equals("UpdateService.do")) {
////			service = new UpdateService();
//		}
//		else if(result.equals("DeleteService.do")) {
////			service = new DeleteService();
//		}
//		else if(result.equals("WriteBoardService.do")) {
////			service = new WriteBoardService();
//		}
		else if (result.equals("findId.do")) {
			service = new FindId();
		}
		
		moveURL = service.execute(request, response);
		response.sendRedirect(moveURL);

	
	}

}

package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.tb_reviewDAO;
import com.smhrd.model.tb_reviewDTO;

public class ReviewDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession hs = request.getSession();
		String idx = (String)hs.getAttribute("Review_idx");
		
		Double reviewdelete = Double.parseDouble(request.getParameter("Review_idx"));
		
		tb_reviewDAO dao = new tb_reviewDAO();
		
		Double result = dao.reviewListDelete(reviewdelete);
		System.out.println(idx);
		System.out.println(result);
		String moveURL = null;
		
		if (result > 0.0) {
			System.out.println("삭제성공");
			moveURL = "myPage.jsp";
		}else {
			System.out.println("삭제실패");
			moveURL = "myPage.jsp";
			
		}
		return moveURL;
	}
}

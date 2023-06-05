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
		
		double reviewdelete1 = Double.parseDouble(request.getParameter("Review_idx"));
		int  reviewdelete = (int)(reviewdelete1);
		tb_reviewDAO dao = new tb_reviewDAO();
		
		int result = dao.reviewListDelete(reviewdelete);
		String moveURL = null;
		
		if (result > 0) {
			System.out.println("삭제성공");
			moveURL = "myPage.jsp";
		}else {
			System.out.println("삭제실패");
			moveURL = "myPage.jsp";
			
		}
		return moveURL;
	}
}

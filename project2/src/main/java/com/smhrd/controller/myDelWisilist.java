package com.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.tb_wishlistDAO;

public class myDelWisilist implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		HttpSession hs = request.getSession();
		double dbWish_idx = Double.parseDouble(request.getParameter("Wish_idx"));
		
		int wish_idx = (int)dbWish_idx;
		tb_wishlistDAO dao = new tb_wishlistDAO();
		
		int result =  dao.delWishList(wish_idx);
		String moveURL = null;
		
		if (result > 0) {
			System.out.println("찜 삭제 성공");
			moveURL = "myPage.jsp";
		}else {
			System.out.println("찜 삭제 성공");
			moveURL = "myPage.jsp";
		}
		return moveURL;
	}
}

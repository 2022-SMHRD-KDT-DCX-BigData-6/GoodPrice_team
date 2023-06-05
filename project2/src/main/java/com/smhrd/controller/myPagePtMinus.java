package com.smhrd.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.Command;
import com.smhrd.model.tb_memberDAO;
import com.smhrd.model.tb_memberDTO;

public class myPagePtMinus implements Command{
   
   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) {
      
		/*
		 * HttpSession hs = request.getSession(); tb_memberDTO member =
		 * (tb_memberDTO)hs.getAttribute("loginResult");
		 */
      String m_id = request.getParameter("m_id");
      System.out.println(m_id);
      
      String Stm_point2000 = "2000";
      String Stm_point4000 = "4000";
      String Stm_point6000 = "6000";
      String Stm_point8000 = "8000";
           
      tb_memberDAO dao = null;
      
      int result = 0;
      //2000 포인트 누른경우
      String StResult = null;
       if (Stm_point2000.equals(request.getParameter("m_point2000"))) {
    	   Double minus_point2000 = Double.parseDouble(request.getParameter("m_point2000"));
    	   result = new tb_memberDAO().myPagePtMinus(minus_point2000,m_id);
          StResult = "2000원 차감";
      //4000 포인트 누른 경우
       }else if (Stm_point4000.equals(request.getParameter("m_point4000"))) {
    	   Double minus_point4000 = Double.parseDouble(request.getParameter("m_point4000"));
    	   result = new tb_memberDAO().myPagePtMinus(minus_point4000,m_id);
          StResult = "4000원 차감";
         
       //6000 포인트 누른 경우
       }else if (Stm_point6000.equals(request.getParameter("m_point6000"))) {
    	   Double minus_point6000 = Double.parseDouble(request.getParameter("m_point6000"));
    	   result = new tb_memberDAO().myPagePtMinus(minus_point6000,m_id);
          StResult = "6000원 차감";

       //8000 포인트 누른 경우
       }else{
    	   Double minus_point8000 = Double.parseDouble(request.getParameter("m_point8000"));
          result = new tb_memberDAO().myPagePtMinus(minus_point8000,m_id);
          StResult = "8000원 차감";
       }
       
      
      String moveURL = null;
      
      if (result > 0) {
         System.out.println(StResult);
         moveURL = "myPage.jsp";
         
      }else {
         System.out.println("포인트 수정 실패");
         moveURL = "myPage.jsp";
         
      }
      
      
      return moveURL;
   }
}
<%@page import="com.smhrd.model.tb_memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
</head>
<body>
	<%
	    // 로그인 상태 확인
	    boolean isLoggedIn = false;
	    tb_memberDTO loginResult = (tb_memberDTO)session.getAttribute("loginResult");
	    if (loginResult != null) {
	        isLoggedIn = true;
	    }
	%>
	
	<%
	    if (isLoggedIn) {
	        response.sendRedirect("Board_List.jsp");
	    } else {
	        response.sendRedirect("Board_List_fail.jsp");
	    }
	%>

</body>
</html>
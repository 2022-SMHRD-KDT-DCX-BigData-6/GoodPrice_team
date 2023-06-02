<%@page import="com.smhrd.model.tb_memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
        tb_memberDTO loginResult = (tb_memberDTO) session.getAttribute("loginResult");
        if (loginResult != null) {
            response.sendRedirect("Board_Write.jsp");
        } else {
    %>
    <script>
        alert("로그인이 필요합니다.");
        location.href = "Board_List_fail.jsp";
    </script>
    <%
        }
    %>
</body>
</html>

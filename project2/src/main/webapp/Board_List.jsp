<%@page import="com.smhrd.model.tb_memberDTO"%>
<%@page import="com.smhrd.model.tb_boardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.tb_boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/css/bootstrap.min.css">

<style>
body {
    background-color: #f2f2f2;
    font-family: Arial, sans-serif;
}

.container {
    max-width: 1000px;
    margin: 0 auto;
    padding: 20px;
}

.bbs th {
    background-color: #007bff;
    color: #fff;
    font-weight: bold;
    padding: 10px;
    text-align: center;
    white-space: nowrap;
}

.bbs td {
    background-color: #f8f9fa;
    color: #333;
    padding: 10px;
    text-align: center;
    border: 1px solid #ccc;
}

.bbs a {
    color: #333;
    text-decoration: none;
}

.bbs a:hover {
    text-decoration: underline;
}

.button-container {
    text-align: center;
    margin-top: 20px;
}

.user-info {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    margin-bottom: 20px;
    font-size: 14px;
    color: #333;
}

.user-info a {
    color: #333;
    text-decoration: none;
    margin-left: 10px;
}

.user-info a:hover {
    text-decoration: underline;
}

.title-link {
    color: #007bff;
    text-decoration: none;
}

.title-link:hover {
    text-decoration: underline;
}

.btn-primary {
    background-color: #007bff;
    border-color: #007bff;
}

.btn-primary:hover {
    background-color: #0069d9;
    border-color: #0062cc;
}

.pagination-container {
    text-align: center;
    margin-top: 20px;
}

.pagination {
    display: inline-block;
}

.pagination a {
    color: #007bff;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
    margin: 0 4px;
}

.pagination a.active {
    background-color: #007bff;
    color: white;
    border: 1px solid #007bff;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>

</head>

<body>
    <%
    tb_boardDAO dao = new tb_boardDAO();
            	List<tb_boardDTO> boardList = dao.showBoard();
                int itemsPerPage = 12; // 페이지당 표시할 게시글 수
                int currentPage = 1; // 현재 페이지 번호
                if (request.getParameter("page") != null) {
                    currentPage = Integer.parseInt(request.getParameter("page"));
                }
                int totalItems = boardList.size(); // 전체 게시글 수
                int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage); // 전체 페이지 수
                int startIndex = (currentPage - 1) * itemsPerPage;
                int endIndex = Math.min(startIndex + itemsPerPage, totalItems);
                List<tb_boardDTO> pagedBoardList = boardList.subList(startIndex, endIndex);
    %>
    <div class="container">
		<!-- user-info 부분 수정 -->
		<div class="user-info">
		    <%
		    tb_memberDTO loginResult = (tb_memberDTO)session.getAttribute("loginResult");
		    		    	String m_id = loginResult.getM_id();
		    %>
		    <div>로그인된 사용자: <%=m_id%></div>
		    <div><a href="LogoutService.do">로그아웃</a></div> <!-- LogoutService를 호출하도록 수정 -->
		</div>
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성일</th>
                    <th scope="col">조회</th>
                    <th scope="col">좋아요</th>
                </tr>
            </thead>
            <tbody>
                <%
                int index = (currentPage - 1) * itemsPerPage + 1;
                                	for (tb_boardDTO board : pagedBoardList) {
                %>
                    <tr>
                        <td><%= index++ %></td>
                        <td><a href="Board_View.jsp?b_idx=<%= board.getB_idx() %>" class="title-link"><%= board.getB_title() %></a></td>
                        <td><%= board.getM_id() %></td>
                        <td><%= board.getB_dt() %></td>
                        <td><%= board.getB_views() %></td>
                        <td><%= board.getB_likes() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <div class="button-container">
            <a href="main.jsp" class="btn btn-primary">처음으로</a>
            <a href="Board_Write.jsp" class="btn btn-primary">글쓰기</a>
        </div>
        <!-- 페이징 -->
        <div class="pagination-container">
            <div class="pagination">
                <% if (currentPage > 1) { %>
                    <a href="?page=<%= currentPage - 1 %>">&laquo;</a>
                <% } %>
                <% for (int i = 1; i <= totalPages; i++) { %>
                    <a href="?page=<%= i %>" <%= i == currentPage ? "class='active'" : "" %>><%= i %></a>
                <% } %>
                <% if (currentPage < totalPages) { %>
                    <a href="?page=<%= currentPage + 1 %>">&raquo;</a>
                <% } %>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>

</body>
</html>

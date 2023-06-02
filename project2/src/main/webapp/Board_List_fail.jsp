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
    max-width: 800px;
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
</style>

</head>

<body>
    <%
    tb_boardDAO dao = new tb_boardDAO();
                List<tb_boardDTO> boardList = dao.showBoard();
                int pageSize = 12; // 페이지당 게시물 수
                int totalSize = boardList.size(); // 총 게시물 수
                int totalPages = (int) Math.ceil((double) totalSize / pageSize); // 총 페이지 수

                String pageParam = request.getParameter("page");
                int currentPage = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;
                int startIdx = (currentPage - 1) * pageSize;
                int endIdx = Math.min(startIdx + pageSize, totalSize);
                List<tb_boardDTO> currentPageList = boardList.subList(startIdx, endIdx);
    %>
    <div class="container">
        <div class="user-info">
        <div><a href="login.jsp">로그인</a></div>
        <div><a href="register.jsp">회원가입</a></div>
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
            	int index = startIdx + 1;
            	%>
                <%
                for (tb_boardDTO board : currentPageList) {
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
            <a href="Board_Write_check.jsp" class="btn btn-primary">글쓰기</a>
        </div>
        <div class="pagination d-flex justify-content-center">
            <% if (totalPages > 1) { %>
                <nav>
                    <ul class="pagination">
                        <% if (currentPage > 1) { %>
                            <li class="page-item"><a class="page-link" href="?page=<%= currentPage - 1 %>">&laquo;</a></li>
                        <% } %>
                        <% for (int i = 1; i <= totalPages; i++) { %>
                            <li class="page-item <%= (currentPage == i) ? "active" : "" %>"><a class="page-link" href="?page=<%= i %>"><%= i %></a></li>
                        <% } %>
                        <% if (currentPage < totalPages) { %>
                            <li class="page-item"><a class="page-link" href="?page=<%= currentPage + 1 %>">&raquo;</a></li>
                        <% } %>
                    </ul>
                </nav>
            <% } %>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>

</body>
</html>

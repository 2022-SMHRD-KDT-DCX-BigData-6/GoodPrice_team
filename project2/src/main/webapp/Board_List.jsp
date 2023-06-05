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
  @import 'https://fonts.googleapis.com/css?family=Open+Sans:600,700';
  
  * {
    font-family: 'Open Sans', sans-serif;
  }
  
  .rwd-table {
    margin: auto;
    min-width: 975px;
    max-width: 100%;
    border-collapse: collapse;
  }
  
  .rwd-table th {
    border-top: none;
    background: #428bca;
    color: #fff;
    display: none;
  }
  
  .rwd-table tr {
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    background-color: #f5f9fc;
  }
  
  .rwd-table tr:nth-child(odd) {
    background-color: #ebf3f9;
  }
  
  .rwd-table td {
    display: block;
  }
  
  .rwd-table td:first-child {
    margin-top: .5em;
  }
  
  .rwd-table td:last-child {
    margin-bottom: .5em;
  }
  
  .rwd-table td:before {
    content: attr(data-th) ": ";
    font-weight: bold;
    width: 120px;
    display: inline-block;
    color: #000;
  }
  
  .rwd-table th,
  .rwd-table td {
    text-align: left;
  }
  
  .rwd-table {
    color: #333;
    border-radius: .4em;
    overflow: hidden;
  }
  
  .rwd-table tr {
    border-color: #bfbfbf;
  }
  
  .rwd-table th,
  .rwd-table td {
    padding: .5em 1em;
  }
  
  @media screen and (max-width: 975px) {
    .rwd-table tr:nth-child(2) {
      border-top: none;
    }
  }
  
  @media screen and (min-width: 300px) {
    .rwd-table tr:hover:not(:first-child) {
      background-color: #d8e7f3;
    }
    
    .rwd-table td:before {
      display: none;
    }
    
    .rwd-table th,
    .rwd-table td {
      display: table-cell;
      padding: .25em .5em;
    }
    
    .rwd-table th:first-child,
    .rwd-table td:first-child {
      padding-left: 0;
    }
    
    .rwd-table th:last-child,
    .rwd-table td:last-child {
      padding-right: 0;
    }
    
    .rwd-table th,
    .rwd-table td {
      padding: 1em !important;
    }
  }
  
  body {
    background-color: #f5f5f5;
    font-family: Arial, sans-serif;
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    height: 100vh;
  }
  
  h4 {
    color: #3366FF; /* 파란색 */
    border-radius: 10px;
  }
  
  .container {
    max-width: 1000px;
    margin: 0 auto;
    padding: 20px;
    display: block;
    text-align: center;
  }
  
  .button-container {
    text-align: center;
    margin-top: 20px;
  }
  
  .user-info {
    display: flex;
    justify-content: space-between;
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
    background-color: #337ad0;
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
  
  .pagination a:hover:not(.active) {
    background-color: #ddd;
  }
</style>
</head>

<script>
    function showLoginAlert() {
        alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
        window.location.href = "login.jsp";
    }
</script>
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
                
        	    // 로그인 상태 확인
        	    boolean isLoggedIn = false;
        	    tb_memberDTO loginResult = (tb_memberDTO)session.getAttribute("loginResult");
        	    if (loginResult != null) {
        	        isLoggedIn = true;
        	    }
    %>
    <div class="container">
		<div class="user-info" header>
		    <div style="display: flex; align-items: center;">
		        <img src="img_file/img1.png" alt="착한가게 업소 이미지" style="width: 50px; height: 50px; margin-right: 10px;">
		        <h4>착한가게 업소</h4>
		    </div>
		    <% if (isLoggedIn == true) { %>
		        <div style="display: flex; align-items: center;">
		            <div style="margin-right: 10px;">사용자 : <%=loginResult.getM_nick()%></div>
		            <div><a href="LogoutService.do">로그아웃</a></div>
		        </div>
		    <% } else { %>
		        <div style="margin-left: auto;">
		            <a href="login.jsp">로그인</a>
		            <a href="register.jsp">회원가입</a>
		        </div>
		    <% } %>
		</div>
        <table class="rwd-table my-table">
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
        	<% if (isLoggedIn == true) { %>
		       	<a href="main.jsp" class="btn btn-primary">처음으로</a>
			    <a href="Board_Write.jsp" class="btn btn-primary">글쓰기</a>
		    <% } else { %>
		        <a href="main.jsp "class="btn btn-primary">처음으로</a>
		        <a href="javascript:void(0);" onclick="showLoginAlert();" class="btn btn-primary">글쓰기</a>
		    <% } %>
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

<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.tb_commentDTO"%>
<%@page import="com.smhrd.model.tb_commentDAO"%>
<%@page import="com.smhrd.model.tb_memberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.smhrd.model.tb_boardDTO"%>
<%@page import="com.smhrd.model.tb_boardDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 읽기</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>
<style>
body {
	background-color: #f2f2f2;
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 800px;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f9f9f9;
	text-align: left;
}

h3 {
	margin-top: 0;
	text-align: center;
}

.buttons {
	text-align: center;
	margin-top: 20px;
	padding-bottom: 20px;
}

.buttons button {
	display: inline-block;
	padding: 10px 20px;
	background-color: #333;
	color: #fff;
	text-decoration: none;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s;
	margin-right: 10px;
}

.buttons button:last-child {
	margin-right: 0;
}

.buttons button:hover {
	background-color: #555;
}

.comment-container {
	text-align: right;
	margin-top: 20px;
}

.comment-container textarea {
	width: 100%;
	resize: vertical;
	padding: 10px;
}

.comment-container button {
	padding: 10px 20px;
	background-color: #333;
	color: #fff;
	text-decoration: none;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s;
	margin-top: 10px;
}

.comment-container button:hover {
	background-color: #555;
}
</style>
</head>
<body>
	<script type="text/javascript">
		  function move(url) {
		    location.href = url;
		  }
		  function WriteTb_BoardServiceAjax(b_idx) {
			$.ajax({
				url : "WriteTb_BoardServiceAjax",
				type : "post",
				data : {"b_idx":b_idx},
				success : function(){
					location.href="Board_View.jsp?b_idx="+b_idx;
				},
				error : function(){alert("게시글 등록 오류 입니다.");}
			});
		  }
		  function IncreaseLikesAjax(b_idx) {
			$.ajax({
				url : "IncreaseLikesAjax",
				type : "post",
				data : {"b_idx":b_idx},
				success : function(){
					location.href="Board_View.jsp?b_idx="+b_idx;
				},
				error : function(){alert("좋아요 증가 오류 입니다.");}
			});
		  }
		  function submitComment(b_idx, m_id) {
			var commentTextArea = document.getElementById("commentTextArea");
			var comment = commentTextArea.value;
		    $.ajax({
		    	url : "Comment_Write_ServiceAjax",
		    	type : "post",
		    	data : {"b_idx":b_idx,"m_id":m_id,"comment":comment},
		    	success : function(){
		    		location.href="Board_View.jsp?b_idx="+b_idx;
		    	},
		    	error : function(){ alert("댓글 등록 오류 입니다.");}
		    });
		  }
		  function deleteBoard(b_idx){
			  $.ajax({
			         url: "Delete_Write_ServiceAjax",
			         type: "post",
			         data : {"b_idx":b_idx},
			         success: function() {
			            location.href="Board_List_check.jsp?b_idx="+b_idx;
			         },
			         error : function(){alert("게시글 삭제 오류 입니다.");}
		      });
		  }
	</script>
	<%
	tb_boardDAO dao = new tb_boardDAO();
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		dao.increaseViews(b_idx);
		tb_boardDTO board = dao.getBoardById(b_idx);
			
		String m_id = "";
		boolean isLoggedIn = false;
			
		tb_memberDTO loginResult = (tb_memberDTO) session.getAttribute("loginResult");
		if (loginResult != null) {
			m_id = loginResult.getM_id();
			isLoggedIn = true;
		}
			
		tb_commentDAO commentDAO = new tb_commentDAO();
		List<tb_commentDTO> commentList = commentDAO.getCommentsByBoardId(b_idx);
	%>
	<div class="container">
		<h3>글 읽기</h3>
		<table>
			<tr>
				<th>작성자</th>
				<td><%=board.getM_id()%></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><%=board.getB_dt()%></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="2"><%=board.getB_title()%></td>
			</tr>
			<tr>
				<td colspan="2"><br><%=board.getB_content()%><br></td>
			</tr>
			<tr>
				<td colspan="2" align="right">좋아요:<input type="button"
					value="♥" onclick="IncreaseLikesAjax(<%=b_idx%>)"></td>
			</tr>
		</table>
		<div class="buttons">
			<button onclick="move('Board_List_check.jsp')">목록</button>
			<a href="Update_Board_Write.jsp?b_idx=<%=b_idx%>"><button>수정</button></a>
			<button onclick="deleteBoard(<%=b_idx%>)">삭제</button>
		</div>
	</div>
	<div class="container">
		<table>
			<%
			for (tb_commentDTO comment : commentList) {
			%>
			<tr>
				<td colspan="2">내용 : <%=comment.getCmt_content()%></td>
			</tr>
			<tr>
				<td colspan="2" align="right">아이디 : <%=comment.getM_id()%></td>
			</tr>
			<tr>
				<td colspan="2" align="right">날짜 : <%=comment.getCmt_dt()%></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	<%
	if (isLoggedIn) {
	%>
	<div class="container comment-container">
		<textarea id="commentTextArea" rows="4" cols="50"
			placeholder="댓글을 입력하세요..."></textarea>
		<button onclick="submitComment(<%=b_idx%>, '<%=m_id%>')">댓글
			등록</button>
	</div>
	<%
	}
	%>
</body>
</html>

<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.tb_commentDTO"%>
<%@page import="com.smhrd.model.tb_commentDAO"%>
<%@page import="com.smhrd.model.tb_memberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.smhrd.model.tb_boardDTO"%>
<%@page import="com.smhrd.model.tb_boardDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 읽기</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<style>
@import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css");
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

.table-1 th,
.table-1 td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
}
.comment-under{
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

.buttons-container {
    margin-top: 20px;
    text-align: center;
}

.buttons-container .button-spacing {
    margin-right: 10px;
}

.buttons-container button {
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

.buttons-container button:last-child {
    margin-right: 0;
}

.buttons-container button:hover {
    background-color: #555;
}

.heart-button {
  width: 25px;
  height: 25px;
  background-color: #ccc;
  color: #fff;
  border: none;
  border-radius: 50%;
  font-size: 16px;
  font-weight: bold;
  text-transform: uppercase;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
  cursor: pointer;
  position: relative;
  align-items: center;
  transition: background-color 0.3s;
}

.heart-button:before {
  content: "\f004";
  font-family: "Font Awesome 5 Free";
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 12px;
  color: #fff;
  transition: color 0.3s;
}

.heart-button:hover {
  background-color: #fff;
}

.heart-button:hover:before {
  color: #b30000;
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

.profile-image {
    padding: 0;
}

.profile-image img {
    margin: 0 auto;
}

.user-info {
    vertical-align: top;
    padding-left: 10px;
}

.username {
    font-weight: bold;
}

.timestamp {
    font-size: 12px;
    color: #888;
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
            url: "WriteTb_BoardServiceAjax",
            type: "post",
            data: { "b_idx": b_idx },
            success: function () {
                location.href = "Board_View.jsp?b_idx=" + b_idx;
            },
            error: function () {
                alert("게시글 등록 오류 입니다.");
            }
        });
    }

    function IncreaseLikesAjax(b_idx) {
        $.ajax({
            url: "IncreaseLikesAjax",
            type: "post",
            data: { "b_idx": b_idx },
            success: function () {
            	alert("좋아요 +1");
                location.href = "Board_View.jsp?b_idx=" + b_idx;
            },
            error: function () {
                alert("좋아요 증가 오류 입니다.");
            }
        });
    }

    function submitComment(b_idx, m_id) {
        var commentTextArea = document.getElementById("commentTextArea");
        var comment = commentTextArea.value;
        $.ajax({
            url: "Comment_Write_ServiceAjax",
            type: "post",
            data: { "b_idx": b_idx, "m_id": m_id, "comment": comment },
            success: function () {
                location.href = "Board_View.jsp?b_idx=" + b_idx;
            },
            error: function () { alert("댓글 등록 오류 입니다."); }
        });
    }

    function deleteBoard(b_idx) {
        $.ajax({
            url: "Delete_Write_ServiceAjax",
            type: "post",
            data: { "b_idx": b_idx },
            success: function () {
                location.href = "Board_List.jsp?b_idx=" + b_idx;
            },
            error: function () { alert("게시글 삭제 오류 입니다."); }
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
    <table class="table-1">
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
    </table>
        <div colspan="2" align="right">
 	         <button class="heart-button" onclick="IncreaseLikesAjax(<%=b_idx%>)" value=""></button>
        </div>
    <div class="buttons-container">
        <button class="button-spacing" onclick="move('Board_List.jsp')">목록</button>
		<% if (isLoggedIn) { %>
		    <button class="button-spacing" onclick="move('Update_Board_Write.jsp?b_idx=<%=b_idx%>')">수정</button>
		<% } else { %>
		    <button class="button-spacing" onclick="alert('로그인이 필요합니다.')">수정</button>
		<% } %>
		<% if (isLoggedIn) { %>
			<button class="button-spacing" onclick="deleteBoard(<%=b_idx%>)">삭제</button>
		<% } else { %>
		    <button class="button-spacing" onclick="alert('로그인이 필요합니다.')">삭제</button>
		<% } %>
    </div>
</div>
<div class="container">
    <table>
        <% for (tb_commentDTO comment : commentList) { %>
        <tr>
            <td rowspan="2" class="profile-image"><img src="img_file/img_profile.png" alt="프로필 이미지"></td>
            <td class="user-info">
                <span class="username"><%=comment.getM_id()%></span>
                <span class="timestamp"><%=comment.getCmt_dt()%></span>
            </td>
        </tr>
        <tr class="comment-under">
            <td colspan="2"><%=comment.getCmt_content()%></td>
        </tr>
        <% } %>
    </table>
</div>
<%
    if (isLoggedIn) {
%>
<div class="container comment-container">
    <textarea id="commentTextArea" rows="4" cols="50" placeholder="댓글을 입력하세요..."></textarea>
    <button onclick="submitComment(<%=b_idx%>, '<%=m_id%>')">댓글 등록</button>
</div>
<%
    }
%>
</body>
</html>

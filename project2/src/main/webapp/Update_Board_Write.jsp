<%@page import="com.smhrd.model.tb_memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap');

body {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
   	text-align: center;
}

.form-table {
    width: 100%;
    margin-bottom: 20px;
}

.form-table caption {
    font-size: 24px;
    font-weight: bold;
    text-align: center;
    margin-bottom: 10px;
}

.form-table th {
    font-weight: bold;
    padding: 10px;
    text-align: left;
    vertical-align: top; /* 추가된 부분 */
}

.form-table td {
    padding: 10px;
}

.form-table input[type="text"],
.form-table textarea {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}

.form-table input[type="file"] {
    border: none;
    background-color: transparent;
    padding: 0;
}

.form-table hr {
    margin: 20px 0;
    border: none;
    border-top: 1px solid #ccc;
}

.button-container {
    text-align: center;
    margin-top: 20px;
}

.button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #333;
    color: #fff;
    text-decoration: none;
    border-radius: 4px;
    transition: background-color 0.3s;
}

.button:hover {
    background-color: #555;
}
</style>

<script type="text/javascript">
    function move(url) {
        location.href = url;
    }
    function boardWriteCheck() {
        var form = document.BoardWriteForm;
        var title = form.b_title.value.trim();
        var content = form.b_content.value.trim();
        var file = form.b_file.value.trim();
        
        if (title === "") {
            alert("제목을 입력해주세요.");
            return false;
        }else if (content === "") {
            alert("내용을 입력해주세요.");
            return false;
        }else if (file === "") {
            alert("파일을 추가해주세요");
            return false;
        }
        return true;
    }
</script>
</head>
<body>
	<% 
		tb_memberDTO loginResult = (tb_memberDTO)session.getAttribute("loginResult");
		String m_id = loginResult.getM_id();
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
	%>  
    <div class="container">
        <caption>게시판 글쓰기</caption>
        <form name="BoardWriteForm" action="UpdateTb_BoardService.do" method="post" enctype="multipart/form-data" onsubmit="return boardWriteCheck();">
    		<input type="hidden" name="b_idx" value="<%=b_idx%>">
            <table class="form-table">
                <tr>
				    <th style="vertical-align: middle;">작성자</th>
				    <td><input type="text" name="m_id" id="m_id" value="<%=m_id%>" readonly></td>
				</tr>
                <tr>
                    <th style="vertical-align: middle;">제목</th>
                    <td><input type="text" name="b_title" id="b_title"></td>
                </tr>
                <tr>
                    <th style="vertical-align: top;">내용</th>
                    <td><textarea name="b_content" id="b_content" rows="10" cols="100"></textarea></td>
                </tr>
                <tr>
                    <th style="vertical-align: middle;">첨부파일</th>
                    <td><input type="file" name="b_file" id="b_file"></td>
                </tr>
                <tr>
                    <td colspan="2"><hr></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="수정" class="button">
                        <input type="button" value="뒤로" onclick="move('Board_List.jsp');" class="button">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>

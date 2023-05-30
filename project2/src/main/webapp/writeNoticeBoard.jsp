<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
         <!-- Q16. 게시글 작성 기능(작성된 게시글은 DB에 저장) - 파일업로드 cos.jar 사용 -->
         <div id = "board">
            <form action="WriteBoardService" method="post" enctype="multipart/form-data">
            <!-- enctype : 기본 값 application/x-www-form-urlencoded 
            					-> Key와 Value 형태로 데이터를 전송			
            			 : 파일 업로드 시 multipart/form-data 
            			 		-> 이미지 등과 같은 용량이 큰 데이터를 전송	-->
            													
            <table id="list">
               <tr>
                  <td>제목</td>
                  <td><input type="text" name="b_title"> </td>
               </tr>
               <tr>
                  <td>작성자</td>
                  <td><input  type="text" name="m_id"> </td>
               </tr>
               <tr>
                  <td colspan="2">내용</td>
               </tr>
               <tr>
                  <td colspan="2">
                     <input  type="file" name="b_file" style="float: right;">
                     <textarea  rows="10" name="b_content" style="resize: none;"></textarea>         
                  </td>
               </tr>
               <tr>
                  <td colspan="2">
                     <input type="reset" value="초기화">
                     <input type="submit" value="작성하기">
                  </td>
               </tr>
            </table>
            </form>
         </div>
         <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/jquery.scrolly.min.js"></script>
         <script src="assets/js/jquery.scrollex.min.js"></script>
         <script src="assets/js/skel.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>
</body>
</html>
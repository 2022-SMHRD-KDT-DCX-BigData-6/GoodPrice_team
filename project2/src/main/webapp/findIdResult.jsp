<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>아이디 찾기</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <% String Id = (String)session.getAttribute("findId"); %>
    
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">아이디 찾기</h3></div>
                                    <div class="card-body">
                                        <div class="small mb-3 text-muted">이메일을 눌러 로그인 창으로 이동해 주세요</div>
                                           <% if(Id != null){ %>
                                         <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <h4>이메일 : <a href="login.jsp"><%= Id %></a></h4>
                                            </div>
                                           <% }else{ %>
                                         <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <h4><a href="login.jsp">찾으시려는 이메일 아이디가 존재하지 않습니다</a></h4>
                                            </div>
                                           <% } %>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <a  href="password.jsp">비밀번호 확인하기</a>
                                        <a  href="main.jsp">메인페이지</a></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        
            </body>
</html>

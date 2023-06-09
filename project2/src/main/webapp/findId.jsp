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
                                        <div class="small mb-3 text-muted">이름과 비밀번호를 입력하여 아이디를 찾아주세요.</div>
                                        <form action="findId.do" method="post" onsubmit="findId();">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputName" name="m_name" type="text" placeholder="name@example.com" />
                                                <label for="inputEmail">이름</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputPw" name="m_pw" type="password" placeholder="name@example.com" />
                                                <label for="inputEmail">비밀번호</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a href="login.jsp">아이디가 기억 나셨나요? 로그인 하러 가기</a>
                                                <input class="btn btn-primary" type="submit" value="이메일 확인하기">
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        
                                        <label><a class="small" href="main.jsp">메인페이지</a></label>
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

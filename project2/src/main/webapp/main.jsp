<%@page import="com.google.gson.Gson"%>
<%@page import="com.smhrd.model.tb_storeDAO"%>
<%@page import="com.smhrd.model.tb_storeDTO"%>
<%@page import="java.util.List"%>
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
        <title>혜자탐구대</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
   
       <title>닫기가 가능한 커스텀 오버레이</title>
       <style>
       .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
       .wrap * {padding: 0;margin: 0;}
       .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
       .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
       .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
       .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
       .info .close:hover {cursor: pointer;}
       .info .body {position: relative;overflow: hidden;}
       .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
       .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
       .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
       .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
       .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
       .info .link {color: #5085BB;}
      </style>
      
    </head>
    
            <!-- -----------------------------------마이페이지, 로그아웃------------------------------------- -->
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html"></a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                </div>
            </form>
            
            
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="myPage.jsp">마이페이지</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
            <!-- -----------------------------------마이페이지, 로그아웃------------------------------------- -->
        
        
            <!-- -----------------------------------사이드 바------------------------------------- -->
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">메인화면</div>
                            <a class="nav-link" href="main.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                메인
                            </a>
                            <div class="sb-sidenav-menu-heading">메뉴</div>
                            
                            
                            <!-- ---------------------로그인------------------------------- -->
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                로그인
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
									<ul>
										<li><a class="nav-link" href="login.jsp">로그인</a></li>
										<li><a class="nav-link" href="register.jsp">회원가입</a></li>
										<li><a class="nav-link" href="password.jsp">비밀번호 찾기</a></li>
									</ul>
								</nav>
                            </div>
                            <!-- ---------------------로그인------------------------------- -->
                            
                            
                            <a class="nav-link collapsed" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                통계
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            
                            <a class="nav-link collapsed" href="board.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                게시판
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                              
                                <div class="sb-nav-link-icon"><i class="fas fa-user fa-fw"></i></div>
                                레이아웃
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
            					<nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                        	
                                        	<a class="nav-link" href="layout-static.html">Static Navigation</a>
                                    		<a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                                        </nav>
                                    </div>
                                    <!-- <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div> -->
                                </nav>
                            </div>
                            <!-- <div class="sb-sidenav-menu-heading">기타</div> -->
                        </div>
                    </div>
                    <!-- -------------------------------사이드바--------------------------------- -->
                    
                    
                    
                    <div class="sb-sidenav-footer">
                        <div class="small"></div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4" style="font-family: Arial, sans-serif; font-size: 28px; font-weight: bold;">착한가격 업소</h1>
                  <ol class="breadcrumb mb-4">
                      <li class="breadcrumb-item active" style="font-family: Arial, sans-serif; font-size: 16px;">착한가격 기분좋은 서비스</li>
                  </ol>
                    </div>
                   
                    <div id="map" style="width:50%;height:350px;"></div>
                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c21e04ab9896f84f77e9ff0564735da3"></script>
               
               <% List<tb_storeDTO> store_list = new tb_storeDAO().showStore(); %>
               <script>
               var storeData = <%= new Gson().toJson(store_list) %>;
               
               var mapContainer = document.getElementById('map');
               var mapOption = {
                   center: new kakao.maps.LatLng(36.2683, 127.6358),
                   level: 14
               };
               
               var map = new kakao.maps.Map(mapContainer, mapOption);
               var marker = [];
               
               for (var i = 0; i < storeData.length; i++) {
                   var lat = storeData[i].lat;
                   var lng = storeData[i].lng;
               
                   marker[i] = new kakao.maps.Marker({
                       map: map,
                       position: new kakao.maps.LatLng(lat, lng)
                   });
               }
               // 커스텀 오버레이에 표시할 컨텐츠 입니다
               // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
               // 별도의 이벤트 메소드를 제공하지 않습니다 
               var content = '<div class="wrap">' + 
                           '    <div class="info">' + 
                           '        <div class="title">' + 
                           '            모리화' + 
                           '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
                           '        </div>' + 
                           '        <div class="body">' + 
                           '            <div class="img">' +
                           '                <img src="https://www.goodprice.go.kr/cmm/fms/getImage.do?atchFileId=FILE_000000000034168&fileSn=1" width="73" height="70">' +
                           '           </div>' + 
                           '            <div class="desc">' + 
                           '                <div class="ellipsis">광주광역시 서구 풍금로 31-1 (풍암동)</div>' + 
                           '                <div class="jibun ellipsis">중식집</div>' + 
                           '             <div class="jibun ellipsis">짜장면 5000원 짬뽕 7000원</div>'
                           '                <div class="jibun ellipsis">062-652-8552</div>' + 
                           '            </div>' + 
                           '        </div>' + 
                           '    </div>' +    
                           '</div>';
               
               // 마커 위에 커스텀오버레이를 표시합니다
               // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
               var overlay = new kakao.maps.CustomOverlay({
                   content: content,
                   map: map,
                   position: marker.getPosition()       
               });
               
               // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
               kakao.maps.event.addListener(marker, 'click', function() {
                   overlay.setMap(map);
               });
               
               // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
               function closeOverlay() {
                   overlay.setMap(null);     
               }
               </script>
                                       
                </main>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
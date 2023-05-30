<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.tb_memberDTO"%>
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
         <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c21e04ab9896f84f77e9ff0564735da3"></script>
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
    
    <body class="sb-nav-fixed">
            <!-- -----------------------------------마이페이지, 로그아웃------------------------------------- -->
    
<!-- ---------------------------로그인 세션 정보(모든 컬럼값)----------------------------- -->    
		<% tb_memberDTO loginResult = (tb_memberDTO)session.getAttribute("loginResult"); 
			out.print("넘어오는 값 : " + loginResult);
		%>    
<!-- ---------------------------로그인 세션 정보(모든 컬럼값)----------------------------- -->    
    
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
            
            <!-- -------------------로그인 했을 때----------------------------------- -->
            <% if(loginResult != null){ %>
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <!-- -----------로그인 했는데 관리자일 때-------------------- -->
                    <% if(loginResult.getAdmin_yn().equals("Y")){ %>
                    관리자
                    <!-- -----------로그인 했는데 관리자일 때-------------------- -->
                    <% }else{ %>
                    <%= loginResult.getM_nick()%>
                    <% } %>
                    님<i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="myPage.jsp">마이페이지</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="LogoutService.do">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
             
            <!-- -------------------로그인 했을 때----------------------------------- -->
            
            <!-- -------------------로그인 안했을 때----------------------------------- -->
            <% }else{ %>
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    	<a class="nav-link" href="login.jsp">
                        로그인<i class="fas fa-user fa-fw"></i>
                        </a>
                </li>
            </ul>
            <% } %>
            <!-- -------------------로그인 안했을 때----------------------------------- -->
        </nav>
            <!-- -----------------------------------마이페이지, 로그아웃------------------------------------- -->
       
		
		<!-- -----------------------------------사이드 바------------------------------------- -->
		<div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">메인</div>
                            <a class="nav-link" href="main.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                대시보드
                            </a>
                            <!-- ---------------로그인---------------- -->
                             <!-- <a class="nav-link" href="login.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                로그인
                            </a> -->
                            <!-- ---------------로그인---------------- -->
                            
                            <!-- <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Layouts
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">Static Navigation</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                                </nav>
                            </div> -->
                           
                           <!--  <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                     <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a> 
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.jsp">로그인</a>
                                            <a class="nav-link" href="register.jsp">회원가입</a>
                                            <a class="nav-link" href="password.jsp">비밀번호 찾기</a>
                                        </nav>
                                    </div>
                                    
                                    -----------------------에러페이지(반응형 안사라짐)----------------------
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div>
                                    -----------------------에러페이지----------------------
                                
                                </nav>
                            </div> -->
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a>
                            <a class="nav-link" href="noticeBoard.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                게시판
                            </a>
                            
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
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
                   
                    
                    <script>
                    var cnt = new Array();
                    cnt[0] = new Array('전체');
                    cnt[1] = new Array('전체','강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
                    cnt[2] = new Array('전체','강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
                    cnt[3] = new Array('전체','남구','달서구','동구','북구','서구','수성구','중구','달성군');
                    cnt[4] = new Array('전체','계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');
                    cnt[5] = new Array('전체','광산구','남구','동구','북구','서구');
                    cnt[6] = new Array('전체','대덕구','동구','서구','유성구','중구');
                    cnt[7] = new Array('전체','남구','동구','북구','중구','울주군');
                    cnt[8] = new Array('전체','고양시','과천시','광명시','구리시','군포시','남양주시','동두천시','부천시','성남시','수원시','시흥시','안산시','안양시','오산시','의왕시','의정부시','평택시','하남시','가평군','광주시','김포시','안성시','양주군','양평군','여주군','연천군','용인시','이천군','파주시','포천시','화성시');
                    cnt[9] = new Array('전체','강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','황성군');
                    cnt[10] = new Array('전체','제천시','청주시','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');
                    cnt[11] = new Array('전체','공주시','보령시','서산시','아산시','천안시','금산군','논산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
                    cnt[12] = new Array('전체','군산시','김제시','남원시','익산시','전주시','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
                    cnt[13] = new Array('전체','광양시','나주시','목포시','순천시','여수시','여천시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','여천군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
                    cnt[14] = new Array('전체','경산시','경주시','구미시','김천시','문겅시','상주시','안동시','영주시','영천시','포항시','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
                    cnt[15] = new Array('전체','거제시','김해시','마산시','밀양시','사천시','울산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','양산시','의령군','창녕군','하동군','함안군','함양군','합천군');
                    cnt[16] = new Array('전체','서귀포시','제주시','남제주군','북제주군');
                    function change(add) {
                    	  var sel = document.form.county;
                    	  var selectedCounty = sel.options[sel.selectedIndex].value; // 선택된 구/군
                    	  var selectedCity = document.form.city.options[add].value; // 선택된 도시

                    	  // 선택된 도시와 구/군을 변수에 저장
                    	  var cityName = selectedCity;
                    	  var countyName = selectedCounty;

                    	  // 변수 활용 예시: 선택된 도시와 구/군 출력
                    	  console.log("Selected City:", cityName);
                    	  console.log("Selected County:", countyName);

                    	  // 이전에 선택한 구/군을 저장합니다.
                    	  var previousCounty = selectedCounty;

                    	  /* 옵션메뉴삭제 */
                    	  sel.innerHTML = "";

                    	  /* 옵션박스추가 */
                    	  for (var i = 0; i < cnt[add].length; i++) {
                    	    var option = new Option(cnt[add][i], cnt[add][i]);
                    	    sel.appendChild(option);
                    	  }

                    	  // 저장한 이전 구/군 값을 다시 선택합니다.
                    	  for (var i = 0; i < sel.options.length; i++) {
                    	    if (sel.options[i].value === previousCounty) {
                    	      sel.selectedIndex = i;
                    	      break;
                    	    }
                    	  }

                    	  // 업데이트된 구/군 값을 가져옵니다.
                    	  var updatedCounty = sel.options[sel.selectedIndex].value;

                    	  // 선택된 구/군을 변수에 저장합니다.
                    	  countyName = updatedCounty;

                    	  // 선택된 도시와 구/군을 출력합니다.
                    	  console.log("Selected City:", cityName);
                    	  console.log("Selected County:", countyName);
                    	}
                    </script>
               <form name=form method=post action=$PHP_SELF>
                      시/도: 
                      <select name='city' onchange="change(this.selectedIndex);"  class=input >
                          <option value='전체'>전체</option>
                          <option value='서울'>서울특별시</option>
                          <option value='부산'>부산광역시</option>
                          <option value='대구'>대구광역시</option>
                          <option value='인천'>인천광역시</option>
                          <option value='광주'>광주광역시</option>
                          <option value='대전'>대전광역시</option>
                          <option value='울산'>울산광역시</option>
                          <option value='경기'>경기도</option>
                          <option value='강원'>강원도</option>
                          <option value='충북'>충청북도</option>
                          <option value='충남'>충청남도</option>
                          <option value='전북'>전라북도</option>
                          <option value='전남'>전라남도</option>
                          <option value='경북'>경상북도</option>
                          <option value='경남'>경상남도</option>
                          <option value='제주'>제주도</option>
                       </select>                                                  
                       구/군: 
                       <select name='county'  class=select>
                          <option value=''>전체</option>
                       </select>
               </form> 
                    
                    
                    <div id="map" style="width:50%;height:350px;"></div>
                    
<!--             지도 마커에 표시하기 위한 모든 가게 조회하기 -->
               <% List<tb_storeDTO> store_list = new tb_storeDAO().showStore(); %>
               <script>
               var storeData = <%= new Gson().toJson(store_list) %>;
               
               var mapContainer = document.getElementById('map');
               var mapOption = {
                   center: new kakao.maps.LatLng(35.1520445, 126.888729),
                   level: 5
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
                           '             <div class="jibun ellipsis">짜장면 5000원 짬뽕 7000원</div>'+
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
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
    	<script type="text/javascript" src="js/jquery-3.6.4.js"></script>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>혜자탐구대</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c21e04ab9896f84f77e9ff0564735da3&libraries=services"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.min.css">
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0"></script>
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
      	
      	/* 가게 정보 테이블 스타일 */
       #store_table {
           display: none;
       }
	   table {
		   width: 700px;
		   text-align: center;
		   border: 1px solid #fff;
		   border-spacing: 1px;
		   font-family: 'Cairo', sans-serif;
		   margin: auto;
		   border-radius: 8px;
  		   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	   }
		
		caption {
		    font-weight: bold;
		}
		table td {
		    padding: 10px;
		    background-color: #eee;
		    border: 1px solid #fff;
		    font-weight: bold;
		    border-radius: 8px;
		}
		
		table th {
		    background-color: #333;
		    color: #fff;
		    padding: 10px;
		    border: 1px solid #fff;
		    font-weight: bold;
		    border-radius: 8px;
		}
		
		img {
		    width: 300px;
		    height: 350px;
		}
		
		.review,
		.like_poeple,
		.register {
		    border: none;
		    padding: 5px 10px;
		    color: #fff;
		    font-weight: bold;
		    border-radius: 4px;
    		transition: background-color 0.3s ease;
		}
		
		.review {
		    background-color: #03A9F4;
		}
		
		.like_poeple,
		.register {
		    background-color: #E91E63;
		}
		
		
		 /* 셀렉트 박스 스타일 */
		.bo_w_select {
		    width: 6%; /* 가로 사이즈 */
		    padding: 10px; /* 내부여백 */
		    padding-left: 12px;
		    border: 1px solid #ddd;
		    background: url(./arrow_down_18dp.png) no-repeat right 50%; /* 화살표 위치 */
		    background-size: 30px; /* 화살표 크기 */
		    border-radius: 4px;
		    box-sizing: border-box;
		    -webkit-appearance: none;
		    -moz-appearance: none;
		    appearance: none;
		    font-size: 12px;
		    color: #000;
		    outline:none;
		}
		.bo_w_select:hover {border: 1px solid #aaa;} /* 마우스오버 */
		
		/* 리뷰작성 팝업창 스타일 */
		#review_store{
		  background-color: #333;
		  color: #fff;
		  padding: 10px;
		  font-size: 30px;
		  border: 1px solid #fff;
		  font-weight: bold;
		  border-radius: 8px;
		}
		
		.modal_wrap {
		  display: none;
		  width: 700px;
		  height: 500px;
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		  background: #eee;
		  z-index: 2;
		  border-radius: 10px;
		  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
		}
		
		.black_bg {
		  display: none;
		  position: fixed;
		  top: 0;
		  left: 0;
		  width: 100%;
		  height: 100%;
		  background-color: rgba(0, 0, 0, 0.5);
		  z-index: 1;
		}
		
		.modal_close {
		  width: 40px;
		  height: 40px;
		  position: absolute;
		  top: 10px;
		  right: 10px;
		}
		
		.modal_close > a {
/* 		  display: block; */
		  width: 100%;
		  height: 100%;
		  font-size: 28px;
/* 		  background: url(https://img.icons8.com/metro/26/000000/close-window.png); */
		  text-indent: -9999px;
		}
		
		/* 별점 스타일 */
		.star-rating {
		  display: flex;
		  flex-direction: row-reverse;
		  font-size: 2.25rem;
		  line-height: 2.5rem;
		  justify-content: space-around;
		  padding: 0 0.2em;
		  text-align: center;
		  width: 5em;
		}
		
		.star-rating input {
		  display: none;
		}
		
		.star-rating label {
		  color: #e8e2dc;
		  cursor: pointer;
		}
		
		.star-rating :checked ~ label {
		  color: gold;
		}
		
		.star-rating label:hover,
		.star-rating label:hover ~ label {
		  color: #fff58c;
		}
		
		/* 영수증 파일 첨부 스타일 */
		.filebox .upload-name {
		  display: inline-block;
		  height: 40px;
		  padding: 0 10px;
		  vertical-align: middle;
		  border: 1px solid #dddddd;
		  width: 78%;
		  color: #999999;
		}
		
		.filebox label {
		  display: inline-block;
		  padding: 10px 20px;
		  color: #fff;
		  vertical-align: middle;
		  background-color: #999999;
		  cursor: pointer;
		  height: 40px;
		  margin-left: 10px;
		}
		
		.filebox input[type="file"] {
		  position: absolute;
		  width: 0;
		  height: 0;
		  padding: 0;
		  overflow: hidden;
		  border: 0;
		}
		
		/* 등록 버튼 스타일 */
		.register {
		  display: inline-block;
		  padding: 10px 20px;
		  background-color: #81c147;
		  color: #fff;
		  border: none;
		  cursor: pointer;
		  transition: background-color 0.2s ease-in-out;
		}
		
		.register:hover {
		  background-color: #ff9800;
		}
		
		/* 텍스트 에리어 스타일 */
		textarea {
		  width: 100%;
		  padding: 10px;
		  border: 1px solid #ddd;
		  border-radius: 5px;
		  transition: border-color 0.2s ease-in-out;
		}
		
		textarea:focus {
		  border-color: #777;
		}
      
      </style>
      
    </head>
    
    <body class="sb-nav-fixed">
            <!-- -----------------------------------마이페이지, 로그아웃------------------------------------- -->
    
<!-- ---------------------------로그인 세션 정보(모든 컬럼값)----------------------------- -->    
			<script>
				var userId;
				var userGender;
				var userAge;
				console.log(userId);
	    	</script>
		<% tb_memberDTO loginResult = (tb_memberDTO)session.getAttribute("loginResult"); 
			if(loginResult != null){
				System.out.print("로그인 회원 아이디 : " + loginResult.getM_id());
				String userId = loginResult.getM_id();
				String userGender = loginResult.getM_gender();
				String userAge = loginResult.getM_age();
		%>
			<script>
		        // JavaScript 코드 내에서 JSP 변수를 사용
		        userId = '<%= userId %>';
		        userGender = '<%= userGender%>'
		        userAGE = '<%= userAge%>'
		        console.log(userId);
	    	</script>

    	<% 
			}
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
                            <a class="nav-link" href="Board_List_check.jsp">
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
                    
                    <!-- 리뷰 작성 창 띄우기 -->
                    window.onload = function() {
 	            	   
	            	    function onClick() {
	            	    	 // userId 값 확인
	    			        if (!userId) {
	    			        	// 경고창
	    			        	$("#alertLogin").click();
	    			            return; // 등록 중단
	    			        }
	            	        document.querySelector('.modal_wrap').style.display ='block';
	            	        document.querySelector('.black_bg').style.display ='block';
	            	    }   
	            	    function offClick() {
	            	        document.querySelector('.modal_wrap').style.display ='none';
	            	        document.querySelector('.black_bg').style.display ='none';
	            	    }
	            	 
	            	    document.getElementById('modal_btn').addEventListener('click', onClick);
	            	    document.querySelector('.modal_close').addEventListener('click', offClick);
	            	 
	            	};
	            	
	            	// 비로그인 에러 알림창 실행 버튼 클릭 이벤트
	            	$(document).ready(function() {
	            	    $("#alertLogin").click(function() {
	            	        Swal.fire({
	            	            icon: 'error',
	            	            title: '로그인이 필요한 서비스입니다.',
	            	            text: '',
	            	        });
	            	    });
	            	});
	            	
	            	<!-- 셀렉트박스 생성 -->
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
   				     sel=document.form.county
   				       /* 옵션메뉴삭제 */
   				       for (i=sel.length-1; i>=0; i--){
   				         sel.options[i] = null
   				         }
   				       /* 옵션박스추가 */
   				       for (i=0; i < cnt[add].length;i++){                     
   				                         sel.options[i] = new Option(cnt[add][i], cnt[add][i]);
   				         }         
   				     }
               </script>
                    
               <form name=form method=post action=$PHP_SELF>
                   <span style="font-weight: bold; font-size: 14px; color: #333;">시/도:</span> 
                   <select name='city' id="city" onchange="change(this.selectedIndex);"  class="bo_w_select" >
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
                   <span style="font-weight: bold; font-size: 14px; color: #333;">구/군:</span> 
                   <select name='county' id="country" class="bo_w_select">
                       <option value=''>전체</option>
                   </select>
				</form> 
                    
                    
                <!-- 카카오 지도 생성 -->
                <div style="width: 50%; float: left;">
			  		<div style="border: 5px solid #009688; border-radius: 8px; overflow: hidden;">
			    		<div id="map" style="width: 100%; height: 500px;"></div>
			  		</div>
				</div>
                
                <!-- 가게 정보 테이블 -->
               <div id=store_table>
	               <table>
	               	   <tbody>
	               	   	   <tr>
	               	   	      <th colspan="2">가게 이미지</th>
	               	   	      <th colspan="3">가게 정보</th>
	               	   	   </tr>
		                   <tr>
		                       <td rowspan="8" colspan="2">
		                           <img id="shop_img" alt="가게 이미지" src="">
		                       </td>
		                       <td>📋가게명</td>
		                       <td colspan="2" id="shop_name"></td>
		                   </tr>
		                   <tr>
		                       <td>🚩주소</td>
		                       <td colspan="2" id="shop_addr"></td>
		                   </tr>
		                   <tr>
		                       <td>📞전화번호</td>
		                       <td colspan="2" id="shop_tel"></td>
		                   </tr>
		                   <tr>
		                       <td>🛎업종</td>
		                       <td colspan="2" id="shop_business"></td>
		                   </tr>
		                   <tr>
		                       <td>✅주요품목</td>
		                       <td colspan="2" id="shop_items"></td>
		                   </tr>
		                   <tr>
		                       <td>🚘주차여부</td>
		                       <td id="shop_parking"></td>
		                       <td >
			                       <button class="review" onclick="makeChart()">🔍 평점조회</button>
		                       </td>
		                   </tr>
		                   <tr>
		                       <td>✏리뷰 건수</td>
		                       <td id="shop_review">0건</td>
		                       <td colspan="2">
			                       <button class="review" id="modal_btn">🖊 리뷰작성</button>
			                       <button id="alertLogin" style="display: none;"></button>
		                       </td>
		                   </tr>
		                   <tr>
		                       <td>💕찜 수</td>
		                       <td id="shop_like">0</td>
		                       <td colspan="2">
			                       <button class="like_poeple" onclick="saveWish()">💛 찜하기</button>
			                       <button id="WishSuccess" style="display: none;"></button>
			                       <button id="alertWish" style="display: none;"></button>
		                       </td>
		                   </tr>
	                   </tbody>
	               </table>
               </div>
               
               <!-- 평점 통계 바 차트 -->
               <div style="display: flex;">
                <div style="width: 650px; height: 900px;">
					<!--차트가 그려질 부분-->
					<canvas id="myChart"></canvas>
				</div>
				
			   <!-- 성별 통계 파이 차트 -->
			    <div class="chart-div">
		            <canvas id="pieChartCanvas" width="350px" height="350px"></canvas>
		        </div>
			   </div>

				<!-- 리뷰 작성 팝업창 -->
			   <div class="black_bg"></div>
			   <div class="modal_wrap">
			       <div class="modal_close"><a href="#" onclick="resetForm();">❎</a></div>
			       <div>
			       <table>
			       
			          <tr>
			          <th colspan="2" id="review_store">가게이름</th>
			          </tr>
			          
			          <tr>
			          <td>서비스 or 맛 점수는 ?</td>
				      <td>
				      <div>
					      <div class="star-rating space-x-4 mx-auto">
							<input type="radio" id="5-stars-service" name="service" value="5" v-model="ratings"/>
							<label for="5-stars-service" class="star pr-4">★</label>
							<input type="radio" id="4-stars-service" name="service" value="4" v-model="ratings"/>
							<label for="4-stars-service" class="star">★</label>
							<input type="radio" id="3-stars-service" name="service" value="3" v-model="ratings"/>
							<label for="3-stars-service" class="star">★</label>
							<input type="radio" id="2-stars-service" name="service" value="2" v-model="ratings"/>
							<label for="2-stars-service" class="star">★</label>
							<input type="radio" id="1-star-service" name="service" value="1" v-model="ratings" />
							<label for="1-star-service" class="star">★</label>
					  		</div>
				       </div>
				      </td>
			          </tr>
			          
			          <tr>
			          <td>가성비 점수는 ?</td>
				      <td>
				      <div>
					      <div class="star-rating space-x-4 mx-auto">
							<input type="radio" id="5-stars-effective" name="effective" value="5" v-model="ratings"/>
							<label for="5-stars-effective" class="star pr-4">★</label>
							<input type="radio" id="4-stars-effective" name="effective" value="4" v-model="ratings"/>
							<label for="4-stars-effective" class="star">★</label>
							<input type="radio" id="3-stars-effective" name="effective" value="3" v-model="ratings"/>
							<label for="3-stars-effective" class="star">★</label>
							<input type="radio" id="2-stars-effective" name="effective" value="2" v-model="ratings"/>
							<label for="2-stars-effective" class="star">★</label>
							<input type="radio" id="1-star-effective" name="effective" value="1" v-model="ratings" />
							<label for="1-star-effective" class="star">★</label>
					  </div>
				       </div>
				      </td>
			          </tr>
			          
			          <tr>
			          <td>청결도 점수는 ?</td>
				      <td>
				      <div>
					      <div class="star-rating space-x-4 mx-auto">
							<input type="radio" id="5-stars-clean" name="clean" value="5" v-model="ratings"/>
							<label for="5-stars-clean" class="star pr-4">★</label>
							<input type="radio" id="4-stars-clean" name="clean" value="4" v-model="ratings"/>
							<label for="4-stars-clean" class="star">★</label>
							<input type="radio" id="3-stars-clean" name="clean" value="3" v-model="ratings"/>
							<label for="3-stars-clean" class="star">★</label>
							<input type="radio" id="2-stars-clean" name="clean" value="2" v-model="ratings"/>
							<label for="2-stars-clean" class="star">★</label>
							<input type="radio" id="1-star-clean" name="clean" value="1" v-model="ratings" />
							<label for="1-star-clean" class="star">★</label>
					  </div>
				       </div>
				      </td>
			          </tr>
			          
			          <tr>
			          	<td colspan="2">
					      <textarea name="content" placeholder="리뷰를 작성해주세요" rows="10" style="width:100%;"></textarea>
					    </td>
			          </tr>
			          
			          <tr>
			          	<td colspan="2">
							<div class="filebox">
							    <input class="upload-name" placeholder="영수증 파일을 첨부해주세요">
							    <label for="file">파일첨부</label> 
							    <input type="file" id="file" accept="image/png, image/jpeg">
							</div>
					    </td>
			          </tr>
			          
			          <tr>
			          	<td colspan="2">
			          	<button class="register" onclick="saveReview()" type="button">등록</button>
					    <!-- 리뷰등록 성공시 알림창 -->
						<button id="ReviewSuccess" style="display: none;"></button>
						<button id="alertReceipt" style="display: none;"></button>
					    </td>
			          </tr>
					
			         </table>
			       </div>
			    </div>
                    
                    
<!--             지도 마커에 찍는 부분 -->
               <% 
	               tb_storeDTO dto = new tb_storeDTO(35.1520445, 126.888729);	
	          	   List<tb_storeDTO> store_list = new tb_storeDAO().selectStore(dto);   
          	   %>
               <script>
               // 전역 변수로 차트 객체 선언
               var myChart = null;
               
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
               
               
               var overlay = new kakao.maps.CustomOverlay({
                   map: map,
                   position: marker[i].getPosition()       
               });
               
               // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
               kakao.maps.event.addListener(marker[i], 'click', function() {
            	   
                   overlay.setMap(map);
               });
               	   overlay.setMap(null)
               }
               // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
               function closeOverlay() {
                   overlay.setMap(null);     
               }
               
			   document.addEventListener("DOMContentLoaded", function(){
            	   
            	   const country = document.getElementById('country');
            	   
            	   console.log(country)
                   
                   country.addEventListener('change', CityChange)
                  
					
               });
			   
			   var CityChange = function(){
            	   console.log('changed')
					var a = $("#city option:selected").val();
					var b = this.value;
					console.log("시/도 : " + a + " 구/군 : " + b);
					// 키워드로 장소를 검색합니다
					
					// 장소 검색 객체를 생성합니다
					var ps = new kakao.maps.services.Places(); 
					ps.keywordSearch(a + ' ' + b+'청', placesSearchCB); 

				}
			    var shop_Idx;
				var shop_cnt;
				var wish_cnt;
				
				function placesSearchCB (data, status, pagination) {
					if (status === kakao.maps.services.Status.OK) {

				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				        // LatLngBounds 객체에 좌표를 추가합니다
				        var bounds = new kakao.maps.LatLngBounds();

			            bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				        map.setBounds(bounds);
			            map.setLevel(5);
				    } 
					
					/* 현재 좌표에서 마커 찍는 코드 */
					$( document ).ready(function() { //페이지가 로딩되면 바로 실행한다.
						$.ajax({
					        type:"POST",             //POST방식통신
					        url:"http://localhost:8081/MessageSystem/SelectLatLng",     // Servlet과 mapping할 URL
					        dataType : "json",       //dataType은  JSON형식으로 지정한다.
					        data : {lat: data[0].y, lng : data[0].x},
					        success: function(store_data){
					            console.log(store_data);   //통신에 성공하면 콘솔에 출력한다. 
					            var marker = [];
					               
				                for (var i = 0; i < store_data.length; i++) {
				                   var lat = store_data[i].lat;
				                   var lng = store_data[i].lng;
				               
				                   marker[i] = new kakao.maps.Marker({
				                       map: map,
				                       position: new kakao.maps.LatLng(lat, lng)
				                   });
				                   
				                   
				                   var overlay = new kakao.maps.CustomOverlay({
				                       map: map,
				                       position: marker[i].getPosition()       
				                   });
				                   
				                   // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
				                   kakao.maps.event.addListener(marker[i], 'click', (function(marker, overlay, store) {
				                       return function() {
				                    	
				                    	// 차트 숨기기
				                    	$('#myChart').hide();
				                    	shop_Idx = store.shop_idx;   
				                    	
				                    	// 기존 차트 제거
				                        if (myChart) {
				                            myChart.destroy();
				                            myChart = null;
				                        }
				                    	
				                    	// 가게 리뷰건수 AJAX 통신
				       			        $.ajax({
				       					        type:"POST",             //POST방식통신
				       					        url:"http://localhost:8081/MessageSystem/Count_Review",     // Servlet과 mapping할 URL
				       					        dataType : "json",       //dataType은  JSON형식으로 지정한다.
				       					        data : {
				       					        	shopIdx: shop_Idx
				       					        },
				       					        success: function(data){
				       					            console.log(data);
													shop_cnt = data.cnt;
													document.getElementById("shop_review").innerText = shop_cnt+"건";
				       					        },
				       					        error: function(xhr, status, error) {
				       					        	console.log(error);
				       					        }  
				       					    });
				                    	
				       			  		// 가게 찜수 AJAX 통신
				       			        $.ajax({
				       					        type:"POST",             //POST방식통신
				       					        url:"http://localhost:8081/MessageSystem/CountWish",     // Servlet과 mapping할 URL
				       					        dataType : "json",       //dataType은  JSON형식으로 지정한다.
				       					        data : {
				       					        	shopIdx: shop_Idx
				       					        },
				       					        success: function(data){
				       					            console.log(data);
													wish_cnt = data.cnt;
													document.getElementById("shop_like").innerText = wish_cnt;
				       					        },
				       					        error: function(xhr, status, error) {
				       					        	console.log(error);
				       					        }  
				       					    });
				                    	
				                    	
				                    	   // 가게정보 테이블 출력
				                    	   
				                    	   $("#store_table").show();
				                    	   
										   document.getElementById("shop_img").src = store.shop_img;
										   document.getElementById("shop_img").src = store.shop_img;
										   document.getElementById("shop_name").innerText = store.shop_name;
										   document.getElementById("shop_addr").innerText = store.shop_addr;
										   document.getElementById("shop_tel").innerText = store.shop_tel;
										   document.getElementById("shop_business").innerText = store.shop_business;
										   document.getElementById("shop_items").innerText = store.shop_items;
										   document.getElementById("shop_parking").innerText = store.shop_parking;
										   
										   // 첫 번째 테이블의 shop_name 값을 가져와서 변수에 저장
										   const shopName = document.getElementById('shop_name').textContent;
										   
										   // 두 번째 테이블의 review_store 요소를 선택하여 내용 변경
										   const reviewStoreElement = document.getElementById('review_store');
										   reviewStoreElement.textContent = shopName;

										   overlay.setMap(map);
				                       };
				                   })(marker[i], overlay, store_data[i]));
				                   
				                   function closeOverlay() {
				                	    overlay.setMap(null);     
				               		}
				               }
				            
					            
					        },
					        error: function(xhr, status, error) {
					        	console.log(error);
					        }  
					    });
					});
				}
				
				<!-- 리뷰 데이터 전송 -->
			    function saveReview() {
			        // 데이터 추출
			        var serviceRating = document.querySelector('input[name="service"]:checked').value;
			        var effectiveRating = document.querySelector('input[name="effective"]:checked').value;
			        var cleanRating = document.querySelector('input[name="clean"]:checked').value;
			        var content = document.querySelector('textarea[name="content"]').value;
			        var filename = document.querySelector('#file').value;
			
			        if (!filename) {
			        	// 경고창 표시
			        	$("#alertReceipt").click(); 
			            return; // 등록 중단
			        }

			        
			        // AJAX 통신
			        $.ajax({
					        type:"POST",             //POST방식통신
					        url:"http://localhost:8081/MessageSystem/InsertReview",     // Servlet과 mapping할 URL	
					        dataType : "text",
					        data : {
					        	userId: userId,
					        	shopIdx: shop_Idx,
					            serviceRating: serviceRating,
					            effectiveRating: effectiveRating,
					            cleanRating: cleanRating,
					            content: content,
					            filename: filename
					            userGender: userGender,
					            userAge: userAge
					        },
					        success: function(){
					        	
					         // 리뷰등록 성공시 회원 포인트정보 업데이트 AJAX 통신
					        	$.ajax({
					        	    type: "POST",
					        	    url: "http://localhost:8081/MessageSystem/UpdatePoint",
					        	    dataType: "text",
					        	    data: {
					        	        user_Id: userId // 업데이트할 회원의 userId
					        	    },
					        	    success: function(response) {
					        	        console.log("회원 정보 업데이트 성공");
					        	        // 추가적인 처리 로직 작성
					        	    },
					        	    error: function(xhr, status, error) {
					        	        console.log("회원 정보 업데이트 실패");
					        	        console.log(error);
					        	        // 에러 처리 로직 작성
					        	    }
					        	}); 
					        	
					        	// 리뷰등록 성공시 알림창
					        	$("#ReviewSuccess").click();
					        	
					            // 등록 성공시 창을 닫는 함수
					        	$(".modal_wrap").hide();
					            $(".black_bg").hide();
					         	
					            // 폼 필드 초기화 함수 호출
					            resetForm();
					          	
					         	// 리뷰 건수 업데이트
					            var currentReviewCount = parseInt($("#shop_review").text().replace("건", ""));
					            $("#shop_review").text((currentReviewCount + 1) + "건");
					            
					        },
					        error: function(xhr, status, error) {
					        	console.log(error);
					        }  
					    });
			        
			     	// 리뷰등록성공시 알림창 실행 버튼 클릭 이벤트
			        $(document).ready(function() {
			            $("#ReviewSuccess").click(function() {
			                Swal.fire({
			                    icon: 'success',
			                    title: '리뷰 등록 완료!',
			                    text: '500P 적립되었습니다.',
			                });
			            });
			        });
			    }
			    
			 	// 영수증 미첨부시 경고창 실행 버튼 클릭 이벤트
			    $(document).ready(function() {
			        $("#alertReceipt").click(function() {
			            Swal.fire({
			                icon: 'warning',
			                title: '영수증 파일을 첨부해주세요!',
			            });
			        });
			    });
              
			 	// 폼 필드 초기화 함수
			    function resetForm() {
			        // 폼 필드 초기화
			        $("input[name='service']").prop("checked", false);
			        $("input[name='effective']").prop("checked", false);
			        $("input[name='clean']").prop("checked", false);
			        $("textarea[name='content']").val("");
			        $(".upload-name").val("");
			        $("#file").val("");
			    }
			    
			    /* 파일 첨부시 파일이름 변경 */
			    $("#file").on('change',function(){
			    	  var fileName = $("#file").val();
			    	  $(".upload-name").val(fileName);
			    	});
			    
			    <!-- 찜 데이터 전송 -->
			    function saveWish(){
			    	
			    	 // userId 값 확인
			        if (!userId) {
			        	// 경고 알림창
			        	$("#alertWish").click();
			            return; // 등록 중단
			        }
			    	
			    	// AJAX 통신
			        $.ajax({
					        type:"POST",             //POST방식통신
					        url:"http://localhost:8081/MessageSystem/InsertWish",     // Servlet과 mapping할 URL
					        dataType : "text",       //dataType은  JSON형식으로 지정한다.
					        data : {
					        	userId: userId,
					        	shopIdx: shop_Idx
					        },
					        success: function(data){
					        	console.log(data);
					        	
					        	// 찜 성공 알림창
					        	$("#WishSuccess").click();
					        	
					        	// 찜수 업데이트
					            var currentWishCount = parseInt($("#shop_like").text());
					            $("#shop_like").text((currentWishCount + 1));
					        },
					        error: function(xhr, status, error) {
					        	console.log(error);
					        }  
					    });
			    	
			     	// 찜성공 알림창 실행 버튼 클릭 이벤트
			        $(document).ready(function() {
			            $("#WishSuccess").click(function() {
			                Swal.fire({
			                    icon: 'success',
			                    title: '찜 목록에 추가되었습니다.',
			                });
			            });
			        });
			     	
			    }
			    
			     	// 비로그인 경고창 실행 버튼 클릭 이벤트
	            	$(document).ready(function() {
	            	    $("#alertWish").click(function() {
	            	        Swal.fire({
	            	            icon: 'error',
	            	            title: '로그인이 필요한 서비스입니다.',
	            	            text: '',
	            	        });
	            	    });
	            	});
			    
			    /* 평점 차트 그리기 */
               function makeChart() {
            	// 막대 차트를 표시	
            	$('#myChart').show();
            	// 파이 차트를 표시
            	$('#pieChartCanvas').show();
            	
			    var chartShopName = document.getElementById('shop_name').innerText;
			    var chartTitle = chartShopName + ' 평점';
				
			 	// 기존 차트 제거
			    if (myChart) {
			        myChart.destroy();
			        myChart = null;
			    }
			    
			    // AJAX 요청
			    $.ajax({
			        type: "POST",
			        url: "http://localhost:8081/MessageSystem/SelectReviewData",
			        data: { shopIdx: shop_Idx }, // 요청에 필요한 데이터 전달
			        dataType: "json",
			        success: function (response) {
			            var reviewData = response.data; // 가져온 데이터
						console.log(response.Clean);
			            var context = document.getElementById('myChart').getContext('2d');
			            myChart = new Chart(context, {
			                type: 'bar',
			                data: {
			                    labels: ['서비스 or 맛', '가성비', '청결도'],
			                    datasets: [{
			                        label: '평가점수',
			                        fill: false,
			                        data: [response.Service, response.Price, response.Clean],
			                        backgroundColor: [
			                            'rgba(54, 162, 235, 0.8)',
			                            'rgba(54, 162, 235, 0.8)',
			                            'rgba(54, 162, 235, 0.8)',
			                        ],
			                        borderColor: [
			                            'rgba(54, 162, 235, 1)',
			                            'rgba(54, 162, 235, 1)',
			                            'rgba(54, 162, 235, 1)',
			                        ],
			                        borderWidth: 3
			                    }]
			                },
			                options: {
			                    title: {
			                        display: true,
			                        text: chartTitle,
			                        fontSize: 24
			                    },
			                    scales: {
			                        yAxes: [{
			                            ticks: {
			                                beginAtZero: true,
			                                min: 0, // 최소값 설정
			                                max: 5, // 최대값 설정
			                                fontSize: 14
			                            }
			                        }],
			                        xAxes: [{
			                            ticks: {
			                                fontSize: 14
			                            },
			                            barThickness: 70
			                        }]
			                    }
			                }
			            });
			        },
			        error: function (xhr, status, error) {
			            console.log(error); // 에러 처리
			        }
			    });
			 	
			    // 파이 차트 그리기
			    var pieChartData = {
			      labels: ['foo', 'bar', 'baz', 'fie', 'foe', 'fee'],
			      datasets: [{
			        data: [95, 12, 13, 7, 13, 10],
			        backgroundColor: ['rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', 'rgb(153, 102, 255)']
			      }]
			    };

			    var pieContext = document.getElementById('pieChartCanvas').getContext('2d');
			    window.pieChart = new Chart(pieContext, {
			      type: 'pie',
			      data: pieChartData,
			      options: {
			        responsive: false
			      }
			    });
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
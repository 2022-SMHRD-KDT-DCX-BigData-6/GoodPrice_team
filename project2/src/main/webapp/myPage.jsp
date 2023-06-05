<%@page import="com.smhrd.model.tb_memberDAO"%>
<%@page import="com.smhrd.model.tb_wishlistDAO"%>
<%@page import="com.smhrd.model.tb_wishlistDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.smhrd.model.tb_reviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.tb_reviewDAO"%>
<%@page import="com.smhrd.model.tb_memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <<<<<<< HEAD -->

<style>
.point{
	text-align: center;
}
.h4 {
	vertical-align : middle;
}

</style>
<!DOCTYPE html>
<!-- >>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-DCX-BigData-6/GoodPrice_team.git -->
<html>

<head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	   	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<noscript><link rel="stylesheet" href="css/mypage/assets/css/noscript.css" /></noscript>
		<link rel="stylesheet" href="css/mypage/assets/css/main.css"/>
		<!-- <link rel="stylesheet" href="css/mypage/assets/css/all.min.css"/> -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0//css/all.min.css">
		<title>MYPAGE</title>
	</head>
	  <%tb_memberDTO member = (tb_memberDTO)session.getAttribute("loginResult");   
       
	  
      String m_id = member.getM_id();
      System.out.print(m_id);
       
      tb_memberDAO m_poiint = new tb_memberDAO();
      
      Double point = m_poiint.memPoint(m_id);
      
       List<tb_reviewDTO> reviewList = new tb_reviewDAO().reviewList(m_id);
            session.setAttribute("reviewList", reviewList);
      // System.out.print(list.get(0).getReview_content());
     
      /* List<tb_reviewDTO> dateList = new tb_reviewDAO().dateToChar(m_id);
      System.out.print(dateList.get(0).getReview_dt()); */
      
      List<tb_wishlistDTO> wishList = new tb_wishlistDAO().wishList(m_id);
            System.out.print(wishList);
            %> 
		<body class="is-preload">
			<div id = "top" align="right">
			<a href="main.jsp"><span>HOME</span></a>
			<a href="logout.html"><span>LOGOUT</span></a>			
			</div>
			<!-- Wrapper-->
         <!--    System.out.print(wishList);%>  -->
	<!-- <body class="is-preload">
	<div id="top" align="right">
		<label class="outMyPage">
			<a href="main.jsp">HOME</a> <a href="logout.html">LOGOUT</a>
		</label>
	</div> -->
	<!-- Wrapper-->
<!-- >>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-DCX-BigData-6/GoodPrice_team.git -->
			<div id="wrapper"><!-- 박스 가로 너비 -->

				<!-- Nav -->
					<nav id="nav"> <!-- 네비게이션 아이콘 디자인 -->
					<!-- $nav_links = $nav.children('a') -->
					
						<a href="" class="icon solid fa-receipt"><span>POINT</span></a>
						<a href="#work" class="icon solid fa-pen"><span>REVIEW</span></a>
						<a href="#wishList" class="icon solid fa-heart"><span>WISHLIST</span></a>
						<a href="#contact" class="icon fa-user"><span>MYINFO</span></a>
					</nav>

				<!-- Main -->
					<div id="main"> <!-- 박스 -->

						<!-- Me -->
							<article id="home" class="panel intro">
								<header>
									<h1>Good-Price</h1>
									<%=member.getM_nick()%>님 환영합니다.
								</header>
								
								<table>
								<th><h3> My Point : <%= member.getM_point() %></h3><th> 
								</table>
								
								<table>								
									
									    <th><span=3>포인트 사용 항목</span></th>
										<tr>									
										  <td><i class="fas fa-coffee fa-3x"></i></td>
										  <td></td>
										  <td><i class="fas fa-umbrella fa-3x"></i></td>
										</tr> 
										<tr> 
										  <td>2000p</td>
										  <td></td>
										  <td>4000p</td>
										</tr>
										<tr> 
										  <td><i class="fas fa-gift fa-3x"></i></td>
										  <td></td>
										  <td><i class="fas fa-camera fa-3x"></i></td>
										</tr> 
										<tr> 
										  <td>6000p</td>
										  <td></td>
										  <td>8000p</td>
										</tr>
									</table>
									
									 <button class="btn" id="btn1" type="button" style="padding:0px; margin:0px;"><i class="fas fa-coffee fa-3x"></i></button>
									
									 <script>
  
      const btn1 = document.getElementById("btn1");

      btn1.addEventListener("click", ()=>{

         console.log("btn1 clicked");

         /* const page = document.getElementById("page1");

         page.innerHTML = `
         <div style="width:40%; height:50%; background-color:#FA8258">
         <br>
         <br> */

            <h1>포인트</h1><br><br>  
          
            <%= member.getM_point()%> <br>
           
            
            
         </div>
         `;

      })
      </script>
      

 <a href="?p=-2000">2000point</a>
<?php

if($p =='-2000') insert_point($member['member.getM_point()'], -2000, '클릭포인트 -2000포인트차감');

?>
									
									
									
									
										
								
								</span>
								
								<a href="#work" class="jumplink pic">
									
									
								
									
									
									
									<p> Point : <%= point %></p>
									
									<span class="arrow icon solid fa-chevron-right" vertical-align = center">
									</span>
								
								</a>
									
							</article>

						<!-- Work -->
			<article id="work" class="panel">
			<header>
				<h2>Review</h2>
			</header>
			<body>
																			
				<div class="wrap">
				<div class="table_wrap">							
				<div class="table_box">							
				<table>
				<tbody>
					<tr>
					    <th>번호</th>
						<th>내용</th>
					    <th>날짜</th>
						<th>삭제</th>								
					</tr>				
					<% for(int i = 0; i < reviewList.size();i++){%>
					<tr>
					     <td><%= i + 1%></td>
						 <td><%= reviewList.get(i).getReview_content()%></td>
						 <td><%= reviewList.get(i).getReview_dt()%></td>
						 <td><a href = "#">삭제</a></td>
						 <%-- <td><a href = "ReviewDelete.do<%=reviewList.get(i).getReview_idx()%>">삭제</a></td> --%>
						 </tr>
						 <%}%>
					</tbody>
					</table>
				</div>
			</div>


																
								
							
								<%--   <% for(int i = 0; i < reviewList.size();i++){ %>
								     <%= i + 1%>
								     <%= reviewList.get(i).getReview_content()%>
								     <%=reviewList.get(i).getReview_dt()%>
								  
								   
								   <%}%> --%>
								 
							
								
								
								</body>
								
							</article>
							<article id="wishList" class="panel">
								<header>
									<h2>WishList</h2>
								</header>
								<body>
								
								
								
																			
				<div class="wrap">
				<div class="table_wrap">							
				<div class="table_box">							
				<table>
				<tbody>
					<tr>
					    <th>번호</th>
						<th>찜</th>
						<th>삭제</th>								
					</tr>
					
					</tr>				
					<% for(int i = 0; i < wishList.size();i++){%>
					<tr>
					     <td><%= i + 1%></td>
						 <td><%= wishList.get(i)%></td>	
						 <td>삭제</td>
						 </tr>
						 <%}%>
					</tbody>
					</table>
				</div>
			</div>
					
									
							<%-- 	<% for(int i = 0; i < wishList.size();i++){ %>
								<%= wishList.get(i) %>
								
								<% } %>
								
								</body>
							 --%>
							</article>

						<!-- Contact -->
							<article id="contact" class="panel">
								<header>
									<!-- <h2>정보 확인</h2> -->
								</header>
								<form action="updateMember.do" method="post">
									
									<div>
										<div class="row">
											<div class="col-12">
												<input type="text" name="name" value="<%= member.getM_name()%>" placeholder="이름을 입력해주세요">
											</div>
											<div class="col-12">
												<input type="text" name="nick" value="<%= member.getM_nick()%>" placeholder="닉네임을 입력해주세요">
											</div>
											<div class="col-6 col-12-medium">
												<input type="text" name="pw" value="<%= member.getM_pw()%>"placeholder="비밀번호를 입력해주세요" />
											</div>
											<div class="col-6 col-12-medium">
												<input type="text" name="pwcheck" placeholder="비밀번호를 확인해주세요" />
											</div>
											
											<div class="col-12">
												<input type="text" name="addr" value="<%= member.getM_addr()%>" placeholder="주소를 입력해주세요" rows="6"></textarea>
											</div>
											<div class="col-12" align="right">
												<input type="submit"  value="확인" >
												<input type="submit"  value="회원탈퇴" onclick="outMember(this.form);"/>	
											</div>
									
								</form>
											
												
																				
															
								</div>
							</article>

					</div>

				<!-- Footer -->
					<div id="footer">
						<ul class="copyright">
							<li>copy; @ HEAJA UNIT </li><li>Design:HEAJA UNIT</a></li>
						</ul>
					</div>

			</div>

		<!-- Scripts -->
			<script src="css/mypage/assets/js/jquery.min.js"></script>
			<script src="css/mypage/assets/js/browser.min.js"></script>
			<script src="css/mypage/assets/js/breakpoints.min.js"></script>
			<script src="css/mypage/assets/js/util.js"></script>
			
	<!-- 회원탈퇴 눌렀을 때 form action값 바꾸기 -->
	<script> 
    //회원탈퇴 하고 뒤로가기 하고 확인 누르면 회원 수정 되야하는데 회원 탈퇴가 되는 버그 존재
  	function outMember(frm) { 
    frm.action="outMember.do";
    frm.submit(); 
    return true; 
  	} 
  	</script>
	
	<script type="text/javascript">
	/*
	Astral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
*/

(function($) {

	var $window = $(window),
		$body = $('body'),
		$wrapper = $('#wrapper'),
		$main = $('#main'),
		$panels = $main.children('.panel'),
		$nav = $('#nav'), $nav_links = $nav.children('a');

	// Breakpoints.
		breakpoints({
			xlarge:  [ '1281px',  '1680px' ],
			large:   [ '981px',   '1280px' ],
			medium:  [ '737px',   '980px'  ],
			small:   [ '361px',   '736px'  ],
			xsmall:  [ null,      '360px'  ]
		});

	// Play initial animations on page load.
		$window.on('load', function() {
			window.setTimeout(function() {
				$body.removeClass('is-preload');
			}, 100);
		});

	// Nav.
		$nav_links
			.on('click', function(event) {

				var href = $(this).attr('href');

				// Not a panel link? Bail.
					if (href.charAt(0) != '#'
					||	$panels.filter(href).length == 0)
						return;
					
				// Prevent default.
					event.preventDefault();
					event.stopPropagation();

				// Change panels.
					if (window.location.hash != href)
						window.location.hash = href;

			});

	// Panels.

		// Initialize.
			(function() {

				var $panel, $link;

				// Get panel, link.
					if (window.location.hash) {

				 		$panel = $panels.filter(window.location.hash);
						$link = $nav_links.filter('[href="' + window.location.hash + '"]');

					}

				// No panel/link? Default to first.
					if (!$panel
					||	$panel.length == 0) {

						$panel = $panels.first();
						$link = $nav_links.first();

					}

				// Deactivate all panels except this one.
					$panels.not($panel)
						.addClass('inactive')
						.hide();

				// Activate link.
					$link
						.addClass('active');

				// Reset scroll.
					$window.scrollTop(0);

			})();

		// Hashchange event.
			$window.on('hashchange', function(event) {

				var $panel, $link;

				// Get panel, link.
					if (window.location.hash) {

				 		$panel = $panels.filter(window.location.hash);
						$link = $nav_links.filter('[href="' + window.location.hash + '"]');

						// No target panel? Bail.
							if ($panel.length == 0)
								return;

					}

				// No panel/link? Default to first.
					else {

						$panel = $panels.first();
						$link = $nav_links.first();

					}

				// Deactivate all panels.
					$panels.addClass('inactive');

				// Deactivate all links.
					$nav_links.removeClass('active');

				// Activate target link.
					$link.addClass('active');

				// Set max/min height.
					$main
						.css('max-height', $main.height() + 'px')
						.css('min-height', $main.height() + 'px');

				// Delay.
					setTimeout(function() {

						// Hide all panels.
							$panels.hide();

						// Show target panel.
							$panel.show();

						// Set new max/min height.
							$main
								.css('max-height', $panel.outerHeight() + 'px')
								.css('min-height', $panel.outerHeight() + 'px');

						// Reset scroll.
							$window.scrollTop(0);

						// Delay.
							window.setTimeout(function() {

								// Activate target panel.
									$panel.removeClass('inactive');

								// Clear max/min height.
									$main
										.css('max-height', '')
										.css('min-height', '');

								// IE: Refresh.
									$window.triggerHandler('--refresh');

								// Unlock.
									locked = false;

							}, (breakpoints.active('small') ? 0 : 500));

					}, 250);

			});

	// IE: Fixes.
		if (browser.name == 'ie') {

			// Fix min-height/flexbox.
				$window.on('--refresh', function() {

					$wrapper.css('height', 'auto');

					window.setTimeout(function() {

						var h = $wrapper.height(),
							wh = $window.height();

						if (h < wh)
							$wrapper.css('height', '100vh');

					}, 0);

				});

				$window.on('resize load', function() {
					$window.triggerHandler('--refresh');
				});

			// Fix intro pic.
				$('.panel.intro').each(function() {

					var $pic = $(this).children('.pic'),
						$img = $pic.children('img');

					$pic
						.css('background-image', 'url(' + $img.attr('src') + ')')
						.css('background-size', 'cover')
						.css('background-position', 'center');

					$img
						.css('visibility', 'hidden');

				});

		}

})(jQuery);
	</script>

	
</body>
</html>
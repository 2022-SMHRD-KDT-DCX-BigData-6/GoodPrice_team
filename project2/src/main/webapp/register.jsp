<%@page import="com.smhrd.model.tb_memberDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<style type="text/css">
	.card-header{
		position: relative;
		top: 0;
	}
	.emailCheck{
	margin-left: 90px;
	}
	
	
</style>
<title>회원가입</title>
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>


</head>
<body class="bg-primary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center"> <!-- 중간에 위치하게 -->
						<div class="col-lg-7"> <!-- 박스 너비 -->
							<div class="card shadow-lg border-0 rounded-lg mt-5"> <!-- 박스 틀 -->
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">회원 가입</h3>
								</div>
								<div class="card-body">
											
											<!-- 중복체크 변수 -->
											<% tb_memberDTO emailCheckResult = (tb_memberDTO)session.getAttribute("emailCheckResult"); %>
									<!-- --------------------------회원가입 시작---------------------------- -->
									<script src="./js/dataCheck.js"></script>
									<form action="JoinService.do" method="post" name="joinForm" id="formId" onsubmit="submitCheck();">
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating">
													<input class="form-control" name="m_name"
														id="inputLastName" type="text" />
														 
														<label for="inputLastName">이름</label> <span id="nameSpan" >한글 10자 이내/ 영문30자 이내</span>
												</div>
											</div>
										</div>
										
										
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" name="m_id" id="inputEmail" type="text" />
													 <label for="inputEmail">이메일</label> 
													 <span>영문 , 숫자 혼합10~30자 이내</span>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" type="text" name="inputDomain" id="inputDomain"  aria-label="readonly input example" readonly>
													<label for="inputDomain">도메인</label>
													<select name="selectDomain" id="selectDomain" title="이메일 주소 선택" onchange="changeEmail();">
														<option value=""> 선택 </option>
														<option value="etc"> 직접입력  </option>
                										<option value="naver.com">naver.com</option>
														<option value="nate.com">nate.com</option>
														<option value="gmail.com">gmail.com</option>
														<option value="yahoo.com">yahoo.com</option>
														<option value="hanmail.net">hanmail.net</option>
													</select>
													<input type="button" id="emailCheck" class="btn btn-primary mb-3" value="중복검사" style="float: right;">
												</div>
											</div>
										</div>
										<!-- <script src="./js/jquery-3.6.4.js"></script>
										 <script>
        									$("select[name=selectDomain]").on("change",function(){
        										if($(this).val() === "etc"){
        											$("select[name=inputDomain]").prop("readonly",false);
        										} 
        									})
    									</script> -->
										
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" name="m_pw" id="inputPassword" type="password"/>
													 <label for="inputPassword">비밀번호</label> 
													 <span>영문 , 숫자 혼합10~30자 이내</span>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" name="m_checkPw" id="inputPasswordConfirm" type="password"/> 
													<label for="inputPasswordConfirm">비밀번호 확인</label> 
												</div>
											</div>
										</div>

										<div class="form-floating mb-3">
											<input class="form-control" name="m_nick" id="inputNick" type="text"/> 
											<label for="inputEmail">닉네임</label> <span>한글 10자 이내</span>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" name="m_age" id="inputAge" type="number" max="200"/>
											<label for="inputAge">나이</label>
											<!-- 연도 셀렉박스 -->
											<%-- <select>
											<% for(int year = 1900; year <= 2023;year++){ %>
												<option value="<%= year %>"><%= year %></option>
												<% } %>
											</select>
											
											<!-- 월 셀렉박스 -->
											<select>
												<% int month = 0;
												for(month = 1; month <= 12; month++){ %>
													<option value="<%= month %>"><%= month %></option>
												<% } %>
											</select>
											<!-- 일 셀렉박스 -->
											
											<!-- 31일 포함하는 달 -->
											<select>
											<% int day = 1;
											if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12){ %>
												<% for(day = 1; day <= 31; day++){ %>
												<option value="<%= day %>"><%= day %></option>												
												<% } %>
											
											<!-- 31일 포함 안하는 달 -->
											<% }else{ %>
												<% for(day = 1; day <= 30; day++){ %>
												<option value="<%= day %>"><%= day %></option>												
												<% } %>
											<% } %>
											</select> --%>
										</div>
										
										<table class="btn btn-primary mb-3" border="1">
											<tr>
												<td><span >성별</span></td>
												<td>
												남<input name="m_gender" id="man"type="radio" value="m"/>
												여<input name="m_gender"id="girl" type="radio" value="w" />
												</td>
											</tr>
										</table>
										<!-- ---------------------다음 주소 API----------------------- -->
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" onclick="sample4_execDaumPostcode();"> 
														<label for="sample4_postcode">주소</label> <span>
														<input type="button" class="btn btn-primary mb-3" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"></span>
												</div>
											</div>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" name="m_addr"
												id="sample4_roadAddress" readonly="readonly" placeholder="도로명주소">
											<label for="sample4_roadAddress">도로명 주소</label> <span>상세주소
												입력x</span> <input type="hidden" class="form-floating mb-3"
												id="sample4_jibunAddress" placeholder="지번주소" size="60">
											<input type="hidden" class="form-floating mb-3"
												id="sample4_detailAddress" placeholder="상세주소" size="60">
											<span id="guide" style="color: #999; display: none"></span> <input
												type="hidden" class="form-floating mb-3"
												id="sample4_extraAddress" placeholder="참고항목" size="60">
											<input type="hidden" class="form-floating mb-3"
												id="sample4_engAddress" placeholder="영문주소" size="60"><br>
										</div>

										<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
										<script>
											//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
											function sample4_execDaumPostcode() {
												new daum.Postcode(
														{
															oncomplete : function(
																	data) {
																// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

																// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
																// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
																var roadAddr = data.roadAddress; // 도로명 주소 변수
																var extraRoadAddr = ''; // 참고 항목 변수

																// 법정동명이 있을 경우 추가한다. (법정리는 제외)
																// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
																if (data.bname !== ''
																		&& /[동|로|가]$/g
																				.test(data.bname)) {
																	extraRoadAddr += data.bname;
																}
																// 건물명이 있고, 공동주택일 경우 추가한다.
																if (data.buildingName !== ''
																		&& data.apartment === 'Y') {
																	extraRoadAddr += (extraRoadAddr !== '' ? ', '
																			+ data.buildingName
																			: data.buildingName);
																}
																// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
																if (extraRoadAddr !== '') {
																	extraRoadAddr = ' ('
																			+ extraRoadAddr
																			+ ')';
																}

																// 우편번호와 주소 정보를 해당 필드에 넣는다.
																document
																		.getElementById('sample4_postcode').value = data.zonecode;
																document
																		.getElementById("sample4_roadAddress").value = roadAddr;
																document
																		.getElementById("sample4_jibunAddress").value = data.jibunAddress;

																document
																		.getElementById("sample4_engAddress").value = data.addressEnglish;

																// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
																if (roadAddr !== '') {
																	document
																			.getElementById("sample4_extraAddress").value = extraRoadAddr;
																} else {
																	document
																			.getElementById("sample4_extraAddress").value = '';
																}

																var guideTextBox = document
																		.getElementById("guide");
																// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
																if (data.autoRoadAddress) {
																	var expRoadAddr = data.autoRoadAddress
																			+ extraRoadAddr;
																	guideTextBox.innerHTML = '(예상 도로명 주소 : '
																			+ expRoadAddr
																			+ ')';
																	guideTextBox.style.display = 'block';

																} else if (data.autoJibunAddress) {
																	var expJibunAddr = data.autoJibunAddress;
																	guideTextBox.innerHTML = '(예상 지번 주소 : '
																			+ expJibunAddr
																			+ ')';
																	guideTextBox.style.display = 'block';
																} else {
																	guideTextBox.innerHTML = '';
																	guideTextBox.style.display = 'none';
																}
															}
														}).open();
											}
										</script>
								<!-- ----------------------다음 주소 API---------------------------- -->
								<div class="d-grid">
									<input type="submit" class="btn btn-primary btn-block"
										value="회원가입" onclick="submitCheck();">
								</div>
								<div class="card-footer text-center py-3">
									<span><a class="small" href="main.jsp">메인페이지</a></span> <a
										href="login.jsp">아이디가 이미 있으신가요? 로그인 하러 가기</a>
								</div>
									</form>
								</div>
							</div>
							<!-- --------------------------회원가입 끝---------------------------- -->
						</div>
					</div>
				</div>
	</main>
		</div>
	</div>
	<div id="layoutAuthentication_footer">
		<footer class="py-4 bg-light mt-auto">
			<div class="container-fluid px-4">
				<div class="d-flex align-items-center justify-content-between small">
					<div class="text-muted">Copyright &copy; Your Website 2023</div>
					<div>
						<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
							&amp; Conditions</a>
					</div>
				</div>
			</div>
		</footer>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="./js/dataCheck.js"></script>
	<script type="text/javascript">
	//-------------이름 유효성검사----------------
	
	
	
	
	function changeEmail(){
		var inputDomain = document.getElementById("inputDomain");
		var selectDomain = document.getElementById("selectDomain");
		
		//현재 선택된 옵션의 순서와 값을 취득
		var idx = selectDomain.options.selectedIndex;
		
		//취득한 값 val에 저장
		var val = selectDomain.options[idx].value;
		 
		    if (val === "etc") {
		    	inputDomain.readOnly = false;
		    	inputDomain.value = "";
		    } else {
		    	//저장한 값을 emailAdd 값으로 저장
				inputDomain.value = val;
		    	inputDomain.readOnly = true;
		    }
		
		
	}
	</script>
</body>
</html>

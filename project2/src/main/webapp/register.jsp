<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
	#card-header{
		position: relative;
		top: 0;
	}
	#emailDuple{
	margin-left: 90px;
	}
	
	
</style>
<title>회원가입</title>
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="js/emailCheck.js"></script>

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
											
									<% HttpSession hs = request.getSession();
									//중복이면 null값 중복 아니면 사용자가 입력한 값 들어있음
										String emailCheckResult = (String)hs.getAttribute("emailCheckResult");
										
										String[] dev = new String[2];
										dev[0] = "";
										dev[1] = "";
										
										if(emailCheckResult != null){
											
										//@를 기준으로 앞, 뒤를 잘라서 배열에 저장
										//emailCheckResultDev[0] = m_id
										//emailCheckResultDev[1] = domain
										 dev = emailCheckResult.split("@");
											
										}
											
										%>
										
									<!-- --------------------------회원가입 시작---------------------------- -->
									<form action="emailCheck.do" method="post" name="joinForm" id="formId" onsubmit="emailCheck();">
										
										<!-- -----------------------이메일----------------------- -->
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" name="m_id" id="inputEmail" type="text" value="<%= dev[0] %>"  />
													 <label for="inputEmail">이메일</label> 
													 <span class="dupleCheck" >영문 , 숫자 혼합10~30자 이내</span>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" type="text" name="inputDomain" id="inputDomain"  aria-label="readonly input example" value=" <%= dev[1] %> " readonly="readonly" >
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
													
													
													<!-- 중복체크 했나 안했나 확인용 value="unCheck" 이면 중복체크 안한거-->
													<input type="hidden" id="dupleConfirm" name="dupleConfirm" value="unCheck">
													 
													 <!-- 세션 결과값 여기에 저장 - 비어있으면 중복x 값이 있으면 중복 -->
													 <input type="hidden" id="idVal" value="" ></input> 
													
													 <input type="submit" class="btn btn-primary mb-3" value="중복체크" id="emailDuple" />
													 
												</div>
											</div>
										</div>
										<!-- ------------------------이메일------------------------- -->
									</form>	<!-- 중복 체크 성공하면 hidden 인풋박스에 email값 전송 -->
									
									
									<form action="JoinService.do" method="post" name="joinForm" id="joinForm" onsubmit="submitCheck();">
										
										<input class="form-control" name="m_id" id="hiddenEmail" type="hidden" value="<%= emailCheckResult %>" />
										
										
										<!-- ---------------------비밀번호------------------------ -->
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
										<!-- ---------------------비밀번호----------------------- -->
										
										<!-- ----------------------이름---------------------- -->
										
												<div class="form-floating mb-3">
													<input class="form-control" name="m_name" id="inputLastName" type="text" />
														 
														<label for="inputLastName">이름</label> <span id="nameSpan" >한글 10자 이내/ 영문30자 이내</span>
												</div>
										<!-- 이름 -->

										<!-- ---------------닉넴------------------- -->
										<div class="form-floating mb-3">
											<input class="form-control" name="m_nick" id="inputNick" type="text"/> 
											<label for="inputEmail">닉네임</label> <span>한글 10자 이내</span>
										</div>
										<!-- ---------------닉넴------------------- -->
										
										<!-- ---------------나이------------------- -->
										<div class="form-floating mb-3">
											<input class="form-control" name="m_age" id="inputAge" type="number" max="200"/>
											<label for="inputAge">나이</label>
										</div>
										<!-- ---------------나이------------------- -->
										
										<!-- ---------------성별------------------- -->
										<table class="btn btn-primary mb-3" border="1">
											<tr>
												<td><span >성별</span></td>
												<td>
												남<input name="m_gender" id="man"type="radio" value="m"/>
												여<input name="m_gender"id="girl" type="radio" value="w" />
												</td>
											</tr>
										</table>
										<!-- ---------------성별------------------- -->
										
										<!-- ---------------------주소(다음 주소 API)----------------------- -->
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" onclick="sample4_execDaumPostcode();"> 
														<label for="sample4_postcode">주소</label> <span>
														<input type="button" class="btn btn-primary mb-3"" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"></span>
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
								</div>
								<!-- ----------------------다음 주소 API---------------------------- -->
								
								<!-- -------------------링크 관련------------------ -->
								<div class="d-grid">
									<input type="button" class="btn btn-primary btn-block"
										value="회원가입" onclick="submitCheck();">
								</div>
								<div class="card-footer text-center py-3">
									<span><a class="small" href="main.jsp">메인페이지</a></span> <a
										href="login.jsp">아이디가 이미 있으신가요? 로그인 하러 가기</a>
								</div>
								<!-- -------------------링크 관련------------------ -->
							</div>
							</form>
							<!-- --------------------------회원가입 끝---------------------------- -->
							
							<% 
							//화면 바뀌면 셋
							session.removeAttribute("emailCheckResult");  %>
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
						<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
							&amp; Conditions</a>
					</div>
				</div>
			</div>
		</footer>
	</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	


	<script type="text/javascript">
	
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
	
	
	
	<script type="text/javascript">
	  function submitCheck() {
	    // hiddenEmail 필드의 값을 가져옴
	    var hiddenEmail = document.getElementById("hiddenEmail").value;
	    var emailRegex = /^[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z]{2,4}$/;
	    // hiddenEmail 값이 비어있으면 경고창을 띄움
	    
	    if (hiddenEmail === "") {
	      alert("아이디 중복검사를 해주세요.");
	      return false; // 폼 제출 중단
	    }
	    if (hiddenEmail !== emailRegex){
	    	alert("아이디 형식이 올바르지 않습니다");
	    	return false;
	    }

	    // 비밀번호 필드 유효성 검사
	    var inputPassword = document.getElementById("inputPassword").value;
	    var inputPasswordConfirm = document.getElementById("inputPasswordConfirm").value;
	    if (inputPassword === "" || inputPasswordConfirm === "") {
	      alert("비밀번호를 입력해주세요.");
	      return false; // 폼 제출 중단
	    }
	    // 비밀번호 유효성 검사 (영문, 숫자 혼합 10~30자)
	    var passwordRegex = /^[A-Za-z0-9]{10,30}$/;
	    if (!passwordRegex.test(inputPassword)) {
	      alert("비밀번호는 영문과 숫자를 혼합하여 10~30자로 입력해야 합니다.");
	      return false; // 폼 제출 중단
	    }
	    // 비밀번호 확인 일치 여부 확인
	    if (inputPassword !== inputPasswordConfirm) {
	      alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
	      return false; // 폼 제출 중단
	    }

	    // 이름 필드 유효성 검사
	    var inputLastName = document.getElementById("inputLastName").value;
	    if (inputLastName === "") {
	      alert("이름을 입력해주세요.");
	      return false; // 폼 제출 중단
	    }
	    // 이름 유효성 검사 (한글 10자 이내 또는 영문 30자 이내)
	    var nameRegex = /^[가-힣]{0,10}$|^[A-Za-z]{0,30}$/;
	    if (!nameRegex.test(inputLastName)) {
	      alert("이름은 한글 10자 이내 또는 영문 30자 이내로 입력해야 합니다.");
	      return false; // 폼 제출 중단
	    }

	    // 닉네임 필드 유효성 검사
	    var inputNick = document.getElementById("inputNick").value;
	    if (inputNick === "") {
	      alert("닉네임을 입력해주세요.");
	      return false; // 폼 제출 중단
	    }
	    // 닉네임 유효성 검사 (한글 10자 이내 또는 영문 30자 이내)
	    var nickRegex = /^[가-힣]{0,10}$|^[A-Za-z]{0,30}$/;
	    if (!nickRegex.test(inputNick)) {
	      alert("닉네임은 한글 10자 이내 또는 영문 30자 이내로 입력해야 합니다.");
	      return false; // 폼 제출 중단
	    }

	   
	    // 나이 필드 유효성 검사
	    var inputAge = document.getElementById("inputAge").value;
	    if (inputAge === "") {
	      alert("나이를 입력해주세요.");
	      return false; // 폼 제출 중단
	    }
	    // 나이 유효성 검사 (숫자만 입력)
	    var ageRegex = /^[0-9]+$/;
	    if (!ageRegex.test(inputAge)) {
	      alert("나이는 숫자만 입력해야 합니다.");
	      return false; // 폼 제출 중단
	    }

	    // 폼이 유효하므로 서버로 제출
	    document.getElementById("joinForm").submit();
	  }
	</script>
</body>
</html>

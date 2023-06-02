function submitCheck(){
var pwReg = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
var idReg = /^[a-zA-z0-9]{8,30}$/;
var inputId = document.getElementById("inputEmail");
var inputPw = document.getElementById("inputPassword");
var inputPwCheck = document.getElementById("inputPasswordConfirm");
var inputName = document.getElementById("inputLastName");
var inputNick = document.getElementById("inputNick");
var inputBirth = document.getElementById("inputBirth");
var man = document.getElementById("man");
var girl = document.getElementById("girl");
var inputAddrNum = document.getElementById("sample4_postcode");
var inputAddr = document.getElementById("sample4_roadAddress");

//----------------아이디-----------------------
	
	
	/*var inputInfo = [inputPw, inputId, PwCheck, inputName, inputNick, inputBirth, inputGender, inputAddr]
	var inputInfo2 = ["아이디", "비밀번호", "비밀번호 확인", "이름", "닉네임", "생일", "성별", "주소"]
	
	for(var i = 0; i <= inputInfo.length; i++){
			if(inputInfo[i].value == ""){
				alert(inputInfo2[i] + "를 입력해 주세요");
				inputInfo[i].focus();
				return false;
			}
	}*/
	//----------------------아이디-----------------------
	if(inputId.value == ""){
		alert("아이디를 입력해 주세요");
		inputId.focus();
		return false;
	}
	
	//---------------------비밀번호------------------------
	if(inputPw.value == ""){
		alert("비밀번호를 입력해 주세요");
		inputPw.focus();
		return false;
	}
	if(inputPwCheck.value == ""){
		alert("비밀번호 확인을 입력해 주세요");
		inputPwCheck.focus();
		return false;
	}
	
	//--------------------이름-------------------------
	if(inputName.value == ""){
		alert("이름을 입력해 주세요");
		inputPw.focus();
		return false;
	}
	
	//--------------------닉네임------------------------
	if(inputNick.value == ""){
		alert("닉네임을 입력해 주세요");
		inputName.focus();
		return false;
	}
	
	//--------------------생일-------------------------
	if(inputBirth.value == ""){
		alert("생년월일을 입력해 주세요");
		inputBirth.focus();
		return false;
	}
	
	//--------------------성별-------------------------
	if(!man.checked && !girl.checked ){
		alert("성별을 입력하세요");
		man.focus();
		return false;
	}
	
	//--------------------우편번호-------------------------
	if(inputAddrNum.value == ""){
		alert("우편번호를 입력해 주세요");
		inputAddrNum.focus();
		return false;
	}
	//--------------------주소-------------------------
	if(inputAddr.value == ""){
		alert("주소를 입력해 주세요");
		inputAddr.focus();
		return false;
	}
	
}




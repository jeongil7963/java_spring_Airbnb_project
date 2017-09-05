<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="javascript/jquery-3.2.1.min.js"></script>
<script src="javascript/jquery-ui.js"></script>
<script src="javascript/jquery-ui.min.js"></script>
<link rel="stylesheet" href="css/airDnDCSS.css?ver=3"> 
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.joinForm {
  align:center;
  width: 1200px;
  padding: 3% 3% 3% 3%;
  margin: auto;
  background: white;
}
.form {
	
  align:center;
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 900px;
  margin: 0 auto 100px;
  padding: 45px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}


.form input[type=text],input[type=password] {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 60%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form input[type=button] {
  align:center;
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  width: 200px;
  border: 0;
  padding: 15px 15px 15px 15px;
  background-color: #FF5A5F;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}

.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}


</style>

<script type="text/javascript">
	
$(document).ready(function(){
	$(".joinBtn").click(function(){
        // 태크.val() : 태그에 입력된 값
        // 태크.val("값") : 태그의 값을 변경 
        var userId = $("#id").val();
        var userPw = $("#password").val();
        if(userId == ""){
            alert("아이디를 입력하세요.");
            $("#id").focus(); // 입력포커스 이동
            return; // 함수 종료
        }
        if(userPw == ""){
            alert("아이디를 입력하세요.");
            $("#password").focus();
            return;
        }
        if(userPw != $('#mbpw_re').val()){
        	alert("두 비밀번호가 다릅니다")
        	return;
        }
        // 폼 내부의 데이터를 전송할 주소
        document.userInfo.action="join.do"
        // 제출
        document.userInfo.submit();
    });
	
	$(".cancelBtn").click(function(){
		location.href = "index.jsp";
	});
	
	$("#logo").click(function(){
		location.href="index.jsp";
	});
	var checkShow = false;
	$("#rollDown").hide();
	$("#tempImg").click(function(){
		if(checkShow == false){
			$("#rollDown").show();
			checkShow = true;
		}else{
			$("#rollDown").hide();
			checkShow = false;
		}

	});
	
});
</script>
 

</head>
<body class="body">
	<div id="top">
		<img src="img/logo.png" id="logo">
		<div id="memberStatus">
			<div id="nomemberStatusWrapper">
				<div id="noMemberStatus">
					<a class="indexFont" href="join.jsp">회원가입</a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="indexFont" href="login.jsp">로그인</a>
				</div>
			</div>	
	</div>
	<div id="body">
		
		<div class="joinForm">
			<form name="userInfo" class="form" method="post" action="join.do">
				<table width="100%">
					<tr height="2" bgcolor="#FFC8C3">
						<td colspan="2"></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" id="id"> <a
							href='#' style='cursor: help'> 중복확인 </a></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pw" id="password"> 영문/숫자포함 6자 이상</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="mbpw_re" id="mbpw_re"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type='text' name="email"> ex)ya63kr@nate.com
						</td>
					</tr>
					<tr>
						<th>핸드폰 번호</th>
						<td><input type="text" name="phone"> ex) -없이 적으세요</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="text" name="birthday"> ex)19920913 </td>
					</tr>
					<tr height="2" bgcolor="#FFC8C3">
						<td colspan="2"></td>
					</tr>
				  </table>
				  <table style=" width:100%;  margin: auto; text-align: center;">
				  	<tr>
							<td style="text-align: 'center';"><input type="button" style="color:#fff;" class="joinBtn" value="회원가입"></td>
					
							<td style="text-align: 'cetner';"><input type="button" style="color:#fff;" class="cancelBtn" value="취소"onclick="goIndexForm()"></td>
					</tr>
				  </table>								
				</form>
			</div>
		
	</div>
	<div id="footer">
		<div id="footerContentsWrapepr">
			<div id="footerContents1">
				<img id="footerLogo" src="img/logo.png"/>
				<p id="footerP1">공지사항</p><p id="footerP1Right">4조 화이팅!! 모두들 수고많았습니다!! 2달 동안 정말 즐거웠고 남은 인턴도 잘 보내요!!</p>
			</div>
			<div id="footerContents2">
				<p id="footerP2">회사소개 · 광고안내 · 검색등록 · 제휴문의 · 인재채용 · 서비스약관 · 청소년보호정책 · 개인정보처리방침 · 웹접근성안내 · 고객센터<br>
				Copyright © Skdidimdol Corp. All rights reserved.		
				</p>
			</div>
		</div>
	</div>
</body>
</html>
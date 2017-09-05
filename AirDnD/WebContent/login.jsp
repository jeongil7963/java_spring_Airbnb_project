<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/airDnDCSS.css?ver=3"> 
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.loginForm {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  margin-top:60px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input[type=text],input[type=password] {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form input[type=button] {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #FF5A5F; /* fallback for old browsers */
  background: -webkit-linear-gradient(right, #FF5A5F, #FF5A5F);
  background: -moz-linear-gradient(right, #FF5A5F, #FF5A5F);
  background: -o-linear-gradient(right, #FF5A5F, #FF5A5F);
  background: linear-gradient(to left, #FF5A5F, #FF5A5F);
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script>
$(document).ready(function(){
   $("#password").keypress(function(e) { 
       if (e.keyCode == 13){
          var userId = $("#id").val();
           var userPw = $("#password").val();
           if(userId == ""){
               alert("아이디를 입력하세요.");
               $("#id").focus(); // 입력포커스 이동
               return; // 함수 종료
           }
           if(userPw == ""){
               alert("비밀번호를 입력하세요.");
               $("#password").focus();
               return;
           }
           // 폼 내부의 데이터를 전송할 주소
           document.form1.action="loginCheck.do"
           // 제출
           document.form1.submit();

       }   
   });

   
   $("#logo").click(function(){
		window.location="index.jsp";
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
    $("#loginBtn").click(function(){
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
            alert("비밀번호를 입력하세요.");
            $("#password").focus();
            return;
        }
        // 폼 내부의 데이터를 전송할 주소
        document.form1.action="loginCheck.do"
        // 제출
        document.form1.submit();
    });
});



</script>
 <title>Insert title here</title>
 
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
	</div>
   
   <div id="body" style="background-image: URL(img/background2.jpg); background-repeat: no-repeat; width: 100%; height:700px;">
   
      <div class="loginForm">
      <form method="post" name="form1" class="form" action="loginCheck.do">
         <div class="box">
            <input type="text" name="id" id="id" class="iText" value="이메일 입력하세요.">
            <br> 
            <input type="password" name="pw" id="password" class="iText" value="비밀번호 입력하세요." onkeydown='javascript:onEnterSubmit()'>
            <br>
            <input type="button" id="loginBtn" class="loginBtn" value="로그인" >
                  <p class="message">ID가 없으신가요? <a href="join.jsp">회원가입</a></p>
         </div>
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
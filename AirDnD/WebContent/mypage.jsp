<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/airDnDCSS.css?ver=3"> 
<link rel="stylesheet" href="css/searchList.css?ver=2">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script>
	$(document).ready(function() {
		$.ajax({
			url : "getMypage.do",
			type : "POST",
			dataType : 'json',
			success : function(data) {
				console.log(data.userid);
				$("#idField").text(data.userid);
				$("#emailField").text(data.email);
				$("#callField").text(data.phone);
				$("#birthdayField").text(data.birthday);
			}
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
<!-- GoogoleMap Asynchronously Loading the API ********************************************* -->
<%
	String id = (String) session.getAttribute("userid");
%>
<title>Insert title here</title>
</head>
<body>
	<div id="top">
		<img src="img/logo.png" id="logo">
		<div id="memberStatus">
			<% 
				if(id == null){
			%>
			
			<div id="nomemberStatusWrapper">
				<div id="noMemberStatus">
					<a class="indexFont" href="join.jsp">회원가입</a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="indexFont" href="login.jsp">로그인</a>
				</div>
			</div>	
			<%
				}else{
			%>
			<div id="memberStatusWrapper">
				<div id="memberStatus">
					<p id="memberStatusFont"><%=id %>님 반갑습니다!</p>
				</div>	
				<div id="tempImg">
					<h2 style="color:#fff;">&nbsp;&nbsp;메뉴</h2>
					<div id="rollDown">
						<div class="list-group">
						  <a href="mypage.jsp" class="list-group-item list-group-item-action">마이 페이지</a>
						  <a href="getReservList.do?userId=<%=id %>" class="list-group-item list-group-item-action">예약 리스트</a>
						  <a href="roomsList.jsp" class="list-group-item list-group-item-action">숙박지 리스트</a>
						  <a href="logout.do" class="list-group-item list-group-item-action">로그아웃</a>
						</div>
					</div>
				</div>	
			</div>
			<%} %>
			</div>
	</div>
	<div class="mypageBody">

		<div class="row">
			<div class="jumbotron">
				<div id="mypageBodyLeft" >
					<p style="font-size:50px; color:#000; font-weight:bold;">개인정보</p>
					<a href="edit_profile.do" id="updateBtn">수정</a>
				</div>
				<div id="mypageBodyRight">
					<div class="row">
						<table>
							<tr class="mypageBodyRightTr">
								<td>
									<td class="mypageBodyRightTd">
										아이디
									</td>
									<td class="mypageBodyRightTd" id="idField">									
									</td>
								</td>
								<td>
									<td class="mypageBodyRightTd">
										이메일
									</td>
									<td class="mypageBodyRightTd" id="emailField">
									</td>
								</td>
							</tr>
							<tr class="mypageBodyRightTr">
								<td>
									<td class="mypageBodyRightTd">
										전화번호
									</td>
									<td class="mypageBodyRightTd" id="callField">
										
									</td>
								</td>
								<td>
									<td class="mypageBodyRightTd">
										생년월일
									</td>
									<td class="mypageBodyRightTd" id="birthdayField">
									</td>
								</td>
							</tr>
						</table>
<!-- 						<div class="col-md-6" id="idField">ID -->
<!-- 							: hyungryuk</div> -->
<!-- 						<div class="col-md-6" id="emailField">E-mail -->
<!-- 							: hyungryug@gmail.com</div> -->
<!-- 						<div class="col-md-6" id="callField">핸드폰 -->
<!-- 							: 010-0000-0000</div> -->
<!-- 						<div class="col-md-6" id="birthdayField">생년월일 -->
<!-- 							: 1991.02.04</div> -->
					</div>
				</div>
			</div>
		</div>

		<div class="row">

			<div class="col-md-6">
				<a href="getReservList.do?userId=<%=id%>"
					class="list-group-item list-group-item-action"><center>예약
						리스트</center></a>
			</div>
			<div class="col-md-6"">
				<a href="roomsList.jsp"
					class="list-group-item list-group-item-action"><center>숙박지
						리스트</center></a>
			</div>
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
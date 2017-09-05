<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="css/airDnDCSS.css?ver=3"> 
	<link rel="stylesheet" href="css/reservationCSS.css?ver=3"> 
	<script>
	<% 
	String id = (String)session.getAttribute("userid");
	%>
	
		$(document).ready(function(){
			$("#updateBtn").click(function(){
				alert("예약정보를 수정하시겠습니까?");
			});
			$("#datepicker1").datepicker({
	             dateFormat: 'yy-mm-dd'
	         });      
	         $("#datepicker2").datepicker({
	             dateFormat: 'yy-mm-dd'
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
   <div id="body">
      <div id="tab">
      
      <form method="post" action="UpdateReserv.do">
      <input type="hidden" name="reserv_id" value="${reservation.reserv_id}">
         <div class="reservationPicture">
            <a href=""><img src="images/a.jpg" style="width:100%; height:400px"></a>
         </div>
         <div class="reservationName">
            ${accommodation.name }
         </div>
         <div class="reservationDate">
            날짜<input type="text" id="datepicker1" name="start_date" value="${reservation.start_date }">
            &nbsp;&nbsp;~&nbsp;&nbsp;
            <input type="text" id="datepicker2" name="end_date" value="${reservation.end_date }">
         </div>      
         <div class="reservationPeople">
               인원<select id="personnel" name="number_of_people">
                  <option value=1 <c:if test="${reservation.number_of_people == 1}">selected</c:if>>인원 1명</option>
                  <option value=2 <c:if test="${reservation.number_of_people == 2}">selected</c:if>>인원 2명</option>
                  <option value=3 <c:if test="${reservation.number_of_people == 3}">selected</c:if>>인원 3명</option>
                  <option value=4 <c:if test="${reservation.number_of_people == 4}">selected</c:if>>인원 4명</option>
                  <option value=5 <c:if test="${reservation.number_of_people == 5}">selected</c:if>>인원 5명</option>
                  <option value=6 <c:if test="${reservation.number_of_people == 6}">selected</c:if>>인원 5명+</option>
              </select>
         </div>
         <div class="reservationBtn">
         <input type="submit" id="updateBtn" value="수정완료" style='color:white'>&nbsp;&nbsp;&nbsp;
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
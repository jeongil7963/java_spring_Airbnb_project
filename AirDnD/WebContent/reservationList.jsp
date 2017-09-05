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
<link rel="stylesheet" href="css/reservationCSS.css?ver=8">
<script type="text/javascript">
<% 
	String id = (String)session.getAttribute("userid");
%>
		$(document).ready(function(){
	        
	        var resList = [];
	        var accList = [];
	        var imgList = [];
	     
	       
	       <c:choose>
		       <c:when test="${reservations=='[]'}">
		   			$("#body").css('height', 400);
					$("#body").html("<b>예약리스트가 없습니다.</b>");					
		   			$("#body").css('font-size', '35px');
		   			$("#body").css('margin-top', '150px');
		   			$("#body").css('margin-left', '50px');
		       </c:when>


		       <c:otherwise>
			       <c:forEach items="${reservations}" var="item1">
			        var obj1 = new Object();
			        obj1.start_date = ("${item1.start_date}");
			        obj1.end_date = ("${item1.end_date}");
			        obj1.number_of_people = ("${item1.number_of_people}");
			        obj1.price = ("${item1.price}");
			        obj1.reserv_id = ("${item1.reserv_id}");
			        resList.push(obj1);
			       </c:forEach>
	
			       <c:forEach items="${accommodations}" var="item2">
			        var obj2 = new Object();
			        obj2.name = ("${item2.name}");
			        obj2.accom_id = ("${item2.accom_id}");
			        accList.push(obj2);
			       </c:forEach>
	
			       <c:forEach items="${images}" var="item3">
			        var obj3 = new Object();
			        obj3.path = ("${item3.path}");
			        imgList.push(obj3);
			       </c:forEach>
			       
			       var size = resList.length;
			       
		  	       for(var i=0;i<size;i++){
		  	    	   $("<div class='reservationList'>"+
		  	    	   		"<div class='reservationPicture'>"+
		  	    	   			"<a href='searchDetail.do?accom_id="+accList[i].accom_id+"'>"+
		  	    	   				"<img src='images/a.jpg' style='width:100%; height:400px'>"+
		  	    	   			"</a>"+
		  	    	   		"</div>"+
		  	    	   		"<div class='reservationWrapper'>"+
			  	    	   		resList[i].price+"원&nbsp;&nbsp;&nbsp;"+
			  	    	   		accList[i].name+
			  	    	   	"</div>"+
		  	    	   		"<div class='reservationDate'>"+resList[i].start_date+" ~ "+resList[i].end_date+"</div>"+
		  	    	   		"<div class='reservationPeople'>게스트 "+resList[i].number_of_people+"명</div>"+
		  	    	   		"<div class='reservationBtn'>"+
		  	    	   			"<a href='getReservUpdateForm.do?reserv_id="+resList[i].reserv_id+"' style='color:black' >예약수정&nbsp;&nbsp;&nbsp;</a>"+
		  	    	   			"<a href='DeleteReserv.do?reserv_id="+resList[i].reserv_id+"' style='color:black'>예약취소</a>"+
		  	    	   		"</div>"+
		  	    	   	"</div>").appendTo("#body");
		  	       }
  	   		 		var bodyHeight = $("#body").height() + 20;
	     		    $("#body").css('height', bodyHeight);
		       </c:otherwise>

	       </c:choose>
	       
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
			$("#logo").click(function(){
				location.href="index.jsp";
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
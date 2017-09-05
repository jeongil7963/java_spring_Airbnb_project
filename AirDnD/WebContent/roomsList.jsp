<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>숙소 리스트</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="css/airDnDCSS.css?ver=3"> 
	<script>
	<% 
		String id = (String)session.getAttribute("userid");
	%>
		$(document).ready(function(){
			
			var id = "<%= id%>";	//session값
			//특정 사용자 조회
			
			$.ajax({
				url:'getAccommodationByHostId.do?host_id='+id,//내가 가지고 있는 숙박지 정보
				type:'GET',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				success:accommodationSelectResult
			});
			
 			//사용자 조회 응답		
			function accommodationSelectResult(xhr) {
 				var  cnt = xhr.length;
 				$.each(xhr, function(idx,item){
 					$("<div id = '"+item.accom_id+"' class='roomsList'>"+
// 							"<div id='roomsList"+item.accom_id+"Img' class='roomsListImg'>"+
// 							"</div>"+
							"<img src='C:\imgtemp'"+item.accom_id+".jpg id='roomsList"+item.accom_id+"Img' class='roomsListImg'>"+
						"<div id='roomsList"+item.accom_id+"Contents' class='roomsListContents'>"+
								"<li>"+item.name+"</li><li>숙박 가능 인원 : "+item.accomodates+"</li>"+
								"<li>예약 현황 <font class ='roomsListRerservationshowPopUp'> > </font></li>"+
 								"<li>숙소 상세 정보 <font class ='roomsListDetailInfoshowPopUp'> > </font></li>"+
							"</div>"+
 							"<div id='roomsList"+item.accom_id+"Btn' class='roomsListBtn'>"+
 								"<input type='button' class='roomsListUpdate' value='수정'><br>"+
 								"<input type='button' class='roomsListDelete' value='삭제'>"+
 							"</div>"+
 						"</div>"
//  						"<div id= 'roomsList"+item.accom_id+"ReservationDiv' class='roomsListReservationDiv' style='display:none;'>"+
//  							"<p>"+ 
//  								"roomsList"+item.accom_id+
// 								"<br><<예약현황>><br>"+
//  							"</p>"+
//						"</div>"+
//  						"<div id='roomsList"+item.accom_id+"DetailInfoDiv' class='roomsListDetailInfoDiv' style='display:none;'>"+
//  							"<p>"+
//  							"roomsList"+item.accom_id+
//  							"<br><<시설>><br>"+
//  							"인터넷<br>"+
//  							"엘리베이터<br>"+
//  							"무선인터넷<br>"+
//  							"부엌	"+
//  							"</p>"+
//  						"</div>"
					).appendTo("#tempWrapper");		
 				});

 	 			$("#body").css("min-height","700px");
 				$("#body").css("height", $("#roomsListWrapper").height()+200);
 			}
			
//  		function amenitySelectResult(xhr){
//  				var amenityIs = [];
// 				$.each(xhr, function(idx, item){
// 					if(item.amenity_value == true){
// 						$(item.amenity_type+"<br>").appendTo("#tempWrapper");
// 					}
// 				});
// 			}
 			
//  		function reservationSelectResult(xhr){
//  			$.each(xhr, function(idx, item){
//  				$(item.start_date+" ~ "+item.end_date+" "+item.accommodates).appendTo("#tempWrapper");
//  			});
//  		}

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
			
			$("#topSearchSubmitBtn").click(function(){
				alert($("#topCity").val() + " , " + $("#topDatepicker1").val() + " ~ " + $("#topDatepicker2").val() +" , "+$("#topPersonnel option:selected").val());
			});

			$("body").on("click",".roomsListUpdate",function(){
				// LHS - 숙박지ID 전송				
				location.href="sendRoomInfo.do?accom_id="+$(this).parent().parent().attr("id");
			});
			$("body").on("click",".roomsListDelete",function(){
				alert($(this).parent().parent().attr("id") + " 삭제");
			});
			$("#roomsAddBtn").click(function(){
				window.location="roomsAdd.jsp";
			});
			$("#topDatepicker1").datepicker({
				 dateFormat: 'yy-mm-dd'
			});		
			$("#topDatepicker2").datepicker({
				 dateFormat: 'yy-mm-dd'
			});
			$("#logo").click(function(){
				window.location="index.jsp";
			});
			
			$(".roomsListReservationDiv").css('height',$(".roomsListReservationDiv").height());
			$(".roomsListDetailInfoDiv").css('height',$(".roomsListDetailInfoDiv").height());
			//$(".roomsListReservationDiv").hide();
			//$(".roomsListDetailInfoDiv").hide();
			
			var roomsListReservationDivCheck = false;
			var roomsListDeatailInfoDivCheck = true;

			
			$("body").on("click",".roomsListRerservationshowPopUp",function(){			
 				var realAccom_id = $(this).parent().parent().parent().attr("id");
// 				$.ajax({
// 					url:'getReservationByAccomId.do?accom_id='+realAccom_id,	//내가 가지고 있는 숙박지 reservation 정보
// 					type:'GET',
// 					contentType:'application/json;charset=utf-8',
// 					dataType:'json',
// 					success:reservationSelectResult
// 				})
				
// 				if(roomsListReservationDivCheck == false){
// 					var rlrspu = $(this).parent().parent().parent().attr("id")+"ReservationDiv";
// 					$("#"+rlrspu).show();
// 					roomsListReservationDivCheck = true;
// 				}else{
// 					$(".roomsListReservationDiv").hide();
// 					roomsListReservationDivCheck = false;
// 				}
				location.href = "getReservList.do?accom_id="+realAccom_id;
			});

			
			$("body").on("click",".roomsListDetailInfoshowPopUp",function(){
 				var realAccom_id = $(this).parent().parent().parent().attr("id");
// 				$.ajax({
// 					url:'getAmenityByAccomId.do?accom_id='+realAccom_id,	//내가 가지고 있는 숙박지 Amenity 정보
// 					type:'GET',
// 					contentType:'application/json;charset=utf-8',
// 					dataType:'json',
// 					success:amenitySelectResult
// 				})
				
// 				if(roomsListDeatailInfoDivCheck == false){
// 					var rldid = $(this).parent().parent().parent().attr("id")+"DetailInfoDiv";
// 					$("#"+rldid).show();
// 					roomsListDeatailInfoDivCheck = true;
// 				}else{
// 					$(".roomsListDetailInfoDiv").hide();
// 					roomsListDeatailInfoDivCheck = false;
// 				}
				location.href = "searchDetail.do?accom_id="+realAccom_id;
			});
			
// 			$.ajax({
// 	            url : "searchInList.do",
// 	            type : "POST",
// 	            data : jData,
// 	            dataType : 'json',
// 	            success : function(data) {
// 	               result = data;
// 	               $.each(data, function(idx, item) {
// 	                  $("<div class='item'><div class='itemPic'><a href='searchDetail.do?accom_id=" + item.accom_id + "'><img src='images/tower.JPG'class='img-thumbnail'alt='Responsive image'></a></div><div class='itemCost'>" + item.price + "</div><div class='itemTitle'>" + item.description + "</div><div class='itemRecommandPoint'></div></div>")
// 	                     .appendTo("#contentInput");

// 	               });
// 	               $('#hiddenCity').val(city);
// 	               $('#hiddenStartDate').val(startDate);
// 	               $('#hiddenEndDate').val(endDate);
// 	               $('#hiddenPerson').val(person);
// 	            }
// 	         });
			
			$("body").on("click",".roomsListDelete",function(){
				console.log("클릭");
				var realAccom_id = $(this).parent().parent().attr("id");
				$.ajax({
					url:"removeAccommodation.do?acco_id="+realAccom_id,
					type:"GET",
					dataType:'json',
					success : function(data){
						if(data == "1"){
							alert("삭제되었습니다.");
							location.href="roomsList.jsp";
						}else{
							alert("삭제실패");
						}
						
					}
				});
				
// 				var result = confirm(realAccom_id +" 숙박지를 정말로 삭제하시겠습니까?");
// 				if(result) {
// 					location.href= "removeAccommodation.do?accom_id="+realAccom_id;	//내가 가지고 있는 숙박지 정보		
// 					//console.log({deleteResult}+"!!");
					
// 				}
			});
		
			
			$("body").on("hover",".roomsListRerservationshowPopUp",function(){
				$(this).css('cursor','pointer');
			});
			
			$("body").on("hover",".roomsListDetailInfoshowPopUp",function(){
				$(this).css('cursor','pointer');
			});
			
			$("body").on("hover",".roomsListImg",function(){
				$(this).css('cursor','pointer');
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
		<div id="roomsListWrapper">
			<div id="tempWrapper"></div>
			<input type="button" id="roomsAddBtn" class="roomsList" value="숙박지 등록" />
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
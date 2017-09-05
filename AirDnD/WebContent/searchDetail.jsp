<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/airDnDCSS.css?ver=3">
<link rel="stylesheet" href="css/searchList.css?ver=2">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<!-- <!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" -->
<!-- 	crossorigin="anonymous"> -->
<!-- <!-- Optional theme -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" -->
<!-- 	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" -->
<!-- 	crossorigin="anonymous"> -->
<!-- <!-- Latest compiled and minified JavaScript -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" -->
<!-- 	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVx0ZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" -->
<!-- 	crossorigin="anonymous"></script> -->


<!-- <!-- GoogoleMap Asynchronously Loading the API ********************************************* -->
<%
	String id = (String) session.getAttribute("userid");
%>
<script type="text/javascript">
// 	var map;
// 	function initMap() {
// 		map = new google.maps.Map(document.getElementById('map'), {
// 			center : {
// 				lat : -34.397,
// 				lng : 150.644
// 			},
// 			zoom : 8
// 		});
// 	}

	//Floating Button
	$(document).ready(function() {
			
		console.log(${resVO.accomodates});	
		
		$('#resBtn').click(function(){         
		    var idvar = "<%=id%>";
		    if(idvar=="null"){
		       alert("로그인을 해주세요");
		    }
		    else{
		       alert("예약되었습니다.");
		    }  
		});
		
		
		var currentPosition = parseInt($("#sidebox").css("top")); 
		$(window).scroll(function() { 
			var position = $(window).scrollTop(); 
			$("#rightbar").stop().animate({
				"top":position+currentPosition+"px"
			},1000); 
		});
		var $sidebar = $("#rightbar_scroll");
		var	$window = $(window);
		var	offset = $sidebar.offset();
		var	topPadding = 15;

		$window.scroll(function() {
			if ($window.scrollTop() > offset.top) {
				$sidebar.stop().animate({
					marginTop : $window.scrollTop() - offset.top + topPadding
				});
			} else {
				$sidebar.stop().animate({
					marginTop : 0
				});
			}
		});
		
		for(var i=1;i<=${resVO.accomodates};i++){
			$("<option value="+i+">"+i+"명</option>").appendTo($('#person'));
		}
		
		$('#person').on('change',function(){
			console.log("인원수변경");
			var tmp = $('#person').val();
			var pr = ${resVO.price};
			console.log(tmp);
			console.log(pr);
			pr *=1;
			tmp *=1;
			var priceText = pr*tmp;
			console.log(priceText);
			$('#totPrice').text(priceText);
			console.log("값 등록");
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
		
		$("#logo").click(function(){
			window.location="index.jsp";
		});
	});
	//Floating Button
</script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBJ9LCf6t73riVqtmjwJaxc2wiWesxbZlo&callback=initMap"
	async defer></script>
<title>Insert title here</title>
</head>
<body>
	<div id="top">
		<img src="img/logo.png" id="logo">
		<div id="memberStatus">
			<%
				if (id == null) {
			%>

			<div id="nomemberStatusWrapper">
				<div id="noMemberStatus">
					<a class="indexFont" href="join.jsp">회원가입</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <a class="indexFont" href="login.jsp">로그인</a>
				</div>
			</div>
			<%
				} else {
			%>
			<div id="memberStatusWrapper">
				<div id="memberStatus">
					<p id="memberStatusFont"><%=id%>님 반갑습니다!
					</p>
				</div>
				<div id="tempImg">
					<h2 style="color: #fff;">&nbsp;&nbsp;메뉴</h2>
					<div id="rollDown">
						<div class="list-group">
							<a href="mypage.jsp"
								class="list-group-item list-group-item-action">마이 페이지</a> <a
								href="getReservList.do?userId=<%=id%>"
								class="list-group-item list-group-item-action">예약 리스트</a> <a
								href="roomsList.jsp"
								class="list-group-item list-group-item-action">숙박지 리스트</a> <a
								href="logout.do" class="list-group-item list-group-item-action">로그아웃</a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<div id="searchDetail">
		<div id="rightbar">
			<div id="rightbar_scroll" style="margin-left: 3%; background-color: #ff5a5f; padding: 3px 3px 3px 3px;">
				<div class="row">
					<div class="col-md-6" style="margin-top: 5%;">예약인원 :</div>
					<div class="col-md-6" id="selectNumPerson" style="margin-top: 5%;">
						<select id="person" name="ReservNumOfPerson"></select>
					</div>
					<div class="col-md-6" style="margin-top: 5%;">비용 :</div>
					<div class="col-md-6" id="totPrice" style="margin-top: 5%;"></div>
					<div class="col-md-12" id="resBtn"
						style="border-style: solid; border-width: 3px; width: 80%; text-align: center; margin-left: 10%; margin-top: 10%; cursor: pointer;">예약하기</div>
				</div>
			</div>
		</div>
		<div class="photoMap">
			<div id="photoSlide">
				<ul class="slides">
					<input type="radio" name="radio-btn" id="img-1" checked />
					<li class="slide-container">
						<div class="slide">
							<img
								src="http://farm9.staticflickr.com/8072/8346734966_f9cd7d0941_z.jpg" />
						</div>
						<div class="nav">
							<label for="img-6" class="prev">&#x2039;</label> <label
								for="img-2" class="next">&#x203a;</label>
						</div>
					</li>

					<input type="radio" name="radio-btn" id="img-2" />
					<li class="slide-container">
						<div class="slide">
							<img
								src="http://farm9.staticflickr.com/8504/8365873811_d32571df3d_z.jpg" />
						</div>
						<div class="nav">
							<label for="img-1" class="prev">&#x2039;</label> <label
								for="img-3" class="next">&#x203a;</label>
						</div>
					</li>

					<input type="radio" name="radio-btn" id="img-3" />
					<li class="slide-container">
						<div class="slide">
							<img
								src="http://farm9.staticflickr.com/8068/8250438572_d1a5917072_z.jpg" />
						</div>
						<div class="nav">
							<label for="img-2" class="prev">&#x2039;</label> <label
								for="img-4" class="next">&#x203a;</label>
						</div>
					</li>

					<input type="radio" name="radio-btn" id="img-4" />
					<li class="slide-container">
						<div class="slide">
							<img
								src="http://farm9.staticflickr.com/8061/8237246833_54d8fa37f0_z.jpg" />
						</div>
						<div class="nav">
							<label for="img-3" class="prev">&#x2039;</label> <label
								for="img-5" class="next">&#x203a;</label>
						</div>
					</li>

					<input type="radio" name="radio-btn" id="img-5" />
					<li class="slide-container">
						<div class="slide">
							<img
								src="http://farm9.staticflickr.com/8055/8098750623_66292a35c0_z.jpg" />
						</div>
						<div class="nav">
							<label for="img-4" class="prev">&#x2039;</label> <label
								for="img-6" class="next">&#x203a;</label>
						</div>
					</li>

					<input type="radio" name="radio-btn" id="img-6" />
					<li class="slide-container">
						<div class="slide">
							<img
								src="http://farm9.staticflickr.com/8195/8098750703_797e102da2_z.jpg" />
						</div>
						<div class="nav">
							<label for="img-5" class="prev">&#x2039;</label> <label
								for="img-1" class="next">&#x203a;</label>
						</div>
					</li>

					<li class="nav-dots"><label for="img-1" class="nav-dot"
						id="img-dot-1"></label> <label for="img-2" class="nav-dot"
						id="img-dot-2"></label> <label for="img-3" class="nav-dot"
						id="img-dot-3"></label> <label for="img-4" class="nav-dot"
						id="img-dot-4"></label> <label for="img-5" class="nav-dot"
						id="img-dot-5"></label> <label for="img-6" class="nav-dot"
						id="img-dot-6"></label></li>
				</ul>
			</div>
		</div>
	</div>

	<div id="roomsDetailContext">
		<div id="roomTitle">
			<div class="resName">${resVO.name}</div>
		</div>
		<div class="iconList">
			<div class="tableItems">
				<table>
					<tr>
						<td><center>
								<img src="images/House.JPG" />
							</center></td>
					</tr>
					<tr>
						<td><center>
								<b>${resVO.room_type}</b>
							</center></td>
					</tr>
				</table>
			</div>
			<div class="tableItems">
				<table>
					<tr>
						<td><center>
								<img src="images/People.JPG" />
							</center></td>
					</tr>
					<tr>
						<td><center>
								<b>인원 ${resVO.accomodates} 명</b>
							</center></td>
					</tr>
				</table>
			</div>
			<div class="tableItems">
				<table>
					<tr>
						<td><center>
								<img src="images/Door.JPG" />
							</center></td>
					</tr>
					<tr>
						<td><center>
								<b>침실 ${resVO.bedrooms} 개 </b>
							</center></td>
					</tr>
				</table>
			</div>
			<div class="tableItems">
				<table>
					<tr>
						<td><center>
								<img src="images/Bed.JPG" />
							</center></td>
					</tr>
					<tr>
						<td><center>
								<b>침대 ${resVO.beds} 개</b>
							</center></td>
					</tr>
				</table>
			</div>

		</div>
		<div class="intro">

			<div id=roomIntro>${resVO.description}</div>
		</div>
		<div class="AccDetail1">
			<h2>숙소</h2>
			<div>
				<div class="detailAccoItem">숙박 가능 인원 : ${resVO.currency_unit}</div>
				<div class="detailAccoItem">체크아웃 : ${resVO.bathrooms}</div>
				<div class="detailAccoItem">욕실 : ${resVO.bathrooms}</div>
				<div class="detailAccoItem">애완동물 : ${resVO.bathrooms}</div>
				<div class="detailAccoItem">침실 : ${resVO.bedrooms}</div>
				<div class="detailAccoItem">건물 유형 : ${resVO.building_type}</div>
				<div class="detailAccoItem">침대 : ${resVO.beds}</div>
				<div class="detailAccoItem">숙소 유형 : ${resVO.room_type}</div>
				<div class="detailAccoItem">체크인 : ${resVO.room_type}</div>
			</div>
		</div>
	</div>
	</div>
	<div class="feeDetail"></div>

	</div>

	<div id="footer">
		<div id="footerContentsWrapepr">
			<div id="footerContents1">
				<img id="footerLogo" src="img/logo.png" />
				<p id="footerP1">공지사항</p>
				<p id="footerP1Right">4조 화이팅!! 모두들 수고많았습니다!! 2달 동안 정말 즐거웠고 남은
					인턴도 잘 보내요!!</p>
			</div>
			<div id="footerContents2">
				<p id="footerP2">
					회사소개 · 광고안내 · 검색등록 · 제휴문의 · 인재채용 · 서비스약관 · 청소년보호정책 · 개인정보처리방침 ·
					웹접근성안내 · 고객센터<br> Copyright © Skdidimdol Corp. All rights
					reserved.
				</p>
			</div>
		</div>
	</div>
</body>
</html>
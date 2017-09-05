<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>숙소 리스트</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="css/airDnDCSS.css?ver=3">
<script>
   <%String id = (String) session.getAttribute("userid");%>
      $(document).ready(function(){
         var bodyHeight = $("#body").height() + 20;
         var accommodation_id;
         $("#body").css('height', bodyHeight);          
         $("#topSearchSubmitBtn").click(function(){
            alert($("#topCity").val() + " , " + $("#topDatepicker1").val() + " ~ " + $("#topDatepicker2").val() +" , "+$("#topPersonnel option:selected").val());
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
         $("#topDatepicker1").datepicker({
             dateFormat: 'yy-mm-dd'
         });      
         $("#topDatepicker2").datepicker({
             dateFormat: 'yy-mm-dd'
         });
         $("#logo").click(function(){
            window.location="index.jsp";
         });
         $("#minusMaxSleepRoomsBtn").click(function(){
            var maxSleepRoomsCnt = parseFloat($("#maxSleepRoomsCnt").text());
             if(maxSleepRoomsCnt <= 1){
                alert("1 이하는 설정할 수 없습니다.");
             }else{
               $("#maxSleepRoomsCnt").text(maxSleepRoomsCnt-1);
             }
         });
         $("#plusMaxSleepRoomsBtn").click(function(){
            var maxSleepRoomsCnt = parseFloat($("#maxSleepRoomsCnt").text());
            $("#maxSleepRoomsCnt").text(maxSleepRoomsCnt+1);
         });
         $("#minusSleepBedBtn").click(function(){
            var maxSleepBedCnt = parseFloat($("#maxSleepBedCnt").text());
             if(maxSleepBedCnt <= 0){
                alert("0 이하는 설정할 수 없습니다.");
             }else{
               $("#maxSleepBedCnt").text(maxSleepBedCnt-1);
             }
         });
         $("#plusSleepBedBtn").click(function(){
            var maxSleepBedCnt = parseFloat($("#maxSleepBedCnt").text());
            $("#maxSleepBedCnt").text(maxSleepBedCnt+1);
         });
         $("#minusMaxBathBtn").click(function(){
             var maxBathCnt = parseFloat($("#maxBathCnt").text());
             if(maxBathCnt <= 0){
                alert("0 이하는 설정할 수 없습니다.");
             }else{
               $("#maxBathCnt").text(maxBathCnt-1);
             }
         });
         $("#plusMaxBathBtn").click(function(){
             var maxBathCnt = parseFloat($("#maxBathCnt").text());
            $("#maxBathCnt").text(maxBathCnt+1);
         });
         $("input[type=text]").click(function(){
            $(this).val("");
         });
         $("#roomsDetailInfoDescript").text("");
         
      // 업로드 버튼 숨김
		document.getElementById('submitBtn').style.visibility='hidden';
		$('#submitBtn').click(function() {
	           var data = new FormData();
	           $.each($('#img')[0].files, function(i, file) {
	               data.append('file-' + i, file);	                
	           });
	           data.append('accom_id', accommodation_id);
	           
	           //alert(accommodation_id);
	            
	           $.ajax({
	               url: 'upload.do',
	               type: "post",
	               dataType: "text",
	               data: data,
	               // cache: false,
	               processData: false,
	               contentType: false,
	               success: function(data, textStatus, jqXHR) {
	            	   console.log(data);
	               }, error: function(jqXHR, textStatus, errorThrown) {}
	           });
	           
	        	// 업로드 실행
				$('#submitBtn').trigger('click');	
	       });
         
         $("#addRoomsBtn").click(function(){
            if($('select[id="roomsBuildType"]').val() == "default"){
               alert("숙소의 건물 유형을 선택해주세요.");
            }else if($("#setName").val() == "숙소 제목" || $("#setName").val() == ""){
               alert("숙소의 이름을 지정해주세요.");
            }else if($("#payment").val() == "" || $("#payment").val() == "1박 가격"){
               alert("가격을 지정해주세요.");
            }else{
               
               var data = {}
               
               data["accom_id"] = $("#accom_id").val();
               data["room_type"] = $("select[name=room_type]").val();
               data["accomodates"] = $("select[name=accomodates]").val();   //최대 인원수
               data["property_type"] = $("select[name=property_type]").val();
               data["building_type"] = $("select[name=building_type]").val();
               data["bedrooms"] = $("select[name=bedrooms]").val();
               data["beds"] = $("font[name=beds]").text();
               data["bathrooms"] = $("font[name=bathrooms]").text();
               data["national_name"] = $("select[name=national_name]").val();

               data["location"] = $("input[name=address1]").val()+" "+ $("[name=address2]").val() +" "+ $("[name=address3]").val() +" "+ $("[name=address4]").val() +" "+ $("[name=address5]").val(); //address1+" "+address2+" "+address3+" "+address4+" "+address5";

               data["amenity_essential"] = (String)($('input[name=amenity_essential]').is(":checked"));
               data["amenity_wifi"] = (String)($("input[name=amenity_wifi]").is(":checked"));
               data["amenity_shampoo"] = (String)($("input[name=amenity_shampoo]").is(":checked"));
               data["amenity_closet"] = (String)($("input[name=amenity_closet]").is(":checked"));
               data["amenity_tv"] = (String)($("input[name=amenity_tv]").is(":checked"));
               data["amenity_heating"] = (String)($("input[name=amenity_heating]").is(":checked"));
               data["amenity_airconditioner"] = (String)($("input[name=amenity_airconditioner]").is(":checked"));
               data["amenity_breakfast"] = (String)($("input[name=amenity_breakfast]").is(":checked"));

               data["securityFacility_smoke"] = (String)($("input[name=securityFacility_smoke]").is(":checked"));
               data["securityFacility_cm"] = (String)($("input[name=securityFacility_cm]").is(":checked"));
               data["securityFacility_firstaidkit"] = (String)($("input[name=securityFacility_firstaidkit]").is(":checked"));
               data["securityFacility_fire"] = (String)($("input[name=securityFacility_fire]").is(":checked"));
               data["securityFacility_locker"] = (String)($("input[name=securityFacility_locker]").is(":checked"));

               data["usableFacility_pridatavatelivingroom"] = (String)($("input[name=usableFacility_privatelivingroom]").is(":checked"));
               data["usableFacility_pool"] = (String)($("input[name=usableFacility_pool]").is(":checked"));
               data["usableFacility_kitchen"] = (String)($("input[name=usableFacility_kitchen]").is(":checked"));
               data["usableFacility_washer"] = (String)($("input[name=usableFacility_washer]").is(":checked"));
               data["usableFacility_dryer"] = (String)($("input[name=usableFacility_dryer]").is(":checked"));
               data["usableFacility_park"] = (String)($("input[name=usableFacility_park]").is(":checked"));
               data["udatasableFacility_ele"] = (String)($("input[name=usableFacility_ele]").is(":checked"));
               data["usableFacility_tub"] = (String)($("input[name=usableFacility_tub]").is(":checked"));
               data["usableFacility_gym"] = (String)($("input[name=usableFacility_gym]").is(":checked"));

               data["img"] = $("input[name=img]").val();
               data["description"] = $("textarea[name=description]").val();

               data["goodThing_family"] = (String)($("input[name=goodThing_family]").is(":checked"));
               data["goodThing_group"] = (String)($("input[name=goodThing_group]").is(":checked"));
               data["goodThing_withpet"] = (String)($("input[name=goodThing_withpet]").is(":checked"));
                              
               data["name"] = $("input[name=name]").val();   //숙소 이름
               data["price"] = $("input[name=price]").val();   
               data["cdataurrency_unit"] = $("select[name=currency_unit]").val();

               data["host_id"] = $("input[name=host_id]").val();   //session값
               data["avg_point"] = $("input[name=avg_point]").val();
               
               accommodation_id = $("#accom_id").val();
            	// 업로드 실행
				$('#submitBtn').trigger('click');	
               
               $.ajax({
                  contentType:'application/json',
                  dataType:'json',
                  data : JSON.stringify(data),
                  url : "addAccommodation.do?id=<%=id%>",
                  type : "POST",                  
                  success : function(data){
                     console.log(data);
                     alert("등록되었습니다.");
                  }   
               });
               window.location="roomsList.jsp";
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
	<div id="body">
		<div id="contentsWrapper">
			<!--<form id="addRoomsForm" method="post" action="addAccommodation.do"> -->
			<hr style="border: solid 2px #FF5A5F; width: 98%;">
			<h2>회원님의 숙소 유형은 무엇인가요?</h2>
			<div id="roomsType">
				<input type="hidden" id="accom_id" name="accom_id" value=0>
				<select id="roomsTypeList" name="room_type">
					<option value="개인실">개인실</option>
					<option value="집 전체">집 전체</option>
					<option value="다인실">다인실</option>
				</select> <select id="roomsTypeNum" name="accomodates">
					<option value=1>최대 1명 숙박 가능</option>
					<option value=2>최대 2명 숙박 가능</option>
					<option value=3>최대 3명 숙박 가능</option>
					<option value=4>최대 4명 숙박 가능</option>
					<option value=5>최대 5명 숙박 가능</option>
					<option value=6>최대 6명 숙박 가능</option>
					<option value=7>최대 7명 숙박 가능</option>
					<option value=8>최대 8명 숙박 가능</option>
					<option value=9>최대 9명 숙박 가능</option>
					<option value=10>최대 10명 숙박 가능</option>
					<option value=11>최대 11명 숙박 가능</option>
					<option value=12>최대 12명 숙박 가능</option>
					<option value=13>최대 13명 숙박 가능</option>
					<option value=14>최대 14명 숙박 가능</option>
					<option value=15>최대 15명 숙박 가능</option>
					<option value=16>최대 16명 숙박 가능</option>
				</select>
			</div>
			<h2>숙소 유형을 집, 호텔, 기타 중에서 골라주세요.</h2>
			<select id="roomsTypeSelect" name="property_type">
				<option value="집">집</option>
				<option value="호텔">호텔</option>
				<option value="기타">기타</option>
			</select>
			<h2>숙소의 건물 유형을 알려주세요.</h2>
			<select id="roomsBuildType" name="building_type">
				<option value="default">하나를 선택해주세요.</option>
				<option value="아파트">아파트</option>
				<option value="게스트하우스">게스트하우스</option>
				<option value="단독주택">단독주택</option>
				<option value="별채">별채</option>
				<option value="휴가용 별장">휴가용 별장</option>
			</select> <br>
			<br>
			<h2>게스트가 사용할 수 있는 침실은 몇 개인가요?</h2>
			<select id="roomsSleepCnt" name="bedrooms">
				<option value=0>침실 0개</option>
				<option value=1>침실 1개</option>
				<option value=2>침실 2개</option>
				<option value=3>침실 3개</option>
				<option value=4>침실 4개</option>
				<option value=5>침실 5개</option>
				<option value=6>침실 6개</option>
			</select>
			<h2>게스트가 사용할 수 있는 침실은 몇 개인가요?</h2>
			<font>침대</font> <input type="button" id="minusSleepBedBtn" value="-"></input>
			&nbsp;<font id="maxSleepBedCnt" name="beds">1</font>&nbsp; <input
				type="button" id="plusSleepBedBtn" value="+"></input>
			&nbsp;&nbsp;&nbsp;&nbsp; <font>욕실</font> <input type="button"
				id="minusMaxBathBtn" value="-"></input> &nbsp;<font id="maxBathCnt"
				name="bathrooms">1</font>&nbsp; <input type="button"
				id="plusMaxBathBtn" value="+"></input>
			<hr style="border: solid 2px #FF5A5F; width: 98%;">
			<h2>숙소의 위치를 알려주세요.</h2>
			<h3>국가</h3>
			<select id="nationalName" name="national_name">
				<option value="한국">한국</option>
				<option value="미국">미국</option>
				<option value="일본">일본</option>
				<option value="중국">중국</option>
				<option value="러시아">러시아</option>
				<option value="캐나다">캐나다</option>
				<option value="프랑스">프랑스</option>
				<option value="이탈리아">이탈리아</option>
				<option value="스페인">스페인</option>
			</select> <br>
			<br> <font size="4px"><b>시/도
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 시군</b></font><br>
			<input type="text" id="address1" name="address1" value="서울특별시" /> <input
				type="text" id="address2" name="address2" value="예) 강남구" />
			<h3>도로명 / 건물번호 / 아파트 이름 / 건물 이름</h3>
			<input type="text" id="address3" name="address3" value="예) 언주로 406">
			<h3>아파트 / 건물명 및 동 / 호수 (선택사항)</h3>
			<input type="text" id="address4" name="address4"
				value="예) 35동 4층 407호">
			<h3>도로명 / 건물번호 / 아파트 이름 / 건물 이름</h3>
			<input type="text" id="address5" name="address5" value="예) 135-919">

			<input type="hidden" value="" name="location">
			<!-- location에 address합쳐서 보내는 form -->
			<hr style="border: solid 2px #FF5A5F; width: 98%;">
			<h2>어떤 편의시설을 제공하시나요?</h2>
			<input type="checkbox" name="amenity_essential" />필수 품목(수건, 침대시트, 비누,
			화장지)<br> <input type="checkbox" name="amenity_wifi" />무선인터넷<br>
			<input type="checkbox" name="amenity_shampoo" />샴푸<br> <input
				type="checkbox" name="amenity_closet" />옷장/서랍장<br> <input
				type="checkbox" name="amenity_tv" />TV<br> <input
				type="checkbox" name="amenity_heating" />난방<br> <input
				type="checkbox" name="amenity_airconditioner" />에어컨<br> <input
				type="checkbox" name="amenity_breakfast" />조식, 커피, 차<br>

			<h2>안전시설</h2>
			<input type="checkbox" name="securityFacility_smoke" />연기 감지기<br>
			<input type="checkbox" name="securityFacility_cm" />일산화탄소 감지기<br>
			<input type="checkbox" name="securityFacility_firstaidkit" />구급상자<br>
			<input type="checkbox" name="securityFacility_fire" />소화기<br> <input
				type="checkbox" name="securityFacility_locker" />침실문 잠금장치<br>

			<h2>게스트가 어떤 공간을 사용할 수 있나요?</h2>
			<input type="checkbox" name="usableFacility_privatelivingroom" />개인
			거실<br> <input type="checkbox" name="usableFacility_pool" />수영장<br>
			<input type="checkbox" name="usableFacility_kitchen" />부엌<br> <input
				type="checkbox" name="usableFacility_washer" />빨래 - 세탁기<br> <input
				type="checkbox" name="usableFacility_dryer" />빨래 - 건조기<br> <input
				type="checkbox" name="usableFacility_park" />주차<br> <input
				type="checkbox" name="usableFacility_ele" />엘리베이터<br> <input
				type="checkbox" name="usableFacility_tub" />자쿠지 욕조<br> <input
				type="checkbox" name="usableFacility_gym" />헬스장<br>
			<hr style="border: solid 2px #FF5A5F; width: 98%;">
			<h2>숙소의 모습을 보여 주세요.</h2>
			<form id="frm" name="frm" enctype="multipart/form-data">
				<input type="file" id="img" name="img">
				<button type="button" id="submitBtn">upload</button>
			</form>
			<h2>숙소 설명</h2>
			<h3>요약</h3>
			<textarea rows="10" cols="60" id="roomsDetailInfoDescript"
				name="description"> 
				</textarea>
			<h2>숙소의 좋은 점</h2>
			<input type="checkbox" name="goodThing_family" />(아이 동반)가족<br> <input
				type="checkbox" name="goodThing_group" />단체<br> <input
				type="checkbox" name="goodThing_withpet" />반려동물 동반<br>

			<h2>이름 지정</h2>
			<input type="text" id="setName" name="name" value="숙소 제목" />
			<h2>기본 요금</h2>
			<input type="text" id="payment" name="price" value="1박 가격" />
			<h2>통화 단위</h2>
			<select id="currencyUnit" name="currency_unit">
				<option value="krw">KRW</option>
				<option value="usd">USD</option>
				<option value="jpy">JPY</option>
				<option value="cny">CNY</option>
				<option value="rub">RUB</option>
				<option value="cad">CAD</option>
				<option value="eur">EUR</option>
			</select> <br>
			<br> <input type="hidden" id="host_id" name="host_id"
				value="<%=id%>"> <input type="hidden" id="avg_point"
				name="avg_point" value=0> <input type="submit"
				id="addRoomsBtn" value="숙소 등록">
			<hr style="border: solid 2px #FF5A5F; width: 98%;">
			>>>>>>> 01e8fdaaa124fcb8d931ee13c299f9986fedc606
			<!-- </form> -->
		</div>
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
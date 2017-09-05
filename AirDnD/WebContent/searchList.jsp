<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<!-- <!-- Latest compiled and minified CSS -->

<!-- <link rel="stylesheet" -->
<!--    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" -->
<!--    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" -->
<!--    crossorigin="anonymous"> -->

<!-- <!-- Optional theme -->
<!-- <link rel="stylesheet" -->
<!--    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" -->
<!--    integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" -->
<!--    crossorigin="anonymous"> -->

<!-- <!-- Latest compiled and minified JavaScript -->
<!-- <script -->
<!--    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" -->
<!--    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" -->
<!--    crossorigin="anonymous"></script> -->



<script>
   $(document).ready(function() {
      
      
      console.log(${voSize});
      if(${voSize!=0}){
         console.log(${voSize});
         $("#topCity").val("${city}");
         $("#topDatepicker1").val("${startDate}");
         $("#topDatepicker2").val("${endDate}");
         $("#topPersonnel").val("${person}").prop("selected", true); 
         
         var city1 = $("#topCity").val();
         var startDate1 = $("#topDatepicker1").val();
         var endDate1 = $("#topDatepicker2").val();
         var person1 = $("#topPersonnel").val();

         var jData1 = {
            "city" : city1,
            "startDate" : startDate1,
            "endDate" : endDate1,
            "person" : person1
         };
         $("#contentInput").empty();
         console.log(jData1);

         $.ajax({
            url : "searchInList.do",
            type : "POST",
            data : jData1,
            dataType : 'json',
            success : function(data) {
               result = data;
               $.each(data, function(idx, item) {
                  if(data==null){
                     $("<b>예약 가능한 숙소가 없습니다.</b>").appendTo("#contentInput");

                  }else{
                     $("<div class='item'><div class='itemPic'><a href='searchDetail.do?accom_id=" + item.accom_id + "'><img src='images/tower.JPG'class='img-thumbnail'alt='Responsive image'></a></div><div class='itemCost'><h5>" + item.price + "원</h5></div><div class='itemTitle'><h5>" + item.name + "</h5></div><div class='itemRecommandPoint'></div></div>")
                     .appendTo("#contentInput");

                  }
                  
               });
               $('#hiddenCity').val(city1);
               $('#hiddenStartDate').val(startDate1);
               $('#hiddenEndDate').val(endDate1);
               $('#hiddenPerson').val(person1);
            }
         });
         
      }else{
         console.log(${voSize});
         $("#topCity").val("${city}");
         $("#topDatepicker1").val("${startDate}");
         $("#topDatepicker2").val("${endDate}");
         $("#topPersonnel").val("${person}").prop("selected", true); 
         $('#contentInput').css('height', 400);
         $('#contentInput').html('<b>예약가능한 숙소가 없습니다.</b>');
         $('#contentInput').css('font-size', '35px');
         $('#contentInput').css('margin-top', '150px');
         $('#contentInput').css('margin-left', '50px');
         
      }
      
      
      var result = null;
      var priceResult = null;
      var typeResult = null;
      var checkBoxChanged = false;
      $(".cross").click(function() {
         window.location.href = "searchDetail.html";
      });

      var checkSelectRangeOfCost = false;
      var checkSelectHouseType = false;

      $("#selectRangeOfCost").click(function() {
         if (checkSelectHouseType == true) {
            $("#setHouseTypePanel").slideUp("fast");
            $("#itemList").css("opacity", "1.0");
            $("#itemList").css("filter", "alpha(opacity=100)");
            checkSelectHouseType = false;
         }
         checkSelectRangeOfCost = true;
         $("#setRangePanel").slideDown("fast");
         $("#itemList").css("opacity", "0.5");
         $("#itemList").css("filter", "alpha(opacity=50)");
         $("#setRangePanel").css("cursor", "default");
      });



      $("#selectHouseType").click(function() {
         if (checkSelectRangeOfCost == true) {
            $("#setRangePanel").slideUp("fast");
            $("#itemList").css("opacity", "1.0");
            $("#itemList").css("filter", "alpha(opacity=100)");
            checkSelectRangeOfCost = false;
         }
         checkSelectHouseType = true;
         $("#setHouseTypePanel").slideDown("fast");
         $("#itemList").css("opacity", "0.5");
         $("#itemList").css("filter", "alpha(opacity=50)");
         $("#setHouseTypePanel").css("cursor", "default");

      });

      $(".panelCloseButton").click(function() {
         if (checkSelectHouseType == true) {
            $("#setHouseTypePanel").slideUp("fast");
            $("#itemList").css("opacity", "1.0");
            $("#itemList").css("filter", "alpha(opacity=100)");
            checkSelectHouseType = false;
         }
         if (checkSelectRangeOfCost == true) {
            $("#setRangePanel").slideUp("fast");
            $("#itemList").css("opacity", "1.0");
            $("#itemList").css("filter", "alpha(opacity=100)");
            checkSelectRangeOfCost = false;
         }
      });



      //등록 버튼 클릭
      $('#topSearchSubmitBtn').on('click', function() {
         var city = $("#topCity").val();
         var startDate = $("#topDatepicker1").val();
         var endDate = $("#topDatepicker2").val();
         var person = $("#topPersonnel").val();

         var jData = {
            "city" : city,
            "startDate" : startDate,
            "endDate" : endDate,
            "person" : person
         };
         $("#contentInput").empty();
         console.log(jData);

         $.ajax({
            url : "searchInList.do",
            type : "POST",
            data : jData,
            dataType : 'json',
            success : function(data) {
               result = data;
               $.each(data, function(idx, item) {
                  if(data==null){
                     $("<b>예약 가능한 숙소가 없습니다.</b>").appendTo("#contentInput");

                  }else{
                     $("<div class='item'><div class='itemPic'><a href='searchDetail.do?accom_id=" + item.accom_id + "'><img src='images/tower.JPG'class='img-thumbnail'alt='Responsive image'></a></div><div class='itemCost'><h5>" + item.price + "원</h5></div><div class='itemTitle'><h5>" + item.name + "</h5></div><div class='itemRecommandPoint'></div></div>")
                     .appendTo("#contentInput");
                  }

               });
               $('#hiddenCity').val(city);
               $('#hiddenStartDate').val(startDate);
               $('#hiddenEndDate').val(endDate);
               $('#hiddenPerson').val(person);
            }
         });
      }); //등록 버튼 클릭

      $('input[name=typeFilter]').on('change', function(e) {
         checkBoxChanged = true;
         var tmp = new Array();
         $("#contentInput").empty();
         console.log("TypeFilter Changed!");
         var data;
         if ($('#minPrice').val() != "" && $('#maxPrice').val() != "") {
            data = priceResult;
            console.log("값 지정됨");
         } else {
            data = result;
            console.log("값 지정안됨");
         }
         if ($('input:checkbox[id=checkBox1]').is(':checked') == true) {

            $.each(data, function(idx, item) {
               if (item.room_type == $('input:checkbox[id=checkBox1]').val()) {
                  tmp.push(item);
               }
            });
         }
         if ($('input:checkbox[id=checkBox2]').is(':checked') == true) {

            $.each(data, function(idx, item) {
               if (item.room_type == $('input:checkbox[id=checkBox2]').val()) {
                  tmp.push(item);
               }
            });
         }
         if ($('input:checkbox[id=checkBox3]').is(':checked') == true) {

            $.each(data, function(idx, item) {
               if (item.room_type == $('input:checkbox[id=checkBox3]').val()) {
                  tmp.push(item);
               }
            });
         }
         typeResult = tmp;
         $.each(tmp, function(idx, item) {
            $("<div class='item'><div class='itemPic'><a href='searchDetail.do?accom_id=" + item.accom_id + "'><img src='images/tower.JPG'class='img-thumbnail'alt='Responsive image'></a></div><div class='itemCost'>" + item.price + "</div><div class='itemTitle'>" + item.description + "</div><div class='itemRecommandPoint'></div></div>")
               .appendTo("#contentInput");

         });
      });

      $('#minPrice').on('input', function(e) {

         if ($('#minPrice').val() != "" && $('#maxPrice').val() != "") {

            console.log('min1');
            var city1 = $("#topCity").val();
            var startDate = $("#topDatepicker1").val();
            var endDate = $("#topDatepicker2").val();
            var person = $("#topPersonnel").val();
            var startPrice = $('#minPrice').val();
            var endPrice = $('#maxPrice').val();

            console.log(city1 + startDate +endDate+person+startPrice+endPrice)
            var jData = {               
               "startDate" : startDate,
               "endDate" : endDate,
               "person" : person,
               "startPrice" : startPrice,
               "endPrice" : endPrice,
               "city" : city1
            };
            console.log('min2');
            $("#contentInput").empty();
            $.ajax({
               url : "searchInListPriceFilter.do",
               type : "POST",
               data : jData,
               dataType : 'json',
               success : function(data) {
                  priceResult = data;
                  $.each(data, function(idx, item) {
                     if(data==null){
                        $("<b>예약 가능한 숙소가 없습니다.</b>").appendTo("#contentInput");

                     }else{
                        $("<div class='item'><div class='itemPic'><a href='searchDetail.do?accom_id=" + item.accom_id + "'><img src='images/tower.JPG'class='img-thumbnail'alt='Responsive image'></a></div><div class='itemCost'><h5>" + item.price + "원</h5></div><div class='itemTitle'><h5>" + item.name + "</h5></div><div class='itemRecommandPoint'></div></div>")
                        .appendTo("#contentInput");
                     }

                  });
               }
            });
            $('input:checkbox[id=checkBox1]').checked = true;
            $('input:checkbox[id=checkBox2]').checked = true;
            $('input:checkbox[id=checkBox3]').checked = true;
         }
      });


      $('#maxPrice').on('input', function(e) {

         console.log('max');
         if ($('#minPrice').val() != "" && $('#maxPrice').val() != "") {

            
            var startDate = $("#topDatepicker1").val();
            var endDate = $("#topDatepicker2").val();
            var person = $("#topPersonnel").val();
            var startPrice = $('#minPrice').val();
            var endPrice = $('#maxPrice').val();
            var city1 = $("#topCity").val();

            console.log(city1 + startDate +endDate+person+startPrice+endPrice)
            var jData = {
               "city" : city1,
               "startDate" : startDate,
               "endDate" : endDate,
               "person" : person,
               "startPrice" : startPrice,
               "endPrice" : endPrice
            };

            $("#contentInput").empty();
            $.ajax({
               url : "searchInListPriceFilter.do",
               type : "POST",
               data : jData,
               dataType : 'json',
               success : function(data) {
                  priceResult = data;
                  $.each(data, function(idx, item) {
                     if(data==null){
                        $("<b>예약 가능한 숙소가 없습니다.</b>").appendTo("#contentInput");

                     }else{
                        $("<div class='item'><div class='itemPic'><a href='searchDetail.do?accom_id=" + item.accom_id + "'><img src='images/tower.JPG'class='img-thumbnail'alt='Responsive image'></a></div><div class='itemCost'><h5>" + item.price + "원</h5></div><div class='itemTitle'><h5>" + item.name + "</h5></div><div class='itemRecommandPoint'></div></div>")
                        .appendTo("#contentInput");
                     }

                  });
               }
            });
            $('input:checkbox[id=checkBox1]').checked = true;
            $('input:checkbox[id=checkBox2]').checked = true;
            $('input:checkbox[id=checkBox3]').checked = true;
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
<%
   String id = (String) session.getAttribute("userid");
%>
<title>Insert title here</title>
<link rel="stylesheet" href="css/searchList.css">
<link rel="stylesheet" href="css/airDnDCSS.css?ver=4">
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
</head>


<body>
   <!-- TopSearch 가져옴 시작-->
   <input type="hidden" id="hiddenCity">
   <input type="hidden" id="hiddenStartDate">
   <input type="hidden" id="hiddenEndDate">
   <input type="hidden" id="hiddenPerson">

   <!-- TopSearch 가져옴 끝-->
   <div id="searchList">
      <div id="top">
         <img src="img/logo.png" id="logo">
         <div id="topSearch">
            <div id="topCityDiv">
               <input type="text" id="topCity" value="모든 위치" name="searchCity">
            </div>
            <div id="topDatepickerDiv">
               <input type="text" id="topDatepicker1" value="모든 날짜"
                  name="searchStartDate"> ~ <input type="text"
                  id="topDatepicker2" value="모든 날짜" name="searchEndDate">
            </div>
            <div id="topPersonnelDiv">
               <select id="topPersonnel" name="searchNumOfPerson">
                  <option value="1">인원 1명</option>
                  <option value="2">인원 2명</option>
                  <option value="3">인원 3명</option>
                  <option value="4">인원 4명</option>
                  <option value="5">인원 5명</option>
                  <option value="6">인원 5명+</option>
               </select>
            </div>
            <input type="submit" id="topSearchSubmitBtn" value="검색">
         </div>
         <div id="memberStatus">
            <c:choose>
               <c:when test="${msg =='failure'}">
                  <div id="nomemberStatusWrapper">
                     <div id="noMemberStatus">
                        <a class="indexFont" href="join.jsp">회원가입</a>
                        &nbsp;&nbsp;&nbsp;&nbsp; <a class="indexFont" href="login.jsp">로그인</a>
                     </div>
                  </div>
               </c:when>
               <c:when test="${msg == null}">
                  <!-- 로그인X -->

                  <%
                     if (id == null) {
                  %>

                  <div id="topNomemberStatusWrapper">
                     <div id="noMemberStatus">
                        <a class="indexFont" href="join.jsp">회원가입</a>
                        &nbsp;&nbsp;&nbsp;&nbsp; <a class="indexFont" href="login.jsp">로그인</a>
                     </div>
                  </div>
                  <%
                     } else {
                  %>
                  <div id="topMemberStatusWrapper">
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
                                 href="logout.do"
                                 class="list-group-item list-group-item-action">로그아웃</a>
                           </div>
                        </div>
                     </div>
                  </div>
                  <%
                     }
                  %>
               </c:when>
               <c:otherwise>
                  <div id="topMemberStatusWrapper">
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
                                 href="logout.do"
                                 class="list-group-item list-group-item-action">로그아웃</a>
                           </div>
                        </div>
                     </div>
                  </div>
               </c:otherwise>
            </c:choose>
         </div>
      </div>
      <div id="selectRange">

         <div id="selectRangeOfCost">
            <b>가격범위</b> <span class="glyphicon glyphicon-chevron-down"></span>

         </div>


         <div id="selectHouseType">
            <b>숙소유형</b> <span class="glyphicon glyphicon-chevron-down"></span>

         </div>
      </div>
      <div id="itemList">
         <div id="setRangePanel">
            <div class="panelCloseButton">✖</div>
            <div class="panelDetail">
               <div class="input-group">
                  <span class="input-group-addon">최저값</span> <input type="text"
                     id="minPrice" class="form-control"
                     aria-label="Amount (to the nearest dollar)"> <span
                     class="input-group-addon">.00</span>
               </div>
               <br>
               <div class="input-group">
                  <span class="input-group-addon">최고값</span> <input type="text"
                     id="maxPrice" class="form-control"
                     aria-label="Amount (to the nearest dollar)"> <span
                     class="input-group-addon">.00</span>
               </div>
            </div>
         </div>
         <div id="setHouseTypePanel">
            <div class="panelCloseButton">✖</div>
            <div class="panelDetail">
               <div class="input-group">
                  <div class="row">
                     <div class="col-md-12">
                        <div class="hr-left">
                           <span class="input-group-addon"> <input type="checkbox"
                              name="typeFilter" id="checkBox1" value="집전체" che cked><b>집
                                 전체</b> (나 혼자 사용할 수 있는 숙소)
                           </span>
                        </div>
                     </div>
                     <div class="col-md-12">
                        <div class="hr-left">
                           <span class="input-group-addon"> <input type="checkbox"
                              name="typeFilter" id="checkBox2" value="개인실" checked><b>개인실</b>(개인실이
                              있고 공동 공간은 함께 사용하는 숙소)
                           </span>
                        </div>
                     </div>
                     <div class="col-md-12">
                        <div class="hr-left">
                           <span class="input-group-addon"> <input type="checkbox"
                              name="typeFilter" id="checkBox3" value="다인실" checked><b>다인실</b>(다인실과
                              같은 공유 공간을 이용하는 숙소)
                           </span>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- /input-group -->
            </div>
         </div>
         <div id="contentInput"></div>

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
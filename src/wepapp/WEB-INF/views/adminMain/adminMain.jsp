<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='tiles' uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
   <head>
   	<title></title>
            <meta charset="UTF-8" />
         <!-- html4 : 파일의 인코딩 방식 지정 -->
         <!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->

     	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
         <!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정.-->
      
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
         <!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
   
      
         <!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
          <link rel="shortcut icon" href="/resources/images/icon.png" />
         <link rel="apple-touch-icon" href="/resources/images/icon.png"/>
         
         <script type="text/javascript">
         var one=${month.jan};
         var two=${month.feb};
         var three=${month.mar};
         var four=${month.apr};
         var five=${month.may};
         var six=${month.jun};
         var seven=${month.jul};
         var eight=${month.aug};
         var nine=${month.sep};
         var ten=${month.oct};
         var eleven=${month.nov};
         var twoeleven=${month.dec};
         </script>
</head>

<body >
<div class="container-fluid">
<h5 class="text-left m-0 font-weight-bold text-primary">메인</h5>
<hr class="sidebar-divider">
<div class="row">
            <!-- Area Chart -->
            <div class="col-xs-12 col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">오늘의 할일</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  	  <div class="text-right "><h6 class="font-weight-bold">${time}</h6></div>
				  <table class="table table-striped" >
					<tr class="text-center">
						<td>배송 준비중</td>
						<td>배송 중</td>
						<td>취소 신청/취소처리중</td>
						<td>교환 신청/교환처리중</td>
						<td>환불요청</td>
						<td>게시물관리</td>
					</tr>
					
					<tr class="text-center">
						<td>${total.ready}건</td>
						<td>${total.ship}건</td>
						<td>${total.canceling }건</td>
						<td>${total.exchange }건</td>
						<td>${total.refund }건</td>
						<td>0건</td>
					</tr>
				</table>
                </div>
              </div>
            </div>
            </div>


<br>
<div class="row">

            <!-- Area Chart -->
            <div class="col-xl-6 col-lg-6">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">쇼핑몰 현황</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-area">
                     <canvas id="myAreaChart" ></canvas>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-xl-6 col-lg-6">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">1일 매출현황</h6>
                   
                </div>
                <!-- Card Body -->
                <div class="card-body">
                	<div class="chart-area">
                <table class="table table-bordered">
				  <tr class="text-center">
				  	<td>날짜</td>
				  	<td>주문</td>
				  	<td>결제</td>
				  	<td>환불(취소/반품)</td>
				  </tr>
					<c:forEach var="order" items="${list}" varStatus="status">
						<tr class="text-center">
							<td>${order.o_regdate }</td>
							<td>${order.total }건</td>
							<td>${order.pay }건</td>
							<td>${order.cancel }건</td>
						</tr>
					</c:forEach>
				</table>
				</div>
                </div>
              </div>
            </div>
          </div>
  </div>
		  <script src="/resources/include/js/sb-admin-2.min.js"></script>
		  <script src="/resources/include/vendor/chart.js/Chart.min.js"></script>
		  <script src="/resources/include/js/demo/chart-area-main.js"></script>
</body>
</html>

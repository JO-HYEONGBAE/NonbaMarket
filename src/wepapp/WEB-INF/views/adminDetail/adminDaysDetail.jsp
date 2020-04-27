<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        
        <!-- 모바일 웹 페이지 설정 끝 -->
         
         <!--[if lt IE 9]>
         <script src="/resource/include/js/html5shiv.js"></script>
         <![endif]-->
       <script type="text/javascript">
       var now= new Date();
       var year =now.getFullYear();
       var month =(1+now.getMonth());
       var day = now.getDate();
       var date =format(now);
       now.setDate(now.getDate()-6);
       var one=format(now);
       now.setDate(now.getDate()+1);
       var two=format(now);
       now.setDate(now.getDate()+1);
       var thr=format(now);
       
       now.setDate(now.getDate()+1);
       var four=format(now);
       
       
       now.setDate(now.getDate()+1);
       var five=format(now);
       
       now.setDate(now.getDate()+1);
       var six=format(now);
       
       function format(date){
	       	var year = date.getFullYear();                          
	       	var month = (1 + date.getMonth());                     
	       	month = month >= 10 ? month : '0' + month; 
	       	var day = date.getDate();                                        
	       	day = day >= 10 ? day : '0' + day;               
	       	return  month + '-' + day;

	       }
       
       
       var totsix="${dayList.six}";
       var totfiv="${dayList.five}";
       var totfor="${dayList.four}";
       var totthr="${dayList.three}";
       var tottwo="${dayList.two}";
       var totone="${dayList.one}";
       var tot="${dayList.today}";
       
       
       </script>
</head>
<body>
	<div class="col-xl-6">
	<a class="btn btn-success" href="/adminDetail/adminDaysDetail" role="button">일일 매출</a>
	<a class="btn btn-default" href="/adminDetail/adminWeeksDetail" role="button">주별 매출</a>
	<a class="btn btn-default" href="/adminDetail/adminMonthsDetail" role="button">월간 매출</a>
	</div>
	<hr/>
            <!-- Area Chart -->
            <div class="col-xl-12 col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">일일 매출</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-bar">
                     <canvas id="myBarChart" ></canvas>
                  </div>
                </div>
              </div>
            </div>
			<div class="col-xl-12 col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">매출 분석</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                	<table class="table table-hover" >
                		<colgroup>
                			<col width=7%>
                			<col width=10%>
                			<col width=10%>
                			<col width=10%>
                			<col width=7%>
                			<col width=10%>
                			<col width=7%>
                			<col width=7%>
                			<col width=7%>
                		</colgroup>
                		<tr class="text-center">
                			<td style="vertical-align: middle;" rowspan="2" class="text-center">일자</td>
                			<td colspan="4" class="text-center">결제완료주문</td>
                			<td style="vertical-align: middle; " rowspan="2" class="text-center">결제합계</td>
                			
                			<td style="vertical-align: middle" class="text-center" rowspan="2">환불합계</td>
                		</tr>
                		<tr>
                		<td class="text-center">주문수</td>
                		<td class="text-center">품목수</td>
                		<td class="text-center">상품판매금액</td>
                		<td class="text-center">포인트</td>
                			
                		</tr>
                			
                		<c:forEach var="day" items="${list}">
                		<tr>
                			<td class="text-center">${day.regdate}</td>
                			<td class="text-center">${day.ordercnt}</td>
                			<td class="text-center">${day.stockcnt}</td>
                			<td class="text-center">${day.totalsell}</td>
                			<td class="text-center">${day.usepoint}</td>
                			<td class="text-center">${day.totalsum}</td>
                			<td class="text-center">${day.totalrefund}</td>
                			
                			
                		</tr>
                		</c:forEach>
                		
                		
                		
                		
                	</table>
                </div>
              </div>
            </div>

</body>
<script src="/resources/include/js/sb-admin-2.min.js"></script>
 <script src="/resources/include/vendor/chart.js/Chart.min.js"></script>
 
<script type="text/javascript" src="/resources/include/js/demo/chart-bar-day.js"></script>
</html>

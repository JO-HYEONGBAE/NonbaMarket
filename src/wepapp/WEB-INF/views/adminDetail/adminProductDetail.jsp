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
 		
       var list = [];
		var cnt=[];
		
		var list2 = [];
		var sum=[];
       <c:forEach items="${cntrank}" var="item">

       list.push("${item.name}");
		cnt.push("${item.cnt}");
       </c:forEach>
       
       <c:forEach items="${sumrank}" var="item">

       list2.push("${item.name}");
		sum.push("${item.sum}");
       </c:forEach>
	   	
       var searchDate="${data.enddate}";
	    var btn="${data.dateBtn}";
	    
       $(function(){
    	   
   	   if(searchDate!=""){
       		$("#startdate").val("${data.startdate}");
       		$("#enddate").val("${data.enddate}");
       	}else{
       		//초기 들어오면 설정되는 날짜값
               $("#enddate").val("전체");
               $("#startdate").val("전체");
               
       	}
   	   if(btn!=""){
       		$("input[name='btn']").removeClass("btn-primary");
       		$("${data.dateBtn}").addClass("btn-primary");
       	}else{
       		$("#allBtn").addClass("btn-primary");
       	}
   		 
   		var $startDate = $('.start-date');
	    var $endDate = $('.end-date');
    
   		 
       $("#todayBtn").click(function(){
		 $("#enddate").val(date);
         $("#startdate").val(date);
		$("#dateBtn").val("#todayBtn");
		});
		
		$("#threeBtn").click(function(){
			 $("#enddate").val(date);
			 
			 now.setDate(now.getDate()-3);
      		 date =format(now);
        	 $("#startdate").val(date);
	         now=new Date();
	       	date =format(now);
	       	$("#dateBtn").val("#threeBtn");
		});
		
		$("#sevenBtn").click(function(){
			 $("#enddate").val(date);
			now.setDate(now.getDate()-7);
	          date =format(now);
			 $("#startdate").val(date);
			 now=new Date();
       		date =format(now);
       
      		 $("#dateBtn").val("#sevenBtn");
		});
		
		$("#oneMonthBtn").click(function(){
			 $("#enddate").val(date);
			now.setMonth(now.getMonth()-1);
      	 	date =format(now);
			 $("#startdate").val(date);
			now=new Date();
       		date =format(now);
       
       		$("#dateBtn").val("#oneMonthBtn");
		});
		
		$("#threeMonthBtn").click(function(){
			 $("#enddate").val(date);
			 
			now.setMonth(now.getMonth()-3);
     	 	date =format(now);
			 $("#startdate").val(date);
			now=new Date();
       		date =format(now);
       
       $("#dateBtn").val("#threeMonthBtn");
		});
		
		$("#yearBtn").click(function(){
			$("#enddate").val(date);
			 
			now.setFullYear(now.getFullYear()-1);
     		 date =format(now);
			 $("#startdate").val(date);
			now=new Date();
      		 date =format(now);
       
       		$("#dateBtn").val("#yearBtn");
		});
		
		$("#allBtn").click(function(){
			$("#enddate").val("전체");
			
			 $("#startdate").val("전체");
			 
			 $("#dateBtn").val("#allBtn");
		});
		
  	 $("input[name=btn]").click(function(){
   		$("input[name='btn']").removeClass("btn-primary");
		$(this).addClass("btn-primary");
   });
   
   
  	 $("#searchBtn").click(function(){
  		 $("#p_searchForm").attr({
  			 "action":"/adminDetail/adminProductDetail",
  		 	"method":"get"
  		 });
  		 $("#p_searchForm").submit();
  	 });
  	 
  	 
   //시작날 종료날 제한 걸어주기
   $startDate.datepicker({
     autoHide: true,
     dateFormat: "yy-mm-dd",   
     onClose: function( selectedDate ) {    
     // 시작일(fromDate) datepicker가 닫힐때
     // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
     $("#enddate").datepicker( "option", "minDate", selectedDate );
     }
   });
   $endDate.datepicker({
     autoHide: true,
     dateFormat: "yy-mm-dd",  
     onClose: function( selectedDate ) {
         // 종료일(toDate) datepicker가 닫힐때
         // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
         $("#startdate").datepicker( "option", "maxDate", selectedDate );
     }      
   });

		//달력 이미지 버튼 활성화
   $("#startBtn").click(function(){
   	$startDate.datepicker("show");
   })
   
    $("#endBtn").click(function(){
   	$endDate.datepicker("show");
   })
   
   $("#reset").click(function(){
			$("#h_searchForm").each(function(){
				this.reset();
			});
		$("#allBtn").click();
	});
	});
			
	  function format(date){

     	var year = date.getFullYear();                          
     	var month = (1 + date.getMonth());                     
     	month = month >= 10 ? month : '0' + month; 
     	var day = date.getDate();                                        
     	day = day >= 10 ? day : '0' + day;               
     	return  year + '-' + month + '-' + day;

     }
 
       </script>
</head>
<body>
<div class="container-fluid">
		<div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">상품 분석</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                <form class="form-inline" id="p_searchForm">
              <input type="hidden" id="dateBtn" name="dateBtn" value="">
                
				  <table class="table table-hover" >
		<tr>
				  	<td><h6 class="m-0 font-weight-bold text-default" style="padding:6%" >기간</h6></td>
				  		<td colspan="2">
				  		<input type="button" id="allBtn" name="btn" class="btn"  value="전체">
				  		<input type="button" id="todayBtn" name="btn" class="btn" value="오늘">
				  		<input type="button" id="threeBtn" name="btn" class="btn" value="3일">
				  		<input type="button" id="sevenBtn" name="btn" class="btn" value="7일">
				  		<input type="button" id="oneMonthBtn" name="btn" class="btn" value="1개월">
				  		<input type="button" id="threeMonthBtn" name="btn" class="btn" value="3개월">
				  		<input type="button" id="yearBtn" name="btn" class="btn" value="1년">
				  		
				  		
				  		<input type="text" placeholder="시작일"   id="startdate" name="startdate" aria-label="First name" class="form-control start-date">
				  		<button type="button" id="startBtn"  class="btn btn-outline-secondary docs-datepicker-trigger" >
                			<i class="fa fa-calendar"  aria-hidden="true"></i>
              			</button>
              			~
     					 <input type="text" placeholder="종료일" id="enddate" name="enddate" aria-label="Last name" class="form-control end-date">
     					 <button type="button" id="endBtn" class="btn btn-outline-secondary docs-datepicker-trigger" >
               			 <i class="fa fa-calendar"  aria-hidden="true"></i>
             			 </button>
				  		</td>
				  	</tr>
				  	<tr>
				  		<td><h6 class="m-0 font-weight-bold text-default" style="padding:7%" >결제금액</h6></td>
				  		<td class="text-left" colspan="2" >
					    <input type="text" class="form-control" id="startprice" name="startprice">
					    ~
					    <input type="text" class="form-control" id="endprice" name="endprice">
				  		</td>
				  	</tr>
				  	</table>
				  	</form>
				  	</div>
				  	</div>
				  	<div class="container text-center">
			 <button type="button" id="searchBtn" class="btn btn-primary ">검색</button>
			 </div>
			 <br>
				  	<div class="row">
	 <!-- Area Chart -->
            <div class="col-xl-6 col-lg-6">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">상품 판매갯수</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-bar">
                     <canvas id="myPieChart" ></canvas>
                  </div>
                </div>
              </div>
            </div>
			<div class="col-xl-6 col-lg-6 ">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">상품 판매매출</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-bar">
                     <canvas id="myPieChart2" ></canvas>
                  </div>
                </div>
              </div>
            </div>
            </div>
            </div>
			</div>
<script src="/resources/include/js/sb-admin-2.min.js"></script>
<script src="/resources/include/vendor/chart.js/Chart.min.js"></script>
<script type="text/javascript" src="/resources/include/js/demo/chart-pie-demo.js"></script>
<script type="text/javascript" src="/resources/include/js/demo/chart-pie-sum.js"></script>
</body>
</html>

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
       
       
	   	var word="<c:out value='${data.keyword}'/>";
	   	var searchDate="${data.enddate}";
       var btn="${data.dateBtn}";
	   	var chksms="${data.m_smssend}";	
	   	var chkemail="${data.m_emailsend}";	
	   	var startprice="${data.startprice}";
	   	var endprice="${data.endprice}";
       
       
       
       $(function(){
    	  
    	   
    	   $(".paginate_button a").click(function(e){
       		e.preventDefault();
       		$("#m_searchForm").find("input[name='pageNum']").val($(this).attr("href"));
       		$("#m_searchForm").attr({
       			"method":"get",
       			"action":"/adminMember/memberList"
       		});
       		$("#m_searchForm").submit();
       	});
       	
    	   
    	   $("#enddate").val(date);
    	      $("#startdate").val(date);
    	      var $startDate = $('.start-date');
    	      var $endDate = $('.end-date');
    	   
    			
    		
    		//날짜 버튼 누르면 바뀌는 스크립트
    	    var $startDate = $('.start-date');
    	    var $endDate = $('.end-date');
    	    
    		if(word!=""){
    			$("#search").val("${data.search}");
    			$("#keyword").val("${data.keyword}");
    			
    			
    		}if(searchDate!=""){
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
    		 
    		 
    		 if(startprice!=''){
    			 $("#startprice").val(startprice);
    		 }
    		 if(endprice!=''){
    			 $("#endprice").val(endprice);
    		 }
    			 
    			 
    		 if(chkemail!=''){
         		$("input:radio[name='m_emailsend']:radio[value='"+chkemail+"']").prop("checked",true);
         	} if(chksms!=''){
         		$("input:radio[name='m_smssend']:radio[value='"+chksms+"']").prop("checked",true);
         	}  
         	
         	
         	$("#excelDownBtn").click(function(){
        		$("#m_searchForm").attr({
        			"method":"get",
        			"action":"/adminMember/memberExcel"
        		});
        		$("#m_searchForm").submit();
        	});
        	
    		 
         	$("#searchBtn").click(function(){
         		
         		if(Number($("#startprice").val())<=Number($("#endprice").val())){
         			
        		$("#m_searchForm").attr({
        			"action":"/adminMember/memberList",
        			"method":"get"
        		});
        		$("#m_searchForm").submit();
         		}else{
         			alert("결제금액이 시작금액보다 끝나는금액이 작을수없습니다.");
         		}
        	});
         	
    	     
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
		<h5 class="text-left m-0 font-weight-bold text-primary">고객관리</h5>
			<hr class="sidebar-divider">
				<div class="row">
            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">회원 검색</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                <form class="form-inline" id="m_searchForm">
                <input type="hidden" id="dateBtn" name="dateBtn" value="">
                 <input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}"> 
                <input type="hidden" name="amount" value="${pageMaker.cvo.amount}"> 
				  <table class="table table-hover" >
				  <colgroup>
				  <col width=7%>
				  <col width=7%>
				  </colgroup>
				  	<tr>
				  		<td><h6 class="m-0 font-weight-bold text-default" style="padding:7%" >검색분류</h6></td>
				  		<td><select id="search" name="search" class="form-control">
				  			<option value="id">아이디</option>
				  			<option value="name">이름</option>
				  			<option value="email">이메일</option>
				  			<option value="phone">휴대폰번호</option>
				  		</select>
				  		</td>
				  		
				  		<td class="text-left" colspan="2" >
					    <input type="text" class="form-control" id="keyword" name="keyword">
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
				  	
				  	
				  	<tr>
				  	<td ><h6 class="m-0 font-weight-bold text-default" style="padding:6%" >등록일</h6></td>
				  		<td colspan="2" >
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
				  		<td><h6 class="m-0 font-weight-bold text-default" style="padding:7%" >SMS수신</h6></td>
				  		<td colspan="2"><input type="radio" name="m_smssend" value="0" checked="checked">&nbsp;&nbsp;전체&nbsp;&nbsp;
				  		<input type="radio" name="m_smssend" value="1">&nbsp;&nbsp;수신허용&nbsp;&nbsp;
				  		<input type="radio" name="m_smssend" value="2">&nbsp;&nbsp;수신안함&nbsp;&nbsp;
				  	</td>
				  	</tr>
				  	<tr>
				  		<td><h6 class="m-0 font-weight-bold text-default" style="padding:7%" >이메일수신</h6></td>
				  		<td colspan="2"><input type="radio" name="m_emailsend" value="0" checked="checked">&nbsp;&nbsp;전체&nbsp;&nbsp;
				  		<input type="radio" name="m_emailsend" value="1">&nbsp;&nbsp;수신허용&nbsp;&nbsp;
				  		<input type="radio" name="m_emailsend" value="2">&nbsp;&nbsp;수신안함&nbsp;&nbsp;
				  	</td>
				  	</tr>
				  </table>
				  </form>
				  </div>
				 </div>
			 </div>
			 <div class="container text-center">
			 <button type="button" id="searchBtn" class="btn btn-primary btn-lg">검색</button>
			 <button type="button" id="reset" class="btn btn-primary btn-lg">초기화</button>
			 </div>
		 </div>
		 <br/>
		  <div class="row">
		 <div class="container-fluid text-right">
				<span  class="m-0 font-weight-bold text-default">총</span> 
                  <span class="m-0 font-weight-bold text-danger">${count}</span>
                  <span class="m-0 font-weight-bold text-default">명</span> 
                  </div>
            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">회원목록</h6>
                  <button type="button" id="excelDownBtn" ><img src="/resources/images/excel.png"></button>
                </div>
                
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
                			<td>아이디</td>
                			<td>이름</td>
                			<td>휴대전화</td>
                			<td>나이</td>
                			<td>이메일</td>
                			<td>생일</td>
                			<td>등록일</td>
                			<td>등급</td>
                			<td>총결제금액</td>
                		</tr>
                			<c:forEach var="member" items="${list}">
                		<tr class="text-center">
                			<td style="vertical-align: middle">${member.m_id}</td>
                			<td style="vertical-align: middle">${member.m_name}</td>
                			<td style="vertical-align: middle">${member.m_phone}</td>
                			<td style="vertical-align: middle">${member.age} </td>
                			<td style="vertical-align: middle">${member.m_email}</td>
                			<td style="vertical-align: middle" class="text-center">${member.m_birth}</td>
                			<td style="vertical-align: middle">${member.m_regdate}</td>
                			<td style="vertical-align: middle">${member.g_name} </td>
                			<td style="vertical-align: middle">${member.allprice} </td>
                			
                		</tr>
                			</c:forEach>
                			<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
				             </tr>
                	</table>
                
               
               
               
                <div class="container-fluid " style="text-align: center">
              	<ul class="pagination">
              <c:if test="${pageMaker.prev}">
              			<li class="paginate_button page-item previous" id="dataTable_previous">
              			<a href="${pageMaker.startPage -1 }" class="page-link" >
					<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">previous</font></font></a></li>
              </c:if>
              
              <c:forEach var ="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
              			
              			
       			<li class="paginate_button active ${pageMaker.cvo.pageNum == num ? 'activce':''}">
       				<a href="${num}" class="page-link"  >
       			<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${num}</font>
       			</font></a></li>
       			
       			
       		</c:forEach>
       			<c:if test="${pageMaker.next}">
              			<li class="paginate_button page-item">
              				<a href="${pageMaker_endPage +1 }" class="page-link">
					<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">previous</font></font></a></li>
				</c:if>
              </ul>
              </div>
               </div>
               </div>
               </div>
               </div>
               </div>
</body>
</html>

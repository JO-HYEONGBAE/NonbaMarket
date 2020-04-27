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
         var chkArray=[];
         
         var chkmember="${data.m_num}";
     	var word="<c:out value='${data.keyword}'/>";
     	var word2="<c:out value='${data.keyword2}'/>";
     	var searchDate="${data.enddate}";
         var btn="${data.dateBtn}";
         
         
         $(function(){
        	 
        	 $(".paginate_button a").click(function(e){
         		e.preventDefault();
         		$("#d_searchForm").find("input[name='pageNum']").val($(this).attr("href"));
         		$("#d_searchForm").attr({
         			"method":"get",
         			"action":"/adminOrders/deliveryList"
         		});
         		$("#d_searchForm").submit();
         	});
        	 
        	 $("#excelDownBtn").click(function(){
          		$("#d_searchForm").attr({
          			"method":"get",
          			"action":"/adminOrders/deliveryExcel"
          		});
          		$("#d_searchForm").submit();
          	});
         	
        	 
        	 
     	//날짜 버튼 누르면 바뀌는 스크립트
         var $startDate = $('.start-date');
         var $endDate = $('.end-date');
         
     	if(word!=""){
     		$("#search").val("${data.search}");
     		$("#keyword").val("${data.keyword}");
     		
     		
     	}
     	if(word2!=""){
     		$("#search2").val("${data.search2}");
     		$("#keyword2").val("${data.keyword2}");
     		
     		
     	}
     	
     	if(searchDate!=""){
     		$("#startdate").val("${data.startdate}");
     		$("#enddate").val("${data.enddate}");
     	}else{
     		//초기 들어오면 설정되는 날짜값
             $("#enddate").val("전체");
             $("#startdate").val("전체");
             
     	}if(chkmember!=''){
    		$("input:radio[name='m_num']:radio[value='"+chkmember+"']").prop("checked",true);
    	}
    		
     	 
     	 if(btn!=""){
     		$("input[name='btn']").removeClass("btn-primary");
     		$("${data.dateBtn}").addClass("btn-primary");
     	}else{
     		$("#allBtn").addClass("btn-primary");
     	}
     	 
     	 $("#searchBtn").click(function(){
     		 
     	 
     		$("#d_searchForm").attr({
     			"action":"/adminOrders/deliveryList",
     			"method":"get"
     		});
     		$("#d_searchForm").submit();
     	 })
     	 
     	 
     	 //송장 번호 입력
     	 $(".invoiceInsertBtn").click(function(){
    		 var result=Math.floor(Math.random() * 100000000000) + 1;
    		 console.log(result)
    		 $(this).prev().val(result)
    		 var td=$(this).parents("td");
    		 var o_invoice=$(this).prev().val();
    		 var o_num=$(this).parents("td").prev().find("a").html();
    		 var btn=$(this).parents("td").next().next().next().next().next().find(".deliverUpdateBtn");
    		 console.log(o_num);
    		 
    		 if($(this).prev().val().replace(/\s/g,'')==""){
    				alert("송장번호를 입력해주세요");
    				$($(this).prev()).focus();
    				$($(this).prev()).val("");
    				return false;
    				}else {
    			
    					$.ajax({
    						url:"/adminOrders/"+o_num,
    						type:"patch",
    						headers:{
    							"X-HTTP-Method-Override":"PATCH",
    							"Content-Type":"application/json"
    						},
    						data:JSON.stringify({
    						o_invoice:o_invoice,
    							
    						}),
    						dataType:"text",
    						error:function(){
    							alert("시스템 오류입니다.");
    						},
    						
    						
    						success:function(data){
    							console.log(data);
    							if(data=="SUCCESS"){
    								btn.removeAttr("disabled");
    								td.html(result);
    							}
    							else{
    								
    							}
    					 
    						}
    					});
    				}
    				});
     	 
     	 
     	 
     	 
     	 //배송 변경버튼
    	 $(".deliverUpdateBtn").click(function(){
    		 var td2=$(this).parents("td");
    		 var td=$(this).parents("td").prev();
    		 var o_deliver=$(this).parents("td").prev().find(".o_deliver").val();
    		 var o_invoice=$(this).parents("td").prev().prev().prev().prev().prev().html();
    		 console.log(o_deliver);
    		 console.log(o_invoice);
    		 $.ajax({
    			url:"/adminOrders/deliverUpdate",
    			type:"patch",
    			headers:{
    				"Content-Type":"application/json",
    				"X-HTTP-Method-Override":"PATCH"
    			},
    			data:JSON.stringify({
    				o_deliver:o_deliver,
    				o_invoice:o_invoice
    			}),
    			dataType:"text",
    			error:function(){
    				alert("시스템 관리중입니다. 잠시후 다시 시도해주세요.");
    			},
    			success:function(result){
    				if(result=="SUCCESS"){
    					alert("수정되었습니다.");
    					
    				
    					
    					if(o_deliver=='배송완료'){
    						td.html("<h6 class='m-0 font-weight-bold text-default'>"+o_deliver+"</h6>");
    						td2.html("<h6 class='m-0 font-weight-bold text-default'>X</h6>");
    					
    					}
    				}
    			}
    		 });
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
				$("#o_searchForm").each(function(){
  				this.reset();
  			});
				$("#allBtn").click();
			});
          
          //리스트 체크 버튼 전체선택 전체 해제
        /*   $("#o_deliver").click(function(){
          	if($("#o_deliver").prop("checked")){
          		$("input[name='o_deliver']").prop("checked",true);
          	}else{
          		$("input[name='o_deliver']").prop("checked",false);
          	}
          	
          }); */
          $("#reset").click(function(){
  			$("#d_searchForm").each(function(){
  				this.reset();
  			});
  		$("#allBtn").click();
  	});
          
      });
      
      //날짜 조합
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

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h5 class="text-left m-0 font-weight-bold text-primary">배송 관리</h5>
            	<hr class="sidebar-divider">
          </div>

          <!-- Content Row -->
          <div class="row">
			
            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-4 col-md-6 mb-4">
              <div class="card border-bottom-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="h5 font-weight-bold text-primary text-uppercase mb-1 text-center">배송준비중</div>
                      <div id="ready" class="h5 mb-0 font-weight-bold text-gray-800 text-center">${state.ready}건</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-4 col-md-6 mb-4">
              <div class="card border-bottom-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="h5 font-weight-bold text-primary text-uppercase mb-1 text-center">배송중</div>
                      <div id="ing" class="h5 mb-0 font-weight-bold text-gray-800 text-center">${state.ing}건</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-4 col-md-6 mb-4">
              <div class="card border-bottom-danger shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="h5 font-weight-bold text-primary text-uppercase mb-1 text-center">배송완료</div>
                      <div id="finish" class="h5 mb-0 font-weight-bold text-gray-800 text-center">${state.finish }건</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="container-fluid">
			<div class="row">

            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">배송검색</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                <form class="form-inline" id="d_searchForm">
                 <input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}"> 
                <input type="hidden" name="amount" value="${pageMaker.cvo.amount}"> 
                <input type="hidden" id="dateBtn" name="dateBtn" value="">
				  <table class="table table-hover" >
				  <colgroup>
				  <col width=7%>
				  <col width=7%>
				  </colgroup>
				  	<tr>
				  		<td><h6 class="m-0 font-weight-bold text-default" style="padding:7%" >검색분류</h6></td>
				  		<td><select id="search" name="search" class="form-control">
				  			<option value="name">이름</option>
				  			<option value="number">주문번호</option>
				  		</select>
				  		</td>
				  		
				  		<td class="text-left" colspan="2" >
					    <input type="text" class="form-control" id="keyword" name="keyword">
				  		</td>
				  	</tr>
				  	<tr>
				  	<td ><h6 class="m-0 font-weight-bold text-default" style="padding:6%" >주문일</h6></td>
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
				  		<td><h6 class="m-0 font-weight-bold text-default" style="padding:7%" >상품</h6></td>
				  		<td >
				  		<select  name="search2" class="form-control">
				  			<option value="name">상품명</option>
				  			<option value="number">상품번호</option>
				  		</select>
				  		
				  		</td>
				  		<td class="text-left" colspan="2" >
					    <input type="text" class="form-control" id="keyword2" name="keyword2">
				  		</td>
				  	</tr>
				  	<tr>
				  		<td><h6 class="m-0 font-weight-bold text-default" style="padding:7%" >회원구분</h6></td>
				  		<td colspan="2"><input type="radio" name="m_num" value="0" checked="checked">&nbsp;&nbsp;전체&nbsp;&nbsp;
				  		<input type="radio" name="m_num" value="1">&nbsp;&nbsp;회원&nbsp;&nbsp;
				  		<input type="radio" name="m_num" value="2">&nbsp;&nbsp;비회원&nbsp;&nbsp;
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
                  <span class="m-0 font-weight-bold text-danger">${count }</span>
                  <span class="m-0 font-weight-bold text-default">개</span> 
                  </div>
            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">배송목록</h6>
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
                		</colgroup>
                		<tr class="text-center">
                			<td>주문자</td>
                			<td>주문번호</td>
                			<td>송장번호</td>
                			<td>주소</td>
                			<td>결제금액</td>
                			<td>주문일</td>
                			<td>주문상태</td>
                			<td>상태변경</td>
                		</tr>
                			<c:forEach var="orders" items="${list}">
                		<tr class="text-center">
                			<td style="vertical-align: middle">${orders.o_name}</td>
                			<td class="goDetail tal" style="vertical-align: middle"><a >${orders.o_num }</a>
                			<c:choose>
                			<c:when test="${not empty orders.o_invoice}">
                			<td style="vertical-align: middle">${orders.o_invoice}</td>
                			</c:when>
                			<c:otherwise>
                			<td style="vertical-align: middle"class="intd"><input type="text" class="o_invoice" name="o_invoice" placeholder="송장번호">
                			<input type="button" class=" btn btn-primary invoiceInsertBtn"  value="입력">
                			</c:otherwise>
                			</c:choose>
                			<td style="vertical-align: middle">${orders.o_address} </td>
                			<td style="vertical-align: middle">${orders.o_allprice} </td>
                			<td style="vertical-align: middle">${orders.o_regdate }</td>
                			<c:choose>
                			<c:when test="${orders.o_deliver=='배송완료'}">
                			<td style="vertical-align: middle" class="text-center">
                			<h6 class="m-0 font-weight-bold text-default">배송완료</h6>
                			<td style="vertical-align: middle"><h6 class="m-0 font-weight-bold text-default">X</h6></td>
                			</c:when>
                			<c:otherwise>
                			<td style="vertical-align: middle" class="text-center">
                			<select class="o_deliver" name="o_deliver">
                			<option  value="배송준비중" <c:if test="${orders.o_deliver=='배송준비중'}">selected </c:if> >배송준비중</option>
                			<option value="배송중"<c:if test="${orders.o_deliver=='배송중'}">selected</c:if>>배송중</option>
                			<option value="배송완료"<c:if test="${orders.o_deliver=='배송완료'}">selected</c:if>>배송완료</option>
                			</select>
                			</td>
                			<td style="vertical-align: middle">
                			<c:choose>
                			<c:when test="${not empty orders.o_invoice}">
                			<input type="button" class=" btn btn-primary deliverUpdateBtn" value='변경'  >
                			</c:when>
                			<c:otherwise>
                			<input type="button" class=" btn btn-primary deliverUpdateBtn" value='변경' disabled="disabled">
                			</c:otherwise>
                			</c:choose>
                			</td>
                			</c:otherwise>
                			</c:choose>
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
				             </tr>
                	</table>
                <div class="text-center">
              <ul class="pagination " >
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
           </div>
            </div>
</body>
</html>

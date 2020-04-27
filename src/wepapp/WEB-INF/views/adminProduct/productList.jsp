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
         <script type="text/javascript" src="/resources/include/js/common.js"></script>
        <script type="text/javascript">
            var now= new Date();
            var year =now.getFullYear();
            var month =(1+now.getMonth());
            var day = now.getDate();
            var date =format(now);
            var chkArray=[];            
  			
          //검색후 나오는 값 설정작업
        	var word="<c:out value='${data.keyword}'/>";
        	var searchDate="${data.enddate}";
        	var btn="${data.dateBtn}";
        	console.log(btn);
        	var lg_c="${data.lc_num}";
        	var md_c="${data.mc_num}";
        	var p_c="${data.p_num}";
        	var chkdisplay="${data.p_display}";
        	var chkstock="${data.p_stock}";
        $(function() {
        	
        	
        	 $("#op_stock").blur(function(){
          		 var x=  Number($("#stock").val());
          		 var y=  Number($("#op_stock").val());
          		  if(Number($("#stock").val())<Number($("#op_stock").val())){
          			  alert("한글 영어 입력 또는 상품 재고보다 많이 입력할 수 없습니다.");
          			  $("#op_stock").val("");
          			  $("#op_stock").focus();
          		  } 
          	   });
        	
        	$(".paginate_button a").click(function(e){
        		e.preventDefault();
        		$("#p_searchForm").find("input[name='pageNum']").val($(this).attr("href"));
        		$("#p_searchForm").attr({
        			"method":"get",
        			"action":"/adminProduct/productList"
        		});
        		$("#p_searchForm").submit();
        	});
        	
        	
        	
        	
        	
        	
        	$("#productDeleteBtn").click(function(){
        		
        	//체크박스 체크된것 배열 값
        	$("input[name='chks']:checked").each(function(i){
        		chkArray.push(Number($(this).val()));	
        		console.log(chkArray);
        	});  	
        	var p_num={"p_num":chkArray};
        		if(confirm("삭제하시겠습니까?")){
        			$.ajax({
        				url:"/adminProduct/deleteProduct/"+chkArray,
        				dataType:"text",
        				headers:{
        					"X-HTTP-Method-Override":"DELETE"
        				},
        				type:"delete",
        				
        				error:function(){
        					alert("시스템에 문제가 생겼습니다. 잠시후 다시 시도해주세요");
        					console.log(p_num);
        				},
        				success:function(result){
        					console.log(result);
        					if(result=="성공"){
        						alert("삭제하였습니다.");
        						location.href="/adminProduct/productList";
        						
        					}
        					else{
        						alert("삭제에 실패하였습니다.");
        						chkArray=[];
        						console.log(chkArray);
        					}
        					
        				}
        			});
        		}
        	});
        	
        	
        	
        	console.log(word);
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
        	
        	if(lg_c!="0"){
        		$("#lc_num").val(lg_c).prop("checked",true);
				var url="/adminProduct/mid/"+lg_c;
        		
        		$.getJSON(url,function(data){
        			console.log("midcategory"+data.length);
        			
        			$(data).each(function(){
        				var mc_num=this.mc_num;
        				var mc_name=this.mc_name;
        				
        				addMid(mc_num,mc_name)
        			});
        			}).always(function(){
        				if(md_c!="0"){
                			$("#mc_num").val(md_c).prop("checked",true);
                			var url ="/adminProduct/low/"+md_c;
                			$.getJSON(url,function(data){
                    			console.log("midcategory"+data.length);
                    			
                    			$(data).each(function(){
                    				var p_num=this.p_num;
                    				var p_name=this.p_name;
                    				
                    				addLow(p_num,p_name)
                    			});
                    			
                    		}).always(function(){
                    			if(p_c!="0"){
                    				$("#p_num").val(p_c).prop("checked",true);
                    			}
                    		});
                    		
        				}
        			
        		});
        			
        	}
        	
        	 if(chkdisplay!=''){
        		$("input:radio[name='p_display']:radio[value='"+chkdisplay+"']").prop("checked",true);
        	} if(chkstock!=''){
        		$("input:radio[name='p_stock']:radio[value='"+chkstock+"']").prop("checked",true);
        	}  
        	
        	$("#excelDownBtn").click(function(){
        		$("#p_searchForm").attr({
        			"method":"get",
        			"action":"/adminProduct/productExcel"
        		});
        		$("#p_searchForm").submit();
        	});
        	
        	
        	$("#lc_num").change(function(){
        		$("#mc_num").html("<option value=0>중분류</option>");
        		$("#p_num").html("<option value=0>소분류</option>");
        		console.log($(this).val());
        		var url="/adminProduct/mid/"+$(this).val();
        		
        		$.getJSON(url,function(data){
        			console.log("midcategory"+data.length);
        			
        			$(data).each(function(){
        				var mc_num=this.mc_num;
        				var mc_name=this.mc_name;
        				
        				addMid(mc_num,mc_name)
        			});
        			
        		});
        		});
        		
        		
        		
        		$("#mc_num").change(function(){
        			$("#p_num").html("<option value=0>소분류</option>");
        			var url ="/adminProduct/low/"+$(this).val();
        			$.getJSON(url,function(data){
        				console.log("lowcategory"+data.length);
        				$(data).each(function(){
        					var p_num=this.p_num;
        					var p_name=this.p_name;
        					
        					addLow(p_num,p_name)
        					
        				});
        			});
        		});
        		
        		
        		//날짜 버튼 활성화
        		
        	
        	
        	$("#searchBtn").click(function(){
        		$("#p_searchForm").attr({
        			"action":"/adminProduct/productList",
        			"method":"get"
        		});
        		$("#p_searchForm").submit();
        	});
        	
        	
        	
        	
        	//날짜 버튼 누르면 바뀌는 스크립트
            
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
            
            //리스트 체크 버튼 전체선택 전체 해제
            $("#chkAll").click(function(){
            	if($("#chkAll").prop("checked")){
            		$("input[name='chks']").prop("checked",true);
            	}else{
            		$("input[name='chks']").prop("checked",false);
            	}
            	
            });
            
			$("#reset").click(function(){
  				$("#p_searchForm").each(function(){
     				this.reset();
     			});
				$("#allBtn").click();
			});
        	
			
			$(".goDetail").click(function(){
				var p_num = $(this).prev().find("input[name=chks]").val();
				$("#op_p_num").val(p_num);
				
				listOption(p_num);
				$("#stock").val("0");
				$("#optionModal").modal();
				
			});
			 $("#close").click(function(){
	    		 if(confirm('상품옵션추가를 그만하시겠습니까?')){
	    			 if($("#stock").val()==0){
	          			$("#option_form").each(function(){
	          				this.reset();
	          		});
	   				$("#optionModal").modal("hide");
	   				location.href="/adminProduct/productList";
	    			 }else{
	    				 alert("상품 재고가 남았습니다. 옵션을 추가하거나 수정해주세요.");
	    			 }
	    			 
	          			
	    		 } 
	    	   });
			
			 
			 //상품옵션 리스트 추가
	    	   $("#optionInsertBtn").click(function(){
	    		   var p_num=$("#op_p_num").val();
	    	        if(!chkData("#op_name","옵션명을"))return ;
			        else if(!chkData("#op_price","가격을")) return;
			        else if(!chkData("#op_stock","재고를")) return;
			        else{
			        	$.ajax({
			        		url:"/adminProduct/optionInsert",
			        		type:"post",
			        		headers:{
			        			"Content-Type":"application/json",
			        			"X-HTTP-Method-Override":"POST"
			        		},
			        		data:JSON.stringify({
			        			p_num:$("#op_p_num").val(),
			        			op_name:$("#op_name").val(),
			        			op_price:$("#op_price").val(),
			        			op_stock:$("#op_stock").val()
			        		}),
			        		dataType:"text",
			        		error:function(){
			        			alert("시스템 오류입니다. 관리자에게 문의하세요");
			        		},
			        		success:function(result){
			        			if(result="성공"){
			        				alert('리스트 추가 성공');
			        			$("#stock").val($("#stock").val()-$("#op_stock").val());
			        			$("#op_name").val("");
			        			$("#op_price").val("");
			        			$("#op_stock").val("");
			        			listOption(p_num);
			        			}
			        		}
			        	
			        	});
			        }
	    	   });
			
	    	   
	    	   //상품 리스트 삭제
	    	   $(document).on("click",".delBtn",function(){
	    			   var op_num=$(this).parents("td").next().val();
	    			   var op_stock=$(this).parents("td").prev().attr("data-stock");
	    			   if(confirm("선택하신 옵션을 삭제하시겠습니까?")){
	    			   $.ajax({
	    				   url:"/adminProduct/"+op_num,
	    				   type:"delete",
	    				   headers:{
	    					   "X-HTTP-Method-Override":"DELETE"
	    				   },
	    				   dataType:"text",
	    				   error:function(){
	    					   alert("시스템 오류입니다. 다시 시도해주세요");
	    				   },success:function(result){
	    					   if(result="성공"){
	    						   var sum=Number($("#stock").val())+Number(op_stock);
	    						   $("#stock").val(sum);
	    						   listOption($("#op_p_num").val());
	    						   
	    					   }
	    				   }
	    				   
	    				   
	    			   })
	    		   }
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
        
        function addMid(mc_num,mc_name){
        	var mid_option=$("<option>");
        	mid_option.val(mc_num);
        	mid_option.html(mc_name);
        	
        	$("#mc_num").append(mid_option);
        }

        function addLow(p_num,p_name){
        	var low_option=$("<option>");
        	low_option.val(p_num);
        	low_option.html(p_name);
        	
        	$("#p_num").append(low_option);
        }
        function listOption(p_num){
        	$("#optionList").html("");
        	var url="/adminProduct/list/"+p_num+".json";
        	$.getJSON(url,function(data){
			
        		$(data).each(function(){
        			var op_num=this.op_num;
        			var op_name=this.op_name;
        			var op_price=this.op_price;
        			var op_stock=this.op_stock;
        			addOption(op_num,op_name,op_price,op_stock);
        		});
        	});
        }
        function addOption(op_num,op_name,op_price,op_stock){
     	   
     	   var tr=$("<tr>");
     	   var td=$("<td>");
     	   td.attr({"width":"30%"});
     	   var op_nums=$("<input>");
     	   op_nums.attr({"type":"hidden","name":"op_num"});
     	   op_nums.addClass("op_num");
     	   op_nums.val(op_num);
     	   var name_span=$("<span>");
     	   name_span.html(op_name);
     	   
     	   var td1=$("<td>");
     	   td1.attr({"width":"30%"});
     	   var price_span=$("<span>");
     	   price_span.html(op_price+"원");

     	   var td2=$("<td>");
     	   td2.attr({"width":"30%","data-stock":op_stock});
     	   var stock_span=$("<span>");
     	   stock_span.html(op_stock+"개");
     	   
     	   var btn_td=$("<td>");
     	   btn_td.attr({"width":"10%"});
     	   var delete_btn=$("<a>");
     	   delete_btn.addClass("delBtn btn btn-danger btn-circle btn-sm");
     	   delete_btn.attr({"type":"button"});
     	   var delete_i=$("<i>");
     	   delete_btn.addClass("fas fa-trash");
     	   delete_btn.append(delete_i);
     	  /*  var btn_img=$("<img>");
     	   btn_img.attr("src","/upLoad/delete.png");
     	   delete_btn.append(btn_img).css("style","border:0px"); */
     	   
     	   td.append(name_span);
     	   td1.append(price_span);
     	   td2.append(stock_span);
     	   btn_td.append(delete_btn);
     	   tr.append(td).append(td1).append(td2).append(btn_td).append(op_nums);
     	   $("#optionList").append(tr);
        
        }
        
        </script>
        <!-- 모바일 웹 페이지 설정 끝 -->
         
         <!--[if lt IE 9]>
         <script src="/resource/include/js/html5shiv.js"></script>
         <![endif]-->
       
</head>
<body>
	<div class="container-fluid">
			<h5 class="text-left m-0 font-weight-bold text-primary">상품관리</h5>
			<hr class="sidebar-divider">
			<div class="row">

            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">상품검색</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                <form class="form-inline" id="p_searchForm">
              <input type="hidden" id="dateBtn" name="dateBtn" value="">
                <input type="hidden" id="lc_name" name="large" value="">
                <input type="hidden" id="mc_name" name="middle" value=""> 
                <input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}"> 
                <input type="hidden" name="amount" value="${pageMaker.cvo.amount}"> 
                
				  <table class="table table-hover" >
				  <colgroup>
				  <col width=7%>
				  <col width=5%>
				  </colgroup>
				  	<tr>
				  		<td><h6 class="m-0 font-weight-bold text-default" style="padding:5%" >검색분류</h6></td>
				  		<td><select id="search" name="search" class="form-control">
				  			<option value="name">상품명</option>
				  			<option value="number">상품번호</option>
				  		</select>
				  		</td>
				  		
				  		<td class="text-left" colspan="2" >
					    <input type="text" class="form-control" id="keyword" name="keyword">
				  		</td>
				  	</tr>
				  	
				  	<tr>
						<td><h6 class="m-0 font-weight-bold text-default" style="padding:5%" >상품분류</h6></td>
						<td colspan="2">
						<select class="form-control" id="lc_num" name="lc_num">
							<option value=0>대분류</option>
							<c:forEach var="large" items="${largeList}">
								<option value="${large.lc_num}">${large.lc_name}</option>
							</c:forEach>
				  		</select>
				  		<select class="form-control" id="mc_num" name="mc_num">
							<option value=0>중분류</option>
				  		</select>
				  		
				  		<select class="form-control" id="p_num" name="p_num">
							<option value=0>소분류</option>
				  		</select>
				  		</td>
				  	</tr>
				  	
				  	<tr>
				  	<td><h6 class="m-0 font-weight-bold text-default" style="padding:6%" >상품등록일</h6></td>
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
				  		<td><h6 class="m-0 font-weight-bold text-default" style="padding:7%" >진열상태</h6></td>
				  		<td colspan="2"><input type="radio" class="p_display" name="p_display" value="전체" checked="checked">&nbsp;&nbsp;전체&nbsp;&nbsp;
				  		<input type="radio" class="p_display" name="p_display" value="진열">&nbsp;&nbsp;진열&nbsp;&nbsp;
				  		<input type="radio" class="p_display" name="p_display" value="진열안함">&nbsp;&nbsp;진열안함&nbsp;&nbsp;
				  	</td>
				  	</tr>
				  		<tr>
				  		<td><h6 class="m-0 font-weight-bold text-default" style="padding:7%" >재고상태</h6></td>
				  		<td colspan="2"><input type="radio" class="p_stock" name="p_stock" value="0" checked="checked">&nbsp;&nbsp;전체&nbsp;&nbsp;
				  		<input type="radio" class="p_stock" name="p_stock" value="1">&nbsp;&nbsp;재고있음&nbsp;&nbsp;
				  		<input type="radio" class="p_stock" name="p_stock" value="2">&nbsp;&nbsp;품절&nbsp;&nbsp;
				  	</td></tr>
				  
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
                  <h6 class="m-0 font-weight-bold text-primary">상품목록</h6>
                  <button type="button" id="excelDownBtn" ><img src="/resources/images/excel.png"></button>
                  
                  
                </div>
                
                <div class="card-body">
                	<table class="table table-hover" >
                		<colgroup>
                			<col width=5%>
                			<col width=15%>
                			<col width=10%>
                			<col width=10%>
                			<col width=5%>
                			<col width=20%>
                			<col width=10%>
                		</colgroup>
                		<tr class="text-center">
                			<td><label class="checkbox-inline">
  							<input type="checkbox" id="chkAll" value="option1"> 
							</label></td>
                			<td>상품명</td>
                			<td>판매가</td>
                			<td>진열상태</td>
                			<td>재고</td>
                			<td>상품분류</td>
                			<td>상품등록일</td>
                		</tr>
                			<c:forEach var="product" items="${list}">
                		<tr class="text-center">
                			<td style="vertical-align: middle"><label class="checkbox-inline">
  							<input type="checkbox" name="chks" value="${product.p_num}"> 
							</label>
                			<td class="text-left goDetail tal">
      							<img width=50px  src="/upLoad/p_img/${product.p_img}" >
                			${product.p_name}</td>
                			<td style="vertical-align: middle">${product.p_price}원 </td>
                			<td style="vertical-align: middle">${product.p_display} </td>
                			<td style="vertical-align: middle">${product.p_stock} </td>
                			<td style="vertical-align: middle">${product.large} > ${product.mid} > ${product.p_name }</td>
                			<td style="vertical-align: middle">${product.p_regdate }</td>
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
             </tr>
              </table>
              <div class="text-center">
              <ul class="pagination" >
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
	<%-- 	<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
		
              
              	<ul class="pagination">
              		<c:if test="${pageMaker.prev}">
              			<li class="paginate_button page-item previous "><a href="${pageMaker.startPage -1 }" >
					Previous
					</a></li>
              		</c:if>
              		
              		<c:forEach var ="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
              			<li class="active ${pageMaker.cvo.pageNum == num ? 'activce':''}">
              				<a href="${num}" > ${num}</a>
              			</li>
              		</c:forEach>
              		<c:if test="${pageMaker.next}">
              			<li class="paginate_button page-item">
              				<a href="${pageMaker_endPage +1 }">
              				Next
					</a></li>
              		</c:if>	
              	</ul>
              </div> --%>
              <div class="container-fluid text-right">
              	
                <button type="button" id="productDeleteBtn" class="btn btn-danger btn-sm">삭제</button>
                </div>
                <br>
		 </div>
		 
	 </div>
	 </div>
	 <div class="modal fade" id="optionModal" tabindex="-1" role="dialog" aria-labelledby="replyModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
			  <div class="modal-dialog">
		    	<div class="modal-content">
		     	 <div class="modal-header">
		        <h4 class="modal-title" id="replyModalLabel">옵션 수정</h4>
		      </div>
		      <div class="modal-body">
		        <form id="option_form" name="option_form">
		        <div class="form-group">
		        <input type="hidden" id="op_p_num" name="p_num" />
		        	<label for="g_name" class="control-label">상품 옵션명</label>
		        	<input type="text" class="form-control" name="op_name" id="op_name" />
		        </div>
		        <div class="form-group">
		        	<label for="g_content" class="control-label">옵션 가격</label>
		        	<input type="text" class="form-control" name="op_price" id="op_price" />
		        </div>
		        <div class="form-group">
		        	<label for="g_pwd" class="control-label">상품 재고</label>
		        	<input type="text" class="form-control"  id="stock" readonly="readonly"/>
		        
		        	<label for="g_pwd" class="control-label">옵션 재고</label>
		        	<input type="text" class="form-control" name="op_stock" id="op_stock"/>
		        </div>
		        <div class="form-group" >
		        <table class="table table-hover" id="optionList">
		        </table>
		        </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default"  id="close">닫기</button>
		        <button type="button" class="btn btn-primary" id="optionInsertBtn">추가</button>
		      </div>
    </div>
  </div>
</div>
	 
</body>
</html>

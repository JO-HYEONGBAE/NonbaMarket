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
        <!-- 모바일 웹 페이지 설정 끝 -->
         
         <!--[if lt IE 9]>
         <script src="/resource/include/js/html5shiv.js"></script>
         <![endif]-->
         <script type="text/javascript">
         var chkArray=[];  
         var chkArray2=[];  
         var page="${data.pageNum}";
         var cnt="${data.cnt}";
         $(function(){
        	console.log(cnt);
        	 if(Number(page)>=1 && cnt==2){
         		$("#nav-large-tab").removeClass("active");
         		$("#nav-mid-tab").addClass("active");
         		$("#nav-large").removeClass("show active");
         		$("#nav-mid").addClass("show active");
         	 };
        	  
        	  $("#nav-large-tab").click(function(){
        		 $("#cnt").val("1");
        	  });
        	  $("#nav-mid-tab").click(function(){
         		 $("#cnt").val("2");
         	  });
         	 
        	 
        	 $(".paginate_button a").click(function(e){
         		e.preventDefault();
         		$("#page").find("input[name='pageNum']").val($(this).attr("href"));
         		$("#page").attr({
         			"method":"get",
         			"action":"/adminProduct/productCategoryEno"
         		});
         		$("#page").submit();
         	});
         	
         	
        	 
        	 
        	 
        	 $(".goDetail").dblclick(function(){
        		var num=$(this).prev().html();
        		var name=$(this).html();
        		console.log(num.length);
        		if(num.length==3||num.length==4){
        			$("#lc_insert").attr({"disabled":"disabled"});
        			$("#lc_update").removeAttr("disabled");
        			
        			$("#lc_num").val(num);
        			$("#lc_name").val(name);
        		}
        		if(num.length==6||num.length==7){
        			$("#mc_insert").attr({"disabled":"disabled"});
        			$("#large").attr({"disabled":"disabled"});
        			$("#mc_update").removeAttr("disabled");
        			
        			$("#mc_num").val(num);
        			$("#mc_name").val(name);
        		}
        	 });
        	 
        	 $("#lc_update").click(function(){
        		 if(!chkData("#lc_name","대분류명을 ")) return;
         		else{
         			if(confirm("수정하시겠습니까?")){
        				$.ajax({
        					url:"/adminProduct/updateLargeCategory",
        					data:$("#lc_insertForm").serialize(),
        					dataType:"text",
        					type:"get",
        					error:function(){
        					alert("시스템에 문제가 생겼으니 잠시후에 다시 시도해주세요");
        					},
        				success:function(result){
        					alert("수정되었습니다.")
        					location.href="/adminProduct/productCategoryEno";
        				}
        				
        					
        					
        				})
         			}
         		}
        	 });
        	 
        	 $("#mc_update").click(function(){
        		 if(!chkData("#mc_name","대분류명을 ")) return;
         		else{
         			if(confirm("수정하시겠습니까?")){
        				$.ajax({
        					url:"/adminProduct/updateMidCategory",
        					data:$("#mc_insertForm").serialize(),
        					dataType:"text",
        					type:"get",
        					error:function(){
        					alert("시스템에 문제가 생겼으니 잠시후에 다시 시도해주세요");
        					},
        				success:function(result){
        					alert("수정되었습니다.")
        					location.href="/adminProduct/productCategoryEno";
        				}
        				
        					
        					
        				})
         			}
         		}
        	 });
        	 
        	 $("#lc_delete").click(function(){
         		if(confirm("대분류를 삭제할시 대분류에 속한 하위상품들또한 같이 삭제됩니다.")){
             	//체크박스 체크된것 배열 값
             	$("input[name='largeChks']:checked").each(function(i){
             		chkArray.push(Number($(this).val()));	
             		console.log(chkArray);
             	});  	
             	var p_num={"p_num":chkArray};
             			$.ajax({
             				url:"/adminProduct/deleteLargeCategory/"+chkArray,
             				dataType:"text",
             				headers:{
             					"X-HTTP-Method-Override":"DELETE"
             				},
             				type:"delete",
             				
             				error:function(){
             					alert("시스템에 문제가 생겼습니다. 잠시후 다시 시도해주세요");
             					console.log(p_num);
             					chkArray=[];
             				},
             				success:function(result){
             					console.log(result);
             					if(result=="SUCCESS"){
             						alert("삭제하였습니다.");
             						location.href="/adminProduct/productCategoryEno";
             						
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
        	 
        	 
        	 
        	 $("#mc_delete").click(function(){
          		if(confirm("중분류를 삭제할시 중분류에 속한 하위상품들또한 같이 삭제됩니다.")){
              	//체크박스 체크된것 배열 값
              	$("input[name='midChks']:checked").each(function(i){
              		chkArray2.push(Number($(this).val()));	
              		console.log(chkArray2);
              	});  	
              	var p_num={"p_num":chkArray};
              			$.ajax({
              				url:"/adminProduct/deleteMidCategory/"+chkArray2,
              				dataType:"text",
              				headers:{
              					"X-HTTP-Method-Override":"DELETE"
              				},
              				type:"delete",
              				
              				error:function(){
              					alert("시스템에 문제가 생겼습니다. 잠시후 다시 시도해주세요");
              					console.log(p_num);
              					chkArray2=[];
              				},
              				success:function(result){
              					console.log(result);
              					if(result=="SUCCESS"){
              						alert("삭제하였습니다.");
              						location.href="/adminProduct/productCategoryEno";
              						
              					}
              					else{
              						alert("삭제에 실패하였습니다.");
              						chkArray2=[];
              						console.log(chkArray2);
              					}
              					
              				}
              			});
              		}
              	});
         	 
        	 
        	 
        	 
        	 
        	 $("#largeChk").click(function(){
             	if($("#largeChk").prop("checked")){
             		$("input[name='largeChks']").prop("checked",true);
             	}else{
             		$("input[name='largeChks']").prop("checked",false);
             	}
             	
             });
        	 
        	 $("#midChk").click(function(){
              	if($("#midChk").prop("checked")){
              		$("input[name='midChks']").prop("checked",true);
              	}else{
              		$("input[name='midChks']").prop("checked",false);
              	}
              	
              });
        	 
        	 $("#large").change(function(){
        		var lc_num=$("#large").val();
        		console.log(lc_num);
        		 $.ajax({
        			
        			 url:"/adminProduct/"+lc_num,
        			 type:"post",
        			 dataType:"text",
        			 error:function(){
        				alert("시스템 문제가 생겼습니다 다시 시도해주세요."); 
        			 },
        			 success:function(result){
        				 
        				 $("#mc_num").val(lc_num+result);
        			 }
        		 });
        	 });
        	 $("#lc_insert").click(function(){
        		if(!chkData("#lc_name","대분류명을 ")) return;
        		else{
        			if(confirm("등록하시겠습니까?")){
        		 $("#lc_insertForm").attr({
        			"method":"get",
        			"action":"/adminProduct/largeInsert"
        		 });
        		 $("#lc_insertForm").submit();
       			}
        		}
        	 });
        	 
        	 $("#mc_insert").click(function(){
         		if(!chkData("#mc_name","중분류명을 ")) return;
         		else{
         			if(confirm("등록하시겠습니까?")){
         		 $("#mc_insertForm").attr({
         			"method":"get",
         			"action":"/adminProduct/midInsert"
         		 });
         		 $("#mc_insertForm").submit();
        			}
         		}
         	 });
        	 
        	 
        	 
        	 
              });
             
         	
         
         
         
         </script>
         
         
         
       
</head>
<body>
<div class="container-fluid">
			<h5 class="text-left m-0 font-weight-bold text-primary">상품관리</h5>
			<hr class="sidebar-divider">
			<div class="row">

            <div class="col-lg-7">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">상품 분류 관리</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                
	<nav>
		  <div class="nav nav-tabs" id="nav-tab" role="tablist">
		    <a class="nav-item nav-link active" id="nav-large-tab" data-toggle="tab" href="#nav-large" role="tab" aria-controls="nav-home" aria-selected="true">대분류</a>
		    <a class="nav-item nav-link" id="nav-mid-tab" data-toggle="tab" href="#nav-mid" role="tab" aria-controls="nav-profile" aria-selected="false">중분류</a>
		  </div>
		</nav>
		<div class="tab-content" id="nav-tabContent">
		  <div class="tab-pane fade show active" id="nav-large" role="tabpanel" aria-labelledby="nav-large-tab">
			<table class="table">
				<colgroup>
				<col width="1%">
				<col width="5%">
				<col width="10%">
				<col width="10%">
				</colgroup>
				<tr>
		  		<td class="text-center"><input type="checkbox" id="largeChk" value="option1"></td>
		  		<td class="text-center">번호</td>
		  		<td class="text-center">대분류명</td>
		  		<td class="text-center">표시여부</td>
		  		</tr>
		  		
		  		
		  		<c:choose>
		  		<c:when test="${not empty largeList}">
				<c:forEach var="large" items="${largeList}">
					<tr>
						<td class="text-center"><input type="checkbox" value="${large.lc_num}" name="largeChks"></td>
						<td class="text-center">${large.lc_num}</td>
						<td class="text-center goDetail">${large.lc_name}</td>
						<td class="text-center">${large.lc_display}</td>
					</tr>
				</c:forEach>		  		
				</c:when>
				</c:choose>
			</table>
			<div class="text-right">
			<input type="button" class="btn btn-danger" id="lc_delete" value="삭제">		
			</div>
		
		  </div>
		  
		  
		  <div class="tab-pane fade" id="nav-mid" role="tabpanel" aria-labelledby="nav-mid-tab">
		  	<table class="table">
		  	<colgroup>
				<col width="1%">
				<col width="5%">
				<col width="10%">
				<col width="10%">
				</colgroup>
		  		<tr>
		  		<td class="text-center"><input type="checkbox" id="midChk"></td>
		  		<td class="text-center">번호</td>
		  		<td class="text-center">중분류명</td>
		  		<td class="text-center">표시여부</td>
		  		</tr>
		  		
		  		<c:if test="${not empty midList}">
				<c:forEach var="mid" items="${midList}">
					<tr>
						<td class="text-center"><input type="checkbox" value="${mid.mc_num}" name="midChks"></td>
						<td class="text-center">${mid.mc_num}</td>
						<td class="text-center goDetail" >${mid.mc_name}</td>
						<td class="text-center">${mid.mc_display}</td>
					</tr>
				</c:forEach>		  		
				</c:if>
		  	</table>
		  		<div class="text-right">
			<input type="button" class="btn btn-danger" id="mc_delete" value="삭제">		
			</div>
			
			<div class="text-center">
              <ul class="pagination" >
              <c:if test="${pageMaker.prev}">
              			<li class="paginate_button page-item previous" id="dataTable_previous">
              			<a href="${pageMaker.startPage -1 }" class="page-link" >
					<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">previous</font></font></a></li>
              </c:if>
              
              <c:forEach var ="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
              			
              			
       			<li  class="paginate_button active ${pageMaker.cvo.pageNum == num ? 'activce':''}">
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
	
	
	
	
	
	
	
	
	
	<div class="col-lg-5">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">분류정보</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                <nav>
		  <div class="nav nav-tabs" id="nav-tab" role="tablist">
		    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-largeAdd" role="tab" aria-controls="nav-home" aria-selected="true">대분류</a>
		    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-midAdd" role="tab" aria-controls="nav-profile" aria-selected="false">중분류</a>
		  </div>
		</nav>
		<div class="tab-content" id="nav-tabContent">
		  <div class="tab-pane fade show active" id="nav-largeAdd" role="tabpanel" aria-labelledby="nav-large-tab">
			<form id="lc_insertForm">
			<table class="table">
			<colgroup>
			<col width="1%">
			<col width="10%">
			</colgroup>
				<tr>
			  		<td>번호</td>
			  		<td><input type="text" class="form-control" id="lc_num" name="lc_num" readonly="readonly" value="${largeNum}"></td>
		  		</tr>
		  		<tr >
		  			<td style="border-top:none">분류명</td>
	  				<td style="border-top:none"><input type="text" class="form-control" id="lc_name" name="lc_name"></td>
		  		</tr>
		  		<tr>
		  			<td style="border-top:none">표시상태</td>
		  			<td style="border-top:none">
		  			<input type="radio"  name="lc_display" value="O" checked="checked">&nbsp;&nbsp;표시&nbsp;&nbsp;
		  			<input type="radio"  name="lc_display" value="X">&nbsp;&nbsp;표시안함&nbsp;&nbsp;
		  			</td>
		  		</tr>
		  		
		  		
			</table>
			<div class="text-center">
			<input type="button" class="btn btn-success" id="lc_insert"  value="추가">		
			<input type="button" class="btn btn-warning" id="lc_update"  value="수정" disabled="disabled">		
			</div>
			</form>
		  </div>
		  <div class="tab-pane fade" id="nav-midAdd" role="tabpanel" aria-labelledby="nav-mid-tab">
		  	<form id="page">
		  	    <input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}"> 
                <input type="hidden" name="amount" value="${pageMaker.cvo.amount}"> 
                <input type="hidden" name="cnt" id="cnt" value="${data.cnt }">
		  	</form>
		  	<form id="mc_insertForm" >
		  	<table class="table">
		  	<colgroup>
			<col width="1%">
			<col width="10%">
			</colgroup>
				<tr>
					<td colspan="2"><select class="form-control" id="large" name="lc_num">
					<option value=0>대분류</option>
					<c:if test="${not empty largeList}">
					<c:forEach var="large" items="${largeList}">
								<option  value="${large.lc_num}">${large.lc_name}</option>
					</c:forEach>
					</c:if>
					</select>
					</td>
				</tr>
		  		<tr>
			  		<td style="border-top:none">번호</td>
			  		<td style="border-top:none"><input type="text" class="form-control" id="mc_num" name="mc_num" readonly="readonly"></td>
		  		</tr>
		  		<tr >
		  			<td style="border-top:none">분류명</td>
	  				<td style="border-top:none"><input type="text"  class="form-control" id="mc_name" name="mc_name"></td>
		  		</tr>
		  		<tr>
		  			<td style="border-top:none">표시상태</td>
		  			<td style="border-top:none">
		  			<input type="radio"  name="mc_display" value="O" checked="checked">&nbsp;&nbsp;표시&nbsp;&nbsp;
		  			<input type="radio"  name="mc_display" value="X">&nbsp;&nbsp;표시안함&nbsp;&nbsp;</td>
		  		</tr>
		  	</table>
		  	
		  	<div class="text-center">
			<input type="button" class="btn btn-success" id="mc_insert"  value="추가">		
			<input type="button" class="btn btn-warning" id="mc_update"  value="수정" disabled="disabled">		
			</div>
		  	</form>
		  </div>
		</div>
                </div>
                </div>
	</div>
	</div>
</div>
</body>
</html>

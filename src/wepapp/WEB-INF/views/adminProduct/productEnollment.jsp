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
       
        <link rel="stylesheet" type="text/css" href="/resources/include/css/lightbox.css"/>
         <script type="text/javascript" src="/resources/include/js/lightbox.min.js"></script>
        <!-- 모바일 웹 페이지 설정 끝 -->
         
         <!--[if lt IE 9]>
         <script src="/resource/include/js/html5shiv.js"></script>
         <![endif]-->
       
       <script type="text/javascript">
       var sel_file;
       var mix_num;
       $(function(){
    	  
    	   $("#op_stock").blur(function(){
      		 var x=  Number($("#stock").val());
      		 var y=  Number($("#op_stock").val());
      		  if(Number($("#stock").val())<Number($("#op_stock").val())){
      			  alert("한글 영어 입력 또는 상품 재고보다 많이 입력할 수 없습니다.");
      			  $("#op_stock").val("");
      			  $("#op_stock").focus();
      		  } 
      	   });
    	   
    	   $("#file").on("change",handleImgFileSelect);
    	   
    	   $("#file2").on("change",handleImgFile2Select);
    	   
    	   $("#enrollmentBtn").click(function(){
    		   if(!selectChk("#lc_num","대분류를")) return;
    		   else if(!selectChk("#mc_num","중분류를")) return;
    	  	   else if(!chkData("#p_name","상품명을")) return;
    		   else if(!chkData("#p_price","가격을")) return ;
    		   else if(!chkData("#p_sale","할인율을")) return ;
    		   else if(!chkData("#p_stock","재고를")) return ;
    		   else if(!chkFile($("#file")))return;
    		   else if(!chkFile($("#file2")))return;
    		   else if(!chkData("#sales_unit","판매단위를")) return ;
    		   else if(!chkData("#p_weight","중량/용량을")) return ;
    		   else if(!chkData("#p_origin","원사지를")) return ;
    		   else if(!chkData("#p_announce","안내사항을")) return ;
    		   else{
    			   $("#p_insertForm").ajaxForm({
    				  url:"/adminProduct/productInsert",
    				  type:"post",
    				  enctype:"multipart/form-data",
    				  dataType:"text",
    				  error:function(){
    					  alert("시스템 오류입니다. 관리자에게 문의해주세요");
    				  },
    				  success:function(data){
    					  console.log(data);
    					  $("#op_p_num").val($("#p_num").val());
    		    		   $("#stock").val($("#p_stock").val());
    					  if(data="성공"){
    						  console.log($(".p_option").val());
    						  if($(".p_option:checked").val()=='O'){
    							  $("#optionModal").modal();
    						  }else{
    							  alert("상품입력이 완료되었습니다. 상품검색 탭으로 이동합니다.");
    							  location.href="/adminProduct/productList";
    						  }
    					  }
    					  
    				  }
    			   });
    			   $("#p_insertForm").submit();
    		   }
    	   })
    	   
    	   
    	   //상품 리스트 삭제
    	   $(document).on("click",".delBtn",function(){
    			   var op_num=$(this).parents("td").next().val();
    			   var op_stock=$(this).parents("td").prev().attr("data-stock");
    		   if(confirm("선택하신 옵션을 삭제하시겠습니까?")){
    			   var p_num=$("#p_num").val();
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
    						   listOption(p_num);
    						   
    					   }
    				   }
    				   
    				   
    			   })
    		   }
    	   });
    	   
    	   
    	   
    	   
    	   
    	   //초기화버튼 
    	   $("#reset").click(function(){
    		  $("#p_insertForm").each(function(){
    			 this.reset(); 
    		  });
    		  $("#test_img").attr("src","/resources/images/noimg.gif")
    		  $("#detailImg").attr("src","/resources/images/noimg.gif")
    	   });
    	   
    	   
    	   
    	   
    	   //상품 옵션 끄기
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
    		   var p_num=$("#p_num").val();
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
    	   
    	   
    	   
    	   
    	   $("#p_name").blur(function(){
    		   $("#test_name").html($("#p_name").val());
    	   })
    	   
    	   $("#p_price").blur(function(){
    		  $("#test_price").html($("#p_price").val()+"원"); 
    	   		
    		 var sale= $("#p_price").val()-($("#p_price").val()*($("#p_sale").val()/100));
    	   
    		 $("#sale").val(sale);
    		 $("#test_saleprice").html(sale+ "원 <span style='color:orange' id='test_sale'>"+ $("#p_sale").val()+"%</span>");
    		 
    	   });
    	   
    	   $("#p_sale").blur(function(){
    		   if($("#p_sale").val()<=100){
    		  $("#test_saleprice").html($("#p_sale").val()+"%"); 
    		  var sale= $("#p_price").val()-($("#p_price").val()*($("#p_sale").val()/100));
       	   
     		 $("#sale").val(sale);
     		 $("#test_saleprice").html(sale+"원 <span style='color:orange' id='test_sale'>"+ $("#p_sale").val()+"%</span>");
    		   }else{
    			   alert("할인율은 100이하로 적어주셔야됩니다.");
    			   $("#p_sale").focus();
    			   $("#p_sale").val("");
    		   }
    	   });
    	   

    	   $("#sales_unit").blur(function(){
    		  $("#test_sales_unit").html($("#sales_unit").val());
    		   
    	   });
    	   
    	   
    	   $("#p_weight").blur(function(){
    		  $("#test_weight").html($("#p_weight").val());
    		   
    	   });
    	   $("#p_origin").blur(function(){
     		  $("#test_origin").html($("#p_origin").val());
     		   
     	   });
    	   $("#p_announce").blur(function(){
     		  $("#test_announce").html($("#p_announce").val());
     		   
     	   });
    	   
    	   
    	   
    	   
    	   
    	//대분류 변경시 중분류 뿌리기   
       $("#lc_num").change(function(){
   		$("#mc_num").html("<option value=0>중분류</option>");
   		$("#p_num").val("");
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
   		
   		
   		//중분류 변경시 번호 조합하기
   		$("#mc_num").change(function(){
   			
   			var num=$(this).val();
   			$.ajax({
   				url:"/adminProduct/mix/"+num,
   				type:"post",
   				dataType:"text",
   				error:function(){
   					alert("시스템 오류입니다. 다시 선택해주세요.");
   				},
   			success:function(data){
   				mix_num=$("#mc_num").val()+data;
   				$("#p_num").val(mix_num);
   			}
   			});
   			});
   		});
   		
   		//미리보기 함수
       function handleImgFileSelect(e){
    	   var files= e.target.files;
    	   var filesArr = Array.prototype.slice.call(files);
    	   
    	   filesArr.forEach(function(f){
    		   if(!f.type.match("image.*")){
    			   alert("확장자는 이미지 확장자만 가능합니다.");
    		 	return;
    		   }
    		   sel_file =f;
    		   
    		   var reader = new FileReader();
    		   reader.onload=function(e){
    			   $("#test_img").attr("src",e.target.result);
    		   }
    		   reader.readAsDataURL(f);
    	   });
       }
   		
   		function handleImgFile2Select(e){
   			var files= e.target.files;
     	   var filesArr = Array.prototype.slice.call(files);
     	   
     	   filesArr.forEach(function(f){
     		   if(!f.type.match("image.*")){
     			   alert("확장자는 이미지 확장자만 가능합니다.");
     		 	return;
     		   }
     		   sel_file =f;
     		   
     		   var reader = new FileReader();
     		   reader.onload=function(e){
     			   $("#detailImg").attr("src",e.target.result);
     		   }
     		   reader.readAsDataURL(f);
     	   });
   		}
       
       
       function addMid(mc_num,mc_name){
       	var mid_option=$("<option>");
       	mid_option.val(mc_num);
       	mid_option.html(mc_name);
       	
       	$("#mc_num").append(mid_option);
       }
		function addOption(){
		}
		
		function listOption(p_num){
			$("#optionList").html("");
			var url="/adminProduct/list/"+p_num+".json";
			
			$.getJSON(url,function(data){
				console.log("list count:"+data.length);
			$(data).each(function(){
				var op_num=this.op_num;
				var op_name=this.op_name;
				var op_price=this.op_price;
				var op_stock=this.op_stock;
				addOption(op_num,op_name,op_price,op_stock);
			});
			}).fail(function(){
				alert("리스트 목록을 불러오는데 실패하였습니다. 잠시후 다시 시도해주세요");
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
</head>
<body>
	<div class="container-fluid">
			<h5 class="text-left m-0 font-weight-bold text-primary">상품관리</h5>
			<hr class="sidebar-divider">
			<div class="row">

            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">상품등록</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                <form class="form-inline" id="p_insertForm">
				  <table class="table table-hover" >
				  <colgroup>
				  </colgroup>
				  	<tr>
				  		<td><h6 class="m-0 font-weight-bold text-default" >상품분류</h6></td>
						<td >
						<select class="form-control" id="lc_num" name="lc_num">
							<option value=0>대분류</option>
							<c:forEach var="large" items="${largeList}">
								<option value="${large.lc_num}">${large.lc_name}</option>
							</c:forEach>
				  		</select>
				  		<select class="form-control" id="mc_num" name="mc_num">
							<option value=0>중분류</option>
				  		</select>
				  		<input type="text" id="p_num" name="p_num" readonly="readonly" placeholder="상품번호">
				  		</td>
				  		<td><h6 class="m-0 font-weight-bold text-default"  >상품명</h6></td>
				  		
				  		<td >
				  		<input type="text" class="form-control" id="p_name" name="p_name">
				  		</td>
				  	</tr>
				  	
				  	
				  	<tr>
				  	<td><h6 class="m-0 font-weight-bold text-default" >판매가</h6></td>
					<td ><input type="text" class="form-control" id="p_price" name="p_price" placeholder=0> 원
					<td><h6 class="m-0 font-weight-bold text-default" >할인율</h6></td> 
					<td ><input type="text" class="form-control" id="p_sale" name="p_sale" placeholder=0> %
				  	</tr>
				  	<tr>
				  	<td><h6 class="m-0 font-weight-bold text-default" >실제판매가</h6></td>
					<td ><input type="text" class="form-control" id="sale" readonly="readonly" placeholder=0> 원
					<td><h6 class="m-0 font-weight-bold text-default" >재고</h6></td> 
					<td ><input type="text" class="form-control" id="p_stock" name="p_stock" placeholder=0> 개
				  	</tr>
				  	<tr>
				  	<td><h6 class="m-0 font-weight-bold text-default" >상품 이미지</h6></td>
					<td><input type="file"  id="file" name="file">
					<td><h6 class="m-0 font-weight-bold text-default"  >상세 이미지</h6></td>
					<td><input type="file"  id="file2" name="file2">
				  	</tr>
				  	<tr>
				  	<td><h6 class="m-0 font-weight-bold text-default" >판매 단위</h6></td>
					<td ><input type="text" class="form-control" id="sales_unit" name="sales_unit">
					<td><h6 class="m-0 font-weight-bold text-default"  >중량/용량</h6></td>
					<td ><input type="text" class="form-control" id="p_weight" name="p_weight">
				  	</tr>
				  	<tr>
				  	<td><h6 class="m-0 font-weight-bold text-default" >원산지</h6></td>
					<td ><input type="text" class="form-control" id="p_origin" name="p_origin">
					<td><h6 class="m-0 font-weight-bold text-default" >안내사항</h6></td>
					<td ><input type="text" class="form-control" id="p_announce" name="p_announce">
				  	</tr>
				  	<tr>
				  	
				  	<td><h6 class="m-0 font-weight-bold text-default" >표시여부</h6></td>
					<td ><input type="radio" name="p_display" value="O" checked="checked"> 표시 함 
					<input type="radio" name="p_display"  value="X"> 표시 안함
					<td><h6 class="m-0 font-weight-bold text-default" >옵션여부</h6></td>
					<td ><input type="radio" class="p_option" name="p_option" value="O" checked="checked"> 옵션 추가
					<input type="radio"  class="p_option" name="p_option"  value="X"> 옵션 없음
				  	</tr>
				  	
				  </table>
				  </form>
				  </div>
				 </div>
			 </div>

            <div class="col-lg-12">
              <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">미리보기</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
				  <table class="table" >
				  <colgroup>
				  	<col width="33%">
				  </colgroup>
				  	<tr >
				  	<td  rowspan="15" >
				  	<img width="400" height="470" id="test_img" src='/resources/images/noimg.gif'>
				  	</td>
				  	<td colspan="2" height="20px"><h4 class="m-0 font-weight-bold text-default text-left " id="test_name" ></h4></td>
				  	</tr>
				  	<tr>
				  	<td colspan="2" height="20px" style="border-top:none;">회원할인가</td>
				  	</tr>
				  	<tr>
				  		<td colspan="2" height="20px" style="border-top:none;"><h4 class="m-0 font-weight-bold text-default" id="test_saleprice">원<span style="color:orange" id="test_sale"> 20%</span></h4> </td>
				  	</tr>
				  	<tr>
				  		<td colspan="2" height="20px"  style="border-top:none;"><h6 style="text-decoration:line-through" id="test_price" >원</h6>

				  	</tr>
				  	<tr>
				  		<td height="20px"  width="200px"><h6>판매단위</h6></td>
				  		<td><h6 id="test_sales_unit">1</h6></td>
				  	</tr>
				  	<tr>
				  		<td width="200px" style="border-top:none;"><h6>중량/용량</h6></td>
				  		<td style="border-top:none;"><h6 id="test_weight"></h6></td>
				  	</tr>
				  	<tr>
				  		<td width="200px"><h6>배송구분</h6></td>
				  		<td ><h6>택배배송</h6></td>
				  	</tr>
				  	<tr>
				  		<td width="200px"><h6>원산지</h6></td>
				  		<td ><h6 id="test_origin"></h6></td>
				  	</tr>
				  	<tr>
				  		<td width="200px"><h6>안내사항</h6></td>
				  		<td ><h6 id="test_announce"></h6></td>
				  	</tr>
				  </table>
				  
				  <div class="container-fluid text-center">
					<details>
   					 <summary>상세 이미지</summary>
   					 <img id="detailImg" src="/resources/images/noimg.gif" >
					</details>
				  </div>
				  </div>
				 </div>
			 </div>
			 </div>
			  <div class="container text-center">
			 <button type="button" id="enrollmentBtn" class="btn btn-primary btn-lg">등록</button>
			 <button type="button" id="reset" class="btn btn-primary btn-lg">초기화</button>
			 
			 </div>
			
			 <br>
			<div class="modal fade" id="optionModal" tabindex="-1" role="dialog" aria-labelledby="replyModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
			  <div class="modal-dialog">
		    	<div class="modal-content">
		     	 <div class="modal-header">
		        <h4 class="modal-title" id="replyModalLabel">옵션 등록</h4>
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
</div>	 
</body>
</html>

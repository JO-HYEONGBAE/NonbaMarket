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
         $(function(){
        	
        	 $("#productListBtn").click(function(){
        		 location.href="/adminProduct/productList";
        	 });
        	 
         });
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
                  <h6 class="m-0 font-weight-bold text-primary">상품현황</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
				  <table class="table table-striped" >
				  <colgroup>
					<col width="30%">
					<col width="30%">
					<col width="33%">
				</colgroup>
				
					<tr class="text-center">
					<td>
					<td>
					<td>
					</tr>
					<tr class="text-center" height="50">
						<td><h5 class="m-0 font-weight-bold text-primary">전체 등록 상품</h5></td>
						<td><h5 class="m-0 font-weight-bold text-success">판매중 상품</h5></td>
						<td><h5 class="m-0 font-weight-bold text-danger">품절 상품</h5></td>
						
					</tr>
					
					<tr class="text-center" height="150">
						<td style="padding:7%;"><h3 class="m-0 font-weight-bold text-primary">${status.total }건</h3></td>
						<td style="padding:7%;"><h3 class="m-0 font-weight-bold text-success">${status.sell }건</h3></td>
						<td style="padding:7%;"><h3 class="m-0 font-weight-bold text-danger">${status.stock }건</h3></td>
					</tr>
				</table>
				
                </div>
                
              </div>
            </div>
            </div>
            <button type="button" id="productListBtn" class="btn btn-primary btn-lg btn-block">상품 목록</button>
            

		</div>
</body>
</html>

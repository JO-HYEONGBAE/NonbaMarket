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
         <script type="text/javascript" src="/resources/include/js/jquery-3.3.1.min.js"></script>
         <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">



         
         <script type="text/javascript">
         	$(function(){
         		$("#errorAlert").on('closed.bs.alert',function(){
         			location.href="/adminLogin/logout";
         		});
         		$("#main").click(function(){
         			location.href="/adminLogin/logout";
         		});
         	});
         
         </script>
       
</head>
<body>
	<div class="alert alert-warning alert-dismissible fade in" role="alert" id="errorAlert">
      <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
   	<h4>잘못된 URL을 요청하였습니다.</h4>
	<p>해당 URL은 존재하지 않습니다. 잠시 후 다시 접근해 주세요.~~</p>	
	<p>
	<button type="button" class="btn alert-warning" id="main">홈으로</button>
	</p>
	
</div>


</body>
</html>

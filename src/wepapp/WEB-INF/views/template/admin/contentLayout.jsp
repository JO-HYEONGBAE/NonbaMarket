<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
   <head>
   	<title><tiles:getAsString name="title"/></title>
   	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
         <!-- html4 : 파일의 인코딩 방식 지정 -->
         <!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->

         <!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정.-->
      
         <!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
         
         <!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
         <link rel="shortcut icon" href="/resources/images/icon.png" />
         <link rel="apple-touch-icon" href="/resources/images/icon.png"/>
         <link href="/resources/include/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  		<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
		
  		<!-- Custom styles for this template-->
  		<link href="/resources/include/css/sb-admin-2.min.css" rel="stylesheet">
         <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
          
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	 
         
         
</head>
<body id="page-top">
	<div id="wrapper">
	
		<tiles:insertAttribute name="aside"/>
	
	  <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
			<tiles:insertAttribute name="header"/>
	</nav>
			<tiles:insertAttribute name="body"/>
	</div>
	<footer class="sticky-footer bg-white">
		<tiles:insertAttribute name="footer"/>
	</footer>
	
	</div>
	
	
	
	</div>
		<!-- Bootstrap core JavaScript-->
		  <script src="/resources/include/vendor/jquery/jquery.min.js"></script>
		  <script src="/resources/include/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
		  <!-- Core plugin JavaScript-->
		  <script src="/resources/include/vendor/jquery-easing/jquery.easing.min.js"></script>
		
		  <!-- Custom scripts for all pages-->
		  <script src="/resources/include/js/sb-admin-2.min.js"></script>
		  <script src="/resources/include/vendor/chart.js/Chart.min.js"></script>
       	
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
   <script  src="/resources/include/js/jquery.form.min.js" type="text/javascript"></script>

   
</body>
</html>

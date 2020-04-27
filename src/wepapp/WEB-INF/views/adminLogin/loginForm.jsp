<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
   	<title>로그인</title>
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
        <link href="/resources/include/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
 		 <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  		<!-- Custom styles for this template-->
  		<link href="/resources/include/css/sb-admin-2.min.css" rel="stylesheet">
        <!-- 모바일 웹 페이지 설정 끝 -->
         
         <!--[if lt IE 9]>
         <script src="/resource/include/js/html5shiv.js"></script>
         <![endif]-->
         <script type="text/javascript" src="/resources/include/js/jquery-3.3.1.min.js"></script>
         <script type="text/javascript">
          $(function(){
        	 $("#loginBtn").click(function(){
        		 $.ajax({
        			url:"/adminLogin/adminCheck",
        			type:"post",
        			data:$("#loginForm").serialize(),
        			dataType:"text",
        			error:function(){
        				alert("시스템에 문제가 생겼습니다. 잠시 후 다시 시도해주세요");
        			},
        			 success:function(result){
        			 
        				 if(result=="SUCCESS"){
        					 alert("로그인에 성공하셨습니다.");
        					 location.href="/adminLogin/adminMain";
        				 }
        				 else{
        					 alert("로그인에 실패하였습니다.");
        					 
        					 $("#loginForm").each(function(){
        						this.reset(); 
        					 });
        				 }
        				 
        				 
        			 
        		 }
        		 
        		 
        	 });
          });
          });
         
         
         </script>
</head>
<body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">관리자 로그인</h1>
                  </div>
                  <form id="loginForm" class="user">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-user" id="a_id" name="a_id" aria-describedby="emailHelp" placeholder="아이디">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="a_pwd" name="a_pwd" placeholder="비밀번호">
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">아이디 기억하기</label>
                      </div>
                    </div>
                    <a href="#" id="loginBtn" class="btn btn-primary btn-user btn-block">
                      로그인
                    </a>
                    <hr>
                    <a href="#" class="btn btn-google btn-user btn-block">
                      <i class="fab fa-google fa-fw"></i> 구글로 로그인
                    </a>
                    <a href="#" class="btn btn-facebook btn-user btn-block">
                      <i class="fab fa-facebook-f fa-fw"></i> 페이스 북으로 로그인
                    </a>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="/adminLogin/findInfo">비밀번호를 잊어버리셨습니까?</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="/resources/include/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/include/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/resources/include/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/resources/include/js/sb-admin-2.min.js"></script>

</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/adminLogin/adminMain">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">관리자</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="/adminLogin/adminMain">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>메인</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>상품관리</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">상품 정보</h6>
            <a class="collapse-item" href="/adminProduct/productStatus">상품 현황</a>
            <a class="collapse-item" href="/adminProduct/productList">상품 목록</a>
            <a class="collapse-item" href="/adminProduct/productEnrollment">상품 등록</a>
            <a class="collapse-item" href="/adminProduct/productCategoryEno">상품 분류관리</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>주문관리</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">주문 정보</h6>
            <a class="collapse-item" href="/adminOrders/ordersList">전체 주문 목록</a>
            <a class="collapse-item" href="/adminOrders/deliveryList">배송 관리</a>
            <a class="collapse-item" href="/adminOrders/helpList">취소/환불/반품</a>
          </div>
        </div>
        
      </li>
      
      
		<li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          <i class="fas fa-fw fa-table"></i>
          <span>고객 관리</span>
          </a>
          <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">고객 정보</h6>
            <a class="collapse-item" href="/adminMember/memberList">고객 관리</a>
            <a class="collapse-item" href="#">쿠폰 등록</a>
          </div>
        </div>
      </li>
		

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>게시판 관리</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">게시판</h6>
            <a class="collapse-item" href="#">공지사항</a>
            <a class="collapse-item" href="#">1대1 문의 게시판</a>
            <a class="collapse-item" href="#">상품문의 게시판</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTotal" aria-expanded="true" aria-controls="collapseTotal">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>통계 분석</span></a>
          <div id="collapseTotal" class="collapse" aria-labelledby="headingTotal" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">통계</h6>
            <a class="collapse-item" href="/adminDetail/adminDaysDetail">매출 분석</a>
            <a class="collapse-item" href="/adminDetail/adminProductDetail">상품 분석</a>
          </div>
        </div>
      </li>


      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block"/>

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>

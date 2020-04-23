package com.spring.admin.login.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.admin.login.service.AdminLoginService;
import com.spring.admin.login.vo.AdminLoginVO;
import com.spring.admin.order.service.AdminOrdersService;
import com.spring.admin.order.vo.AdminOrdersVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/adminLogin/*")
@Log4j
@AllArgsConstructor
public class AdminLoginController {
	
	private AdminLoginService adminLoginService;
	
	private AdminOrdersService adminOrderService;
	
	@GetMapping(value="/loginForm")
	public String loginForm() {
		log.info("loginForm 호출 완료");
		
		return "adminLogin/loginForm";
	}
	
	@GetMapping(value="/findInfo")
	public String findInfo() {
		log.info("loginInfo 호출 완료");
		
		
		return "adminLogin/findInfo";
	}
	
	
	@ResponseBody
	@PostMapping(value="/adminCheck",produces = {MediaType.TEXT_PLAIN_VALUE})
	public String adminCheck(AdminLoginVO avo,HttpServletRequest request){
		int result=0;
		String value="";
		 result=adminLoginService.adminCheck(avo);
		
		 log.info(result);
		 if(result==1) {
			 value="SUCCESS";
			 AdminLoginVO info = adminLoginService.adminInfo(avo);
			 
			 HttpSession session = request.getSession(); 
			 
			session.setAttribute("adminInfo", info);
			}
		 else {
			 value="false";
		 }
		 return value;
	}
	
	@RequestMapping("/adminMain")
	public String adminMain(Model model) {
		log.info("adminMain 호출 완료");
		
		Date date = new Date();
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy년MM월dd일");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy");
		
		String year =sdf2.format(date);
		
		AdminOrdersVO avo = adminOrderService.orderMonth(year);
		
		//한달 매출 그래프 속성
		model.addAttribute("month",avo);
		log.info(avo);
		
		//메인 날짜 표시
		model.addAttribute("time", sdf.format(date));
		
		
		List<AdminOrdersVO> list = adminOrderService.orderSales();
		
		//5일치 주문 결제 환불 건수 확인
		model.addAttribute("list",list);
		
		
		//오늘의 할일 리스트
		AdminOrdersVO avoTotal = adminOrderService.orderTotal();
		
		model.addAttribute("total",avoTotal);
		
		
		
		
		return "adminMain/adminMain";
	}
	
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("adminInfo");
		
		
		return "adminLogin/loginForm";
	}
}

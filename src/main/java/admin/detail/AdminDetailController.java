package com.spring.admin.detail.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.admin.order.service.AdminOrdersService;
import com.spring.admin.order.vo.AdminOrdersVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/adminDetail/*")
@AllArgsConstructor
@Log4j
public class AdminDetailController {

	
	
	
	
	private AdminOrdersService adminOrderService;
	
	
	
	
	@RequestMapping(value="/adminDaysDetail")
	public String adminDayDetail(Model model) {
		
		AdminOrdersVO avo = adminOrderService.dayList();
		
		
		log.info(avo);
		List<AdminOrdersVO> list = adminOrderService.daycheckList();
		
		
		model.addAttribute("list",list);
		model.addAttribute("dayList",avo);
		
		return "adminDetail/adminDaysDetail";
	}
	
	@RequestMapping(value="/adminWeeksDetail")
	public String adminWeekDetail(Model model) {
		
		
		AdminOrdersVO avo = adminOrderService.weekList();
		List<AdminOrdersVO> list = adminOrderService.weekcheckList();
		
		model.addAttribute("list",list);
		model.addAttribute("weekList",avo);
		
		return "adminDetail/adminWeeksDetail";
	}
	
	@RequestMapping(value="/adminMonthsDetail")
	public String adminMonthsDetail(Model model) {
		
	Date date = new Date();
	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy");
	
	String year =sdf2.format(date);	
	
	AdminOrdersVO avo = adminOrderService.orderMonth(year);
	
	List<AdminOrdersVO> list = adminOrderService.monthcheckList();
	
		//한달 매출 그래프 속성
		model.addAttribute("month",avo);
		
		model.addAttribute("list",list);
		
		return "adminDetail/adminMonthsDetail";
	}
	
	@RequestMapping(value="/adminProductDetail")
	public String adminProductDetail(@ModelAttribute("data")AdminOrdersVO avo ,Model model) {
		
		
		List<AdminOrdersVO> cntrank= adminOrderService.rankcntProudct(avo);
		
		List<AdminOrdersVO> sumrank= adminOrderService.ranksumProudct(avo);
		
		model.addAttribute("cntrank",cntrank);

		model.addAttribute("sumrank",sumrank);
		
		
		return"adminDetail/adminProductDetail";
	}
	
}

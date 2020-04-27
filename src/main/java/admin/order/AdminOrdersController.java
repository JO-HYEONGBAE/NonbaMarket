package com.spring.admin.order.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.admin.common.vo.PageDTO;
import com.spring.admin.order.service.AdminOrdersService;
import com.spring.admin.order.vo.AdminOrdersVO;
import com.spring.common.excel.ListExcelView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/adminOrders/*")
@AllArgsConstructor
@Log4j
public class AdminOrdersController {

	private AdminOrdersService adminOrdersService;
	

	@RequestMapping(value="/ordersList")
	public String ordersList(@ModelAttribute("data")AdminOrdersVO avo,Model model) {
		log.info(avo);
		List<AdminOrdersVO> list = adminOrdersService.ordersList(avo);
		
		int count =adminOrdersService.countOrdersList(avo);
		
		model.addAttribute("list",list);
		
		model.addAttribute("count",count);
		
		model.addAttribute("pageMaker",new PageDTO(avo,count));
		return "adminOrders/ordersList";
	}
	
	@PatchMapping(value="/{o_num}" ,consumes = "application/json",produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> invoiceInsert(@PathVariable("o_num") Integer o_num, @RequestBody AdminOrdersVO avo){
		
		log.info("invoiceInsert 호출 성공");
		avo.setO_num(o_num);
		
		log.info(avo);
		int result= adminOrdersService.invoiceInsert(avo);
		
		
		return result==1 ? new ResponseEntity<String>("SUCCESS",HttpStatus.OK):
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
				
	}
	
	
	@RequestMapping(value="/deliverUpdate", method = {RequestMethod.PUT,RequestMethod.PATCH},consumes = "application/json",produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deliverUpdate(@RequestBody AdminOrdersVO avo){
		
		log.info("deliverUpdate 호출 성공");
		
		
		log.info(avo);
		int result = adminOrdersService.deliverUpdate(avo);
		
		return result ==1 ? new ResponseEntity<String>("SUCCESS",HttpStatus.OK):
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@ResponseBody
	@RequestMapping(value ="/ordersExcel",method=RequestMethod.GET)
	public ModelAndView ordersExcel(@ModelAttribute AdminOrdersVO avo) {
		
		List<AdminOrdersVO> ordersList= adminOrdersService.ordersExcel(avo);
		
		
		ModelAndView mv = new ModelAndView(new ListExcelView());
		
		mv.addObject("list",ordersList);
		mv.addObject("template","orders.xlsx");
		mv.addObject("file_name","orders");
		
		return mv;
	}
	
	
	@RequestMapping(value="/deliveryList")
	public String deliveryList(@ModelAttribute("data")AdminOrdersVO avo,Model model) {
		
		AdminOrdersVO state = adminOrdersService.ordersState();
		
		List<AdminOrdersVO> list = adminOrdersService.deliveryList(avo);
		
		int count = adminOrdersService.deliveryCountList(avo);
		
		model.addAttribute("list",list);
		
		model.addAttribute("state",state); 
		
		model.addAttribute("count",count);
		
		model.addAttribute("pageMaker",new PageDTO(avo,count));
		
		return "adminOrders/deliveryList";
	}
	
	@ResponseBody
	@RequestMapping(value="/deliveryExcel",method=RequestMethod.GET)
	public ModelAndView deliveryExcel(AdminOrdersVO avo) {
		
		
		List<AdminOrdersVO> deliveryList = adminOrdersService.deliveryExcel(avo);
		
		ModelAndView mv =new ModelAndView(new ListExcelView());
		mv.addObject("list",deliveryList);
		mv.addObject("template","orders.xlsx");
		mv.addObject("file_name","delivery");
		
		return mv;
	}
	
	
	@RequestMapping(value="/helpList")
	public String helpList(@ModelAttribute("data")AdminOrdersVO avo,Model model) {
		
		AdminOrdersVO state=adminOrdersService.helpState();
		
		List<AdminOrdersVO> list = adminOrdersService.helpList(avo);
		
		int count = adminOrdersService.helpCountList(avo);
		
		model.addAttribute("state", state);
		
		model.addAttribute("count",count);
		
		model.addAttribute("list",list); 
		
		model.addAttribute("pageMaker",new PageDTO(avo,count));
		
		return "adminOrders/helpList";
	}
	
	@ResponseBody
	@RequestMapping(value="/helpExcel")
	public ModelAndView helpExcel(AdminOrdersVO avo) {
		
		List<AdminOrdersVO> helpList =adminOrdersService.helpExcel(avo);
		
		ModelAndView mv = new ModelAndView(new ListExcelView());
		mv.addObject("list",helpList);
		mv.addObject("template","orders.xlsx");
		mv.addObject("file_name","help");
		
		return mv;
	}
}

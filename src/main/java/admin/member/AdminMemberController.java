package com.spring.admin.member.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.admin.common.vo.PageDTO;
import com.spring.admin.member.service.AdminMemberService;
import com.spring.admin.member.vo.AdminMemberVO;
import com.spring.common.excel.ListExcelView;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value="/adminMember/*")
public class AdminMemberController {

	
	private AdminMemberService adminMemberService;
	
	@RequestMapping(value="/memberList")
	public String memberList(@ModelAttribute("data") AdminMemberVO avo,Model model) {
		
		List<AdminMemberVO> list = adminMemberService.memberList(avo);
		
		int count= adminMemberService.countMemberList(avo);
		
		model.addAttribute("list",list);
		
		model.addAttribute("count",count);
		
		model.addAttribute("pageMaker",new PageDTO(avo,count));
		
		return "adminMember/memberList";
	}
	
	@ResponseBody
	@RequestMapping(value="/memberExcel",method=RequestMethod.GET)
	public ModelAndView memberExcel(@ModelAttribute AdminMemberVO avo) {
		
		List<AdminMemberVO> memberList=adminMemberService.memberExcel(avo);
		
		
		
		ModelAndView mv = new ModelAndView(new ListExcelView());
		mv.addObject("list",memberList);
		mv.addObject("template","member.xlsx");
		mv.addObject("file_name","member");
		
		return mv;
	}
	
}

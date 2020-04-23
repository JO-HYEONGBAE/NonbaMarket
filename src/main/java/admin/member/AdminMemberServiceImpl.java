package com.spring.admin.member.service;

import java.util.List;

import com.spring.admin.member.vo.AdminMemberVO;

public interface AdminMemberService {

	
	public List<AdminMemberVO> memberList(AdminMemberVO avo);
	
	public int countMemberList(AdminMemberVO avo);
	
	public List<AdminMemberVO> memberExcel(AdminMemberVO avo);
}


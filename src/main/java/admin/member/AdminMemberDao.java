package com.spring.admin.member.dao;

import java.util.List;

import com.spring.admin.member.vo.AdminMemberVO;

public interface AdminMemberDao {
	
	public List<AdminMemberVO> memberList(AdminMemberVO avo);
	
	public int countMemberList(AdminMemberVO avo);
	
	public List<AdminMemberVO> memberExcel(AdminMemberVO avo);

}

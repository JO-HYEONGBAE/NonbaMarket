package com.spring.admin.login.dao;

import com.spring.admin.login.vo.AdminLoginVO;

public interface AdminLoginDao {

	
	public int adminCheck(AdminLoginVO avo);
	
	public AdminLoginVO adminInfo(AdminLoginVO avo);
}

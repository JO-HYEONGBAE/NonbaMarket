package com.spring.admin.login.service;

import com.spring.admin.login.vo.AdminLoginVO;

public interface AdminLoginService {

	public int adminCheck(AdminLoginVO avo);
	
	public AdminLoginVO adminInfo(AdminLoginVO avo);
}

package com.spring.admin.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.login.dao.AdminLoginDao;
import com.spring.admin.login.vo.AdminLoginVO;

import lombok.Setter;


@Service
public class AdminLoginServiceImpl implements AdminLoginService{

	@Setter(onMethod_ =@Autowired)
	private AdminLoginDao adminLoginDao;

	@Override
	public int adminCheck(AdminLoginVO avo) {
		int result =adminLoginDao.adminCheck(avo);
		return result;
	}
	
	public AdminLoginVO adminInfo(AdminLoginVO avo) {
		
		AdminLoginVO vo =adminLoginDao.adminInfo(avo);
		
		return vo;
	}
}

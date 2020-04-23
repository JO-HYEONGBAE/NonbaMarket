package com.spring.admin.detail.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.admin.detail.dao.AdminDetailDao;
import com.spring.admin.detail.vo.AdminDetailVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminDetailServiceImpl implements AdminDetailService {

	private AdminDetailDao adminDetailDao;

	@Override
	public List<AdminDetailVO> detailList(AdminDetailVO avo) {
		
		List<AdminDetailVO> list = adminDetailDao.detailList(avo);
		
		return list;
	}
	
	
}

package com.spring.admin.large_category.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.admin.large_category.dao.AdminLarge_CategoryDao;
import com.spring.admin.large_category.vo.AdminLarge_CategoryVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminLarge_CategoryServiceImpl implements AdminLarge_CategoryService {

	
	private AdminLarge_CategoryDao adminLarge_CategoryDao;
	
	public List<AdminLarge_CategoryVO> largeList(){
		
		List<AdminLarge_CategoryVO> list = adminLarge_CategoryDao.largeList();
		
		return list;
	}
	
	public int largeNum() {
		int result = adminLarge_CategoryDao.largeNum();
		
		return result;
	}
	
	public int largeInsert(AdminLarge_CategoryVO avo) {
		int result = adminLarge_CategoryDao.largeInsert(avo);
		
		return result;
	}

	@Override
	public int deleteLargeCategory(List<Integer> lc_num) {
		int result=adminLarge_CategoryDao.deleteLargeCategory(lc_num);
		
		return result;
	}

	@Override
	public int updateLargeCategory(AdminLarge_CategoryVO avo) {
		int result = adminLarge_CategoryDao.updateLargeCategory(avo);
		
		return result;
	}
}

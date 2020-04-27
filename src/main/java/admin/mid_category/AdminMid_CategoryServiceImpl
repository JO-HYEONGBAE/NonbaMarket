package com.spring.admin.mid_category.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.admin.mid_category.dao.AdminMid_CategoryDao;
import com.spring.admin.mid_category.vo.AdminMid_CategoryVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminMid_CategoryServiceImpl implements AdminMid_CategoryService {

	
	private AdminMid_CategoryDao adminMid_CategoryDao;
	
	public List<AdminMid_CategoryVO> midList(Integer lc_num){
		
		List<AdminMid_CategoryVO> list = adminMid_CategoryDao.midList(lc_num);
		
		return list;
	}

	@Override
	public List<AdminMid_CategoryVO> midAllList(AdminMid_CategoryVO avo) {
		
		List<AdminMid_CategoryVO> list = adminMid_CategoryDao.midAllList(avo);
		
		return list;

	}

	@Override
	public int midNum(Integer lc_num) {
		int result= adminMid_CategoryDao.midNum(lc_num);
		
		return result;
	}

	@Override
	public int midInsert(AdminMid_CategoryVO avo) {
		
		int result =adminMid_CategoryDao.midInsert(avo);
		
		return result;
	}
	
	public int deleteMidCategory(List<Integer> lc_num) {
		int result =adminMid_CategoryDao.deleteMidCategory(lc_num);
		
		return result;
	}

	@Override
	public List<Integer> searchMc_num(List<Integer> lc_num) {
		
		List<Integer> mc_num =adminMid_CategoryDao.searchMc_num(lc_num);
		return mc_num;
	}

	@Override
	public int updateMidCategory(AdminMid_CategoryVO avo) {

		int result= adminMid_CategoryDao.updateMidCategory(avo);
		return result;
	}
	
	public int midCountList() {
		
		return adminMid_CategoryDao.midCountList();
	}
}

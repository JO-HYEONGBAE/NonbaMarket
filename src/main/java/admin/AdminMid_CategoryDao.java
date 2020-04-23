package com.spring.admin.mid_category.dao;

import java.util.List;

import com.spring.admin.mid_category.vo.AdminMid_CategoryVO;

public interface AdminMid_CategoryDao {

	public List<AdminMid_CategoryVO> midList(Integer lc_num);
	
	public List<AdminMid_CategoryVO> midAllList(AdminMid_CategoryVO avo);

	public int midNum(Integer lc_num);
	
	public int midInsert(AdminMid_CategoryVO avo);
	
	public int deleteMidCategory(List<Integer> lc_num);
	
	public List<Integer> searchMc_num(List<Integer> lc_num);
	
	public int updateMidCategory(AdminMid_CategoryVO avo);
	
	
	public int midCountList();
}


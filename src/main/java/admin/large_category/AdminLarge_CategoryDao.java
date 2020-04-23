package com.spring.admin.large_category.dao;

import java.util.List;

import com.spring.admin.large_category.vo.AdminLarge_CategoryVO;

public interface AdminLarge_CategoryDao {

	public List<AdminLarge_CategoryVO> largeList();
	
	public int largeNum();
	
	public int largeInsert(AdminLarge_CategoryVO avo);
	
	public int deleteLargeCategory(List<Integer> lc_num);
	
	public int updateLargeCategory(AdminLarge_CategoryVO avo);
}

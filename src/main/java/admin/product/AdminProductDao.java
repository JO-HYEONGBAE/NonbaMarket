package com.spring.admin.product.dao;

import java.util.List;

import com.spring.admin.product.vo.AdminProductVO;

public interface AdminProductDao {

	public AdminProductVO productStatus();
	
	public List<AdminProductVO> productList(AdminProductVO avo);
	
	public List<AdminProductVO> productExcel(AdminProductVO avo);
	
	public List<AdminProductVO > lowList(Integer mc_num);
	
	public int productInsert(AdminProductVO avo);
	
	public String productMix(Integer mc_num);
	
	public int countProductList(AdminProductVO avo);
	
	public int deleteProduct(List<Long> p_num);
	
	public List<Long> searchP_num(List<Integer> lc_num);
}

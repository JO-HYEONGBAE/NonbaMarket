package com.spring.admin.order.dao;

import java.util.List;

import com.spring.admin.order.vo.AdminOrdersVO;

public interface AdminOrdersDao {
	
	
	public AdminOrdersVO orderTotal();
	
	public List<AdminOrdersVO> orderSales();
	
	public AdminOrdersVO orderMonth(String year);
	
	//주문 총 리스트
	public List<AdminOrdersVO> ordersList(AdminOrdersVO avo);

	//주문 총 리스트 엑셀
	public List<AdminOrdersVO> ordersExcel(AdminOrdersVO avo);
	
	public int countOrdersList(AdminOrdersVO avo);
	
	public int invoiceInsert(AdminOrdersVO avo);
	
	public int deliverUpdate(AdminOrdersVO avo);
	
	public AdminOrdersVO ordersState();
	
	
	
	
	//배송리스트
	public List<AdminOrdersVO> deliveryList(AdminOrdersVO avo);

	public int deliveryCountList(AdminOrdersVO avo);
	
	public List<AdminOrdersVO> deliveryExcel(AdminOrdersVO avo);

	
	public List<AdminOrdersVO> helpList(AdminOrdersVO avo);
	
	//취소교환 환불 리스트
	
	public AdminOrdersVO helpState();
	
	public int helpCountList(AdminOrdersVO avo);

	public List<AdminOrdersVO> helpExcel(AdminOrdersVO avo);
	
	public AdminOrdersVO dayList();
	
	
	public AdminOrdersVO weekList();
	
	public List<AdminOrdersVO> daycheckList();
	
	public List<AdminOrdersVO> weekcheckList();

	public List<AdminOrdersVO> monthcheckList();
	
	public List<AdminOrdersVO> rankcntProudct(AdminOrdersVO avo);

	public List<AdminOrdersVO> ranksumProudct(AdminOrdersVO avo);
}

package com.spring.admin.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.order.dao.AdminOrdersDao;
import com.spring.admin.order.vo.AdminOrdersVO;

import lombok.Setter;

@Service

public class AdminOrdersServiceImpl implements AdminOrdersService{
	
	@Setter(onMethod_ =@Autowired)
	private AdminOrdersDao adminOrdersDao;
	
	
	
	
	@Override
	public AdminOrdersVO ordersState() {
		AdminOrdersVO avo =adminOrdersDao.ordersState();
		
		return avo;
	}
	
	public AdminOrdersVO orderTotal() {
		AdminOrdersVO avo =adminOrdersDao.orderTotal();
		return avo;
	}
	
	public List<AdminOrdersVO> orderSales(){
		List<AdminOrdersVO>list =adminOrdersDao.orderSales();
		
		return list;
	}
	public AdminOrdersVO orderMonth(String year) {
		AdminOrdersVO avo = adminOrdersDao.orderMonth(year);
		
		return avo;
	}
	
	@Override
	public List<AdminOrdersVO> ordersList(AdminOrdersVO avo) {
		
		List<AdminOrdersVO> list = adminOrdersDao.ordersList(avo);
		
		return list;
	}

	@Override
	public int invoiceInsert(AdminOrdersVO avo) {
		
		int result=adminOrdersDao.invoiceInsert(avo);
		return result;
	}

	@Override
	public int deliverUpdate(AdminOrdersVO avo) {
		
		int result= adminOrdersDao.deliverUpdate(avo);
		return result;
	}

	@Override
	public List<AdminOrdersVO> ordersExcel(AdminOrdersVO avo) {

		List<AdminOrdersVO> list =adminOrdersDao.ordersExcel(avo);
		return list;
	}

	@Override
	public int countOrdersList(AdminOrdersVO avo) {
		
		int result= adminOrdersDao.countOrdersList(avo);
		return result;
	}

	@Override
	public List<AdminOrdersVO> deliveryList(AdminOrdersVO avo) {

		List<AdminOrdersVO> list =adminOrdersDao.deliveryList(avo);
		
		return list;
	}
	
	public int deliveryCountList(AdminOrdersVO avo) {
		
		int result =adminOrdersDao.deliveryCountList(avo);
		
		return result;
	}

	@Override
	public List<AdminOrdersVO> deliveryExcel(AdminOrdersVO avo) {

		List<AdminOrdersVO> list = adminOrdersDao.deliveryExcel(avo);
		return list;
	}

	@Override
	public AdminOrdersVO helpState() {
		
		AdminOrdersVO avo = adminOrdersDao.helpState();
		return avo;
	}
	
	public List<AdminOrdersVO> helpList(AdminOrdersVO avo){
		List<AdminOrdersVO> list = adminOrdersDao.helpList(avo);
		return list;
		
	}
	
	
	public int helpCountList(AdminOrdersVO avo) {
		
		int result =adminOrdersDao.helpCountList(avo);
		
		return result;
	}
	public List<AdminOrdersVO> helpExcel(AdminOrdersVO avo){
		
		List<AdminOrdersVO> list = adminOrdersDao.helpExcel(avo);
		return list;
		
	}

	@Override
	public AdminOrdersVO dayList() {
		
		AdminOrdersVO avo =adminOrdersDao.dayList();
		
		return avo;
	}

	@Override
	public AdminOrdersVO weekList() {
		
		AdminOrdersVO avo =adminOrdersDao.weekList();
		return avo;
	}
	
	public List<AdminOrdersVO> daycheckList(){
		
		List<AdminOrdersVO> list = adminOrdersDao.daycheckList();
		return list;
	}
	

	
	public List<AdminOrdersVO> weekcheckList(){
		List<AdminOrdersVO> list = adminOrdersDao.weekcheckList();
		return list;
		
	}

	@Override
	public List<AdminOrdersVO> monthcheckList() {
		List<AdminOrdersVO> list = adminOrdersDao.monthcheckList();
		return list;
	}

	@Override
	public List<AdminOrdersVO> rankcntProudct(AdminOrdersVO avo) {
		
		List<AdminOrdersVO> list = adminOrdersDao.rankcntProudct(avo);
		return list;
	}

	@Override
	public List<AdminOrdersVO> ranksumProudct(AdminOrdersVO avo) {
		List<AdminOrdersVO> list = adminOrdersDao.ranksumProudct(avo);
		
		return list;
	}
}

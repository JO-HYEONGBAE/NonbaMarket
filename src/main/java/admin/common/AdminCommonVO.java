package com.spring.admin.common.vo;


import lombok.Data;

@Data
public class AdminCommonVO {
	private int pageNum=0;
	private int amount=0;
	
	
	
	//맴버 리스트용
	
	private String allprice;
	private int age;
	private String g_name;
	private String name;
	
	//메인화면 뿌려주
	private int total;
	private int sell;
	private int stock;
	
	//리스트 갯수 가져오
	private int cnt;
	private int rank;
	private int sum;
	
	
	//대분류 이름 중분류 이름 가져오기 productlist
	private String large;
	private String mid;
	
	//검색후 값 살려주기
	private String search;
	private String keyword;
	private String search2;
	private String keyword2;
	private String dateBtn;
	private String startdate="";
	private String enddate="";
	private String startprice="";
	private String endprice="";

	
	public AdminCommonVO() {
		this(1,10);
	}
	public AdminCommonVO(int pageNum,int amount) {
		this.pageNum=pageNum;
		this.amount=amount;
	}
	
	private int jan;
	private int feb;
	private int mar;
	private int apr;
	private int may;
	private int jun;
	private int jul;
	private int aug;
	private int sep;
	private int oct;
	private int nov;
	private int dec;
	
	
	private int six;
	private int five;
	private int four;
	private int three;
	private int two;
	private int one;
	private int today;
	
	
	private int oneweek;
	private int twoweek;
	private int threeweek;
	private int fourweek;
	
	
	
	
	private int pay;
	private int cancel;
	
	private int ready;
	private int ing;
	private int finish;
	
	private int wait;
	private int ship;
	private int canceling;
	private int exchange;
	private int returns;
	private int refund;
	
	
	private String regdate;
	private int ordercnt;
	private int stockcnt;
	private int totalsell;
	private int usepoint;
	private int totalsum;
	private int totalrefund;
	
	
}

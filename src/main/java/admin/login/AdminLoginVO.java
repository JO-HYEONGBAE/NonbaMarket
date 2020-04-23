package com.spring.admin.login.vo;

import com.spring.admin.common.vo.AdminCommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class AdminLoginVO extends AdminCommonVO {

	private int a_num=0;
	private String a_name="";
	private String a_nickname="";
	private String a_id="";
	private String a_pwd="";
	private String a_regdate="";
	
}

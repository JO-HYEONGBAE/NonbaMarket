package com.spring.admin.product.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.admin.common.vo.PageDTO;
import com.spring.admin.large_category.service.AdminLarge_CategoryService;
import com.spring.admin.large_category.vo.AdminLarge_CategoryVO;
import com.spring.admin.mid_category.service.AdminMid_CategoryService;
import com.spring.admin.mid_category.vo.AdminMid_CategoryVO;
import com.spring.admin.p_option.vo.AdminP_OptionVO;
import com.spring.admin.product.service.AdminProductService;
import com.spring.admin.product.vo.AdminProductVO;
import com.spring.common.excel.ListExcelView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping(value="/adminProduct/*")
@Log4j
public class AdminProductController {

	
	private AdminProductService adminProductService;
	
	private AdminLarge_CategoryService adminLarge_CategoryService;
	
	private AdminMid_CategoryService adminMid_CategoryService;
	
	
	
	@RequestMapping(value="/productStatus")
	public String productStatus(Model model) {
		log.info("productStatus 호출 완료");
		
		AdminProductVO avo=adminProductService.productStatus();
		
		model.addAttribute("status",avo);
		
		return "adminProduct/productStatus";
	}
	
	//리스트
	
	@RequestMapping(value="/productList")
	public String productList(@ModelAttribute("data")AdminProductVO avo, Model model) {
		
		log.info("productList 호출 완료");
		
		
		List<AdminProductVO> list = adminProductService.productList(avo);
		log.info(list);
		
		List<AdminLarge_CategoryVO> largeList =adminLarge_CategoryService.largeList();
		
		int count= adminProductService.countProductList(avo);
		
		model.addAttribute("list",list);
		
		model.addAttribute("largeList",largeList);
		
		model.addAttribute("count",count);
		
		model.addAttribute("pageMaker",new PageDTO(avo,count));
		
		return "adminProduct/productList";
	}
	
	//중분류 카테고리 불러오기
	@ResponseBody
	@RequestMapping(value="/mid/{lc_num}",produces = {MediaType.APPLICATION_ATOM_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<AdminMid_CategoryVO>> midList(@PathVariable("lc_num")Integer lc_num){
		log.info("midList 호출 완료");
		
		List<AdminMid_CategoryVO> list= adminMid_CategoryService.midList(lc_num);
		
		ResponseEntity<List<AdminMid_CategoryVO>> entity= new ResponseEntity<List<AdminMid_CategoryVO>>(list,HttpStatus.OK);
		
		return entity;
		
	}
	
	
	//소분류 카테고리 불러오기
	@ResponseBody
	@RequestMapping(value="/low/{mc_num}",produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_ATOM_XML_VALUE})
	public ResponseEntity<List<AdminProductVO>> lowList(@PathVariable("mc_num")Integer mc_num){
		log.info("lowList 호출 완료");
		
		ResponseEntity<List<AdminProductVO>> entity=null;
		
		entity= new ResponseEntity<List<AdminProductVO>>(adminProductService.lowList(mc_num),HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value="/productEnrollment")
	public String productEnrollerment(AdminProductVO avo, Model model) {
		
		List<AdminLarge_CategoryVO> largeList =adminLarge_CategoryService.largeList();
		
		
		model.addAttribute("largeList",largeList);
		return "adminProduct/productEnrollment";
	}
	
	@ResponseBody
	@RequestMapping(value="/mix/{mc_num}")
	public String productMix(@PathVariable("mc_num")Integer mc_num){
		String result=adminProductService.productMix(mc_num);
		
		
		return result;
		
	}
	
	@ResponseBody
	@PostMapping(value="/productInsert",produces="text/plain; charset=UTF-8")
	public ResponseEntity<String> productInsert(AdminProductVO avo,Model model){
		log.info("file name: "+avo.getFile().getOriginalFilename());
		log.info("file2 name: "+avo.getFile2().getOriginalFilename());
		int result=0;
		
		result = adminProductService.productInsert(avo);
		
		return result==1 ? new ResponseEntity<String>("성공",HttpStatus.OK):
			new ResponseEntity<String>("실패",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@ResponseBody
	@PostMapping(value="/optionInsert",consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> optionInsert(@RequestBody AdminP_OptionVO avo){
		log.info(avo);
		log.info("OptionInsert 호출 성공");
		log.info(avo);
		int result=0;
		
		result= adminProductService.optionInsert(avo);
		
		return result==1 ? new ResponseEntity<String>("성공",HttpStatus.OK):
			new ResponseEntity<String>("실패",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/list/{p_num}")
	public ResponseEntity<List<AdminP_OptionVO>> optionList(@PathVariable("p_num") long p_num){
		
		ResponseEntity<List<AdminP_OptionVO>> entity=null;
		
		entity =new ResponseEntity<List<AdminP_OptionVO>>(adminProductService.optionList(p_num),HttpStatus.OK);
		return entity;
	}
	
	@ResponseBody
	@DeleteMapping(value="/{op_num}",produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> optionDelete(@PathVariable("op_num") Integer op_num){
		log.info("optionDelete 호출 성공");
		log.info("op_num=" +op_num);
		
		int result = adminProductService.optionDelete(op_num);
		return result ==1 ? new ResponseEntity<String>("성공",HttpStatus.OK):
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/productExcel", method=RequestMethod.GET)
	public ModelAndView productExcel(@ModelAttribute AdminProductVO avo) {
		log.info("productExcel 호출 성공");
		log.info(avo);
		List<AdminProductVO> productList= adminProductService.productExcel(avo);
		
		for(AdminProductVO list :productList) {
		log.info(list);
		}
		ModelAndView mv = new ModelAndView(new ListExcelView());
		mv.addObject("list",productList);
		mv.addObject("template","product.xlsx");
		mv.addObject("file_name","product");
		
		return mv;
	}
	
	@ResponseBody
	@DeleteMapping(value="/deleteProduct/{p_num[]}",produces ="text/plain; charset=UTF-8")
	public ResponseEntity<String> deleteProduct(@PathVariable("p_num[]")List<Long> p_num) {
		log.info("deleteProduct 호출성공");
		log.info(p_num);
		int result=0;
		int result2=adminProductService.productoptionDelete(p_num);
		log.info(result2);
		result= adminProductService.deleteProduct(p_num);
		log.info(result);
			
		
		return result >0 ? new ResponseEntity<String>("성공",HttpStatus.OK):
			new ResponseEntity<String>("실패",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	@RequestMapping(value="/productCategoryEno")
	public String productCategoryEno(AdminLarge_CategoryVO lvo,@ModelAttribute("data") AdminMid_CategoryVO mvo,Model model) {
		
		
		List<AdminLarge_CategoryVO> largeList =adminLarge_CategoryService.largeList();
		
		List<AdminMid_CategoryVO> midList =adminMid_CategoryService.midAllList(mvo);
		
		int largeNum = adminLarge_CategoryService.largeNum();
		
		int count = adminMid_CategoryService.midCountList();
		
		model.addAttribute("largeList",largeList);
		
		model.addAttribute("midList",midList);
		
		model.addAttribute("largeNum",largeNum);
		
		model.addAttribute("pageMaker",new PageDTO(mvo,count));
		
		return "adminProduct/productCategoryEno";
	}
	
	@ResponseBody
	@RequestMapping(value="/{lc_num}")
	public ResponseEntity<String> midNum(@PathVariable("lc_num") Integer lc_num) {
		
		
		
		int result=adminMid_CategoryService.midNum(lc_num);
		ResponseEntity<String> entity = new ResponseEntity<String>(String.valueOf(result),HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value="/largeInsert",method=RequestMethod.GET)
	public String largeInsert(AdminLarge_CategoryVO avo) {
		log.info("largeInsert 호출 성공");
		log.info(avo);
		int result= adminLarge_CategoryService.largeInsert(avo);
		String value="";
		if(result==1) {
			value="/adminProduct/productCategoryEno";
		}
		
		return "redirect:"+value;
		
	}
	
	
	@RequestMapping(value="/midInsert",method=RequestMethod.GET)
	public String midInsert(AdminMid_CategoryVO avo) {
		log.info(avo);
		
		int result= adminMid_CategoryService.midInsert(avo);
		String value="";
		if(result==1) {
			value="/adminProduct/productCategoryEno";
		}
		return "redirect:"+value;
		
	}
	
	@ResponseBody
	@DeleteMapping(value="/deleteLargeCategory/{lc_num[]}",produces ="text/plain; charset=UTF-8")
	public ResponseEntity<String> deleteLargeCategory(@PathVariable("lc_num[]")List<Integer>lc_num){
		
		List<Long> p_num=adminProductService.searchP_num(lc_num);
		log.info("p_num"+p_num);
		
		List<Integer> mc_num=adminMid_CategoryService.searchMc_num(lc_num);
		log.info("mc_num"+mc_num);
		
		if(p_num.size()!=0) {
			adminProductService.deleteProduct(p_num);
			
			List<Integer> op_num=adminProductService.searchOp_num(p_num);
			log.info("op_num"+op_num);
		
			if(op_num.size()!=0) {
				adminProductService.productoptionDelete(p_num);
			}
			
		}
		if(mc_num.size()!=0) {
			
			adminMid_CategoryService.deleteMidCategory(mc_num);
		}
		
		
		log.info(p_num);
		int result=adminLarge_CategoryService.deleteLargeCategory(lc_num);
			
		return result !=0 ? new ResponseEntity<String>("SUCCESS",HttpStatus.OK):
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	@ResponseBody
	@DeleteMapping(value="/deleteMidCategory/{mc_num[]}",produces ="text/plain; charset=UTF-8")
	public ResponseEntity<String> deleteMidCategory(@PathVariable("mc_num[]")List<Integer>mc_num){
		
		List<Long> p_num=adminProductService.searchP_num(mc_num);
		log.info("p_num"+p_num);
		
		log.info("mc_num"+mc_num);
		
		if(p_num.size()!=0) {
			adminProductService.deleteProduct(p_num);
			
			List<Integer> op_num=adminProductService.searchOp_num(p_num);
			log.info("op_num"+op_num);
		
			if(op_num.size()!=0) {
				adminProductService.productoptionDelete(p_num);
			}
			
		}
			
		int result =adminMid_CategoryService.deleteMidCategory(mc_num);
		
		
			
		return result !=0 ? new ResponseEntity<String>("SUCCESS",HttpStatus.OK):
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@ResponseBody
	@RequestMapping(value="/updateLargeCategory")
	public String productCategoryEno(AdminLarge_CategoryVO avo) {
		
		int result=0;
		String value="";
		result=adminLarge_CategoryService.updateLargeCategory(avo);
		
		if(result==1) {
			value="성공";
		}
		return value;
		
		
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/updateMidCategory")
	public String updateLargeCategory(AdminMid_CategoryVO avo) {
		int result =0;
		String value="";
		
		result=adminMid_CategoryService.updateMidCategory(avo);
		
		if(result==1) {
			value="성공";
		}
		
		return value;
	}
	
	
	
	
	
}

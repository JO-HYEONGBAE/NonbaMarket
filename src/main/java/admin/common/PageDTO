package com.spring.admin.common.vo;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
   private int startPage;      //화면에서 보여지는 페이지의 시작 번호
   private int endPage;      //화면에서 보여지는 페이지의 끝 번호
   private boolean prev, next;   //이전과 다음으로 이동한 링크의 표시 여부
   
   private int total;
   private AdminCommonVO cvo;
   
   public PageDTO(AdminCommonVO cvo, int total) {
      this.cvo = cvo;
      this.total = total;
      
      /*페이징의 끝번호(endPage) 구하기
       * this.endPage = (int) (Math.ceil(페이지번호/10.0) * 10 */
      this.endPage = (int) (Math.ceil(cvo.getPageNum() / 10.0)) * 10;
      
      //페이징의 사작벊(startPage) 구하기
      this.startPage = this.endPage -9;
      
      //끝페이지 구하기
      int realEnd = (int) (Math.ceil((total*1.0) /cvo.getAmount()));
      
      if(realEnd <= this.endPage) {
         this.endPage = realEnd;
      }
      
      //이전 구하기
      this.prev = this.startPage > 1;
      
      //다음 구하기
	      this.next = this.endPage < realEnd;
	   }
	   
	   
}


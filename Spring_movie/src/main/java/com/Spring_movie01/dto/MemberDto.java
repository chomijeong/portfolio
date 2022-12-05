package com.Spring_movie01.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberDto {
	
	
	private String mid;
	private String mpw;
	private String mname;
	private String mbirth;
	
	
	private String memail;
	private String maddress;
	
	
	
	private String mpostcode;    // 우편번호
	private String maddr;	     // 주소
	private String mdetailAddr;	 // 상세주소
	private String mextraAddr;   // 참조항목
	
	
	
	
	
	
	
	private String mprofile; // 프로필파일 이름
	
	private MultipartFile mfile;
	
	
	
	private int mstate;
	
	// lombok라이브러리 : get/ set를 Dto에 추가를 안해도 자동으로 완성해준다. 
	// 수동다운 적용 후 maven - update project 후 웹페이지 실행.
	
	

}

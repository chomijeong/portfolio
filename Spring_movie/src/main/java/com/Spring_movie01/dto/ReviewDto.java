package com.Spring_movie01.dto;

import lombok.Data;

@Data
public class ReviewDto {

	private String rvrecode;
	private String rvmid;
	private String rvmvcode;
	private String rvcontents;
	private String rvdate;
	private int rvcommend;
	
	
	private String mprofile;
	private int mstate;

}

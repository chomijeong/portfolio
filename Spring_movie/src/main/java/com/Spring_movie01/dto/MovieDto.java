package com.Spring_movie01.dto;

import lombok.Data;

@Data
public class MovieDto {

	private String mvcode;
	private String mvname;
	private String mvpd;
	private String mvactor;
	private String mvgenre;
	private String mvage;
	private String mvtime;
	private String mvopen;
	
	private String mvposter;
	
	private int goodRvcommend;
	private int badRvcommend;
	
	private double reservationRatio;


	private String searchText;
	
	private int mvstate;

	
}



package com.Spring_movie01.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Spring_movie01.dto.ReservationDto;
import com.Spring_movie01.dto.ReviewDto;
import com.Spring_movie01.dto.SchedulesDto;
import com.Spring_movie01.service.MovieService;





@Controller
public class MovieController {
	
	@Autowired
	private MovieService mvsvc;
	
	@Autowired
	HttpSession session;
	
	
	@RequestMapping(value="/getCgvMovieList")
	public ModelAndView getCgvMovieList(RedirectAttributes ra) throws IOException {
		
		ModelAndView mav = mvsvc.getCgvMovieList(ra);
		
		
		return mav;
		
		
		
		
		
	}
	
	@RequestMapping(value="/MovieList")
	public ModelAndView movieList() {
		
		System.out.println("영화목록 페이지 이동요청");
		ModelAndView mav = mvsvc.MovieList();
		
		
		
		return mav;
		
	}
	
	
	@RequestMapping(value="/MovieView")
	public ModelAndView movieView(String mvcode) {
		
		System.out.println("영화 상세 페이지 이동 요청");
		
		ModelAndView mav = mvsvc.MovieView(mvcode);
		
		
		
		return mav;

		
	}
	

	@RequestMapping(value="/MovieReservationPage")
	public ModelAndView MovieReservationPage() {
		
		System.out.println("영화 예매 페이지 이동 요청");
		
		ModelAndView mav = mvsvc.MovieReservationPage();
		
		
		return mav;
		
	}
	
	
	@RequestMapping(value="/getThList")
	public @ResponseBody String getThList(String mvcode) {
		System.out.println("예매_극장 목록 조회 요청");
		
		String reThList = mvsvc.getThList(mvcode);
		
		
		return reThList;
		
		
	}
	
	
	@RequestMapping(value="/getScDateList")
	public @ResponseBody String getScDateList(String mvcode, String thcode) {
		System.out.println("예매_날짜 목록 조회 요청");
		
		String ScDateList = mvsvc.getScDateList(mvcode,thcode);
		
		
		
		
		
		return ScDateList;
		
	}
	
	@RequestMapping(value="/getScroomList")
	public @ResponseBody String getscroomList(String mvcode, String thcode, String scdate) {
		
		System.out.println("예매_상영관/시간 목록 조회 요청");
		
		String scroomList = mvsvc.getScroomList(mvcode,thcode,scdate);
		
		return scroomList;
		
		
	}
	
	
	@RequestMapping(value="/MovieReservation")
	public ModelAndView MovieReservation(RedirectAttributes ra, ReservationDto re) {
		
		System.out.println("영화 예매 정보 입력 요청");
		
		ModelAndView mav = mvsvc.MovieReservation(ra,re);
		
		
		
		return mav;

	}
	
	
	@RequestMapping(value="/ReservationList")
	public ModelAndView ReservationList(String LoginMid) {
		
		System.out.println("영화 예매 내역 페이지 요청");
		
		String remid = (String)session.getAttribute("LoginMid");
		System.out.println(remid);
		
		ModelAndView mav = mvsvc.ReservationList(remid);
		
		System.out.println(mav);
		
		return mav;
		
		
	}
	
	
	@RequestMapping(value="/reservationCancel")
	public ModelAndView reservationCancel(RedirectAttributes ra,String recode) {
		System.out.println("영화 예매 취소 요청");
		ModelAndView mav = mvsvc.reservationCancel(ra,recode);
		
		
		
		return mav;
		
	}
	

	
	@RequestMapping(value="/reviewWrite")
	public ModelAndView reviewWrite(RedirectAttributes ra, ReviewDto review) {
		System.out.println("관람평 작성 요청");
		ModelAndView mav = mvsvc.reviewWrite(ra,review);
		
		return mav;
		
	}
	
	
	@RequestMapping(value="/getReviewList")
	public @ResponseBody String getReviewList(String rvrecode) {
		System.out.println("관람평 보기 요청");
		String reviewList = mvsvc.getReviewList(rvrecode);
		return reviewList;
	}
	
	@RequestMapping(value="/searchList")
	public ModelAndView searchList(String searchText) {
		System.out.println("영화 검색 요청");
		ModelAndView mav = mvsvc.searchList(searchText);
		

		return mav;
		

	}
	
	

	

}



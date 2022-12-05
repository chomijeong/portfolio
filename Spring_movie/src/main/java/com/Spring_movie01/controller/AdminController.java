package com.Spring_movie01.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Spring_movie01.dto.MovieDto;
import com.Spring_movie01.dto.SchedulesDto;
import com.Spring_movie01.dto.ThDto;
import com.Spring_movie01.service.adminService;


@Controller
public class AdminController {

	private ModelAndView mav;
	
	@Autowired
	private adminService asvc;

	@RequestMapping(value="/AdminMovieList")
	public ModelAndView adminMovieList() {
		System.out.println("관리자 영화 페이지 이동요청");
		
		
		ModelAndView mav = asvc.adminMovieList();
		
		
		return mav;
	}
	
	@RequestMapping(value = "/adminModifyMvState1")
	public ModelAndView adminModifyMvState1(String mvcode, int mvstate) {
		System.out.println("관리자 영화 상태 변경 요청1");
		ModelAndView mav = asvc.adminModifyMvState1(mvcode, mvstate);
		
		return mav;
	}
	
	
	@RequestMapping(value = "/adminModifyMvState2")
	public @ResponseBody String adminModifyMvState2(String mvcode, int mvstate) {
		System.out.println("관리자 영화 상태 변경 요청2");
		
		String updateResult = asvc.adminModifyMvState2(mvcode, mvstate);
		
		return updateResult;
	}
	

	
	@RequestMapping(value = "/adminGetMvInfo")
	public @ResponseBody String adminGetMvInfo(String mvcode) {
		System.out.println("관리자 영화정보 조회 요청");
		String mvInfo = asvc.getAdminMvInfo(mvcode);
		
		return mvInfo;
	}
	@RequestMapping(value = "/adminModifyMovie")
	public ModelAndView adminModifyMovie(MovieDto movie) {
		System.out.println("관리자 영화 정보 수정 요청");
		
		ModelAndView mav = asvc.adminModifyMovie(movie);
		return mav;
		
	}
	
	@RequestMapping(value = "/AdminThList")
	public ModelAndView adminTheaterList() {
		System.out.println("관리자 극장 페이지 이동요청");
		ModelAndView mav = asvc.adminTheaterList();
		return mav;
	}
	
	
	@RequestMapping(value = "/adminModifyThState")
	public @ResponseBody String adminModifyThState(String thcode, int thstate) {
		System.out.println("관리자 극장 상태 변경 요청");
		
		String updateResult = asvc.adminModifyThState(thcode, thstate);
		
		return updateResult;
	}
	
	@RequestMapping(value = "/adminGetThInfo")
	public @ResponseBody String adminGetThInfo(String thcode) {
		System.out.println("관리자 극장 정보 조회 요청");
		
		String thInfo = asvc.adminGetThInfo(thcode);
		
		return thInfo;
		
	}
	
	@RequestMapping(value = "/adminModifyThInfo")
	public ModelAndView adminModifyThInfo(ThDto thInfo){
		
		ModelAndView mav = asvc.adminModifyThInfo(thInfo);
		
		
		return mav;
		
	}
	

	@RequestMapping(value = "/AdminMemberPage")
	public ModelAndView AdminMemberPage() {
		System.out.println("관리자 회원 관리 페이지 이동 요청");
		
		ModelAndView mav = asvc.AdminMemberPage();
		
		
		return mav;
		
		
		
	}
	
	@RequestMapping(value = "/adminModifyMemberState")
	public @ResponseBody String adminModifyMemberState(String mid, int mstate) {
		System.out.println("관리자 회원상태 변경 요청");
		String updateResult = asvc.adminModifyMemberState(mid, mstate);
		return updateResult;
	}
	
	@RequestMapping(value = "/AdminSchedulesPage")
	public ModelAndView AdminSchedules() {
		System.out.println("관리자 스케줄 페이지 이동 요청");
		ModelAndView mav = asvc.AdminSchedulesPage();
		
		return mav;
		
	}
	
	@RequestMapping(value = "/adminScRoomTimeList")
	public @ResponseBody String adminScRoomTimeList(String thcode, String scdate) {
		System.out.println("관리자 스케쥴_상영관 및 시간목록 조회 요청");
		
		String roomTimeList = asvc.amdinScRoomTimeList(thcode,scdate);
		
		return roomTimeList;
		
	}
	
	
	@RequestMapping(value = "/adminSchedules")
	public ModelAndView adminSchedules(SchedulesDto schedules, RedirectAttributes ra) {
		System.out.println("관리자 스케쥴 등록 요청");
		
		
		ModelAndView mav = asvc.adminSchedules(schedules,ra);
		
		
		return mav;
	}
	
	
}

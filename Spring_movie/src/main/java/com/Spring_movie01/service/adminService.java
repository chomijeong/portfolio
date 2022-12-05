package com.Spring_movie01.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Spring_movie01.dao.adminDao;
import com.Spring_movie01.dto.MemberDto;
import com.Spring_movie01.dto.MovieDto;
import com.Spring_movie01.dto.SchedulesDto;
import com.Spring_movie01.dto.ThDto;
import com.google.gson.Gson;

@Service
public class adminService {
	
	@Autowired
	private adminDao adao;

	public ModelAndView adminMovieList() {
		System.out.println("AdminService.adminMovieList() 호출");
		ModelAndView mav = new ModelAndView();
		//전체 영화 목록
		ArrayList<MovieDto> movieList = adao.selectMovieList();
		mav.addObject("mvList", movieList);
		mav.setViewName("Admin/AdminMovieList");
		return mav;
	}
	
	public ModelAndView adminModifyMvState1(String mvcode, int mvstate) {
		System.out.println("AdminService.adminMovieList1() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("mvcode : " + mvcode);
		System.out.println("mvstate : " + mvstate);
		
		int updateResult = adao.updateMvState(mvcode, mvstate);
		System.out.println("updateResult : " + updateResult);
		
		mav.setViewName("redirect:/AdminMovieList");
		return mav;
	}
	

	public String adminModifyMvState2(String mvcode, int mvstate) {
		System.out.println("AdminService.adminMovieList2() 호출");
		System.out.println("mvcode : " + mvcode);
		System.out.println("mvstate : " + mvstate);
		
		int updateResult = adao.updateMvState(mvcode, mvstate);
		System.out.println("updateResult : " + updateResult);
		return updateResult+"";
	}
	// 영화정보 수정
	public ModelAndView adminModifyMovie(MovieDto movie) {
		System.out.println("AdminService.adminModifyMovie() 호출");
		ModelAndView mav = new ModelAndView();
		
		System.out.println("수정할 영화 정보");
		System.out.println(movie);
		
		
		int updateMovieList = adao.updateMvInfo(movie);
		
		
		mav.setViewName("redirect:/AdminMovieList");
		return mav;
	}
	// 영화정보 조회
	public String getAdminMvInfo(String mvcode) {
		System.out.println("AdminService.getAdminMvInfo() 호출");
		MovieDto movie = adao.selectMvInfo(mvcode);
		Gson gson = new Gson();
		String mvInfo_Json = gson.toJson(movie);
		System.out.println(mvInfo_Json);
		return mvInfo_Json;
	}
	
	//전체 극장 목록 조회
	public ModelAndView adminTheaterList() {
		System.out.println("AdminService.adminTheaterList() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<ThDto> thList = adao.selectTheaterList();
		
		mav.addObject("thList", thList);
		mav.setViewName("Admin/AdminThList");
		return mav;
	}
	
	// 극장정보 상태 변경
	public String adminModifyThState(String thcode, int thstate) {
		System.out.println("AdminService.adminModifyThState() 호출");
		System.out.println("thcode : " + thcode);
		System.out.println("thstate : " + thstate);
		
		int updateResult = adao.updateThState(thcode, thstate);
		System.out.println("updateResult : " + updateResult);
		return updateResult+"";
	}
	// 극장정보조회 
	public String adminGetThInfo(String thcode) {
		System.out.println("AdminService.adminGetThInfo() 호출");
		System.out.println("조회할 극장 코드 : " + thcode);
		ThDto theater = adao.selectThInfo(thcode);
		
		Gson gson = new Gson();
		String theater_json = gson.toJson(theater);
		System.out.println(theater_json);
		return theater_json;
		
	}
	public ModelAndView adminModifyThInfo(ThDto thInfo) {
		System.out.println("AdminService.adminModifyThInfo() 호출");
		ModelAndView mav = new ModelAndView();
		
		int updateThInfo = adao.updateThInfo(thInfo);
		
		mav.setViewName("redirect:/AdminThList");
		
		return mav;
	}
	
	// 스케줄
	public ModelAndView AdminSchedulesPage() {
		System.out.println("AdminService.AdminSchedules() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<MovieDto> MovieList = adao.selectMovieListcode();
		
		ArrayList<ThDto> thList = adao.selectTheaterListname();
		
		
		mav.addObject("thList", thList);
		
		
		mav.addObject("MovieList", MovieList);
		mav.setViewName("Admin/AdminSchedules");
		
		
		return mav;
	}
	// 회원목록
	public ModelAndView AdminMemberPage() {
		System.out.println("AdminService.AdminMember() 호출");
		ModelAndView mav = new ModelAndView();
		
		
		ArrayList<MemberDto> mList = adao.selectMemberList();
		
		mav.addObject("mList", mList);
		
		mav.setViewName("Admin/AdminMember");
		
		
		return mav;
	}
	// 회원관리기능
	public String adminModifyMemberState(String mid, int mstate) {
		System.out.println("AdminService.adminModifyMemberState() 호출");
		System.out.println("mid : " + mid);
		System.out.println("mstate : " + mstate);
		
		int updateResult = adao.updateMemberState(mid, mstate);
		System.out.println("updateResult : " + updateResult);
		return updateResult+"";
		
	}

	public String amdinScRoomTimeList(String thcode, String scdate) {
		System.out.println("AdminService.getScRoomTimeList() 호출");
		
		ArrayList<SchedulesDto> roomTimeList = adao.selectScRoomTime(thcode,scdate);
		Gson gson = new Gson();
		String roomTimeList_json = gson.toJson(roomTimeList);
		System.out.println(roomTimeList_json);
		
		
		
		
		return roomTimeList_json;
	}

	public ModelAndView adminSchedules(SchedulesDto schedules, RedirectAttributes ra) {
		System.out.println("AdminService.adminSchedules() 호출");
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println(schedules);
		
		for(int i = 0; i < schedules.getScRoomTime().length; i++) {
			SchedulesDto registSc = new SchedulesDto();
			registSc.setScthcode(schedules.getScthcode());
			registSc.setScmvcode(schedules.getScmvcode());
			
			String[] roomTime = schedules.getScRoomTime()[i].split(" ");
			registSc.setScroom(roomTime[0]);
			registSc.setScdate(schedules.getScdate()+" "+roomTime[1]);
			System.out.println(registSc);
			adao.insertSchedules(registSc);
			
		}
		ra.addFlashAttribute("msg", schedules.getScdate()+" "+schedules.getScRoomTime().length+"개 스케쥴이 등록 되었습니다.");
		mav.setViewName("redirect:/AdminSchedulesPage");
		
		
		return mav;
	}


	
	
	
	
	

}

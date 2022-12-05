package com.Spring_movie01.dao;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.Spring_movie01.dto.MemberDto;
import com.Spring_movie01.dto.MovieDto;
import com.Spring_movie01.dto.SchedulesDto;
import com.Spring_movie01.dto.ThDto;


public interface adminDao {
	
	// 영화목록 불러오기
	ArrayList<MovieDto> selectMovieList();
	
	// 영화상영여부
	int updateMvState(@Param("mvcode") String mvcode, @Param("mvstate") int mvstate);
	
	//영화 상세 정보 조회
	MovieDto selectMvInfo(String mvcode);
	
	//영화정보수정
	int updateMvInfo(MovieDto movie);
	
	// 극장목록 불러오기
	ArrayList<ThDto> selectTheaterList();

	// 극장사용여부
	int updateThState(@Param("thcode") String thcode, @Param("thstate")int thstate);
	
	// 극장 정보 조회
	ThDto selectThInfo(String thcode);
	

	// 극장 정보 수정
	int updateThInfo(ThDto thInfo);
	
	// 영화 이름
	ArrayList<MovieDto> selectMovieListcode();

	// 극장 이름
	ArrayList<ThDto> selectTheaterListname();
	
	// 회원리스트
	ArrayList<MemberDto> selectMemberList();

	
	// 회원관리
	int updateMemberState(@Param("mid") String mid, @Param("mstate") int mstate);

	
	// 스케쥴 조회
	ArrayList<SchedulesDto> selectScRoomTime(@Param("thcode") String thcode, @Param("scdate") String scdate);

	// 스케쥴 등록
	void insertSchedules(SchedulesDto registSc);

	

	

	

	

}
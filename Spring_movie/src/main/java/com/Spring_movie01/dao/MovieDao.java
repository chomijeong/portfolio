package com.Spring_movie01.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.Spring_movie01.dto.MovieDto;
import com.Spring_movie01.dto.ReservationDto;
import com.Spring_movie01.dto.ReservationInfoDto;
import com.Spring_movie01.dto.ReviewDto;
import com.Spring_movie01.dto.SchedulesDto;
import com.Spring_movie01.dto.ThDto;

public interface MovieDao {
	
	
	int selectMvCheck(@Param ("mvname") String mvname, @Param("mvopen") String mvopen);
	
	@Select("SELECT MAX(MVCODE) FROM MOVIES")
	String selectCode();
	
	
	@Insert("INSERT INTO MOVIES(MVCODE,MVNAME,MVPD,MVACTOR,MVGENRE,MVAGE,MVTIME,MVOPEN,MVPOSTER)"
			+ "VALUES(#{mvcode},#{mvname},#{mvpd},#{mvactor},#{mvgenre},#{mvage},#{mvtime},TO_DATE(#{mvopen}, 'YYYY-MM-DD'),#{mvposter})")
	void insertMovie(MovieDto movieDto);
	
	ArrayList<MovieDto> selectMovieList();

	MovieDto selectMovieInfo(String mvcode);

	ArrayList<MovieDto> selectReserveMvList();

	ArrayList<ThDto> selectthList(String mvcode);

	ArrayList<SchedulesDto> getScDateList(@Param("mvcode") String mvcode, @Param("thcode") String thcode);

	ArrayList<SchedulesDto> getScroomList(@Param("mvcode") String mvcode, @Param("thcode") String thcode, @Param("scdate") String scdate);

	String getMaxRecode();

	void insertReservation(ReservationDto re);


	ArrayList<ReservationInfoDto> selectReservationInfoList(String remid);

	ReservationInfoDto selectReserinfo(String recode);

	void deleteReservation(String recode);

	void insertReview(ReviewDto review);
	
	String selectReviewWriteCheck(String recode);


	ReviewDto selectReviewList(String rvrecode);

	ArrayList<ReviewDto> ReviewList(String mvcode);

	int selectCountReservation();

	int selectMvCountReservation(String mvcode);

	ArrayList<MovieDto> selectSearchList(@Param("searchText") String searchText, @Param("checkWhere") String checkWhere);










	
	
	
}
	



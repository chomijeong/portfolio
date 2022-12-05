package com.Spring_movie01.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.Spring_movie01.dao.MovieDao;
import com.Spring_movie01.dto.MovieDto;
import com.Spring_movie01.dto.ReservationDto;
import com.Spring_movie01.dto.ReservationInfoDto;
import com.Spring_movie01.dto.ReviewDto;
import com.Spring_movie01.dto.SchedulesDto;
import com.Spring_movie01.dto.ThDto;
import com.google.gson.Gson;




@Service
public class MovieService {

		@Autowired
		private MovieDao mdao;
	
		@Autowired
		private HttpSession session;
	
public ModelAndView getCgvMovieList(RedirectAttributes ra) throws IOException {
		System.out.println("MovieService.getCgvMovieList() 호출");
		
		ModelAndView mav = new ModelAndView();
		
		
		
		
		String cgvMovieUrl = "http://www.cgv.co.kr/movies/?lt=1&ft=0";
		
		Document doc = Jsoup.connect(cgvMovieUrl).get();
		
		Elements movieList_div = doc.select("div.sect-movie-chart");
		
		Elements movieList_ol = movieList_div.eq(0).select("ol");
		
		ArrayList<MovieDto> cgvMyList = new ArrayList<MovieDto>();
		
		
for(int i = 0; i < movieList_ol.select("li").size(); i++) {
		    MovieDto mv = new MovieDto();
		
		    
	
			String detailUrl = "http://www.cgv.co.kr" + movieList_ol.select("li").eq(i).select("div.box-image a").eq(0).attr("href");
			// 요소가 href를 찾아서 해당 경로로 이동.\
			// System.out.println("detailUrl");

			
			Document detailDoc = Jsoup.connect(detailUrl).get();
			//Jsoup을 가지고 접속을해서 detailUrl에 경로에 해당 요소(태그)를 찾아서 값을 불러온다. 
			Elements baseMovie = detailDoc.select("div.sect-base-movie");
			
			String movieTitle = baseMovie.select("div.box-contents div.title strong").text();
			//System.out.println(" movieTitle : " + movieTitle);
			mv.setMvname(movieTitle);
			
			String posterUrl = baseMovie.select("div.box-image span.thumb-image img").attr("src");
			mv.setMvposter(posterUrl);
			// System.out.println("posterUrl : "+posterUrl);
			
			String movieDirector = baseMovie.select("div.box-contents div.spec dd").eq(0).text();
			// System.out.println("movieDirector :"+movieDirector);
			mv.setMvpd(movieDirector);
			
			String movieActors = baseMovie.select("div.box-contents div.spec dd.on").eq(0).text();
			// System.out.println("movieActors : "+movieActors);
			mv.setMvactor(movieActors);
			
			String movieGenre = baseMovie.select("div.box-contents div.spec dd.on").eq(0).next().text().replace("장르 : ", "");
			// next : 바로 다음 요소를 선택하는 기능을 한다.
			// replace : 앞에 있는 데이터값을 찾아서 뒤에 있는 데이터값으로 내용을 수정한다.
			// System.out.println(" movieGenre : "+ movieGenre);
			mv.setMvgenre(movieGenre);
			
			String movieGrade = baseMovie.select("div.box-contents div.spec dd.on").eq(1).text().split(", ")[0];
			// System.out.println("movieGrade : "+movieGrade);
			mv.setMvage(movieGrade);
			
			String movieTime = baseMovie.select("div.box-contents div.spec dd.on").eq(1).text().split(", ")[1];
			// 콤마(,)를 기준으로 나눈 후 인덱스 값에 해당하는 데이터를 선택한다.
			// System.out.println("movieTime : "+movieTime);
			mv.setMvtime(movieTime);
			
			
			String movieOpen = baseMovie.select("div.box-contents div.spec dd.on").eq(2).text();
			// System.out.println("movieOpen : "+movieOpen);
			mv.setMvopen(movieOpen);

			cgvMyList.add(mv);
			
}
	int insertCount = 0;
	System.out.println(cgvMyList);

		for(int i = 0; i < cgvMyList.size(); i++) {
			cgvMyList.get(i).getMvname();
			cgvMyList.get(i).getMvopen();
			
			int mvCheck
			= mdao.selectMvCheck(cgvMyList.get(i).getMvname(), cgvMyList.get(i).getMvopen());
			
			if(mvCheck == 0) {
			
			// 1. 영화코드 생성(select)
			String mvcode = "MV";
			String Maxmvcode = mdao.selectCode();
			
			
			if( Maxmvcode == null) {
				mvcode = mvcode + "001";
				
			}else{
				// maxMvcode = maxMvcode.split("MV")[1];
				Maxmvcode = Maxmvcode.substring(2); // 'MV002' >> '002'
				int codeNum = Integer.parseInt(Maxmvcode) +1;
				
				if(codeNum < 10) {
				mvcode = mvcode + "00" +codeNum;
				
				}else if(codeNum < 100) {
					mvcode = mvcode + "0"+ codeNum;					
				}else {
					
					mvcode = mvcode + codeNum;				
					
				}
				
			}

			System.out.println(mvcode);
			
			cgvMyList.get(i).setMvcode(mvcode);
			
			// 2. 영화정보 insert
			

			mdao.insertMovie(cgvMyList.get(i));
			insertCount++;
				
				
				
			}
			
			}		
		System.out.println(insertCount+"개 영화 추가");
			
		if(insertCount > 0) {
			
			ra.addFlashAttribute("msg", "영화 정보가 추가되었습니다.");
			
		}
			
		mav.setViewName("redirect:/MovieMain");
		return mav;
		}




	public ModelAndView MovieList() {
		System.out.println("MovieService.movieList() 호출");
		
		ModelAndView mav = new ModelAndView();
		
		// 1.영화 목록 조회
		ArrayList<MovieDto> movieList = mdao.selectMovieList();
		
		for(int i = 0; i < movieList.size(); i++) {
			String mvcode = movieList.get(i).getMvcode();
			
			// 관람평 목록 조회
			ArrayList<ReviewDto> Reviewsel = mdao.ReviewList(mvcode);
			int goodCount = 0;
			int badCount = 0;
			for(int j = 0; j < Reviewsel.size(); j++ ) {
						
				if(Reviewsel.get(j).getRvcommend() == 1) {
					
					goodCount++;
				}else { 
					badCount++;
					
				}

				
			}
			
			movieList.get(i).setGoodRvcommend(goodCount);
			movieList.get(i).setBadRvcommend(badCount);
			
			// 전체 예매수 조회
			int totalReservation = mdao.selectCountReservation();
			System.out.println("totalReservation : "+totalReservation);
			
			// 영화예매수 조회
			int mvCountReservation = mdao.selectMvCountReservation(mvcode);
			System.out.println("mvCountReservation : "+mvCountReservation);
			
			// 예매율
			double reservationRatio = (double)mvCountReservation/totalReservation * 100;
			System.out.println("reservationRatio : " + Math.round(reservationRatio*100)/100.0);
			movieList.get(i).setReservationRatio(Math.round(reservationRatio*100)/100.0);
			
		}

		
		System.out.println(movieList);
		
		
		mav.addObject("movieList", movieList);
		
		// 2. 영화목록 페이지
		mav.setViewName("Movie/MovieList");
		
		return mav;
	}




	public ModelAndView MovieView(String mvcode) {
		System.out.println("MovieService.movieView() 호출");
		
		ModelAndView mav = new ModelAndView();
		
		// 1. 영화 상세 목록 조회.
		MovieDto MovieView = mdao.selectMovieInfo(mvcode);
		System.out.println(MovieView);

		// 관람평 목록 조회
		ArrayList<ReviewDto> Reviewsel = mdao.ReviewList(mvcode);
		int goodCount = 0;
		int badCount = 0;
		for(int i = 0; i < Reviewsel.size(); i++ ) {
			String rvcontents = Reviewsel.get(i).getRvcontents();
			rvcontents = rvcontents.replace(" ", "&nbsp");
			rvcontents = rvcontents.replace("\r\n", "<br>");
			Reviewsel.get(i).setRvcontents(rvcontents);
					
			if(Reviewsel.get(i).getRvcommend() ==1) {
				
				goodCount++;
			}else {
				badCount++;
				
			}		
		}	
		MovieView.setGoodRvcommend(goodCount);
		MovieView.setBadRvcommend(badCount);
		
		System.out.println(Reviewsel);
	
		
		// 전체 예매수 조회
		int totalReservation = mdao.selectCountReservation();
		System.out.println("totalReservation : "+totalReservation);
		
		// 영화예매수 조회
		int mvCountReservation = mdao.selectMvCountReservation(mvcode);
		System.out.println("mvCountReservation : "+mvCountReservation);
		
		// 예매율
		double reservationRatio = (double)mvCountReservation/totalReservation * 100;
		System.out.println("reservationRatio : " + Math.round(reservationRatio*100)/100.0);
		MovieView.setReservationRatio(Math.round(reservationRatio*100)/100.0);
		
		mav.addObject("Reviewsel", Reviewsel);
			
		mav.addObject("MovieView", MovieView);
		
		// 2. 영화 상세 페이지
		mav.setViewName("Movie/MovieView");
		
		return mav;
	}








    // 예매 가능한 영화 목록
	public ModelAndView MovieReservationPage() {
		System.out.println("MovieService.MovieReservationPage() 호출");
		
		
		ModelAndView mav = new ModelAndView();
		
		// 1. 영화 목록 조회 ( 예매가능 한 영화 )
		ArrayList<MovieDto> reMvList = mdao.selectReserveMvList();
		System.out.println(reMvList);
		
		
		mav.addObject("reMvList", reMvList);
		
		mav.setViewName("Movie/MovieReservationPage");
		
		return mav;
		

	}



	// 극장
	public String getThList(String mvcode) {
		System.out.println("MovieService.getThList() 호출");
		
		
		ArrayList<ThDto> thList = mdao.selectthList(mvcode);
		
		Gson gson = new Gson();
		String thList_json = gson.toJson(thList);
		System.out.println(thList_json);
		
		
		return thList_json;
	}



	// 시간
	public String getScDateList(String mvcode, String thcode) {
		System.out.println("MovieService.getScDateList() 호출");
		
		ArrayList<SchedulesDto> ScDateList = mdao.getScDateList(mvcode,thcode);
		
		Gson gson = new Gson();
		String ScDateList_json = gson.toJson(ScDateList);
		System.out.println(ScDateList_json);
		
		
		
		return ScDateList_json;
	}




	public String getScroomList(String mvcode, String thcode, String scdate) {
		System.out.println("MovieService.getScroomList() 호출");
		
		ArrayList<SchedulesDto> scroomList = mdao.getScroomList(mvcode,thcode,scdate);
		
		Gson gson = new Gson();
		String scroomList_json = gson.toJson(scroomList);
		System.out.println(scroomList_json);
		
		
		return scroomList_json;
	}




	public ModelAndView MovieReservation(RedirectAttributes ra, ReservationDto re) {
		System.out.println("MovieService.MovieReservation() 호출");
		
		ModelAndView mav = new ModelAndView();
		
		
		// 예매코드 생성
		// 1. 영화코드 생성 (select)
		String recode = "RE";
		String maxRecode = mdao.getMaxRecode();
		if(maxRecode == null) {
			recode = recode + "01";
			
			
		}else {
			maxRecode = maxRecode.substring(2);
			int codeNum = Integer.parseInt(maxRecode) + 1;
			if(codeNum < 10) {   
				recode = recode + "0" + codeNum;
				
				
			}else {
				recode = recode+ codeNum;
				
			}
			
		}
   
		re.setRecode(recode);
		System.out.println("예매정보");
		System.out.println(re);
		

		mdao.insertReservation(re);

		
		
		ReservationInfoDto reserinfo = mdao.selectReserinfo(recode);
		System.out.println(reserinfo);
		
		ra.addFlashAttribute("reserinfo", reserinfo);
		
		// ra.addFlashAttribute("msg","예매되었습니다.");
		mav.setViewName("redirect:/MovieMain");
		
		return mav;
	}




	public ModelAndView ReservationList(String remid) {
		System.out.println("MovieService.ReservationList() 호출");
		
		ModelAndView mav = new ModelAndView();
		
			
		
		ArrayList<ReservationInfoDto> reservList = mdao.selectReservationInfoList(remid);
		
		for(int i = 0; i < reservList.size(); i++) {
			ReviewDto review = mdao.selectReviewList( reservList.get(i).getRecode());
			if(review != null) {
				String rvcontents = review.getRvcontents();
				rvcontents = rvcontents.replace("\r\n", "<br>");
				rvcontents = rvcontents.replace(" ", "&nbsp;");
				review.setRvcontents(rvcontents);
				
				
			}
			reservList.get(i).setReview(review);
		}
		System.out.println(reservList);
		mav.addObject("reservList",reservList);
		
		
		mav.setViewName("Movie/ReservationList");
		return mav;



	
	}




	public ModelAndView reservationCancel(RedirectAttributes ra, String recode) {
		System.out.println("MovieService.reservationCancel() 호출");
		ModelAndView mav = new ModelAndView();
		
		System.out.println("취소할 예매코드 : "+recode);
		
		mdao.deleteReservation(recode);
		
		ra.addFlashAttribute("msg","예매가 취소 되었습니다.");
		
		mav.setViewName("redirect:/ReservationList");
		
		
		return mav;
	}




	public ModelAndView reviewWrite(RedirectAttributes ra, ReviewDto review) {
		System.out.println("MovieService.reviewWrite() 호출");
		ModelAndView mav = new ModelAndView();
		
		System.out.println("관람평 정보 : " +review);
		mdao.insertReview(review);
		
		ra.addFlashAttribute("mag","관람평이 작성되었습니다.");
		mav.setViewName("redirect:/ReservationList");
		
		
		return mav;
	}




	public String getReviewList(String rvrecode) {
		System.out.println("MovieService.reviewList() 호출");
		
		ReviewDto reView = mdao.selectReviewList(rvrecode);

		
		Gson gson = new Gson();
		
		return gson.toJson(reView);
	}




	public ModelAndView searchList(String searchText) {
		System.out.println("MovieService.searchList() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("입력한 검색어 : " +searchText);
		
		// 영화 검색목록
		ArrayList<MovieDto> searchList = mdao.selectSearchList(searchText,"movie");
		
		// 예매 가능한 영화 검색 목록
		ArrayList<MovieDto> searchReMvList = mdao.selectSearchList(searchText, "schedule");
		
		
		
		mav.addObject("searchList", searchList);
		mav.addObject("searchReMvList", searchReMvList);
		mav.setViewName("Movie/MovieSearchResult");
		
		return mav;
	}










}

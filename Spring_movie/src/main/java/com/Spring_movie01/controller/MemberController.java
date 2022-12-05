package com.Spring_movie01.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Spring_movie01.dto.MemberDto;
import com.Spring_movie01.service.MemberService;

@Controller
public class MemberController {

	
	private ModelAndView mav;
	// ModelAndView라는 필드를 선언만 한것.
	// 데이터는 주지 않는다.
	
	@Autowired // 자동화 설정을 하기 위해서 명칭을 설정해야된다.
	private MemberService msvc; // = new MemberService();
	// 의존성주입 : 주입하려면 대상에 @Autowired를 선언, service클래스에 @Service선언, 스프링 스캔할 범위를 servlet.context.xml에 설정
	// 매번 선언을 할때마다 쓰는 것보다 공동으로 선언해주는 것이 서비스를 불러올때의 작성이 간편해진다.
	// 생성자로 객체를 생성했다.
	
	@RequestMapping(value = "/memberJoinForm")
	public String memberJoinForm( ) {
		
		System.out.println("회원가입 페이지 이동 요청");

		return "Member/MemberJoinForm";
	}
	// return이 null이거나 void일 경우 매핑된 주소.jsp를 찾아간다.(잘 사용안함)
	
	// 1ombok : getter, setter, equal, toString등을 자동으로 생성해주는 라이브러리
	@RequestMapping(value="/memberJoin")
	public ModelAndView memberJoin(MemberDto member) throws IllegalStateException, IOException {
		
		System.out.println("회원가입 요청");
		System.out.println(member);
		
		
		mav = msvc.memberJoin(member);
		// modelAndView는 서비스를 통해 불러온다.
		// ModelAndView의 객체가 생성이 되면 서비스에서 필요한 데이터와 이동할 페이지를 ModelAndView 객체에 저장해서 controller로 반환해주면 mav에 페이지명 / 데이터가 저장되어 웹브라우저로 전송한다.
		
		
		return mav; // return 기본값 : dispatcher, redirect는 따로 명령해야 한다.
		
		
		
	}
	
	@RequestMapping(value="/memeberIdCheck")
	public @ResponseBody String memberIdCheck(String inputId) {
		System.out.println("아이디 중복 확인 요청 ");
		System.out.println("입력한 아이디 : "+inputId);
		
		String idCheckResult = msvc.memberIdCheck(inputId);
		
		
		return idCheckResult;
		
		
	}
	
	@RequestMapping(value="/memberLoginForm")
	public String memberLogin(){
	System.out.println("로그인 페이지 이동요청");
	
		return "Member/MemberLoginForm";
	}
	
	
	
	@RequestMapping(value="/memberLogin")
	public ModelAndView memberLogin(String LoginMid, String LoginMpw, RedirectAttributes ra) {
		
		System.out.println("로그인 요청");
		
		mav = msvc.memberLogin(LoginMid,LoginMpw,ra);
		
		return mav;
		
	}
	
	
	@RequestMapping(value="/memberLogout")
	public ModelAndView memberLogout(RedirectAttributes ra) {
		System.out.println("로그아웃 요청");
		
		
		mav = msvc.memberLogout(ra);
		
		
		return mav;
	}
	
	@RequestMapping(value="/memberView")
	public ModelAndView memberView() {
		System.out.println("내정보페이지 이동 요청");
		
		
		mav = msvc.memberView();
		
		return mav;
		
		
		
		
	}
	
	
	@RequestMapping(value="kakaoLogin")
	public ModelAndView kakaoLogin(RedirectAttributes ra, String kakaoId, String kakaonickname, String kakaoEmail, String kakaoprofileurl) {
		System.out.println("카카오 로그인 요청");
		ModelAndView mav = msvc.kakaoLogin(ra,kakaoId,kakaonickname,kakaoEmail,kakaoprofileurl);
		
		
		return mav;
		
		
		
		
		
	}
	
	
	
		
}



// ModelAndView : 데이터와 페이지 url주소를 같이 저장하는 객체
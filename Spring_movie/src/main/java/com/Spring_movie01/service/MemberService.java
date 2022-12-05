package com.Spring_movie01.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Spring_movie01.dao.MemberDao;
import com.Spring_movie01.dto.MemberDto;

@Service 
// controller에서 @Autowired를 선언해서 자동화 설정을 하고 Service에서 언어테이션의 명칭을 설정해야 자동화 설정이 된다.
public class MemberService {
	

	
	@Autowired
	private MemberDao mdao;
	
	
	@Autowired
	private HttpSession session;
	
	
	// 2. 저장경로 설정
	private String savePath = "C:\\Users\\PC\\Documents\\workspace-spring-tool-suite-4-4.14.1.RELEASE\\Spring_movie\\src\\main\\webapp\\resources\\mprofileUpLoad";
	

	public ModelAndView memberJoin(MemberDto member) throws IllegalStateException, IOException {
	
		System.out.println("MemberService.memberJoin()");
		ModelAndView mav = new ModelAndView();
		// ModelAndView라는 객체를 통해 페이지/ 파일을 저장해서 
		// 페이지/ 파일도 저장할 수 있다.
		
		MultipartFile mfile = member.getMfile();
		// member안에 있는 mfile을 불러와서 MultipartFile mfile에 저장.
		
		String mprofile = "";
		if(!mfile.isEmpty()) {
			// isEmpty() : 비어있는지 확인 / !가 붙었기 때문에 있는지 확인.
			// 첨부 파일 있을 때만 실행.
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			// 1. 파일명 생성
			mprofile = uuid.toString()+"_"+mfile.getOriginalFilename();
			
			// 3. 프로필 이미지 파일 저장
			mfile.transferTo(new File(savePath, mprofile));
		}
		System.out.println(mprofile);
		member.setMprofile(mprofile);
		
		
		//  파일이름 
		System.out.println("mprofile : " + mprofile);
		// 파일은 mfile 필드에만 저장되어 있을 뿐, 서버에 저장된 상태는 아니다.
			
		
		// 주소처리
		member.setMaddress(member.getMpostcode()+"_"+member.getMaddr()
		+"_"+member.getMdetailAddr()+"_"+member.getMextraAddr());
		
		

		// 4.  회원가입처리 (dao를 불러서 Insert문 수행.)
		int joinResult = mdao.insertMember(member);
		
		
		mav.setViewName("redirect:/MovieMain");
		// Main이라는 페이지로 찾아서 return(페이지명)하라는 뜻.
		// Spring에서는 페이지 이름을 넘겨주는 형식이라 Board/boardview라고 보내게 되면 Board/boardView.jsp로 
		// 넘어가게 되므로 redirect 형식으로 보내기 위해서 redirect:/를 붙인다.
		
		
		return mav;
	}



	// 아이디 중복확인
	public String memberIdCheck(String inputId) {
		System.out.println("MemberService.memberJoinForm 호출");
		
		
		String joinSelect = mdao.getjoinSelect(inputId);
		
		if( joinSelect == null){
			return "ok";
			
			
		}else {
				
			return "No";
		
		}
		
	
	
	}
	
	
	// 로그인 기능
	public ModelAndView memberLogin(String LoginMid, String LoginMpw, RedirectAttributes ra) {
	
		
		System.out.println("MemberService.memberLogin() 호출");
		System.out.println("입력한 아이디 : "+LoginMid);
		System.out.println("입력한 비밀번호 : "+LoginMpw);
		
		ModelAndView mav = new ModelAndView();
		
		MemberDto MemberLogin = mdao.selectMemberLogin(LoginMid,LoginMpw);
		
		if(MemberLogin != null) {
			
			if(MemberLogin.getMstate() == 1) {
				
				ra.addFlashAttribute("msg", "이용 정지된 회원입니다.");
				mav.setViewName("redirect:/memberLoginForm");
			} else if(MemberLogin.getMstate() == 0) {
			
			session.setAttribute("LoginMid", MemberLogin.getMid());
			session.setAttribute("LoginProfile", MemberLogin.getMprofile());
			mav.setViewName("redirect:/MovieMain");
			
			ra.addFlashAttribute("msg","로그인 되었습니다");
			
			}
		}else {
		
			// 1. parameter로 보내게 될 경우
			// mav.addObject("msg","아이디 또는 비밀번호가 일치 하지 않습니다.");
			// mav.setViewName("member/MemberLoginForm"); 
			// parameter로 담아서 dispacher 방식으로 넘기게 될 경우에도 값을 쓸 수 있다.
			// 이경우 계속 유지가 되기때문에 해당 msg의 내용이 새로고침하면 계속 뜬다.
			 
			// ------------------------------------------------------------------------   
			
			 // 2. redirect방식으로 attribute에 담아 보내게 될 경우
			 ra.addFlashAttribute("msg","아이디 또는 비밀번호가 일치 하지 않습니다.");
			 mav.setViewName("redirect:/memberLoginForm");

			 // addFlashAttribute : Redirect형식으로 넘어갈 때만 일회용으로 사용되고 사라진다.	
			 // 예) "아이디 또는 비밀번호가 일치 하지 않습니다."가 일회용으로 사용되고 사라진다.
			 
			 // redirect방식이 아닌 dispacher방식으로 보내게 될 경우 사용 할 수 없다.( rediret: 필요 )
		
		
			
			 /* 비교 : parameter로 보내게 되면 해당 값이 계속 유지가 되어 계속 사용이 되지만,
			    redirect방식으로 attribute에 담아 보내게 되면 일회용으로 사용되고 사라진다. */
			
		}
		
		
		
		
		return mav;
		
		
		
		
	
	}


	
	// 로그아웃 기능
	public ModelAndView memberLogout(RedirectAttributes ra) {
		System.out.println("MemberService.memberLogout() 호출");
		
		ModelAndView mav = new ModelAndView();
		session.invalidate();

		// invalidate : 세션값을 초기화 시킨다.
		ra.addFlashAttribute("msg","로그아웃 되었습니다.");

		mav.setViewName("redirect:/MovieMain");

		
		return mav;
		
	}



	public ModelAndView memberView() {
		System.out.println("MemberService.memberView() 호출");
		
		ModelAndView mav = new ModelAndView();
		String loginId = (String) session.getAttribute("LoginMid");
		
		System.out.println("로그인 된 아이디 : "+loginId);

		MemberDto MemberView = mdao.selectMemberView(loginId);

		String maddress = MemberView.getMaddress();

		String[] maddress_arr = maddress.split("_");

		System.out.println(maddress_arr.length);
		
		if(maddress_arr.length >= 4) {
			MemberView.setMpostcode(maddress_arr[0]);
			MemberView.setMaddr(maddress_arr[1]);
			MemberView.setMdetailAddr(maddress_arr[2]);
			MemberView.setMextraAddr(maddress_arr[3]);
	
		}

		
		mav.addObject("MemberView", MemberView);
		mav.setViewName("Member/MemberView");

		
		
		return mav;
	}



	    public ModelAndView kakaoLogin(RedirectAttributes ra, String kakaoId, String kakaonickname, String kakaoEmail, String kakaoprofileurl) {
		System.out.println("MemberService.kakaoLogin() 호출");
		ModelAndView mav = new ModelAndView();
		
		
		MemberDto kakaoLogin = mdao.selectkakaoLogin(kakaoId);

		if(kakaoLogin != null) {
			
			
			session.setAttribute("LoginMid", kakaoLogin.getMid());
			session.setAttribute("LoginProfile", kakaoLogin.getMprofile());
			session.setAttribute("LoginMstate", kakaoLogin.getMstate());
			mav.setViewName("redirect:/MovieMain");

			ra.addFlashAttribute("msg","로그인 되었습니다");
			
			System.out.println(kakaoLogin);
		}else {
			
			int kakaoJoin = mdao.insertkakaoJoin(kakaoId,kakaonickname,kakaoEmail,kakaoprofileurl);
			
			if(kakaoJoin > 0 ) {
				
				
				mav.setViewName("redirect:/MemberLoginForm");
				
				ra.addFlashAttribute("msg","회원가입 되었습니다");
			
			
			}
			
			
		}
		
		
		
		return mav;
	}




	

}

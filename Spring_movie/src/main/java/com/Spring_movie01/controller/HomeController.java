package com.Spring_movie01.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		return "Main";
	}
	
	@RequestMapping(value= "/MovieMainPage")
	public String MovieMainPage() {
		
		
		
		return "MovieMain";
		
	}
	
	
	@RequestMapping(value= "/MovieMain", method = RequestMethod.GET)
	public String Main2() {
		
		
		
		
		return "MovieMain";
		
	}
	

	
	
	@RequestMapping(value="/AdminMainPage")
	public String AdminMainPage(){
		
		return "AdminMain";
		
	}
	
	@RequestMapping(value= "/AdminMain", method = RequestMethod.GET)
	public String Main3(String inputPw, RedirectAttributes ra) {
		
		String pw ="1234";
		if(pw.equals(inputPw)) {
			return "AdminMain";
			
		}else {
			ra.addFlashAttribute("msg","관리자 비밀번호가 일치하지 않습니다.");
			return "redirect:/";
			
		}
		
		
		
		
	}
	
	@RequestMapping(value="/ChatPageTest")
	public String ChatPageTest(){
		
		return "ChatPageTest";
		
	}

	@RequestMapping(value="/ChatPage")
	public String ChatPage() {
		System.out.println("채팅 페이지 이동 요청");
		return "ChatPage";
	}
	
}

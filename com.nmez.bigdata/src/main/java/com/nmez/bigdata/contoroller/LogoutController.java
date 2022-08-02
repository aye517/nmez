package com.nmez.bigdata.contoroller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LogoutController {

	public LogoutController() {
//		System.out.println("User Controller 생성");
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();

		System.out.println(session);
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg","로그아웃 되었습니다.");
		mav.addObject("url","/bigdata");
		mav.setViewName("main/alert");
		
		return mav;
	}
	
	

} //class end 

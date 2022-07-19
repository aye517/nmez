package com.nmez.bigdata.contoroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nmez.bigdata.vo.UserVO;


@Controller
public class MainController {

	public MainController() {
//		System.out.println("Main Controller 생성");
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "/main/Header";
	}
	
	@RequestMapping(value = "/logo", method = RequestMethod.GET)
	public String logoMain() {
		return "/main/Main";
	}
	
	
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public ModelAndView signUp(UserVO vo) { //회원가입 실패시 입력정보 전달
		ModelAndView mav = new ModelAndView();
		mav.addObject("failvo", vo);
		mav.setViewName("/user/SignUp");
		return mav;
	}
	
	
	
	
}

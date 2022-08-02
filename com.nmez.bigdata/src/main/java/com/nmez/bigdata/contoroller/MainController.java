package com.nmez.bigdata.contoroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.nmez.bigdata.vo.UserVO;


@Controller
@SessionAttributes("session")
public class MainController {

	public MainController() {
//		System.out.println("Main Controller 생성");
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "/main/Main";
	}
	
	@RequestMapping(value = "/logo", method = RequestMethod.GET)
	public String logoMain() {
		return "redirect:/";
	}
	
	
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public ModelAndView signUp(UserVO vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/user/SignUp");
		return mav;
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView mypage() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("session"); //정보수정후 바뀐 세션 add
		mav.setViewName("/user/Mypage");
		return mav;
	}
	
	@RequestMapping(value = "/cloud", method = RequestMethod.GET)
	public ModelAndView cloud() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/bigdata/cloud/Cloud");
		return mav;
	}
	

	@RequestMapping(value = "/portfolio", method = RequestMethod.GET)
	public ModelAndView pfMain() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/PfMain");
		return mav;
	}
	
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public ModelAndView qna() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/QnA");
		return mav;
	}
	
	
}

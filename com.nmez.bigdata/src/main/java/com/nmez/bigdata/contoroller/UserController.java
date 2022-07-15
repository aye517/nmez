package com.nmez.bigdata.contoroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nmez.bigdata.service.UserService;
import com.nmez.bigdata.vo.UserVO;


@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	public UserController() {
//		System.out.println("User Controller 생성");
	}
	
	@PostMapping("/signUp")
	public ModelAndView singUpPost(UserVO vo) {
		System.out.println("가입요청정보 :"+vo); //받아온값 확인
		//값 무결성 check(추후)	
		ModelAndView mav = new ModelAndView();		
		int rs = userService.userSignUp(vo); //insert작업 실시
		if(rs == 1) {
			mav.addObject("msg","회원가입 성공. 메인 페이지로 돌아갑니다.");
			mav.addObject("url","/bigdata");
			mav.setViewName("alert");
		}else {
			System.out.println("가입실패");
			mav.addObject("failvo", vo); //실패시 입력값 리턴
			mav.setViewName("redirect:/signUp"); //get방식
		}		
		return mav;

	}
	
	
	
}

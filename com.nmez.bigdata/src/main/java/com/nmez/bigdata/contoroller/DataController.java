package com.nmez.bigdata.contoroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nmez.bigdata.vo.UserVO;


@Controller
public class DataController {

	public DataController() {
//		System.out.println("Main Controller 생성");
	}
	
	@RequestMapping(value = "/DataMain", method = RequestMethod.GET)
	public String signUp(UserVO vo) {

		return "/bigdata/DataMain";
	}
	
	
	
	
}

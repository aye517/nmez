package com.nmez.bigdata.contoroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {

	public MainController() {
		System.out.println("Main Controller 생성");
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "Main/Main";
	}
	
	
}

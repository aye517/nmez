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
	
	@RequestMapping(value = "/MapTest", method = RequestMethod.GET)
	public String mapTest(UserVO vo) {

		return "/bigdata/map/MapTest";
	}
	
	@RequestMapping(value = "/ChartTest", method = RequestMethod.GET)
	public String chartTest(UserVO vo) {

		return "/bigdata/chart/ChartTest";
	}
	
	
	
}

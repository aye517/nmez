package com.nmez.bigdata.contoroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nmez.bigdata.service.DataService;
import com.nmez.bigdata.vo.DataVO;
import com.nmez.bigdata.vo.P_dataVO;
import com.nmez.bigdata.vo.S_dataVO;
import com.nmez.bigdata.vo.T_dataVO;


@Controller
public class MapController {

	@Autowired
	DataService dataService;
	
	public MapController() {
//		System.out.println("Data Controller 생성");
	}
	
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String mapTest(DataVO vo) {

		return "/bigdata/map/Map";
	}
	
	
	@RequestMapping(value = "/getChart", method = RequestMethod.GET)
	public ModelAndView getChart(String code) {
		ModelAndView mav = new ModelAndView();
		System.out.println(code);
		
		List<T_dataVO> t_dataList = dataService.timeData(code);
		List<S_dataVO> s_dataList = dataService.genderData(code);
		P_dataVO p_data = dataService.popData(code);
		
		mav.addObject("t_dataList", t_dataList);
		mav.addObject("p_data", p_data);
		mav.addObject("s_dataList", s_dataList);
		
		mav.setViewName("/bigdata/map/MapToChart");
		return mav;
	}
	
	
	
	
}

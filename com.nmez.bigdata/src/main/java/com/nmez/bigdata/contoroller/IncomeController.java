package com.nmez.bigdata.contoroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nmez.bigdata.service.IncomeService;
import com.nmez.bigdata.vo.IsexVO;

@Controller
public class IncomeController {

	@Autowired
	IncomeService incomService;
	
	public IncomeController() {
//		System.out.println("Main Controller 생성");
	}
	
	@RequestMapping(value = "/income", method = RequestMethod.GET)
	public ModelAndView incomeMain() {
		List<IsexVO> guList = incomService.guList();
		List<IsexVO> dongList = incomService.dongList();
		List<IsexVO> sectorList = incomService.sectorList();
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("guList", guList);
		mav.addObject("dongList",dongList);
		mav.addObject("sectorList",sectorList);
		mav.setViewName("/bigdata/income/IncomeMain");
		return mav;
	}

	@RequestMapping(value = "/incomeCharts", method = RequestMethod.GET)
	public ModelAndView selectData(String gu, String dong, String sector) {
		System.out.println("입력값"+gu+dong+sector);
		List<IsexVO> guList = incomService.guList();
		List<IsexVO> dongList = incomService.dongList();
		List<IsexVO> sectorList = incomService.sectorList();
		
		//piedata가져오기
		IsexVO s_vo = new IsexVO();
		s_vo.setGu(gu);
		s_vo.setDong(dong);
		s_vo.setSector(sector);
		System.out.println("전달 vo"+s_vo);
		List<IsexVO> pieData = incomService.pieData(s_vo);
		System.out.println(pieData);
	
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("guList", guList);
		mav.addObject("dongList",dongList);
		mav.addObject("sectorList",sectorList);
		mav.addObject("pieData", pieData);
		mav.setViewName("/bigdata/income/IncomeMain");
		return mav;
	}
	
	
}

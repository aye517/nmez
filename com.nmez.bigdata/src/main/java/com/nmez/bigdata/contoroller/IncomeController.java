package com.nmez.bigdata.contoroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nmez.bigdata.service.IncomeService;
import com.nmez.bigdata.vo.IageVO;
import com.nmez.bigdata.vo.IdayVO;
import com.nmez.bigdata.vo.IsexVO;
import com.nmez.bigdata.vo.ItimeVO;

@Controller
public class IncomeController {

	@Autowired
	IncomeService incomeService;
	
	public IncomeController() {
//		System.out.println("Main Controller 생성");
	}
	
	@RequestMapping(value = "/income", method = RequestMethod.GET)
	public ModelAndView incomeMain() {
		List<IsexVO> guList = incomeService.guList();
		List<IsexVO> dongList = incomeService.dongList();
		List<IsexVO> sectorList = incomeService.sectorList();
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("guList", guList);
		mav.addObject("dongList",dongList);
		mav.addObject("sectorList",sectorList);
		mav.setViewName("/bigdata/income/IncomeMain");
		return mav;
	}

	@RequestMapping(value = "/incomeCharts", method = RequestMethod.GET)
	public ModelAndView selectData(String gu, String dong, String sector) {
		//System.out.println("입력값"+gu+dong+sector);
		List<IsexVO> guList = incomeService.guList();
		List<IsexVO> dongList = incomeService.dongList();
		List<IsexVO> sectorList = incomeService.sectorList();
		
		//piedata가져오기
		IsexVO s_vo = new IsexVO();
		s_vo.setGu(gu);
		s_vo.setDong(dong);
		s_vo.setSector(sector);
		//System.out.println("전달 vo"+s_vo);
		List<IsexVO> pieData = incomeService.pieData(s_vo);
		//System.out.println(pieData);
		
		//linedata가져오기
		ItimeVO t_vo = new ItimeVO();
		t_vo.setGu(gu);
		t_vo.setDong(dong);
		t_vo.setSector(sector);
		List<ItimeVO> lineData = incomeService.lineData(t_vo);
		//System.out.println(lineData);
		
		//ageBardata 가져오기
		IageVO a_vo = new IageVO();
		a_vo.setGu(gu);
		a_vo.setDong(dong);
		a_vo.setSector(sector);
		List<IageVO> ageBarData = incomeService.ageBarData(a_vo);
		//System.out.println(ageBarData);
		
		//dayBarData
		IdayVO d_vo = new IdayVO();
		d_vo.setGu(gu);
		d_vo.setDong(dong);
		d_vo.setSector(sector);
		List<IdayVO> dayBarData = incomeService.dayBarData(d_vo);
		//System.out.println(dayBarData);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("guList", guList);
		mav.addObject("dongList",dongList);
		mav.addObject("sectorList",sectorList);
		
		mav.addObject("pieData", pieData);
		mav.addObject("lineData", lineData);
		mav.addObject("ageBarData", ageBarData);
		mav.addObject("dayBarData", dayBarData);

		mav.setViewName("/bigdata/income/IncomeMain");
		return mav;
	}
	
	
}

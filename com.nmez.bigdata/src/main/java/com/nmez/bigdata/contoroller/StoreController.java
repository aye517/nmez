package com.nmez.bigdata.contoroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nmez.bigdata.service.IncomeService;
import com.nmez.bigdata.service.StoreService;
import com.nmez.bigdata.vo.IageVO;
import com.nmez.bigdata.vo.IdayVO;
import com.nmez.bigdata.vo.IsexVO;
import com.nmez.bigdata.vo.ItimeVO;
import com.nmez.bigdata.vo.StoreVO;

@Controller
public class StoreController {

	@Autowired
	StoreService storeService;
	
	public StoreController() {
//		System.out.println("Main Controller 생성");
	}
	
	@RequestMapping(value = "/store", method = RequestMethod.GET)
	public ModelAndView storeMain() {
		List<StoreVO> guList = storeService.guList();
		List<StoreVO> categoryList = storeService.categoryList();
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("guList", guList);
		mav.addObject("categoryList", categoryList);
		mav.setViewName("/bigdata/store/StoreMain");
		return mav;
	}

	@RequestMapping(value = "/storeChart", method = RequestMethod.GET)
	public ModelAndView selectData(StoreVO vo) {
		System.out.println("vo==="+vo);
		List<StoreVO> guList = storeService.guList();
		List<StoreVO> categoryList = storeService.categoryList();
		
		ModelAndView mav = new ModelAndView();
		
		List<StoreVO> dataList = storeService.dataList(vo);
		System.out.println(dataList);
		boolean isLoad = true;
		
		mav.addObject("guList", guList);
		mav.addObject("categoryList", categoryList);
		mav.addObject("dataList", dataList);
		mav.addObject("isLoad", isLoad);

		mav.setViewName("/bigdata/store/StoreMain");
		return mav;
	}
	
	
}

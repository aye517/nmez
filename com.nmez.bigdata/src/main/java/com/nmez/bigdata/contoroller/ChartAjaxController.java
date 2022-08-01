package com.nmez.bigdata.contoroller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.nmez.bigdata.service.IncomeService;
import com.nmez.bigdata.service.StoreService;
import com.nmez.bigdata.vo.IsexVO;
import com.nmez.bigdata.vo.StoreVO;

@RestController
public class ChartAjaxController {

	@Autowired
	IncomeService incomeService;
	
	@Autowired
	StoreService storeService;
	
	public ChartAjaxController() {
		//System.out.println("@RestController 생성");
	}
	
	@ResponseBody
	@RequestMapping(value = "/getDong", method = RequestMethod.POST)
	public List<IsexVO> getDong(@RequestBody IsexVO vo) {
		//System.out.println(vo.getGu());
		List<IsexVO> dongList = incomeService.guDongList(vo);
		//System.out.println("rs== " + dongList);
		return dongList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getStoreDong", method = RequestMethod.POST)
	public List<StoreVO> getStoreDong(@RequestBody StoreVO vo) {
		List<StoreVO> dongList = storeService.dongList(vo);
		//System.out.println("rs== " + dongList);
		return dongList;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getStoreSector", method = RequestMethod.POST)
	public List<StoreVO> getStoreSector(@RequestBody StoreVO vo) {
		System.out.println(vo);
		List<StoreVO> sectorList = storeService.sectorList(vo);
		System.out.println(sectorList);
		return sectorList;
	}
}

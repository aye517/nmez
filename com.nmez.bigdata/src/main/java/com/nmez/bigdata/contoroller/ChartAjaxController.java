package com.nmez.bigdata.contoroller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.nmez.bigdata.service.IncomeService;
import com.nmez.bigdata.vo.IsexVO;

@RestController
public class ChartAjaxController {

	@Autowired
	IncomeService incomeService;
	
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
	
}

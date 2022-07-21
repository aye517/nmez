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
public class DataController {

	@Autowired
	DataService dataService;
	

	public DataController() {
//		System.out.println("Data Controller 생성");
	}
	
	@RequestMapping(value = "/MapTest", method = RequestMethod.GET)
	public String mapTest(DataVO vo) {

		return "/bigdata/map/MapTest";
	}
	
	@RequestMapping(value = "/chartTest", method = RequestMethod.GET)
	public String chartTest(DataVO vo) {
		return "/bigdata/chart/ChartTest";
	}
	
	@RequestMapping(value = "/chartTest", method = RequestMethod.POST)
	public ModelAndView test(DataVO vo) {
		System.out.println("입력한 행정코드:"+vo);
		List<DataVO> dataList = dataService.test(vo);
		System.out.println("dataList="+dataList);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dataList", dataList);
		mav.setViewName("bigdata/chart/ChartTest");
		return mav;
	}
	
	@RequestMapping(value = "/lineChart", method = RequestMethod.GET)
	public String chart(T_dataVO vo) {
		return "/bigdata/chart/LineChart";
	}
	
	@RequestMapping(value = "/lineChart", method = RequestMethod.POST)
	public ModelAndView chartPost(T_dataVO vo) {
		System.out.println("입력한 행정코드:"+vo);
		List<T_dataVO> t_dataList = dataService.timeData(vo);
		System.out.println("t_dataList="+t_dataList);
		ModelAndView mav = new ModelAndView();
		mav.addObject("t_dataList", t_dataList);
		mav.setViewName("bigdata/chart/LineChart");
		return mav;
	}
	
	@RequestMapping(value = "/pieChart", method = RequestMethod.GET)
	public String pieChartG(P_dataVO vo) {
		return "/bigdata/chart/PieChart";
	}
	
	@RequestMapping(value = "/pieChart", method = RequestMethod.POST)
	public ModelAndView pieChartP(P_dataVO vo) {
		System.out.println("p_code값 : "+ vo);
		P_dataVO p_data = dataService.popData(vo);
		
		ModelAndView mav = new ModelAndView();
		System.out.println("받아온 data : " + p_data);
		mav.addObject("p_data", p_data);
		mav.setViewName("bigdata/chart/PieChart");
		return mav;
	}
	
	
	@RequestMapping(value = "/barChart", method = RequestMethod.GET)
	public String barChartG(S_dataVO vo) {
		return "/bigdata/chart/BarChart";
	}
	
	@RequestMapping(value = "/barChart", method = RequestMethod.POST)
	public ModelAndView barChartP(S_dataVO vo) {
		System.out.println("s_code값 : "+ vo);
		List<S_dataVO> s_dataList = dataService.genderData(vo);
		
		ModelAndView mav = new ModelAndView();
		System.out.println("받아온 dataList : " + s_dataList);
		mav.addObject("s_dataList", s_dataList);
		mav.setViewName("bigdata/chart/BarChart");
		return mav;
	}
	
}

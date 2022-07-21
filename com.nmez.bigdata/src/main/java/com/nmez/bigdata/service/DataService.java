package com.nmez.bigdata.service;

import java.util.List;

import com.nmez.bigdata.vo.DataVO;
import com.nmez.bigdata.vo.P_dataVO;
import com.nmez.bigdata.vo.S_dataVO;
import com.nmez.bigdata.vo.T_dataVO;

public interface DataService {

	public List<DataVO> test(DataVO vo);

	public List<T_dataVO> timeData(T_dataVO vo);

	public P_dataVO popData(P_dataVO vo);

	public List<S_dataVO> genderData(S_dataVO vo);
}
	


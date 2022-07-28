package com.nmez.bigdata.service;

import java.util.List;

import com.nmez.bigdata.vo.IsexVO;

public interface IncomeService {
	
	public List<IsexVO> guList();

	public List<IsexVO> dongList();

	List<IsexVO> sectorList();

	List<IsexVO> pieData(IsexVO vo);
	
}

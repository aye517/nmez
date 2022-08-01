package com.nmez.bigdata.service;

import java.util.List;

import com.nmez.bigdata.vo.IageVO;
import com.nmez.bigdata.vo.IdayVO;
import com.nmez.bigdata.vo.IsexVO;
import com.nmez.bigdata.vo.ItimeVO;

public interface IncomeService {
	
	public List<IsexVO> guList();

	public List<IsexVO> dongList();
	
	public List<IsexVO> guDongList(IsexVO vo);

	public List<IsexVO> sectorList();

	public List<IsexVO> pieData(IsexVO vo);
	
	public List<ItimeVO> lineData(ItimeVO vo);
	
	public List<IageVO> ageBarData(IageVO vo);
	
	public List<IdayVO> dayBarData(IdayVO vo);	
	
}

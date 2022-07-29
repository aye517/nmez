package com.nmez.bigdata.service;

import java.util.List;

import com.nmez.bigdata.vo.IageVO;
import com.nmez.bigdata.vo.IdayVO;
import com.nmez.bigdata.vo.IsexVO;
import com.nmez.bigdata.vo.ItimeVO;
import com.nmez.bigdata.vo.StoreVO;

public interface StoreService {
	
	public List<StoreVO> guList();

	public List<StoreVO> dongList(StoreVO vo);
	
	public List<StoreVO> categoryList();

	public List<StoreVO> sectorList(StoreVO vo);

	public List<StoreVO> dataList(StoreVO vo);
	
}

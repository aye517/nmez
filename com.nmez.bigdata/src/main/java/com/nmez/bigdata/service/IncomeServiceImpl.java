package com.nmez.bigdata.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmez.bigdata.dao.IncomeDAO;
import com.nmez.bigdata.vo.IageVO;
import com.nmez.bigdata.vo.IdayVO;
import com.nmez.bigdata.vo.IsexVO;
import com.nmez.bigdata.vo.ItimeVO;

@Service
public class IncomeServiceImpl implements IncomeService {

	@Autowired
	IncomeDAO incomeDao;

	@Override
	public List<IsexVO> guList() {
		return incomeDao.guList();
	}

	@Override
	public List<IsexVO> dongList() {
		return incomeDao.dongList();
	}
	
	@Override
	public List<IsexVO> guDongList(IsexVO vo) {
		return incomeDao.guDongList(vo);
	}

	
	@Override
	public List<IsexVO> sectorList() {
		return incomeDao.sectorList();
	}
	
	@Override
	public List<IsexVO> pieData(IsexVO vo) {
		return incomeDao.pieData(vo);
	}

	@Override
	public List<ItimeVO> lineData(ItimeVO vo) {
		return  incomeDao.lineData(vo);
	}

	@Override
	public List<IageVO> ageBarData(IageVO vo) {
		return  incomeDao.ageBarData(vo);
	}

	@Override
	public List<IdayVO> dayBarData(IdayVO vo) {
		return  incomeDao.dayBarData(vo);
	}



	
	
	

	
}

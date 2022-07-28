package com.nmez.bigdata.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmez.bigdata.dao.IncomeDAO;
import com.nmez.bigdata.vo.IsexVO;

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
	public List<IsexVO> sectorList() {
		return incomeDao.sectorList();
	}
	
	@Override
	public List<IsexVO> pieData(IsexVO vo) {
		return incomeDao.pieData(vo);
	}


	
	
	

	
}

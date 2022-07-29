package com.nmez.bigdata.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmez.bigdata.dao.DataDAO;
import com.nmez.bigdata.vo.DataVO;
import com.nmez.bigdata.vo.P_dataVO;
import com.nmez.bigdata.vo.S_dataVO;
import com.nmez.bigdata.vo.T_dataVO;

@Service
public class DataServiceImpl implements DataService {

	@Autowired
	DataDAO dataDao;

	@Override
	public List<DataVO> test(DataVO vo) {
		return dataDao.testList(vo);
	}
	
	@Override
	public List<T_dataVO> timeData(T_dataVO vo) {
		return dataDao.timeData(vo);
	}
	
	@Override
	public List<T_dataVO> timeData(String code) {
		return dataDao.timeData(code);
	}

	@Override
	public P_dataVO popData(P_dataVO vo) {
		return dataDao.popData(vo);
	}
	
	@Override
	public P_dataVO popData(String code) {
		return dataDao.popData(code);
	}

	@Override
	public List<S_dataVO> genderData(S_dataVO vo) {
		return dataDao.genderData(vo);
	}

	@Override
	public List<S_dataVO> genderData(String code) {
		return dataDao.genderData(code);
	}
	
}

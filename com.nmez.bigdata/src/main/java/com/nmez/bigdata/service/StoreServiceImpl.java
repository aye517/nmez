package com.nmez.bigdata.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmez.bigdata.dao.storeDAO;
import com.nmez.bigdata.vo.StoreVO;


@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	storeDAO storeDao;

	@Override
	public List<StoreVO> guList() {
		return storeDao.guList();
	}

	@Override
	public List<StoreVO> dongList(StoreVO vo) {
		return storeDao.dongList(vo);
	}

	@Override
	public List<StoreVO> categoryList() {
		return storeDao.categoryList();
	}

	@Override
	public List<StoreVO> sectorList(StoreVO vo) {
		return storeDao.sectorList(vo);
	}

	@Override
	public List<StoreVO> dataList(StoreVO vo) {
		return storeDao.storeData(vo);
	}
	
	



	
	
	

	
}

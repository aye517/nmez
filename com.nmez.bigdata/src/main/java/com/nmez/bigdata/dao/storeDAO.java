package com.nmez.bigdata.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nmez.bigdata.vo.IageVO;
import com.nmez.bigdata.vo.IdayVO;
import com.nmez.bigdata.vo.IsexVO;
import com.nmez.bigdata.vo.ItimeVO;
import com.nmez.bigdata.vo.StoreVO;

@Repository
public class storeDAO {

	public storeDAO() {
	}
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<StoreVO> guList() {
		return sqlSessionTemplate.selectList("StoreVO.gu");
	}
	
	public List<StoreVO> categoryList() {
		return sqlSessionTemplate.selectList("StoreVO.category");
	}
	
	public List<StoreVO> dongList(StoreVO vo) {
		return sqlSessionTemplate.selectList("StoreVO.dong",vo);
	}
	
	public List<StoreVO> sectorList(StoreVO vo) {
		return sqlSessionTemplate.selectList("StoreVO.sector",vo);
	}

	public List<StoreVO> storeData(StoreVO vo) {
		List<StoreVO> dataList = sqlSessionTemplate.selectList("StoreVO.selectData", vo);
		System.out.println("dao==="+dataList);
		return sqlSessionTemplate.selectList("StoreVO.selectData", vo);
	}

	
} //class end

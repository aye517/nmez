package com.nmez.bigdata.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nmez.bigdata.vo.DataVO;
import com.nmez.bigdata.vo.IsexVO;
import com.nmez.bigdata.vo.P_dataVO;
import com.nmez.bigdata.vo.S_dataVO;
import com.nmez.bigdata.vo.T_dataVO;
import com.nmez.bigdata.vo.UserVO;

@Repository
public class IncomeDAO {

	public IncomeDAO() {
		//System.out.println("@Data리포지토리 스프링 생성");
	}
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<IsexVO> guList() {
		return sqlSessionTemplate.selectList("IsexVO.gu");
	}

	public List<IsexVO> dongList() {
		return sqlSessionTemplate.selectList("IsexVO.dong");
	}

	public List<IsexVO> sectorList() {
		return sqlSessionTemplate.selectList("IsexVO.sector");
	}
	
	public List<IsexVO> pieData(IsexVO vo) {
		return sqlSessionTemplate.selectList("IsexVO.selectData", vo);
		
	}

	
} //class end

package com.nmez.bigdata.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nmez.bigdata.vo.DataVO;
import com.nmez.bigdata.vo.P_dataVO;
import com.nmez.bigdata.vo.S_dataVO;
import com.nmez.bigdata.vo.T_dataVO;
import com.nmez.bigdata.vo.UserVO;

@Repository
public class DataDAO {

	public DataDAO() {
		System.out.println("@Data리포지토리 스프링 생성");
	}
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<DataVO> testList(DataVO vo) {
		return sqlSessionTemplate.selectList("DataVO.test",vo);
	}
	
	public List<T_dataVO> timeData(T_dataVO vo) {
		return sqlSessionTemplate.selectList("T_dataVO.data",vo);
	}

	public P_dataVO popData(P_dataVO vo) {
		return sqlSessionTemplate.selectOne("P_dataVO.data",vo);
	}

	public List<S_dataVO> genderData(S_dataVO vo) {
		return sqlSessionTemplate.selectList("S_dataVO.data",vo);
	}
	
	
} //class end

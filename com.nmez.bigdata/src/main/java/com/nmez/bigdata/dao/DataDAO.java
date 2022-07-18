package com.nmez.bigdata.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nmez.bigdata.vo.UserVO;

@Repository
public class DataDAO {

	public DataDAO() {
		System.out.println("@Data리포지토리 스프링 생성");
	}
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
} //class end

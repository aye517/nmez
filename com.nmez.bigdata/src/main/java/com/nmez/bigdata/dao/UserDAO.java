package com.nmez.bigdata.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nmez.bigdata.vo.UserVO;

@Repository
public class UserDAO {

	public UserDAO() {
		System.out.println("@리포지토리 스프링 생성");
	}
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public int userSingUp(UserVO vo) {
		return sqlSessionTemplate.insert("UserVO.insert", vo);
		
	}

	public int userIdCheck(String uId) {
		return sqlSessionTemplate.selectOne("uIdCheck", uId);
	}
				
} //class end
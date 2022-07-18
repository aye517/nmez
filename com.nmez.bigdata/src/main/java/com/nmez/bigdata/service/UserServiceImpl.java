package com.nmez.bigdata.service;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmez.bigdata.dao.UserDAO;
import com.nmez.bigdata.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDao;
	
	@Override
	public int userSignUp(UserVO vo) {
		return userDao.userSingUp(vo);
	}

	@Override
	public int userIdCheck(String uId) {
		return userDao.userIdCheck(uId);
	}

	
}

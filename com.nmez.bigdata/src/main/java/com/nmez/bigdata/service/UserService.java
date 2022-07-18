package com.nmez.bigdata.service;


import com.nmez.bigdata.vo.UserVO;

public interface UserService {
	
	public int userSignUp(UserVO vo);

	public int userIdCheck(String uId);
}

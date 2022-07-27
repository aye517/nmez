package com.nmez.bigdata.service;


import com.nmez.bigdata.vo.UserVO;

public interface UserService {
	
	public int userSignUp(UserVO vo);

	public int userIdCheck(String uId);

	public UserVO userLogin(UserVO vo);

	public int userUpdate(UserVO vo);

	public int pwUpdate(UserVO vo);

	public int userDrop(UserVO vo);
}

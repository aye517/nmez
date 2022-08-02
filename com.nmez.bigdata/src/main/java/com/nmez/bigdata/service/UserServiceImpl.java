package com.nmez.bigdata.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import com.nmez.bigdata.dao.UserDAO;
import com.nmez.bigdata.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDao;
	
	@Autowired
	private MailSender mailSender;
	
	@Override
	public int userSignUp(UserVO vo) {
		return userDao.userSingUp(vo);
	}

	@Override
	public int userIdCheck(String uId) {
		return userDao.userIdCheck(uId);
	}

	@Override
	public UserVO userLogin(UserVO vo) {
		return userDao.userLogin(vo);
	}

	@Override
	public int userUpdate(UserVO vo) {
		return userDao.userUpdate(vo);
	}

	@Override
	public int pwUpdate(UserVO vo) {
		return userDao.pwUpdate(vo);
	}

	@Override
	public int userDrop(UserVO vo) {
		return userDao.userDrop(vo);
	}

	@Override
	public void sendEmail(String toAddress, String fromAddress, String subject, String msgBody) {
		SimpleMailMessage smm = new SimpleMailMessage();
		smm.setFrom(fromAddress);
		smm.setTo(toAddress);
		smm.setSubject(subject);
		smm.setText(msgBody);
		
		mailSender.send(smm);
	}

	
}

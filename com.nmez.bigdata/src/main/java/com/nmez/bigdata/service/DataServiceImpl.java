package com.nmez.bigdata.service;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmez.bigdata.dao.DataDAO;
import com.nmez.bigdata.dao.UserDAO;
import com.nmez.bigdata.vo.UserVO;

@Service
public class DataServiceImpl implements DataService {

	@Autowired
	DataDAO dataDao;
	


	
}

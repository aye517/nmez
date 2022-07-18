package com.nmez.bigdata.contoroller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.nmez.bigdata.service.UserService;
import com.nmez.bigdata.vo.UserVO;


@RestController
public class UserAjaxController {

	@Autowired
	UserService userService;
	
	public UserAjaxController() {
		System.out.println("@RestController 생성");
	}

	@ResponseBody
	@RequestMapping(value = "bigdata/uIdCheck")
	public int uIdCheck(@RequestBody String uId) {
		String sUid = uId.substring(4);
		System.out.println("id 중복체크 id =" + sUid);
		int rs = userService.userIdCheck(sUid);
		System.out.println("id 중복 체크 메서드 실행" + sUid + rs);
		return rs;
	}
	
	
}

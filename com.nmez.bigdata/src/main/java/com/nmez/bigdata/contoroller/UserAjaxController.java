package com.nmez.bigdata.contoroller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		//System.out.println("id 중복체크 id =" + sUid);
		int rs = userService.userIdCheck(sUid);
		//System.out.println("id 중복 체크 메서드 실행" + sUid + rs);
		return rs;
	}

	
	@ResponseBody
	@RequestMapping(value = "user/pwUpdate", method = RequestMethod.POST)
	public int pwUpdate(@RequestBody UserVO vo) {
		System.out.println("ajax실행");
//		String sUid = uId.substring(4);
//		String sUpw = uPw.substring(4);
//		UserVO vo = new UserVO();
//		vo.setuId(sUid);
//		vo.setuPw(sUpw);
		System.out.println("수정요청정보: "+ vo);
		int rs = userService.pwUpdate(vo);
		System.out.println("rs== "+rs);
		return rs;
	}
	
	
}

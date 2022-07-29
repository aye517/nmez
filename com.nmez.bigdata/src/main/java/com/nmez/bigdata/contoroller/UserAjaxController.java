package com.nmez.bigdata.contoroller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	@RequestMapping(value = "pwUpdate", method = RequestMethod.POST)
	public int pwUpdate(@RequestBody UserVO vo) {
		System.out.println("pw ajax실행");
		//System.out.println("수정요청정보: "+ vo);
		int rs = userService.pwUpdate(vo);
		System.out.println("rs== "+rs);
		return rs;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "sessionOut")
	public int uIdCheck(HttpSession session) {
		System.out.println("session out ajax 실행");
		session.invalidate();
		int rs = 0;
		if(session != null) {
			rs = 1;
		}
		System.out.println("out됐으면 rs=1=="+rs);
		return rs;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "userDrop", method = RequestMethod.POST)
	public int userDrop(@RequestBody UserVO vo) {
		//System.out.println("drop ajax실행 vo" + vo);
		int rs = userService.userDrop(vo);
		//System.out.println("rs== "+rs);
		return rs;
	}
	
}

package com.nmez.bigdata.contoroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.Session;
import com.nmez.bigdata.service.UserService;
import com.nmez.bigdata.vo.UserVO;


@Controller
@SessionAttributes("session")
public class UserController {

	@Autowired
	private UserService userService;
	
	public UserController() {
//		System.out.println("User Controller 생성");
	}
	
	@PostMapping("/signUp")
	public ModelAndView singUpPost(UserVO vo) {
		System.out.println("가입요청정보 :"+vo); //받아온값 확인
		//값 무결성 check(추후)	
		ModelAndView mav = new ModelAndView();		

		//insert작업 실시
		int rs = userService.userSignUp(vo); 
		if(rs == 1) {
			mav.addObject("msg","회원가입 성공. 메인 페이지로 돌아갑니다.");
			mav.addObject("url","/bigdata");
			mav.setViewName("main/alert");
		}else {
			System.out.println("가입실패");
			mav.addObject("failvo", vo); //실패시 입력값 리턴
			mav.setViewName("redirect:/signUp"); //get방식
		}		
		return mav;
	}
	
	@PostMapping("/login")
	public ModelAndView login(UserVO vo, HttpServletRequest request) {
		System.out.println("입력받은값:"+vo);
		String insertId = vo.getuId();
		String insertPw = vo.getuPw();
		
		UserVO userInfo = userService.userLogin(vo);
		System.out.println("받아온값:" + userInfo);
		
		ModelAndView mav = new ModelAndView();
		if(userInfo != null) {
			if(userInfo.getuPw().equals(insertPw)) {
				HttpSession session = request.getSession(); //세션 생성
				session.setAttribute("session", userInfo);
				System.out.println("session==" + session);
				mav.setViewName("redirect:/");
			}else{
				System.out.println("비번틀림");
				mav.addObject("msg","입력이 틀렸거나 없는 회원입니다.");
				mav.addObject("state","nope"); //헤더에서 받을 파라미터 > 다시모달창 띄우기
				mav.addObject("url","/bigdata"); //string그대로 반환
				mav.setViewName("main/alert");
			}
		};
		return mav; 		
	}
		
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String modifyGet() {
		return "user/Modify";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView modifyPost(UserVO vo) {
		System.out.println("수정요청정보: "+ vo);
		int rs = userService.userUpdate(vo);
		//수정된 정보 가져와서 세션담기
		UserVO m_user = userService.userLogin(vo);
		ModelAndView mav = new ModelAndView();
		if(rs == 1) {
//			mav.addObject("msg","수정이 완료되었습니다.");
			mav.addObject("session", m_user);
			mav.setViewName("redirect:/mypage");
		}else {
			mav.addObject("msg","수정에 실패했습니다.");
			mav.addObject("url","/bigdata/update");
			mav.setViewName("main/alert");
		}		
		
		return mav;
	}

	//팝업창 띄우기
	@RequestMapping(value="/pwUpdate", method = RequestMethod.GET)
	public String pwCheck() {
		return "user/PwUpdate";
	}
	
	@RequestMapping(value="/userDrop", method = RequestMethod.GET)
	public String userDrop() {
		return "user/UserDrop";
	}

	@RequestMapping("/sendMail")
	public ModelAndView sendEmail(String email, String subject, String content) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println(email);
		String addr = "ayeppier@gmail.com";
		//String subject = "[😀😀] 알림메일 입니다.";
		//String body = "안녕하세요?\r\n소통해요~\r\n SMTP메일 테스트입니다.";
		userService.sendEmail(email, addr, subject, content);
		mav.addObject("msg","문의 메일이 발송되었습니다.");
		mav.addObject("url","/bigdata");
		mav.setViewName("main/alert");
		return mav;
	}
	
	

} //class end 

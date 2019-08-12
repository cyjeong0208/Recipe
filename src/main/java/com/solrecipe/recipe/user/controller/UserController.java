package com.solrecipe.recipe.user.controller;



import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.solrecipe.recipe.user.api.KakaoAPI;
import com.solrecipe.recipe.user.api.controller.KakaoController;
import com.solrecipe.recipe.user.domain.AuthVO;
import com.solrecipe.recipe.user.domain.MemberVO;
import com.solrecipe.recipe.user.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class UserController {
	

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	@Autowired
	UserService userService;
	
	@Autowired
	KakaoAPI kakaoLogin;
	


	//회원가입 
	@RequestMapping(value="/signup",  produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String updatePW(MemberVO memberVO, AuthVO authVO, @RequestParam String user_pw, @RequestParam String user_username,
							@RequestParam String user_nickname, RedirectAttributes rttr,HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");

		response.setHeader("Content-Type", "text/html;charset=utf-8");
		//암호화
		String enpw = pwencoder.encode(user_pw);
		memberVO.setUser_pw(enpw);
		
		System.out.println(user_nickname);
		//닉네임 없을 때,.,,, 
		if(user_nickname==null || user_nickname.equals("")) {
			String[] nickname = user_username.split("@");
			memberVO.setUser_nickname(nickname[0]);
		}
		
		int result = userService.updatePW(memberVO);  //pw insert 
		
		memberVO.setFirstdate(new Date(System.currentTimeMillis()));		
		memberVO.setUpdatedate(new Date(System.currentTimeMillis()));
		//일반로그인은 0
		memberVO.setKakao_login(0);
		
		int result1 = userService.insertMember(memberVO); //detail insert
		int result2 = userService.insertAuth(authVO); // auth insert
		
		if(result == 1 && result1 ==1 && result2 ==1) {
			
//			memberVO.setUser_name(user_name);
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원가입 완료되었습니다...');");
			out.println("location.href='main'");
			out.println("</script>");
			out.close();
			return "main";
			
		}
		else {
			rttr.addFlashAttribute("joinmsg", "join_fail");
			return "main";
		}
	}
	
	
	//카카오회원가입 
		@RequestMapping(value="/kakao_signup",  produces="text/plain;charset=UTF-8")
		@ResponseBody
		public String kakao_signup(MemberVO memberVO, AuthVO authVO, @RequestParam String kakao_user_username, @RequestParam String kakao_user_name,
								@RequestParam String kakao_user_nickname, RedirectAttributes rttr,HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
			request.setCharacterEncoding("utf-8");

			response.setHeader("Content-Type", "text/html;charset=utf-8");
			//암호화
			//kakao로 로그인햇기에 비밀번호 임의로 넣기.. 
			log.info("contro kakaousername : " + kakao_user_username);
			log.info("control kakao_name : " + kakao_user_name);
			log.info("control kakao_nickname : " + kakao_user_nickname);
			
			String enpw = pwencoder.encode("kakao");
			memberVO.setUser_pw(enpw);
			
			
			memberVO.setUser_username(kakao_user_username);
			memberVO.setUser_name(kakao_user_name);
			memberVO.setUser_nickname(kakao_user_nickname);
			memberVO.setFirstdate(new Date(System.currentTimeMillis()));		
			memberVO.setUpdatedate(new Date(System.currentTimeMillis()));
			//카카오 로그인은 1
			memberVO.setKakao_login(1);
			
			authVO.setUser_username(kakao_user_username);
			authVO.setUser_auth("ROLE_USER");
			
			int result = userService.kakaoMember(memberVO);
			
			
			

			
			int result1=0, result2 = 0;
			log.info(result);
			
			if(result == 1) {
				result1 = userService.insertMember(memberVO); //detail insert
				log.info("re : " + result1 );
				result2 = userService.insertAuth(authVO); // auth insert
				log.info(" re2 : " +result2 );
			}
			log.info("re : " + result1 + " re2 : " +result2 );
			if(result1 ==1 && result2 ==1) {
				
//				memberVO.setUser_name(user_name);
				int chkKakao = userService.chkKakaouser(memberVO.getUser_username());
			    
				session.setAttribute("chkKakao", chkKakao);
			    
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('회원가입 완료되었습니다...');");
				out.println("location.href='main'");
				out.println("</script>");
				out.close();
				return "main";
				
			}
			else {
				rttr.addFlashAttribute("joinmsg", "join_fail");
				return "main";
			}
		}

//		@RequestMapping(value="/kakaoLogin", produces = "application/json;charset=UTF-8", method = {RequestMethod.GET, RequestMethod.POST})
//		@ResponseBody
//		public String kakaoLogin(@RequestParam("code") String code , HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
//			
//			JsonNode token = kakaoLogin.getAccessToken(code);
//
//			  JsonNode profile = kakaoLogin.getKakaoUserInfo(token.path("access_token").toString());
//			  System.out.println(profile);
//			  MemberVO vo = kakaoLogin.changeData(profile);
//			  vo.setUser_username("k"+vo.getUser_username());
//
//			  System.out.println(session);
//			  session.setAttribute("login", vo);
//			  System.out.println(vo.toString());
//
//			  vo = userService.kakaoLogin(vo);  
//			  
//		    return "main";
//		}
	
	@RequestMapping(value="/chkNickname", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String chkNickname(String user_nickname) throws IOException {
		int chk = userService.chkNickname(user_nickname);
		
		if(chk == 0) {
			return "0";
		}
		
		return "1";
	}
	
	@RequestMapping(value="/chkName", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String chkName(String user_username, String user_name) throws IOException {
		int chk = userService.chkName(user_username, user_name);
		
		if(chk == 0) {
			return "0";
		}
		//이메일이 없엉 
		else if(chk == 1) {
			return "1";
		}
		//이름이 없엉 
		return "-1";
	}
	
	@RequestMapping(value="/newPw", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String newPw(String user_username, String user_pw) throws IOException {
		int chk = userService.newPw(user_username, user_pw);
		
		if(chk == 0) {
			return "0";
		}
		
		return "1";
	}
	
	@RequestMapping(value="/insertProfile", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String insertProfile(MemberVO memberVO, @RequestParam String user_num,
							RedirectAttributes rttr,HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest mulrequest) throws IOException {
		request.setCharacterEncoding("utf-8");

		response.setHeader("Content-Type", "text/html;charset=utf-8");
		
		
		
		MultipartFile user_img = mulrequest.getFile("img");
	
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/user/");
		
		
		String uploadFileName = user_img.getOriginalFilename();

		
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
		log.info("only file name: " + uploadFileName);
		//imgvo.setImg_name(uploadFileName);

		UUID uuid = UUID.randomUUID();

		uploadFileName = uuid.toString() + "_" + uploadFileName;

		try {
			File saveFile = new File(uploadPath, uploadFileName);
			user_img.transferTo(saveFile);

			
		} catch (Exception e) {
			e.printStackTrace();
		}

	
		
		
		
		memberVO.setUser_num(Integer.parseInt(user_num));
		
		
		//memberVO.setUpdatedate(new Date(System.currentTimeMillis()));
		
	
		
		int result = userService.insertProfile(memberVO);
		
		
		
		if(result == 1) {
			System.out.println("profile : " + memberVO);
//			memberVO.setUser_name(user_name);
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원정보가 수정되었습니다...');");
			out.println("location.href='myPage_index'");
			out.println("</script>");
			out.close();
			return "main";
			
		}
		else {
			rttr.addFlashAttribute("joinmsg", "join_fail");
			return "main";
		}
	}
	
	
//	//회원가입 
//	@RequestMapping("/signup_insert")
//	public String insertUser(MemberVO memberVO, RedirectAttributes rttr) {
//		System.out.println("insert");
//	//암호화
//		memberVO.setFirstdate(new Timestamp(System.currentTimeMillis()));		
//		memberVO.setUpdatedate(new Timestamp(System.currentTimeMillis()));
//		int result = userService.insertMember(memberVO);
//		System.out.println("insert result :" +result);
//		if(result == 1) {
//			rttr.addFlashAttribute("joinmsg", "join_success");
//			return "main";
//		}
//		else {
//			rttr.addFlashAttribute("joinmsg", "join_fail");
//			return "main";
//		}
//	}	
//	
		

}

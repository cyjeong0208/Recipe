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

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

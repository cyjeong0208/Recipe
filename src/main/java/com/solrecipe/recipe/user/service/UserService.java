//package com.solrecipe.recipe.user.service;
//
//import java.sql.SQLException;
//
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
//
//import com.solrecipe.recipe.user.domain.MemberVO;
//
//public class UserService {
//	@Autowired
//	private SqlSessionTemplate userSqlSessin;
//	private UserServiceImpl userDao;
//
//	// 회원가입 서비스
//	public int user_service(MemberVO membervo) {
//
//		int resultCnt = 0;
//
//		userDao = userSqlSessin.getMapper(UserServiceImpl.class);
//		try {
//			resultCnt = userDao.regUser(membervo);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		return resultCnt;
//	}
//
//}

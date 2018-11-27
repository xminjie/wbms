package com.njwb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
 
import com.njwb.entity.User;
import com.njwb.service.LoginService;

public class UserController {
	
	Logger log = Logger.getLogger(UserController.class);
	
	LoginService loginService;

	public LoginService getLoginService() {
		return loginService;
	}

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}
	
	public String  userAble(HttpServletRequest request, HttpServletResponse response) {
		
		String account = request.getParameter("account");
		
		loginService.userAbleByAccount(account);
		
		return "success";
		
	}
	
public String  users(HttpServletRequest request, HttpServletResponse response) {
		
		 
		
		List<User> userList =  loginService.queryAllUser();
		request.setAttribute("userList", userList);
		log.info("所有账户"+userList);
		
		return "success";
		
	}
	
	
	
	
	
	
}

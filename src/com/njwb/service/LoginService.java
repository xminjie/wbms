package com.njwb.service;

import java.util.List;

import com.njwb.entity.Menu;
import com.njwb.entity.User;
 
public interface LoginService {
	User loginQuery(String account, String passwd);
	List<Menu> queryMenuListByRoleId(Integer roleId);
	 //禁用启用账户
	 boolean userAbleByAccount(String account);
	 List<User>  queryAllUser();
}

package com.wyj.service;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wyj.dao.UserDao;
import com.wyj.pojo.User;

@Service
public class UserServiceImpl {
	@Autowired
	@Qualifier("userDao")
	private UserDao ud;
	
	
	public UserDao getUd() {
		return ud;
	}

	public void setUd(UserDao ud) {
		this.ud = ud;
	}

	public boolean zhuce(User u) {
		return ud.zhuce(u)>0?true:false;
	}
	
	public User login(User u) {
		return ud.login(u);
	}
	
	public boolean checkUname(String uname) {
		return ud.checkUname(uname)>0?false:true;
	}
}

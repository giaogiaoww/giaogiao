package com.wyj.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wyj.pojo.User;

@Component
public interface UserDao {
	public int zhuce(User u);
	
	public User login(User u);
	
	public int checkUname(@Param("uname")String uname);
}

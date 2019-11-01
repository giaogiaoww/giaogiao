package com.wyj.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.wyj.pojo.User;
import com.wyj.service.UserServiceImpl;

@Controller
public class UserController {
	/*ApplicationContext ct=ContextListener.ct;
	UserServiceImpl us=ct.getBean("userServiceImpl",UserServiceImpl.class);*/
	
	@Autowired
	private UserServiceImpl us;
	
	@RequestMapping("/dl")
	public void dl(HttpServletResponse response,User u,String veryCode,HttpSession session) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String mess="用户名或者密码错误";
		String url="";
		u = us.login(u);
		if(!veryCode.equals(session.getAttribute("verificationCode").toString())) {
			mess="验证码填写错误";
		}else if(u!=null) {
			session.setAttribute("loginUser", u);
			mess="登录成功";
			url="load";
		}
		
		out.write("{\"mess\":\""+mess+"\",\"url\":\""+url+"\"}");
		out.flush();
	}
	
	
	@RequestMapping("/zhuce")
	public void zhuce(HttpServletResponse response,User u) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String mess="注册失败";
		String url="";
		if(us.zhuce(u)) {
			mess="注册成功";
			url="login.jsp";
		}
		out.write("{\"mess\":\""+mess+"\",\"url\":\""+url+"\"}");
		out.flush();
		
	}
	
	@RequestMapping("/checkUname")
	public void checkUname(String date,PrintWriter out) {
		if(us.checkUname(date)) {
			out.write("true");
		}else {
			out.write("false");
		}
	}
	
	@RequestMapping("/ajax111")
	public void ajax111(HttpServletResponse response,String qx,HttpSession session) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		Map<String,List<String>> map = (Map<String,List<String>>)session.getAttribute("map");
		Object json =JSON.toJSON(map.get(qx));
 		out.write(json==null?"":json.toString());
		out.flush();
		out.close();
	}
}

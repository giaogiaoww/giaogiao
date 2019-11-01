package com.wyj.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.wyj.pojo.User;

@Component
public class MyInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		System.out.println("preHandle");
		String method="zhifu";
		HandlerMethod hm=null;
		try {
			hm = (HandlerMethod) obj;
		} catch (Exception e) {
			return false;
		}
		System.out.println(hm.getMethod().getName());
		if(method.equals(hm.getMethod().getName())) {
			User u = (User) request.getSession().getAttribute("loginUser");
			if(u==null) {
				response.sendRedirect("login.jsp");
				return false;
			}else {
				return true;
			}
		}else {
			return true;
		}
	}

}

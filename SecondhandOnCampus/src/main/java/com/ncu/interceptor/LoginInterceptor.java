package com.ncu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ncu.pojo.User;


public class LoginInterceptor implements HandlerInterceptor {

	
	//进入 Handler方法之前执行
	//用于身份认证、身份授权
	//比如身份认证，如果认证通过表示当前用户没有登陆，需要此方法拦截不再向下执行
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		//获取请求的url
		String url = request.getRequestURI();
		//判断url是否是公开 地址（实际使用时将公开 地址配置配置文件中）
		//这里公开地址是登陆提交的地址
		if(url.indexOf("index")>=0){
			return true;
		}
		if(url.indexOf("login")>=0){
			//如果进行登陆/注销，放行
			return true;
		}
		if(url.indexOf("register")>=0){
			//如果进行注册，放行
			return true;
		}
		if(url.indexOf("showGoodsByPage")>=0){
			return true;
		}
		if(url.indexOf("showCart")>=0){
			return true;
		}
		//判断session
		HttpSession session  = request.getSession();
		//从session中取出用户身份信息
		User user = (User) session.getAttribute("user");
		
		if(user != null){
			//身份存在，放行
			return true;
		}
		request.setAttribute("error", "须先登录");
		request.getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(request, response);
		//return false表示拦截，不向下执行
		//return true表示放行
		return false;
	}

	//进入Handler方法之后，返回modelAndView之前执行
	//应用场景从modelAndView出发：将公用的模型数据(比如菜单导航)在这里传到视图，也可以在这里统一指定视图
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	//执行Handler完成执行此方法
	//应用场景：统一异常处理，统一日志处理
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}
